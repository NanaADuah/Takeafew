using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; 

namespace _33705119_Assignment2
{
    public partial class Settings : System.Web.UI.Page
    {
        SqlConnection connection;
        static string sqlConn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\takeafew.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = "";
            string surname = "";
            string email = "";
            string position = "";
            DateTime birthDate = new DateTime();
            DateTime employmentDate = new DateTime();
            if(!Page.IsPostBack)
            {

            //retrieve data of user logged in 
            if (Session["WorkerID"] != null)
            {
                try
                {
                    string query = $"SELECT Name, Email, Surname, Position, EmploymentDate, BirthDate FROM Users WHERE WorkerID = {Session["WorkerID"]}";
                    connection = new SqlConnection(sqlConn);
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);

                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        name = reader.GetValue(0).ToString();
                        email = reader.GetValue(1).ToString();
                        surname = reader.GetValue(2).ToString();
                        position = reader.GetValue(3).ToString();
                        employmentDate = Convert.ToDateTime(reader.GetValue(4).ToString());
                        birthDate = Convert.ToDateTime(reader.GetValue(5).ToString());
                    }

                    //displating default data from database
                    if(name.Equals(".X"))
                        tbName.Text = "Pending";
                    else
                        tbName.Text = name;
                    tbEmail.Text = email;

                    if(surname.Equals(".X"))
                        tbSurname.Text = "Pending";
                    else
                        tbSurname.Text = surname;

                    tbPosition.Text = position;
                    tbEmployement.Text = employmentDate.ToString(@"yyyy\/MM\/dd");
                    Calendar1.SelectedDate = birthDate;
                    Calendar1.VisibleDate = birthDate;
                    string fullName;

                    if (name.Equals(".X"))
                        fullName = "Hello";
                    else
                        fullName = $"Hello {name} {surname}";

                    lblDetails.ForeColor = System.Drawing.Color.Black;
                    lblDetails.Text = $"{fullName}, here are some of your details below, you can update them and save the details";
                    connection.Close();

                }
                catch (SqlException ex)
                {
                    lblDetails.Text = $"An error occured, {ex.Errors[0].Message}";
                    lblDetails.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
                Response.Redirect("login.aspx");
            }
        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            //update the information in the database
            if (Session["WorkerID"] != null)
            {
                if (!tbName.Text.Equals("Pending") && !tbSurname.Text.Equals("Pending"))
                {
                    connection = new SqlConnection(sqlConn);
                    try
                    {
                        connection.Open();
                        string query = $"UPDATE Users SET Name = '{tbName.Text}', Surname = '{tbSurname.Text}', Email = '{tbEmail.Text}', BirthDate = '{Calendar1.SelectedDate.ToString()}' WHERE WorkerID = {Session["WorkerID"]}";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        connection.Close();
                        Response.Redirect("default.aspx");
                    } catch (SqlException ex)
                    {
                        lblDetails.Text = $"An error occured, {ex.Errors[0].Message}";
                        lblDetails.ForeColor = System.Drawing.Color.Red;
                    }
                } else
                {
                    lblDetails.Text = $"Invalid name/surname";
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //redirect back to the home page
            Response.Redirect("default.aspx");
        }
    }
}