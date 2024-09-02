package sendmail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.time.LocalTime;

@WebServlet("/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public void sendMail(String mail,String message2) throws ServletException, IOException {
        String toEmail = mail;
        String from = "21eg112c23@anurag.edu.in";
        final String username = "21eg112c23@anurag.edu.in"; 
        final String password = "Amrutha@2203";
        String host = "smtp.gmail.com";
        Properties props = new Properties();
        LocalTime obj=LocalTime.now();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("You have entered lab successfully ");
            message.setText(message2);
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}

