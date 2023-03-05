using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;

namespace _33705119_Assignment2
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection connection;
        static string sqlConn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\takeafew.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrors.Text = "";
            HttpCookie loginDetails = Request.Cookies["takeafew"];

            //auto-login if selected
            if (loginDetails != null)
            {
                connection = new SqlConnection(sqlConn);
                if(checkLoginDetails(loginDetails["Email"], loginDetails["Password"])) 
                {
                    Response.Redirect("default.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = tbEmail.Text;
            string password = tbPassword.Text;
            HttpCookie log = new HttpCookie("takeafew");
            connection = new SqlConnection(sqlConn);

            //checks login details
            try 
            {
                if(checkLoginDetails(email, password))
                { 
                    if (cbLog.Checked) 
                    {
                        log["Email"] = email;
                        log["Password"] = password;
                        Response.Cookies.Add(log);
                        log.Expires = DateTime.Now.AddDays(10);
                    }
                        
                    if (newLogin(email))
                        Response.Redirect("setup.aspx");
                    else
                        Response.Redirect("default.aspx");
                }
                else
                lblErrors.Text = "Invalid login details";
            }
            catch(SqlException ex)
            {
                lblErrors.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        //compares the information against database and returns the result
        public bool checkLoginDetails(string email, string password)
        {
            connection.Open();
            string query = $"SELECT WorkerID, Email, Password FROM Users WHERE Email = '{email}'";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                if(reader.GetValue(1).Equals(email))
                {
                    string matchPassword = reader.GetValue(2).ToString();
                    Session["WorkerID"] = reader.GetValue(0);

                    if (matchPassword.Equals(password))
                    { 
                        reader.Close();
                        reader.Dispose();
                        connection.Close();
                        return true;
                    }
                }
            }

            reader.Close();
            reader.Dispose();
            connection.Close();
            return false;
        }

        //executes if user is logging in for the first time
        public bool newLogin(string email)
        {

            connection.Open();
            string queryLog = $"SELECT Name, Surname FROM Users WHERE Email = '{email}'";
            SqlCommand commandLog = new SqlCommand(queryLog, connection);
            SqlDataReader readerLog = commandLog.ExecuteReader();
            
            while (readerLog.Read())
            {
                if (readerLog.GetValue(0).Equals(".X") || readerLog.GetValue(1).Equals(".X"))
                {
                    connection.Close();
                    return true;
                }
            }
            connection.Close();
            return false;
        }
    }
}