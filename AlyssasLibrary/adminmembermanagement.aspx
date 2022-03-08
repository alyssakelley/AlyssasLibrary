<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="AlyssasLibrary.membermanagement" %>
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
                                        <asp:TextBox CssClass="form-control" ID="ID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
                                     </div>
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> Member Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Name" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label> Account Status </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control me-1" ID="Status" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success me-1" ID="ApproveStatusButton" runat="server" Text="A" OnClick="ApproveStatusButton_Click"> <i class="fas fa-check-circle"> </i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning me-1" ID="PendingStatusButton" runat="server" Text="P" OnClick="PendingStatusButton_Click"> <i class="fas fa-pause-circle"> </i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger me-1" ID="ApproveDisableButton" runat="server" Text="D" OnClick="ApproveDisableButton_Click"> <i class="fas fa-times-circle"> </i> </asp:LinkButton>
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
                                    <asp:TextBox CssClass="form-control" ID="DOB" runat="server" placeholder="mm-dd-yyy" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> Member Phone Number </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="PhoneNum" runat="server" placeholder="Phone No." ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Member Email </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Email" runat="server" placeholder="Email Address" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
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
                                <label> City </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="City" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
                                </div>
                            </div>

                             <div class="col-md-4">
                                <label> State </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="State" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Zip Code </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Zip" runat="server" placeholder="Zip Code" ReadOnly="True"></asp:TextBox> <!-- This will be loaded after member ID is entered-->
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
                                    <asp:TextBox CssClass="form-control" ID="Addr" runat="server" placeholder="Member Address" ReadOnly="True" Rows="2" TextMode="MultiLine"></asp:TextBox>
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
                                <asp:Button class="btn btn-danger" ID="PermDeleteButton" runat="server" Text="Permanently Delete Membership" OnClick="PermDeleteButton_Click" />
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
                                            <h3>Master Member List</h3>
                                        </center>
                                    </div>
                                </div>

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSourceMemberDim" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [MemberDim]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSourceMemberDim" AutoGenerateColumns="False" DataKeyNames="memberID">
                                            <Columns>
                                                <asp:BoundField DataField="memberID" HeaderText="ID" SortExpression="memberID" ReadOnly="True" />
                                                <asp:BoundField DataField="fullName" HeaderText="Name" SortExpression="fullName" />
                                                <asp:BoundField DataField="accountStatus" HeaderText="Status" SortExpression="accountStatus" />
                                                <asp:BoundField DataField="phoneNumber" HeaderText="Phone Number" SortExpression="phoneNumber" />
                                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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