<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="AlyssasLibrary.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container fluid">
        <div class="row">
            <div class="col-md-6"> <!-- d-flex align-items-stretch"> -->
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="images/UserImage.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Profile</h3>
                                    <span> Account Status - </span>
                                    <asp:Label style="color:blue" ID="Label1" runat="server" Text="DynamicStatus"></asp:Label> <!-- Color will depend on status, dynamically changed -->
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                                <label> Full Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label> Date of Birth </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="mm-dd-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label> Phone Number </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Phone Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label> Email Address </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label> State </label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" placeholder="State">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="California" Value="CA" />
                                        <asp:ListItem Text="Idaho" Value="ID" />
                                        <asp:ListItem Text="Oregon" Value="OR" />
                                        <asp:ListItem Text="Montana" Value="MT" />
                                        <asp:ListItem Text="Washington" Value="WA" />
                                    </asp:DropDownList>

                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> City </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Zip Code </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col"> <!-- recall: col takes up all spaces-->
                                <label> Home Address </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Home Address" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                  <br />                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="tag tag-pill tag-primary">                                     
                                        Login Credentials
                                    </span>
                                </center>                               
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                  <br />                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label> Member ID </label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> Current Password </label>
                                <div class="form-group"> <!-- might want to make these read only -->
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Current Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> New Password </label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

         
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="d-grid gap-2 col-12 mx-auto">
                                <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Sign Up" />
                            </div>
                        </div>
               </div>
            </div>          
         </div>

            <!-- Checkedout Books-->
            <div class="col-md-6"> <!-- d-flex align-items-stretch"> -->
                <div class="card h-100"> <!-- the card will take up the entire height 100 = 100% not 100px-->
                    <div class="card-body">
                        <div class="row">
                                    <div class="col">
                                        <center>
                                            <img width="100" src="images/BooksCircleIcon.PNG" />
                                        </center>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h3>Checked Out Books</h3>
                                            <asp:Label  ID="Label2" runat="server" Text="Book Info"></asp:Label> 
                                        </center>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:GridView class="table table-hover" ID="GridView1" runat="server"></asp:GridView>
                                    </div>
                                </div>

                    </div>
                </div>
            </div>
        </div>
            
        <Center>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
        </Center>
   </div>
</asp:Content>
