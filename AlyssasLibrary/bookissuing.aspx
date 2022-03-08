<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookissuing.aspx.cs" Inherits="AlyssasLibrary.bookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container"> <!-- container-fluid -->
        <div class="row">
            <div class="col-md-6"> <!-- d-flex align-items-stretch"> -->
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="images/BookSearchIcon.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Book Issuing</h3>
                                    <h7> <span> Enter Member and Book Information for New Checkout or Return </span> </h7>
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
                                <label> Member ID </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label> Book ID </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="bXXXX"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label> Member Full Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
                                </div>
                            </div>

                             <div class="col-md-6">
                                <label> Book Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after book ID is entered-->
                                </div>
                            </div>
                        </div>

                        <div class="row">
                             <div class="col-md-6">
                                <label> Checkout Date </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="mm-dd-yyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label> Return Date </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="mm-dd-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
         
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-grid gap-2 col-6 mx-auto">
                                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Checkout" />
                            </div>
                            <div class="d-grid gap-2 col-6 mx-auto">
                                <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Return" />
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
                                            <h3>Issued Book List</h3>
                                            <asp:Label  ID="Label2" runat="server" Text="Book Info"></asp:Label> 
                                        </center>
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

