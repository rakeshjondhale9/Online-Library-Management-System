using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Remoting.Messaging;

namespace Online_Library_Management_System
{
    public partial class ReturnBooks : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBorrowedBooks();
            }
        }

        private void LoadBorrowedBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Query to get currently borrowed books that haven't been returned
                string query = @"
                    SELECT 
                        bb.BorrowID, 
                        b.Title AS BookTitle, 
                        bb.BorrowerName, 
                        bb.BorrowDate, 
                        bb.ReturnDate 
                    FROM 
                        BorrowedBooks bb
                    JOIN 
                        Books b ON bb.BookID = b.BookID 
                    WHERE 
                        bb.ReturnDate IS NULL"; // Only show books that haven't been returned

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Load the dropdown with borrowed books
                        ddlBorrowedBooks.DataSource = reader;
                        ddlBorrowedBooks.DataTextField = "BookTitle"; // Display the book title
                        ddlBorrowedBooks.DataValueField = "BorrowID"; // Use BorrowID as the value
                        ddlBorrowedBooks.DataBind();
                    }
                }

                // Now load the GridView with borrowed books
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvBorrowedBooks.DataSource = dt;
                    gvBorrowedBooks.DataBind();
                }
            }
        }

        protected void btnReturnBook_Click(object sender, EventArgs e)
        {
            int borrowID = Convert.ToInt32(ddlBorrowedBooks.SelectedValue);
            DateTime returnDate = DateTime.Now; // Current date as return date

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE BorrowedBooks SET ReturnDate = @ReturnDate WHERE BorrowID = @BorrowID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ReturnDate", returnDate);
                    cmd.Parameters.AddWithValue("@BorrowID", borrowID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Book returned successfully.";
            LoadBorrowedBooks(); // Reload the list of borrowed books
        }

    }
}