import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Prompt the user to enter sender's and recipient's email addresses
sender_email = input("Enter your Gmail email address (sender): ")
sender_password = input("Enter your Gmail password (sender): ")
recipient_email = input("Enter the recipient's Gmail email address: ")
email_subject = input("Enter the email subject: ")
# Email configuration
smtp_server = "smtp.gmail.com"
smtp_port = 587

# Create a MIMEText object for the email content
message = MIMEMultipart()
message["From"] = sender_email
message["To"] = recipient_email
message["Subject"] = email_subject      #"Subject of the Email"

# Email body
body = "Hello! I am Sumit."
message.attach(MIMEText(body, "plain"))

# Establish an SMTP connection
try:
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Secure the connection
    server.login(sender_email, sender_password)

    # Send the email
    text = message.as_string()
    server.sendmail(sender_email, recipient_email, text)

    # Close the SMTP server
    server.quit()

    print("Email sent successfully!")

except Exception as e:
    print("An error occurred:", str(e))

