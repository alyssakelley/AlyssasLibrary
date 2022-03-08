<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="AlyssasLibrary.membermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid"> <!-- container-fluid -->
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
                                    <h3>Member Details</h3>
                                    <h7> <span> Enter Member ID to update member status or delete membership. </span> </h7>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label> Member ID </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Search" />
                                     </div>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> Member Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label> Account Status </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control me-1" ID="TextBox5" runat="server" placeholder="DynamicStatus" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success me-1" ID="Button3" runat="server" Text="A"> <i class="fas fa-check-circle"> </i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning me-1" ID="Button5" runat="server" Text="P"> <i class="fas fa-pause-circle"> </i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger me-1" ID="Button6" runat="server" Text="D"> <i class="fas fa-times-circle"> </i> </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col">
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label> Member DOB </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="mm-dd-yyy" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> Member Phone Number </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Phone No." ReadOnly="True"></asp:TextBox> <!-- This will be loaded after book ID is entered-->
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Member Email </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Email Address" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after book ID is entered-->
                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <br />
                            </div>
                        </div>

                        <div class="row">
                             <div class="col-md-12">
                                <label> Member Full Address </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Member Address" ReadOnly="True" Rows="2" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
         
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-grid gap-2 col-12 mx-auto">
                                <asp:Button class="btn btn-danger" ID="Button1" runat="server" Text="Permanently Delete Membership" />
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
                                            <h3>Member's Books</h3>
                                        </center>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:GridView class="table table-hover" ID="GridView1" runat="server"></asp:GridView>
                                    </div>
                                </div>

                        <div class="row">
                            <div class="col">
                                <hr />
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