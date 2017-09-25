using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RegisterUser(object sender, EventArgs e)
    {
        int userId = 0;
        string constr = ConfigurationManager.ConnectionStrings["bazaSQL"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_User"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@imie", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@nazwisko", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@telefon", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            string message = string.Empty;
            switch (userId)
            {
                case -1:
                    message = "Podana nazwa użytkownika jest już w użyciu.\\nProszę podać inną nazwę.";
                    break;
                case -2:
                    message = "Podany adres e-mail jest już w użyciu.";
                    break;
                default:
                    message = "Rejestracja zakończona.\\nUser Id: " + userId.ToString();
                    SendActivationEmail(userId);
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    txtUsername.Text = "";
                    txtPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    txtEmail.Text = "";
                    break;
            }
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
        }
    }
    private void SendActivationEmail(int userId)
    {
        string constr = ConfigurationManager.ConnectionStrings["bazaSQL"].ConnectionString;
        string activationCode = Guid.NewGuid().ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        using (MailMessage mm = new MailMessage("pablocza@gmail.com", txtEmail.Text))
        {
            mm.Subject = "Aktywacja konta";
            string body = "Witaj " + txtUsername.Text.Trim() + ",";
            body += "<br /><br />Aby aktywować swoje konto w naszym serwisie kliknij link poniżej";
           body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Default2.aspx", "Activation.aspx?ActivationCode=" + activationCode) + "'>Kliknij tutaj, aby aktywować konto.</a>";
        body += "<br /><br />Dziękujemy";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("pablocza@gmail.com", "Cz@p3lka8");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }
}