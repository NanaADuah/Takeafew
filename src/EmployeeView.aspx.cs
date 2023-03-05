using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace _33705119_Assignment2
{
    public partial class EmployeeView : System.Web.UI.Page
    {
        SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            Takeafew takeafew = new Takeafew();

            //redirect back to login page if not logged in
            if (Session["WorkerID"] == null)
                Response.Redirect("login.aspx");

            connection = new SqlConnection(takeafew.getSqlConn());
            displayData("SELECT EmployeeID, Name, Surname, Position, Email FROM Employees", "Employees");
            btnHire.Visible = true;
            btnCancel.Visible = false;
            btnAccept.Visible = false;
            empNum.Visible = false;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        //displaying queried information in GridView
        public void displayData(string query, string source)
        {
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dataSet = new DataSet();

                adapter.SelectCommand = command;
                adapter.Fill(dataSet, source);
                employeeGrid.DataSource = dataSet;
                employeeGrid.DataMember = source;
                employeeGrid.DataBind();

                DataTable table = new DataTable();
                adapter.Fill(table);

                if(table != null)
                { 
                    if(table.Rows.Count == 0)
                    {
                        lblInfo.Text = "No data in table...";
                        Label5.Visible = false;
                        Button1.Visible = false;
                        Button2.Visible = false;
                        Button3.Visible = false;
                    }
                    else
                    {
                        lblInfo.Text = "";
                        Label5.Visible = true;
                        Button1.Visible = true;
                        Button2.Visible = true;
                        Button3.Visible = true;
                    }
                }

                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string query = $"SELECT EmployeeID, Name, Surname, Position, Email FROM Employees WHERE {dlItems.Text} LIKE '%{tbSearch.Text}%'";
            search(query);
        }

        //searching queried data and displating in GridView
        public void search(string query)
        {
            SqlCommand command = new SqlCommand(query, connection);
            try
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;
                DataSet dataSet = new DataSet();

                adapter.Fill(dataSet, "Employees");
                employeeGrid.DataSource = dataSet;
                employeeGrid.DataMember = "Employees";
                employeeGrid.DataBind();
                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            search("SELECT * FROM Employees");
        }

        protected void btnHire_Click(object sender, EventArgs e)
        {
            //hide or display any necessary controls
            btnCancel.Visible = true;
            btnHire.Visible = false;    
            empNum.Visible = true;
            empNum.Text = "1";
            btnAccept.Visible = true;
            lblInfo.Text = "";
            empNum.Focus();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //hide or display any necessary controls
            btnHire.Visible = true;
            btnCancel.Visible = false;
            btnAccept.Visible = false;
            empNum.Visible = false;
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            //Generate and add a list of new employees and then display
            Takeafew takeafew = new Takeafew();
            int num;
            btnHire.Visible = false;
            if (int.TryParse(empNum.Text, out num))
            {
                if (num >= 1 && num <= 20)
                {
                    try
                    {
                        lblInfo.Text = takeafew.generateEmployees(num);
                        displayData("SELECT EmployeeID, Name, Surname, Position, Email FROM Employees", "Employees");
                    }
                    catch (SqlException ex)
                    {
                        lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
                    }
                }
                else
                {
                    lblInfo.Text = "Invalid range|Min: 1 - Max: 20";
                    lblInfo.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblInfo.Text = "Invalid number";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }

            btnHire.Visible = true;
            btnAccept.Visible = false;
            empNum.Visible = false;
            btnCancel.Visible = false;
        }

        //filter
        protected void Button1_Click2(object sender, EventArgs e)
        {
            displayData("SELECT  EmployeeID, Name, Surname, Position, Email,  FROM Employees ORDER BY Name", "Employees");
        }

        //filter
        protected void Button2_Click(object sender, EventArgs e)
        {
            displayData("SELECT EmployeeID, Surname, Name, Position, Email, Warehouse FROM Employees ORDER BY Surname", "Employees");
        }

        //filter
        protected void Button3_Click(object sender, EventArgs e)
        {
            displayData("SELECT  EmployeeID, Name, Surname, Position, Email,  FROM Employees ORDER BY WorkerID", "Employees");
        }

        protected void employeeGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = employeeGrid.SelectedRow.Cells[0].Text;
            lblInfo.Text = value;
        }

        protected void employeeGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //view employee details
            Response.Redirect("SingleEmployee.aspx");
        }
    }
}