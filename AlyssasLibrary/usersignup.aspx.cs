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
    public partial class WebForm4 : System.Web.UI.Page //WebFormA = User Sign Up
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // sign up botton is clicked 
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ExistingUser() == true)
            {
                Response.Write("<script>alert('Member ID taken, please sign up under a different Member ID.');</script>");
            }
            else
            {
                SignUpNewUser();
            }
        }
        protected void SignUpNewUser()
        {
            //try catch is good practice 
            try
            {

                SqlConnection con = new SqlConnection(strcon); // init new collection/object
                // check if connection with database is open or not
                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }
                //query 


                //SqlCommand cmd = new SqlCommand("INSERT INTO MemberDim(fullName, dateOfBirth, phoneNumber, email, state, city, zipCode, fullAddress, memberID, password, accountStatus) VALUES('xxxx', null, null, null, null, null, null, null, 'xxxx', null, null)", con);
                SqlCommand cmd = new SqlCommand("INSERT INTO MemberDim (fullName,dateOfBirth,phoneNumber,email,state,city,zipCode,fullAddress,memberID,password,accountStatus) VALUES(@fullName,@dateOfBirth,@phoneNumber,@email,@state,@city,@zipCode,@fullAddress,@memberID,@password,@accountStatus)", con); //insert query
                cmd.Parameters.AddWithValue("@fullName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dateOfBirth", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phoneNumber", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@zipCode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@fullAddress", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@accountStatus", "pending");
                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 
                //Response.Write("<script>alert('User details saved successfully');</script>");
                // Response.Redirect("userlogin.aspx");
                Response.Write("<script>alert('Sign Up Successful. Please log in.');</script>");
                //Response.Redirect("userlogin.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Unsuccessful. " + ex.Message + "');</script>");
            }
        }

        bool ExistingUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // init new collection/object
                                                               // check if connection with database is open or not
                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                // to-do: go back and fix this to use the parameter rather than just the input from the textbox
                SqlCommand cmd = new SqlCommand("SELECT memberID FROM MemberDim where memberID = '"+ TextBox8.Text.Trim() + "';", con);
                //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); //fill this temp table with the output of cmd

                if (dt.Rows.Count > 0)
                {
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

    }
}