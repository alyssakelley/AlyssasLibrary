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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Logging In');</script>"); //select * from MemberDim where memberID = 'ak11' and password = '123'
            if (validAdminLogin() == true)
            {
                LogInAdmin();
            }
            else
            {
                Response.Write("<script>alert('Invalid Admin credentials.');</script>");
            }
        }
        // makeing sure the member ID and password exists 
        bool validAdminLogin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                // to-do: go back and fix this to use the parameter rather than just the input from the textbox - big sql injection risk
                SqlCommand cmd = new SqlCommand("select * from AdminLoginDim where username = '" + TextBox1.Text.Trim() + "' and password = '" + TextBox3.Text.Trim() + "'; ", con);
                //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(0).ToString() + ".');</script>"); //GetValue(0) 0 bc username is the first (0th) col in AdminLoginDim
                        Response.Write("<script>alert('Login Successful.');</script>"); //GetValue(8) 8 bc memberID is the 9th (index 8) col in MemberDim
                        Session["adminID"] = dr.GetValue(0).ToString();
                        Session["password"] = dr.GetValue(1).ToString();
                        Session["fullName"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                        //Session["accountStatus"] = dr.GetValue(10).ToString();
                        //LogInUser();
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
            catch (Exception ex)
            {
                Response.Write("<script>alert('Unsuccessful. " + ex.Message + "');</script>");
                return false;
            }
        }

        void LogInAdmin()
        {
            Response.Redirect("homepage.aspx");
            //Response.Write("<script>alert('Admin logging in...');</script>");
        }
    }
}