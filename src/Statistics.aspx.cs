using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace _33705119_Assignment2
{
    public partial class Statistics : System.Web.UI.Page
    {
        SqlConnection connection;
        int total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["WorkerID"] == null)
                Response.Redirect("login.aspx");

            //displays information in controls
            getStats();
            if (IsPostBack)
            {
                Chart2.Visible = false;
            }

            if(ViewState["pos"] == null)
                loadCombo();

            //reset notification label colour state 
            lblInfo.ForeColor = System.Drawing.Color.Black;
        }

        protected void btnHome_Click1(object sender, EventArgs e)
        {
            //return to default
            Response.Redirect("default.aspx");
        }
        public void loadCombo()
        {
            Takeafew takeafew = new Takeafew();
            connection = new SqlConnection(takeafew.getSqlConn());
            lbAvg.Items.Clear();

            try
            {
                connection.Open();
                SqlCommand getWName = new SqlCommand("SELECT DISTINCT Name FROM Warehouse", connection);
                SqlDataReader reader = getWName.ExecuteReader();
                while (reader.Read())
                {
                    lbAvg.Items.Add(reader.GetValue(0).ToString());
                }
                reader.Close();
                lblInfo.Text = "";
                reader.Dispose();
                connection.Close();
            } 
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        public void LoadWare()
        {
            Chart2.Visible = true;
            Takeafew takeafew = new Takeafew();
            //gets and loads the different warehouses into the ListBox
            connection = new SqlConnection(takeafew.getSqlConn());
            try
            {
                connection.Open();

                string query = $"SELECT Position, COUNT(*) AS Total FROM Employees WHERE Warehouse = '{lbAvg.Text}' GROUP BY Position";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet, "Employees");

                Chart2.DataSource = dataSet.Tables[0];
                Chart2.Series[0].XValueMember = "Position";
                Chart2.Series[0].YValueMembers = "Total";
                Chart2.Titles.Add(lbAvg.Text);
                Chart2.DataBind();
            }
            catch(SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void getStats()
        {
            Takeafew takeafew = new Takeafew();
            connection = new SqlConnection(takeafew.getSqlConn());
            //display data accordingly in the different controls
            try
            {
                connection.Open();

                string query = $"SELECT Warehouse, COUNT(*) AS Total FROM Employees GROUP BY Warehouse";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet,"Employees");
                SqlCommand getEmp = new SqlCommand("SELECT COUNT(*) FROM Employees", connection);

                int num = (int)getEmp.ExecuteScalar();
                total = num;
                tbTotal.Text = num.ToString();

                SqlCommand getWH = new SqlCommand("SELECT DISTINCT COUNT(*) FROM Warehouse", connection);

                int warehouse = (int)getWH.ExecuteScalar();

                
                
                tbAvg.Text = String.Format("{0:F}", num/7);

                Chart1.DataSource = dataSet.Tables[0];

                Chart1.Series[0].XValueMember = "Warehouse";
                Chart1.Series[0].YValueMembers = "Total";
                Chart1.DataBind();

                SqlCommand getJobs = new SqlCommand($"SELECT DISTINCT Position FROM Employees",connection);
                SqlDataReader readerJobs = getJobs.ExecuteReader();
                while (readerJobs.Read())
                { 
                    lbJobs.Items.Add(readerJobs.GetValue(0).ToString());
                }

                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Takeafew takeafew = new Takeafew();
            lblInfo.Text = takeafew.updateValues(total);
        }

        public void setPos()
        {
            ViewState["Pos"] = lbAvg.SelectedIndex;
        }

        protected void lbJobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            string wareSearch = lbAvg.Text;
            lblStatJob.Text = $"Statistics for {wareSearch} are:  ";
            Takeafew takeafew = new Takeafew();
            lbJobStats.Items.Clear();
            int counter = -1;
            connection = new SqlConnection(takeafew.getSqlConn());
            //displays associated positions from warehouse
            try
            {
                connection.Open();
                string query = $"SELECT Position, COUNT(*) AS Total FROM Employees WHERE Warehouse = '{wareSearch}' AND Position='{lbJobs.Text}' GROUP BY Position";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    int value = int.Parse(reader.GetValue(1).ToString());
                    if(value == 1)
                        lbJobStats.Items.Add($"{reader.GetValue(0)}'s - {value} worker");
                    else
                        lbJobStats.Items.Add($"{reader.GetValue(0)}'s - {value} workers");
                    counter++;
                }
                
                if(counter == -1)
                {
                    lbJobStats.Items.Clear();
                    lbJobStats.Items.Add($"This warehouse does not have {(lbJobs.Text).ToLower()}s");
                }

                lbJobStats.Focus();

                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].ToString()}";
                    lblInfo.ForeColor = System.Drawing.Color.Red;
             }
        }

        protected void lbAvg_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["pos"] = lbAvg.SelectedIndex;
            LoadWare();
        }
    }
    }