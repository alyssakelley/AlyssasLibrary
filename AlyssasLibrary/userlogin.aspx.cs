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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Logging In');</script>"); //select * from MemberDim where memberID = 'ak11' and password = '123'
            if (validUserLogin() == true)
            {
                LogInUser();
            }
            else
            {
                Response.Write("<script>alert('Member ID and/or Password incorrect. Please try again.');</script>");
            }
        }
        // makeing sure the member ID and password exists 
        bool validUserLogin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); 
                                                               
                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                // to-do: go back and fix this to use the parameter rather than just the input from the textbox - big sql injection risk
                SqlCommand cmd = new SqlCommand("select * from MemberDim where memberID = '" + TextBox1.Text.Trim() + "' and password = '" + TextBox3.Text.Trim() + "'; ", con);
                //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while(dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful.');</script>"); //GetValue(8) 8 bc memberID is the 9th (index 8) col in MemberDim
                        Session["memberID"] = dr.GetValue(8).ToString();
                        Session["password"] = dr.GetValue(9).ToString();
                        Session["fullName"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["accountStatus"] = dr.GetValue(10).ToString();
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

        void LogInUser()
        {
            //Session["memberID"] = loginReader.GetValue(8).ToString();
            //Session["password"] = loginReader.GetValue(9).ToString();
            //Session["fullName"] = loginReader.GetValue(0).ToString();
            //Session["role"] = "user";
            //Session["accountStatus"] = loginReader.GetValue(10).ToString();
            Response.Redirect("homepage.aspx");
            //Response.Write("<script>alert('Logging in...');</script>");
        }

        // takes to the sign up page
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
    }
}