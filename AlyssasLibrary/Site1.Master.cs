using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlyssasLibrary
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null) //no role established, so no one has logged in yet
                {
                    //blank so no one has logged in and everything should be in default mode (don't see admin links in F, and logout or hello in H)
                    //header links
                    LinkButton2.Visible = true; //user login in header
                    LinkButton3.Visible = true; //user sign up in header
                    LinkButton4.Visible = false; //logout in header
                    LinkButton5.Visible = false; //hello user in header
                    //footer links (admin)
                    LinkButton6.Visible = true; //admin login in footer
                    LinkButton7.Visible = false; //author management in footer
                    LinkButton8.Visible = false; //publisher management  in footer
                    LinkButton9.Visible = false; //book inventory in footer
                    LinkButton10.Visible = false; //book issuing in footer
                    LinkButton11.Visible = false; //member management in footer

                }
                else if (Session["role"].Equals("user")) //user logs in, so they should not see login or sign up or admin links
                {
                    //header links
                    LinkButton2.Visible = false; //user login in header
                    LinkButton3.Visible = false; //user sign up in header
                    LinkButton4.Visible = true; //logout in header
                    LinkButton5.Visible = true; //hello user in header
                    LinkButton5.Text = "Welcome, " + Session["memberID"].ToString() + "!"; //updating it to say hello to the member ID. using member ID bc name can be null
                    //footer links (admin)
                    LinkButton6.Visible = true; //admin login in footer
                    LinkButton7.Visible = false; //author management in footer
                    LinkButton8.Visible = false; //publisher management  in footer
                    LinkButton9.Visible = false; //book inventory in footer
                    LinkButton10.Visible = false; //book issuing in footer
                    LinkButton11.Visible = false; //member management in footer
                }
                else if (Session["role"].Equals("admin")) //admin logs in, so they should not see login or sign up in H or F
                {
                    //header links
                    LinkButton2.Visible = false; //user login in header
                    LinkButton3.Visible = false; //user sign up in header
                    LinkButton4.Visible = true; //logout in header
                    LinkButton5.Visible = true; //hello user in header
                    LinkButton5.Text = "Hello Admin, " + Session["adminID"].ToString() + "."; // will add admin session var
                    //footer links (admin)
                    LinkButton6.Visible = false; //admin login in footer
                    LinkButton7.Visible = true; //author management in footer
                    LinkButton8.Visible = true; //publisher management  in footer
                    LinkButton9.Visible = true; //book inventory in footer
                    LinkButton10.Visible = true; //book issuing in footer
                    LinkButton11.Visible = true; //member management in footer
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Unsuccessful Master Page Load. " + ex.Message + "');</script>");
            }

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookmanagement.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookissuing.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookmanagement.aspx"); //to-do: prob will need to change to a different page to just show all books, not manage them
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e) //logout 
        {
            try
            {
                Session["memberID"] = "";
                Session["password"] = ""; ;
                Session["fullName"] = ""; ;
                Session["role"] = "";
                Session["accountStatus"] = "";

                // go back to default mode
                //header links
                LinkButton2.Visible = true; //user login in header
                LinkButton3.Visible = true; //user sign up in header
                LinkButton4.Visible = false; //logout in header
                LinkButton5.Visible = false; //hello user in header
                //footer links (admin)
                LinkButton6.Visible = true; //admin login in footer
                LinkButton7.Visible = false; //author management in footer
                LinkButton8.Visible = false; //publisher management  in footer
                LinkButton9.Visible = false; //book inventory in footer
                LinkButton10.Visible = false; //book issuing in footer
                LinkButton11.Visible = false; //member management in footer
                //Response.Write("<script>alert('Successfully logged out.');</script>"); //this doesn't show when redirect to-do: add popup notifications
                Response.Redirect("homepage.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Unsuccessful Logout. " + ex.Message + "');</script>");
            }
        }
    }
}