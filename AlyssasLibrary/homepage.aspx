<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AlyssasLibrary.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section> <!-- sectiona and div tags are basically the same -->
        <!--img src="images/AKBanner.PNG" class="img-fluid"/> <!-- class if from bootstrap so the image will be responsive-->
        <img class="img-fluid" src="images/AKBanner2.png"/>
    </section>

    <section> <!-- sectiona and div tags are basically the same -->
        <div class="container"> <!-- this container in th emiddle of the page will hold the three different options -->
            <div class="row"> <!-- The rows will be 1) a description and 2) the different selections -->
                <div class="col-12"> <!-- column will hold the individual options, total: 3 -->
                    <center>
                       <h2 style="font-family:'Courier'"> On this page, you can: </h2>
                       <p><b> Browse our Book Inventory  -  Search Books  -  View Founder's Favorites </b></p>                     
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"> <!-- column can be divided into 12 parts, we have three options: 12/3 = 4, md = this dev takes 4 parts of the entire row when device is above medium size, it is is below, it'll take the entire row (aka mobile view) -->
                    <center>
                        <a href="https://github.com/alyssakelley">
                            <img width="150" src="images/BookSearchIcon.PNG" />
                        </a>
                        <h4> Sign Up </h4>
                        <p class="text-justify"> Please click here to create an account at Alyssa's Library. </p>                      
                    </center>
                </div>
                <div class="col-md-3"> <!-- column can be divided into 12 parts, we have three options: 12/3 = 4, md = this dev takes 4 parts of the entire row when device is above medium size, it is is below, it'll take the entire row (aka mobile view) -->
                    <center>
                        <img width="150" src="images/CloudDownloadIcon.PNG" />
                        <h4> Book Inventory </h4>
                        <p class="text-justify"> Please click here to view the books available at Alyssa's Library. </p>
                    </center>
                </div>

                <div class="col-md-3"> <!-- column will hold the individual options, total: 3 -->
                    <center>
                        <img width="150" src="images/BookEarthSearchIcon.PNG"/>
                        <h4> Search Books</h4>
                        <p> You can use this feature to search for specific books at Alyssa's Library. </p>
                    </center>
                </div>

                <div class="col-md-3"> <!-- column will hold the individual options, total: 3 -->
                    <center>
                        <img width="150" src="images/BookFavoriteIcon.PNG"/>
                        <h4> Founder's Favorites </h4>
                        <p style="font-family:'Courier'"> These books are Alyssa's favorites that we encourage you to check out. </p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <section> <!-- sectiona and div tags are basically the same -->
        <!--img src="images/AKBanner.PNG" class="img-fluid"/> <!-- class if from bootstrap so the image will be responsive-->
        <img class="img-fluid" src="images/Background1Resized2.png"/>
    </section>

</asp:Content>
