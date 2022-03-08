<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookmanagement.aspx.cs" Inherits="AlyssasLibrary.adminbookmanagement" %>
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
                                    <img width="100" src="images/BookFavoriteIcon.PNG" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Enter New Book Details</h3>
                                    <h7> <span> Enter book details for a new book being added to our inventory. </span> </h7>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- upload book image -->
                        <div class="row">
                            <div class="col-md-12">
                                <label> Upload Book Image </label>
                                <div class="form-group">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
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
                                <label> Book ID </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="bXXXX"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Search" />
                                     </div>
                                </div>
                            </div>

                             <div class="col-md-8">
                                <label> Book Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Book Name"></asp:TextBox>
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
                                <label> Language </label>
                                <div class="form-group">
                                      <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                      <asp:ListItem Text="English" Value="English" />
                                      <asp:ListItem Text="Hindi" Value="Hindi" />
                                      <asp:ListItem Text="Russian" Value="Russian" />
                                      <asp:ListItem Text="French" Value="French" />
                                      <asp:ListItem Text="German" Value="German" />
                                      <asp:ListItem Text="Spanish" Value="Spanish" />
                                      </asp:DropDownList>
                                </div>

                                <label> Author Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Author Name" ></asp:TextBox> <!-- This will be loaded after book ID is entered-->
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Publisher Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Publisher Name" ></asp:TextBox> <!-- This will be loaded after book ID is entered-->
                                </div>

                                <label> Published Date </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="mm-dd-yyy" TextMode="Date"></asp:TextBox> <!-- This will be loaded after book ID is entered-->
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Genre </label>
                                <div class="form-group">
                                    <asp:ListBox class="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="4">
                                          <asp:ListItem Text="Action" Value="Action" />
                                          <asp:ListItem Text="Adventure" Value="Adventure" />
                                          <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                          <asp:ListItem Text="Self Help" Value="Self Help" />
                                          <asp:ListItem Text="Wellness" Value="Wellness" />
                                          <asp:ListItem Text="Drama" Value="Drama" />
                                          <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                          <asp:ListItem Text="Horror" Value="Horror" />
                                          <asp:ListItem Text="Poetry" Value="Poetry" />
                                          <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                          <asp:ListItem Text="Romance" Value="Romance" />
                                          <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                          <asp:ListItem Text="Suspense" Value="Suspense" />
                                          <asp:ListItem Text="Thriller" Value="Thriller" />
                                          <asp:ListItem Text="Art" Value="Art" />
                                          <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                          <asp:ListItem Text="Health" Value="Health" />
                                          <asp:ListItem Text="History" Value="History" />
                                          <asp:ListItem Text="Manga" Value="Manga" />
                                    </asp:ListBox>
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
                                <label> Edition </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Edition" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Book Cost </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Cost" TextMode="Number"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Pages </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox> 
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
                                <label> Actual Stock </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Current Stock </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Checked Out </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Checked Out" TextMode="Number" ReadOnly="True"></asp:TextBox> 
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
                                <label> Book Description </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Enter Book Description" Rows="2" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
         
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Add" />
                            </div>
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Update" />
                            </div>
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-danger" ID="Button3" runat="server" Text="Delete" />
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
