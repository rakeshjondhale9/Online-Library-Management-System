<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportBooks.aspx.cs" Inherits="Online_Library_Management_System.ReportBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <style>
        /* ReportBooks.css */
        .report-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .report-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab-button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 5px;
            transition: background-color 0.3s;
        }

        .tab-button:hover {
            background-color: #0056b3;
        }

        .tab-button.active {
            background-color: #0056b3; /* Active button color */
        }

        .tab-content {
            display: none; /* Hide by default */
        }

        .report-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .report-table th, .report-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .report-table th {
            background-color: #007bff;
            color: white;
        }

        .report-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .report-table tr:hover {
            background-color: #e0e0e0;
        }
    </style>

    <div class="report-container">
        <h2>Library Reports</h2>
        <asp:Button ID="btnPrint" runat="server" Text="Print Report" CssClass="btn btn-print" OnClientClick="printReport(); return false;" />
        <div class="tabs">
        <button class="tab-button" onclick="showTab1()">All Books</button>
      <button class="tab-button" onclick="showTab2()">Borrowed Books</button>
      <button class="tab-button" onclick="showTab3()">Returned Books</button>
            </div>
        <div id="books">
            <h3>All Books</h3>
            <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" CssClass="report-table">
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" />
                    <asp:BoundField DataField="PublishedDate" HeaderText="Published Date" />
                </Columns>
            </asp:GridView>
        </div>

        <div id="borrowed">
            <h3>Borrowed Books</h3>
            <asp:GridView ID="gvBorrowedBooks" runat="server" AutoGenerateColumns="False" CssClass="report-table">
                <Columns>
                    <asp:BoundField DataField="BorrowID" HeaderText="Borrow ID" />
                    <asp:BoundField DataField="BookTitle" HeaderText="Book Title" />
                    <asp:BoundField DataField="BorrowedBy" HeaderText="Borrowed By" />
                    <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
        </div>

        <div id="returned">
            <h3>Returned Books</h3>
            <asp:GridView ID="gvReturnedBooks" runat="server" AutoGenerateColumns="False" CssClass="report-table">
                <Columns>
                    <asp:BoundField DataField="ReturnID" HeaderText="Return ID" />
                    <asp:BoundField DataField="BookTitle" HeaderText="Book Title" />
                    <asp:BoundField DataField="ReturnedBy" HeaderText="Returned By" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script type="text/javascript">
        // Show the Books tab by default
       

      
        function printReport() {
            var printContents = document.querySelector('.report-container').innerHTML;
            var newWindow = window.open('', '', 'height=600,width=800');
            newWindow.document.write('<html><head><title>Print Report</title>');
        
            newWindow.document.write('</head><body>');
            newWindow.document.write(printContents);
            newWindow.document.write('</body></html>');
            newWindow.document.close();
            newWindow.print();
        }
    </script>
</asp:Content>
