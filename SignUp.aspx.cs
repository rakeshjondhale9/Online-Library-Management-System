using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class SignUp : Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string email = txtEmail.Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Password, Email) VALUES (@Username, @Password, @Email)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); // Consider using hashed passwords for security.
                    cmd.Parameters.AddWithValue("@Email", email);

                    con.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Registration successful! You can now log in.";
                        Thread.Sleep(2000);
                        Response.Redirect("~/Login.aspx");
                    }
                    catch (SqlException ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message; // Handle unique constraint violations and other errors.
                    }
                }
            }
        }
    }
}