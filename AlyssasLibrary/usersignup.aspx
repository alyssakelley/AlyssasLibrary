<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="AlyssasLibrary.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
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
                                    <h3>Member Sign Up</h3>
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
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label> Date of Birth </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="mm-dd-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label> Phone Number </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Phone Number" TextMode="Phone"></asp:TextBox>
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
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Home Address" Rows="2" TextMode="MultiLine"></asp:TextBox>
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
                                    <span class="tag tag-pill badge-primary">                                     
                                        Login Credentials
                                    </span>
                                </center>                               
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label> Member ID </label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label> Password </label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
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
                                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                            </div>
                        </div>
               </div>
            </div>
                <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>
