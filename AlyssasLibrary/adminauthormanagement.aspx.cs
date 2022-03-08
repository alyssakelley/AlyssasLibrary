using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace AlyssasLibrary
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e) //Search author ID
        {
            //Response.Write("<script>alert('Searching...');</script>");
            try
            {
                GridView1.DataBind();
                if (AuthorExists() && IsAuthorIDBlank() == false && (Session["authorName"] != null))
                {
                    FillAuthorText();                   
                }
                else if (IsAuthorIDBlank())
                {
                    Response.Write("<script>alert('Please enter a valid authorID.');</script>");
                }
               else
                {
                    Response.Write("<script>alert('No author name matching author ID " + TextBox2.Text.Trim() + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Search Error - " + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e) //Add
        {
            //Response.Write("<script>alert('About to add...');</script>");
            try
            {
                if (AuthorExists() && IsAuthorIDBlank() == false)
                {
                    Response.Write("<script>alert('There is already an author with this authorID. Please modify " + TextBox2.Text.Trim() + " or use a different authorID.');</script>");
                }
                else if (IsAuthorIDBlank())
                {
                    Response.Write("<script>alert('Please enter a valid authorID.');</script>");
                }
                else
                {
                    AddNewAuthor();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Add Error - " + ex.Message + "');</script>");
            }
        }

        protected void Button6_Click(object sender, EventArgs e) //Modify
        {
            try
            {
                if (AuthorExists() && IsAuthorIDBlank() == false)
                {
                    ModifyAuthor();
                }
                else if (IsAuthorIDBlank())
                {
                    Response.Write("<script>alert('Please enter a valid authorID.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Could not perform modification. Author ID" + TextBox2.Text.Trim() + " does not exists.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Modify Error - " + ex.Message + "');</script>");
            }
        }

        protected void Button10_Click(object sender, EventArgs e) //Delete
        {
            try
            {
                if (AuthorExists() && IsAuthorIDBlank() == false)
                {
                    DeleteAuthor();
                }
                else if (IsAuthorIDBlank())
                {
                    Response.Write("<script>alert('Please enter a valid authorID.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Could not perform deletion. Author ID " + TextBox2.Text.Trim() + " does not exists.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Delete Error - " + ex.Message + "');</script>");
            }
        }

        bool AuthorExists()
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
                    SqlCommand cmd = new SqlCommand("select * from AuthorDim where authorID = '" + TextBox2.Text.Trim() + "';", con);
                    //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());


                    if (IsAuthorIDBlank() == false)
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                //Response.Write("<script>alert('Found Author.');</script>");
                                Session["authorID"] = dr.GetValue(0).ToString();
                                Session["authorName"] = dr.GetValue(1).ToString();
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
        void AddNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO AuthorDim (authorID,authorName) VALUES(@authorID, @authorName)", con);
                cmd.Parameters.AddWithValue("@authorID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@authorName", TextBox3.Text.Trim());

                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('Author " + TextBox3.Text.Trim() + " has been added under the authorID " + TextBox2.Text.Trim() + ".');</script>");
                clearForm();
                GridView1.DataBind(); // updates the table when action happens 
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not add author. " + ex.Message + "');</script>");
            }
        }

        void ModifyAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                string authorID = TextBox2.Text.Trim();
                SqlCommand cmd = new SqlCommand("UPDATE AuthorDim SET authorName = @authorName where authorID = '" + TextBox2.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@authorID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@authorName", TextBox3.Text.Trim());
                

                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('Author ID " + TextBox2.Text.Trim() + " updated successfully.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not modify author. " + ex.Message + "');</script>");
            }
        }

        void DeleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                string authorID = TextBox2.Text.Trim();
                SqlCommand cmd = new SqlCommand("DELETE FROM AuthorDim WHERE authorID = '" + TextBox2.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@authorID", TextBox2.Text.Trim());

                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('Author ID " + TextBox2.Text.Trim() + " has been deleted.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not delete author. " + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
        }

        void FillAuthorText()
        {
            TextBox3.Text = Session["authorName"].ToString();
        }

        bool IsAuthorIDBlank()
        {
            string authorID = TextBox2.Text.Trim();
            if (string.IsNullOrEmpty(authorID))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}