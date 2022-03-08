# AlyssasLibrary
An E-Library web application created using ASP.NET, Bootstrap, Datatables, and Fontawesome using SQL Database. The user functionalities include user sign up, login, view books, and view/edit profile. The admin functionalities include admin login, author management, publisher management, book inventory, book issuing, and member management. You can also view the static pages to show my resume and my favorite books.What was your motivation?

Goal/What I learned: I built this web application to familiarize myself with the .NET stack and build an application start to finish. Throughout this process, I learned how to build a web application using ASP.NET with bootstrap front end styling. I also learned how to use jQuery to display my data in tables with the assistance of the Datatables library. This web app is reading, updating, and deleting records from my SQL database which was another learning opportunity for me. I will be hosting this on ADO so that process with be new to me as well.

## Features/Layout
### Homepage/Header
The header will allow the user to see a static “About Me” and “Founder’s Favorites” page.
###### About Me 
	This showcases some information about myself, both personal and profession. 
###### Founder’s Favorites 
	This shows my top 5 favorite books at the moment, with a link to my good reads account. 
Towards the left of the header, you will see the following dynamic pages:
###### View Books 
	View the available books we have for potential checkout.
###### User Login 
	The member login page, if the member already has an account, they can login with their memberID and password. If not, they can click the Sign Up button. Once the user logs in, they will be navigates to the homepage. 
###### Sign Up 
	Navigates to the member sign up page. The only fields that are mandatory is the member ID (primary key in the DB). Once the user signs up, they will be navigates to the user login page.
Note: These dynamic header options will change if the member is logged in. When the member is logged in, you will see:
###### View Books 
	View the available books we have for potential checkout.
###### Logout 
	This will reset all of the session variables, and navigate the user to the homepage.
###### Hello, [member ID]!	
	(not a link)

### Homepage/Footer
The footer will initially show and “Admin Login” link. 
###### Admin Login 
	You cannot create an admin account, but if you have the login credentials, you will be able to login successfully using this link.
When you are logged in as admin, the header changes to mimic user login, and the footer will now display the following options:
###### Author Management
	This page will allow you to view, add, modify and delete author information. You can see all of the author information in the right table where you will also be able to search the table. You will have the following button options:
		Search -   You can enter the authorID into the “Author ID” textbox, and if you click the blue “Search” button, it will populate the “Author Name” textbox if it finds a match.
		Modify – You can enter an authorID into the “Author ID” textbox, and a different “Author Name”, and when you click “Modify” it will update the author name in the database and refresh the table to the right to show that change. 
		Delete - You can enter an authorID into the “Author ID” textbox, and when you click “Delete”, it will delete the row from the database and the table to the right will refresh to show that author is no longer present.
###### Publisher Management 
	This page will allow you to view, add, modify and delete publisher information. You can see all of the publisher information in the right table where you will also be able to search the table. You will have the following button options:
		Search -   You can enter the publisher ID into the “Publisher ID” textbox, and if you click the blue “Search” button, it will populate the “Publisher Name” textbox if it finds a match.
		Modify – You can enter a publisher ID into the “Publisher ID” textbox, and a different “Publisher Name”, and when you click “Modify” it will update the author name in the database and refresh the table to the right to show that change. 
		Delete - You can enter a publisher ID into the “Publisher ID” textbox, and when you click “Delete”, it will delete the row from the database and the table to the right will refresh to show that publisher is no longer present.
###### Book inventory 
	This page will allow you to add a new book, update an existing book record, or delete a book. It will show all of the books in the table on the right.
###### Book Issuing 
	The admin will be able to checkout or return books for a given member. It will also show all of the books the member has checked out.
###### Member Management 
	The admin will be able to see the member’s profile details, and be able to update the account status (the account status is pending until the admin changes it to active), or permanently delete the membership. You will also see all of the member’s checkout books in the right table.
You will also be able to navigate to these pages by clicking the 4 icons in the center of the homepage: Sign Up, Book Inventory, Search Books, and Founder’s Favorites.

