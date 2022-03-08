<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="AlyssasLibrary.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //jQuery is put into the head content place holder for a web form page
        //to-do: add delete and modify option directly on the same via datatables
        $(document).ready( function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable(); //the first row is seen as a data row but it is actually the heading so we need to append that here 
        });
    </script>

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
                                    <h3> Author Management </h3>
                                    <span> Add/Update/Delete Author Details </span>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="200" src="images/Author.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-4">
                                <label> Author ID </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="aXXXX"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Search" OnClick="Button4_Click" />
                                     </div>
                                </div>
                            </div>

                             <div class="col-md-8">
                                <label> Author Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Author Name" ></asp:TextBox>
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
                                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                            </div>
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-primary" ID="Button6" runat="server" Text="Modify" OnClick="Button6_Click" />
                            </div>
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-danger" ID="Button10" runat="server" Text="Delete" OnClick="Button10_Click" />
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
                                    <h3>Author List</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [AuthorDim]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="authorID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="authorID" HeaderText="authorID" ReadOnly="True" SortExpression="authorID" />
                                        <asp:BoundField DataField="authorName" HeaderText="authorName" SortExpression="authorName" />
                                    </Columns>
                                </asp:GridView>
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
