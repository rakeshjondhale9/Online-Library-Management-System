<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReturnBooks.aspx.cs" Inherits="Online_Library_Management_System.ReturnBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="return-books-container">
        <h2>Return a Book</h2>
        
        <div class="form-group">
            <label for="ddlBorrowedBooks">Select Borrowed Book:</label>
            <asp:DropDownList ID="ddlBorrowedBooks" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        
        <asp:Button ID="btnReturnBook" runat="server" Text="Return Book" CssClass="btn" OnClick="btnReturnBook_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="success-message" />

        <h2>Currently Borrowed Books</h2>
        <asp:GridView ID="gvBorrowedBooks" runat="server" CssClass="table" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="BorrowID" HeaderText="Borrow ID" />
                <asp:BoundField DataField="BookTitle" HeaderText="Book Title" />
                <asp:BoundField DataField="BorrowerName" HeaderText="Borrower's Name" />
                <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>
    </div>


    <style>
     /* ReturnBooks.css */
.return-books-container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.return-books-container h2 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn {
    background-color: #007bff;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

.btn:hover {
    background-color: #0056b3;
}

.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.table th, .table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

.table th {
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

.table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.table tr:hover {
    background-color: #e0e0e0;
}

.success-message {
    color: green;
    font-weight: bold;
    text-align: center;
    margin-top: 15px;
}

    </style>
</asp:Content>
