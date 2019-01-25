using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DemoRandom
{
    public partial class frmcongratulations : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["Condb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnback.Focus();
            string id = Request.QueryString["ID"];
            string Tid = id.Trim();
            string NUMBer = Request.QueryString["N"];
            DataTable dt = new DataTable();
            string Uname = string.Empty;
            string Dept = string.Empty;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "GetEmpl";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("ID", Convert.ToInt32(NUMBer)));
                    cmd.Connection = con;
                    using (SqlDataReader dtr = cmd.ExecuteReader())
                    {
                        if (dtr.HasRows)
                        {
                            dt.Load(dtr);

                            foreach(DataRow dr in dt.Rows)
                            {
                                Uname = dr["EmplName"].ToString();
                                Dept = GETDEPARTMENT(dr["EmplID"].ToString());
                                Byte[] bytes = (Byte[])dr["picture"];
                                imgs.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(bytes);
                                UpdateStatus(Convert.ToInt32(NUMBer));
                            }
                        }
                    }
                }
            }
               // img1.Attributes.Add("src", "images/" + Tid + ".JPG");
            lblname.Text = Uname;
            lb1.Text = NUMBer;
            lblDep.Text = Dept;
            btnback.Focus();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        private void UpdateStatus(int id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE EmplRegister SET EmplStatus = @s WHERE ID = @id",con))
                {
                    cmd.Parameters.AddWithValue("@s", 1);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
        }
        private string GETDEPARTMENT(string empid)
        {
            string dep = string.Empty;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT dep_name FROM EmplAllLuckDraw WHERE EmplID = '" + empid + "'",con))
                {
                    using (SqlDataReader dtr = cmd.ExecuteReader())
                    {
                        if (dtr.HasRows)
                        {
                            while(dtr.Read())
                            {
                                dep = dtr.GetString(0);
                            }
                        }
                    }
                }
            }
                return dep;
        }
    }
}