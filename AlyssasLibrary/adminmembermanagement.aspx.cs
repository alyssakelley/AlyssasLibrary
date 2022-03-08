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
    public partial class membermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SearchButton_Click(object sender, EventArgs e) //search
        {
            //Response.Write("<script>alert('Searching...');</script>");
            {
                try
                {
                    GridView1.DataBind();
                    if (MemberExists() && IsMemberIDBlank() == false && (Session["memberID"] != null))
                    {
                        //FillAuthorText();
                    }
                    else if (IsMemberIDBlank())
                    {
                        Response.Write("<script>alert('Please enter a valid memberID.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('No member matching this member ID " + ID.Text.Trim() + "');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Search Error - " + ex.Message + "');</script>");
                }
            }
        }

        protected void PermDeleteButton_Click(object sender, EventArgs e) //perm delete
        {
            //Response.Write("<script>alert('Deleting...');</script>");
            {
                try
                {
                    if (MemberExists() && IsMemberIDBlank() == false && (Session["memberID"] != null))
                    {
                        DeleteMember();
                    }
                    else if (IsMemberIDBlank())
                    {
                        Response.Write("<script>alert('Please enter a valid memberID.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Could not perform deletion. Member ID " + ID.Text.Trim() + " does not exists.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Delete Error - " + ex.Message + "');</script>");
                }
            }
        }

        protected void ApproveStatusButton_Click(object sender, EventArgs e) //perm delete
        {
            //Response.Write("<script>alert('Active');</script>");
            {
                try
                {
                    if (MemberExists() && IsMemberIDBlank() == false && (Session["memberID"] != null))
                    {
                        UpdateAccountStatusByMemberID("active");
                    }
                    else if (IsMemberIDBlank())
                    {
                        Response.Write("<script>alert('Please enter a valid memberID.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Could not perform status change. Member ID " + ID.Text.Trim() + " does not exists.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Account Status Change Error - " + ex.Message + "');</script>");
                }
            }
        }

        protected void PendingStatusButton_Click(object sender, EventArgs e) //perm delete
        {
            //Response.Write("<script>alert('Pending');</script>");
            {
                try
                {
                    if (MemberExists() && IsMemberIDBlank() == false && (Session["memberID"] != null))
                    {
                        UpdateAccountStatusByMemberID("pending");
                    }
                    else if (IsMemberIDBlank())
                    {
                        Response.Write("<script>alert('Please enter a valid memberID.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Could not perform status change. Member ID " + ID.Text.Trim() + " does not exists.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Account Status Change Error - " + ex.Message + "');</script>");
                }
            }
        }

        protected void ApproveDisableButton_Click(object sender, EventArgs e) //perm delete
        {
            //Response.Write("<script>alert('Disabled');</script>");
            {
                try
                {
                    if (MemberExists() && IsMemberIDBlank() == false && (Session["memberID"] != null))
                    {
                        UpdateAccountStatusByMemberID("disabled");
                    }
                    else if (IsMemberIDBlank())
                    {
                        Response.Write("<script>alert('Please enter a valid memberID.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Could not perform status change. Member ID " + ID.Text.Trim() + " does not exists.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Account Status Change Error - " + ex.Message + "');</script>");
                }
            }
        }

        bool MemberExists()
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
                    SqlCommand cmd = new SqlCommand("select * from MemberDim where memberID = '" + ID.Text.Trim() + "';", con);
                    //cmd.Parameters.AddWithValue("@memberID", TextBox8.Text.Trim());


                    if (IsMemberIDBlank() == false)
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                //Response.Write("<script>alert('Found Author.');</script>");
                                Session["memberID"] = dr.GetValue(8).ToString();
                                Name.Text = dr.GetValue(0).ToString(); //name
                                Status.Text = dr.GetValue(10).ToString(); //status
                                DOB.Text = dr.GetValue(1).ToString(); //DOB
                                PhoneNum.Text = dr.GetValue(2).ToString(); //phone number
                                Email.Text = dr.GetValue(3).ToString(); //email
                                Addr.Text = dr.GetValue(7).ToString(); //addr
                                City.Text = dr.GetValue(5).ToString(); 
                                State.Text = dr.GetValue(4).ToString(); 
                                Zip.Text = dr.GetValue(6).ToString(); 
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

        void DeleteMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                //string memberID = TextBox2.Text.Trim();
                SqlCommand cmd = new SqlCommand("DELETE FROM MemberDim WHERE memberID = '" + Session["memberID"] + "'", con);
                //cmd.Parameters.AddWithValue("@authorID", TextBox2.Text.Trim());

                //now exec query
                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('Member ID " + Session["memberID"] + " has been deleted.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not delete member. " + ex.Message + "');</script>");
            }
        }

        void UpdateAccountStatusByMemberID(string newStatus)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open(); //if the connection is closed, then we need to open it first
                }

                SqlCommand cmd = new SqlCommand("UPDATE MemberDim SET accountStatus = '" + newStatus + "' WHERE memberID = '" + Session["memberID"] + "'", con);

                cmd.ExecuteNonQuery();
                con.Close(); //close the connection 

                Response.Write("<script>alert('Member ID " + Session["memberID"] + " account status changed to " + newStatus + ".');</script>");
                //clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - Could not delete member. " + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            ID.Text = ""; //ID
            Name.Text = ""; //name
            Status.Text = ""; //status
            DOB.Text = ""; //DOB
            PhoneNum.Text = ""; //phone number
            Email.Text = ""; //email
            Addr.Text = ""; //addr
            City.Text = "";
            State.Text = "";
            Zip.Text = "";
        }

        void FillMemberTextBoxes()
        {
            Name.Text = Session["memberID"].ToString();
        }
        bool IsMemberIDBlank()
        {
            string memberID = ID.Text.Trim();
            if (string.IsNullOrEmpty(memberID))
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