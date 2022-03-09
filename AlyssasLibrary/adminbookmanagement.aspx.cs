using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using Microsoft.VisualBasic;

namespace AlyssasLibrary
{
    public partial class adminbookmanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateAuthorPublisherDropDowns();
            BookGridView.DataBind();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                //Response.Write("<script>alert('Searching...');</script>");
                PopulateBookDetails();
            }
            else if (IsBookIDBlank())
            {
                Response.Write("<script>alert('Please enter a valid bookID.');</script>");
            }
            else
            {
                Response.Write("<script>alert('No book exists under this book ID or name.');</script>");
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                Response.Write("<script>alert('Book already exists under the same book ID or name.');</script>");
            }
            else
            {
                AddNewBook();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                ModifyBook();
            }
            else
            {
                Response.Write("<script>alert('Cannot modify - No book exists under this book ID.');</script>");
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (BookExists())
            {
                DeleteBook();
            }
            else
            {
                Response.Write("<script>alert('Cannot delete - No book exists under this book ID.');</script>"); 
            }
        }

        void PopulateAuthorPublisherDropDowns()
        {
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open(); //if the connection is closed, then we need to open it first
                    }
                    //fill in author name drop down
                    SqlCommand author_cmd = new SqlCommand("SELECT authorName from AuthorDim", con);

                    SqlDataAdapter authorDA = new SqlDataAdapter(author_cmd);
                    DataTable authorDT = new DataTable();
                    authorDA.Fill(authorDT);

                    AuthorDropDown.DataSource = authorDT;
                    AuthorDropDown.DataTextField = "authorName";
                    AuthorDropDown.DataBind();

                    //fill in publisher name drop down
                    SqlCommand publisher_cmd = new SqlCommand("SELECT publisherName from PublisherDim", con); // I could also reuse the cmd and just set it to this

                    SqlDataAdapter publisherDA = new SqlDataAdapter(publisher_cmd);
                    DataTable publisherDT = new DataTable();
                    publisherDA.Fill(publisherDT);

                    PublisherDropDown.DataSource = publisherDT;
                    PublisherDropDown.DataTextField = "publisherName";
                    PublisherDropDown.DataBind();
                    con.Close(); //close the connection 
                
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error - could not populate author and/or publisher drop downs. " + ex.Message + "');</script>");
                }
            }
        }
        bool BookExists()
        {
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open(); //if the connection is closed, then we need to open it first
                    }

                    // to-do: go back and fix this to use the parameter rather than just the input from the textbox - big sql injection risk
                    SqlCommand cmd = new SqlCommand("select * from BookDim where bookID = '" + ID.Text.Trim() + "' OR bookName = '" + bookName.Text.Trim() + "';", con);
                    //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());


                    if (IsBookIDBlank() == false)
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                //Response.Write("<script>alert('Found Book.');</script>");
                                Session["bookID"] = dr.GetValue(0).ToString();
                                Session["bookName"] = dr.GetValue(1).ToString();
                            }
                            con.Close(); //close the connection 
                            return true;
                        }
                        else
                        {
                            con.Close(); //close the connection 
                            return false;
                        }
                    }
                    else
                    {
                        con.Close(); //close the connection 
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Unsuccessful. " + ex.Message + "');</script>");
                    return false;
                }
            }
        }
        void AddNewBook()
        {
            try
            {
                //getting all of the selected genres from the drop down box
                string allGenres = "";
                foreach(int i in GenreListBox.GetSelectedIndices())
                {
                    allGenres = allGenres + GenreListBox.Items[i] + ",";
                }
                allGenres = allGenres.Remove(allGenres.Length - 1); // removing the last value which will be ","

                //save the filename, save the file to bookInventory, save full file path for saving into DB as a string
                //hardcoded example: string filepath = "~/booKInventory/bookimg.png";
                string uploadedBookImageFilepath = "~/images/bookInventory/BookFavoriteIcon.PNG"; //default
                string uploadedBookImageName = Path.GetFileName(uploadedBookImage.PostedFile.FileName); //using system.IO to get the filename from the upload
                if (uploadedBookImageName == "" || uploadedBookImageName == null)
                {

                }
                else
                {
                    uploadedBookImage.SaveAs(Server.MapPath("images/bookInventory/" + uploadedBookImageName)); //this is actually doing the saving of the png 
                    uploadedBookImageFilepath = "~/images/bookInventory/" + uploadedBookImageName; // this will be stored in BookDim
                }
               // */

                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO BookDim(bookID,bookName,genre,authorName,publisherName,publishDate,language,edition,bookPrice,pageCount,bookDesc,actualStock,currentStock,bookImgLink) VALUES (@bookID,@bookName,@genre,@authorName,@publisherName,@publishDate,@language,@edition,@bookPrice,@pageCount,@bookDesc,@actualStock,@currentStock,@bookImgLink)", con);
                cmd.Parameters.AddWithValue("@bookID", ID.Text.Trim());
                cmd.Parameters.AddWithValue("@bookName", bookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", allGenres);
                cmd.Parameters.AddWithValue("@authorName", AuthorDropDown.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisherName", PublisherDropDown.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publishDate", publishedDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", LangDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", edition.Text.Trim());
                cmd.Parameters.AddWithValue("@bookPrice", cost.Text.Trim());
                cmd.Parameters.AddWithValue("@pageCount", pageCount.Text.Trim());
                cmd.Parameters.AddWithValue("@bookDesc", bookDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@actualStock", actualStock.Text.Trim()); // these values are the same when a book is added, only changed when issuing
                cmd.Parameters.AddWithValue("@currentStock", actualStock.Text.Trim()); // these values are the same when a book is added, only changed when issuing
                cmd.Parameters.AddWithValue("@bookImgLink", uploadedBookImageFilepath);

                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('" + bookName.Text.Trim() + " has been added under bookID: " + ID.Text.Trim() + ".');</script>");
                clearForm();
                BookGridView.DataBind(); // updates the table when action happens 
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not add author. " + ex.Message + "');</script>");
            }

        }

        void ModifyBook()
        {

        }

        void DeleteBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM BookDim WHERE bookID = '" + Session["bookID"] + "' OR bookName = '" + Session["bookName"] + "';", con);

                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('" + Session["bookName"] + " (" + Session["bookID"] + ") has been deleted.');</script>");
                clearForm();
                BookGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not delete book. " + ex.Message + "');</script>");
            }
        }

        void PopulateBookDetails()
        {
            //Response.Write("<script>alert('Trying to populate.');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                //Response.Write("<script>alert('selecting...');</script>");
                SqlCommand cmd = new SqlCommand("SELECT * FROM BookDim WHERE bookID = '" + ID.Text.Trim() + "';", con); //+ //Session["bookID"] + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count > 0 )
                {
                    /*
                    string dateStr = dt.Rows[0]["publishDate"].ToString();
                    //dt will be DateTime type
                    DateTime dateT = Convert.ToDateTime(dateStr);
                    //s will be MM/dd/yyyy format string
                    string finalDateStr = dateT.ToString("MM/dd/yyyy");
                    var date = DateTime.Now.ToString("MM/dd/yyyy");
                    */
                    
                    bookName.Text = dt.Rows[0]["bookName"].ToString();
                    pageCount.Text = dt.Rows[0]["pageCount"].ToString().Trim();//
                    bookDesc.Text = dt.Rows[0]["bookDesc"].ToString().Trim();//
                    cost.Text = dt.Rows[0]["bookPrice"].ToString().Trim();//
                    edition.Text = dt.Rows[0]["edition"].ToString();
                    currentStock.Text = dt.Rows[0]["currentStock"].ToString();
                    actualStock.Text = dt.Rows[0]["actualStock"].ToString();
                    checkedOut.Text = "" + (Convert.ToInt32(dt.Rows[0]["actualStock"].ToString()) - Convert.ToInt32(dt.Rows[0]["currentStock"].ToString()));
                    publishedDate.Text = dt.Rows[0]["publishDate"].ToString();
                    LangDropDownList.SelectedValue = dt.Rows[0]["language"].ToString().Trim().Trim();
                    PublisherDropDown.SelectedValue = dt.Rows[0]["publisherName"].ToString().Trim();
                    AuthorDropDown.SelectedValue = dt.Rows[0]["authorName"].ToString().Trim();

                    //selecting genres in the drop down box
                    string[] currGenres = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    GenreListBox.ClearSelection(); // clear out so any existing selections are blank
                    for(int i = 0; i < currGenres.Length; i++) // looking at each genre we have in the database 
                    {
                        for (int j = 0; j < GenreListBox.Items.Count; j++) // trying to find a match to each available genre option we list
                        {
                            if (currGenres[i] == GenreListBox.Items[j].ToString())
                            {
                                GenreListBox.Items[j].Selected = true; // select the same genre in the drop down and show it as selected
                            }
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('" + Session["bookID"] + " has been updated.');</script>");
                }
                con.Close();
                //BookGridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not delete book. " + ex.Message + "');</script>");
            }

        }
        bool IsBookIDBlank()
        {
            string bookID = ID.Text.Trim();
            if (string.IsNullOrEmpty(bookID))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        void clearForm()
        {
            ID.Text = "";
            bookName.Text = "";
            publishedDate.Text = "";
            edition.Text = "";
            currentStock.Text = "";
            actualStock.Text = "";
            checkedOut.Text = "";
            pageCount.Text = "";
            bookDesc.Text = "";
            GenreListBox.ClearSelection();
            cost.Text = "";
            LangDropDownList.ClearSelection();
            PublisherDropDown.ClearSelection();
            AuthorDropDown.ClearSelection();
        }
    }
}