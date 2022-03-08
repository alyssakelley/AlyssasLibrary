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
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e) //search
        {
            string publisherID = TextBox2.Text.Trim();

            if (string.IsNullOrEmpty(publisherID))
            {
                Response.Write("<script>alert('Please enter a valid publisherID.');</script>");
            }
            else
            {
                try
                {
                    GridView1.DataBind();
                    if (PublisherExists() && Session["publisherName"] != null)
                    {
                        TextBox3.Text = Session["publisherName"].ToString();

                    }
                    else
                    {
                        Response.Write("<script>alert('No publisher name matching publisher ID " + TextBox2.Text.Trim() + "');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Search Error - " + ex.Message + "');</script>");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e) //add
        {
            try
            {
                if (PublisherExists())
                {
                    Response.Write("<script>alert('There is already a publisher with this publisherID. Please modify " + TextBox2.Text.Trim() + " or use a different publisherID.');</script>");
                }
                else
                {
                    AddNewPublisher();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Add Error - " + ex.Message + "');</script>");
            }
        }

        protected void Button6_Click(object sender, EventArgs e) //modify
        {
            try
            {
                if (PublisherExists())
                {
                    ModifyPublisher();
                }
                else
                {
                    Response.Write("<script>alert('Could not perform modification. Publisher ID" + TextBox2.Text.Trim() + " does not exists.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Modify Error - " + ex.Message + "');</script>");
            }
        }

        protected void Button10_Click(object sender, EventArgs e) //delete
        {
            try
            {
                if (PublisherExists())
                {
                    DeletePublisher();
                }
                else
                {
                    Response.Write("<script>alert('Could not perform deletion. Publisher ID" + TextBox2.Text.Trim() + " does not exists.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Delete Error - " + ex.Message + "');</script>");
            }
        }

        bool PublisherExists()
        {
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open(); //if the connection is closed, then we need to open it first
                    }

                    string publisherID = TextBox2.Text.Trim();
                    // to-do: go back and fix this to use the parameter rather than just the input from the textbox - big sql injection risk
                    SqlCommand cmd = new SqlCommand("select * from PublisherDim where publisherID = '" + TextBox2.Text.Trim() + "';", con);
                    //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());

                    if (string.IsNullOrEmpty(publisherID))
                    {
                        Response.Write("<script>alert('Please enter a valid publisherID.');</script>");
                        return false;
                    }
                    else
                    {

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            Session["publisherID"] = dt.Rows[0][0].ToString();
                            Session["publisherName"] = dt.Rows[0][1].ToString();
                            con.Close(); //close the connection 
                            return true;
                        }
                        else
                        {
                            con.Close(); //close the connection 
                            return false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Unsuccessful. " + ex.Message + "');</script>");
                    return false;
                }
            }
        }
        void AddNewPublisher()
        {
             try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                string publisherID = TextBox2.Text.Trim();
                SqlCommand cmd = new SqlCommand("INSERT INTO PublisherDim (publisherID,publisherName) VALUES(@publisherID, @publisherName)", con);
                cmd.Parameters.AddWithValue("@publisherID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@publisherName", TextBox3.Text.Trim());

                if (string.IsNullOrEmpty(publisherID))
                {
                    Response.Write("<script>alert('Please enter a valid publisherID.');</script>");
                }
                else
                {

                    //now exec query
                    cmd.ExecuteNonQuery();
                    con.Close(); //close the connection 

                    Response.Write("<script>alert('Publisher " + TextBox3.Text.Trim() + " has been added under the publisherID " + publisherID + ".');</script>");
                    clearForm();
                    GridView1.DataBind(); // updates the table when action happens 
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not add publisher. " + ex.Message + "');</script>");
            }
        }

        void ModifyPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                string publisherID = TextBox2.Text.Trim();
                SqlCommand cmd = new SqlCommand("UPDATE PublisherDim SET publisherName = @publisherName where publisherID = '" + publisherID + "'", con);
                cmd.Parameters.AddWithValue("@publisherID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@publisherName", TextBox3.Text.Trim());


                if (string.IsNullOrEmpty(publisherID))
                {
                    Response.Write("<script>alert('Please enter a valid publisherID.');</script>");
                }
                else
                {
                    //now exec query
                    cmd.ExecuteNonQuery();
                    con.Close(); //close the connection 

                    Response.Write("<script>alert('Publisher ID " + publisherID + " updated successfully.');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not modify publisher. " + ex.Message + "');</script>");
            }
        }

        void DeletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                string publisherID = TextBox2.Text.Trim();
                SqlCommand cmd = new SqlCommand("DELETE FROM PublisherDim WHERE publisherID = '" + publisherID + "'", con);
                //cmd.Parameters.AddWithValue("@publisherID", TextBox2.Text.Trim());

                if (string.IsNullOrEmpty(publisherID))
                {
                    Response.Write("<script>alert('Please enter a valid publisherID.');</script>");
                }
                else
                {
                    //now exec query
                    cmd.ExecuteNonQuery();
                    con.Close(); //close the connection 

                    Response.Write("<script>alert('Publisher ID " + publisherID + " has been deleted.');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not delete publisher. " + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
    }
}