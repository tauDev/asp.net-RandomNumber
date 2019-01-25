using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Media;

namespace DemoRandom
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //SoundPlayer players = new SoundPlayer(Server.MapPath("~/sound/Kalimba.mp3"));
            //players.Play();
            LoadWinner();
            playBtn.Focus();
            int iFileCnt = 0;
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/users/"));
            FileInfo[] listfiles = dirInfo.GetFiles("*.*");
            int p = listfiles.Length;
            if (listfiles.Length > 0)
            {
                Random rnd = new Random();
                int[] tempArr = new int[12];
                for (int i = 0; i < 11; i++)
                {
                    HtmlImage img = new HtmlImage();
                    HtmlGenericControl newDiv = new HtmlGenericControl("div");

                    int random = rnd.Next(1, p);
                    tempArr[i] = random;
                    for (int j = 0;j < 10; j++)
                    {
                        if(tempArr[j] != random)                        {
                           
                            img.Src = "~/users/" + listfiles[random].Name;

                            newDiv.Attributes.Add("class", "message" + i);
                            newDiv.Controls.Add(img);

                            parent.Controls.Add(newDiv);
                            iFileCnt = iFileCnt + 1;
                        }
                        
                    }
                    
                }

            }
        }

        [System.Web.Services.WebMethod]
        public static string GETDATA(string s)
        {
            string EmpId = "0000";
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["Condb"].ConnectionString;
                int idx = Convert.ToInt32(s);

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("Select a.ID,a.EmplID From EmplRegister as a left join EMPLOYEES as b ON a.EmplID = b.emp_id  Where " +
                        "a.ID = " + idx + " and b.EmplStatus = 1 and a.EmplStatus != 1", con))
                    {
                        using (SqlDataReader dtr = cmd.ExecuteReader())
                        {
                            if (dtr.HasRows)
                            {
                                while (dtr.Read())
                                {
                                    EmpId = dtr.GetString(1);
                                }

                            }
                        }
                    }
                }
                return EmpId;
            }
            catch
            {
                return EmpId;
            }
           
        }

        [System.Web.Services.WebMethod]
        public static string GETDATAALL()
        {
            int EmpId = 0;
            string str = "0,0,0";
            string Conv = "000";
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["Condb"].ConnectionString;

                string f = string.Empty;
                string s = string.Empty;
                string t = string.Empty;

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("Select TOP 1 a.ID,a.EmplID From EmplRegister as a left join EMPLOYEES as b ON a.EmplID = b.emp_id  Where " +
                        " b.EmplStatus = 1 and a.EmplStatus != 1  ORDER BY NEWID()", con))
                    {
                        using (SqlDataReader dtr = cmd.ExecuteReader())
                        {
                            if (dtr.HasRows)
                            {
                                while (dtr.Read())
                                {
                                    EmpId = dtr.GetInt32(0);
                                }
                                Conv = EmpId.ToString("000");
                                //if (Conv.Length == 3)
                                //{
                                //    f = Conv.Substring(0,1);
                                //    s = Conv.Substring(1,1);
                                //    t = Conv.Substring(2,1);
                                //    str = f + "," + s + "," + t;
                                //}
                            }
                        }
                    }
                }
                return Conv;
            }
            catch
            {
                return Conv;
            }
        }
        private void LoadWinner()
        {
            string strcon = ConfigurationManager.ConnectionStrings["Condb"].ConnectionString;
            string sql = "SELECT [HappyID],[EmplID],[EmplName],[dep_name],[RegisterDateTime]" +
                " FROM[Employees_Card].[dbo].[EmplAllLuckDraw] Where EmplStatus = 1";
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    using (SqlDataReader dtr = cmd.ExecuteReader())
                    {
                        if(dtr.HasRows)
                        {
                            dt.Load(dtr);
                            for(int i = 0;i< dt.Rows.Count;i++)
                            {
                                HtmlGenericControl newDiv = new HtmlGenericControl("div");
                                var newP1 = new HtmlGenericControl("p") { InnerText = "Happy Id : " + dt.Rows[i]["HappyID"].ToString() };
                                newP1.Attributes.Add("class", "card-text");
                                var newP2 = new HtmlGenericControl("p") { InnerText = "Employee Id : " + dt.Rows[i]["EmplID"].ToString() };
                                newP2.Attributes.Add("class", "card-text");
                                var newP3 = new HtmlGenericControl("p") { InnerText = "Name : " + dt.Rows[i]["EmplName"].ToString()};
                                newP3.Attributes.Add("class", "card-text");
                                var newP4 = new HtmlGenericControl("p") { InnerText = "Department : " + dt.Rows[i]["dep_name"].ToString() };
                                newP4.Attributes.Add("class", "card-text");

                                newDiv.Attributes.Add("class", "card border-primary mb-3");
                                newDiv.Attributes.Add("style", "width:19rem;color:white; background-image:url(images/yeen.jpg);");
                                

                                newDiv.Controls.Add(newP1);
                                newDiv.Controls.Add(newP2);
                                newDiv.Controls.Add(newP3);
                                newDiv.Controls.Add(newP4);
                                TopSlot.Controls.Add(newDiv);
                            }
                        }
                    }
                }
            }

        }
    }
}