using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class ReportBooks : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
                LoadBorrowedBooks();
                LoadReturnedBooks();
            }
        }

        private void LoadBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT BookID, Title, Author, PublishedDate FROM Books", con))
                {
                    gvBooks.DataSource = cmd.ExecuteReader();
                    gvBooks.DataBind();
                }
            }
        }

        private void LoadBorrowedBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // Assuming BorrowedBooks table has BookID and UserID
                string query = @"
                    SELECT bb.BorrowID,b.BookID, b.Title AS BookTitle, bb.BorrowerName AS BorrowedBy, bb.BorrowDate 
                    FROM BorrowedBooks bb 
                    JOIN Books b ON bb.BookID = b.BookID 
                    WHERE bb.ReturnDate IS NULL";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    gvBorrowedBooks.DataSource = cmd.ExecuteReader();
                    gvBorrowedBooks.DataBind();
                }
            }
        }

        private void LoadReturnedBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // Assuming ReturnedBooks table has BookID and UserID
                string query = @"
                    SELECT r.ReturnID, b.Title AS BookTitle,bb.BorrowerName AS ReturnedBy, r.ReturnDate 
                    FROM ReturnedBooks r 
                    JOIN Books b ON r.BookID = b.BookID
                   JOIN BorrowedBooks bb ON bb.BookID = b.BookID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    gvReturnedBooks.DataSource = cmd.ExecuteReader();
                    gvReturnedBooks.DataBind();
                }
            }
        }
    }
}