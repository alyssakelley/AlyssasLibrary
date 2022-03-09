<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookmanagement.aspx.cs" Inherits="AlyssasLibrary.adminbookmanagement" %>
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
                                    <asp:FileUpload ID="uploadedBookImage" runat="server" /> <!-- Could also add logic here to change the icon to match the book photo upload, to-do: member pic-->
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
                                        <asp:TextBox CssClass="form-control" ID="ID" runat="server" placeholder="bXXXX"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
                                     </div>
                                </div>
                            </div>

                             <div class="col-md-8">
                                <label> Book Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="bookName" runat="server" placeholder="Book Name"></asp:TextBox>
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
                                      <asp:DropDownList class="form-control" ID="LangDropDownList" runat="server">
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
                                    <asp:DropDownList class="form-control" ID="AuthorDropDown" runat="server">
                                        <asp:ListItem Text="Author1" Value="a1" />
                                        <asp:ListItem Text="Author2" Value="a2" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Publisher Name </label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="PublisherDropDown" runat="server">
                                        <asp:ListItem Text="Publisher1" Value="p1" />
                                        <asp:ListItem Text="Publisher2" Value="p2" />
                                    </asp:DropDownList>
                                </div>

                                <label> Published Date </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="publishedDate" runat="server" placeholder="mm-dd-yyy" TextMode="Date"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Genre </label>
                                <div class="form-group">
                                    <asp:ListBox class="form-control" ID="GenreListBox" runat="server" SelectionMode="Multiple" Rows="4">
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
                                    <asp:TextBox CssClass="form-control" ID="edition" runat="server" placeholder="Edition" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Book Cost </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="cost" runat="server" placeholder="Cost" TextMode="Number"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Pages </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="pageCount" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox> 
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
                                    <asp:TextBox CssClass="form-control" ID="actualStock" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Current Stock </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="currentStock" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Checked Out </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="checkedOut" runat="server" placeholder="Checked Out" TextMode="Number" ReadOnly="True"></asp:TextBox> 
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
                                    <asp:TextBox CssClass="form-control" ID="bookDesc" runat="server" placeholder="Enter Book Description" Rows="2" TextMode="MultiLine"></asp:TextBox>
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
                                <asp:Button class="btn btn-success" ID="AddButton" runat="server" Text="Add" OnClick="AddButton_Click" />
                            </div>
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-primary" ID="UpdateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" />
                            </div>
                            <div class="d-grid gap-2 col-4 mx-auto">
                                <asp:Button class="btn btn-danger" ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
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
                                            <h3>Master Book Inventory</h3>
                                        </center>
                                    </div>
                                </div>

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSourceBookDim" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [BookDim]"></asp:SqlDataSource>                                   
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="BookGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="bookID" DataSourceID="SqlDataSourceBookDim">
                                            <Columns>
                                                <asp:BoundField DataField="bookID" HeaderText="ID" ReadOnly="True" SortExpression="bookID" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                         <div class="container-fluid"> <!-- container-fluid -->
                                                             <div class="row">
                                                                <div class="col-lg-10"> <!-- d-flex align-items-stretch"> -->
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <!-- book name -->
                                                                            <asp:Label ID="bookName" runat="server" Text='<%# Eval("bookName") %>' Font-Size="Larger" Font-Bold="True" Font-Names="Courier"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <!-- author, genre, lang -->
                                                                            <strong>Author:</strong>
                                                                            <asp:Label ID="authorName" runat="server" Text='<%# Eval("authorName") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                            &nbsp;&nbsp;<strong>&nbsp;|&nbsp;&nbsp; Genre(s):</strong>
                                                                            <asp:Label ID="genre" runat="server" Text='<%# Eval("genre") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                            &nbsp; <strong>&nbsp;|&nbsp;&nbsp; Language:</strong>
                                                                            <asp:Label ID="language" runat="server" Text='<%# Eval("language") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <!-- publisher, published date, pages, edition -->

                                                                            <strong>Publisher:</strong>
                                                                            <asp:Label ID="publisherName" runat="server" Text='<%# Eval("publisherName") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                            &nbsp;&nbsp;<strong>&nbsp;|&nbsp;&nbsp; Pages:</strong>
                                                                            <strong>
                                                                            <asp:Label ID="pageCount" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" Text='<%# Eval("pageCount") %>'></asp:Label>
                                                                            &nbsp;&nbsp; |&nbsp;&nbsp; Edition:</strong>
                                                                            <asp:Label ID="edition" runat="server" Text='<%# Eval("edition") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>

                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <!-- Desc -->
                                                                            <strong>Total Stock:</strong>
                                                                            <asp:Label ID="actualStock" runat="server" Text='<%# Eval("actualStock") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                            &nbsp;<strong>&nbsp; |&nbsp;&nbsp; Current Availability:</strong>
                                                                            <asp:Label ID="currentStock" runat="server" Text='<%# Eval("currentStock") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <!-- Desc -->
                                                                            <asp:Label ID="bookDesc" runat="server" Text='<%# Eval("bookDesc") %>' Font-Size="Medium" Font-Bold="False" Font-Italic="True"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-2"> <!-- This is the book image -->
                                                                    <asp:Image class="img-fluid p-2" ID="imgLink" runat="server" ImageUrl='<%# Eval("bookImgLink") %>'></asp:Image>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>
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
