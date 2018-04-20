import getpass
import smtplib
import os
import sys
import base64
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText

sender = raw_input('Enter your email address or intra login: ')
senderPass = getpass.getpass('Enter your email password: ')
sendTo = raw_input('Enter the email to send this to: ')

sender = "ajtemunovic@gmail.com"
recipient = "pedronunezcode@gmail.com"

print 'Setting up basic paraameters'

subject = raw_input('Enter the subject for the email or "Call" to arise the warriors: ')
if subject == 'Call':
    subject = 'Calling all Warriors!'


msg = MIMEMultipart()
msg['From'] = sender
msg['To'] = sendTo
msg['Subject'] = subject
body = raw_input('Enter your message or "Chant" for the warriors: ')
if body == 'Chant':
    body = 'Sons of Scotland! I am William Wallace....\nYes, I have heard. Kills men by the hundreds. And if he were here, he would consume the English with fireballs from his eyes, and bolts of lightning from his arse.\n I am William Wallace! And I see a whole army of my country men, here, in defiance of tyranny. You have come to fight as free men, and free men you are. What will you do with that freedom? Will you fight? ...Aye, fight and you may die, run and you will live, at least a while.\n And dying in your beds many years from now, would you be willing to trade all the days from this day to that for one chance, just one chance to come back here and tell our enemies that they may take our lives, but they will never take our freedom!\n Alba gu bra! (Scotland forever!)'

msg.attach(MIMEText(body, 'plain'))
server = smtplib.SMTP('smtp.gmail.com', 587)
server.ehlo()
server.starttls()
server.login(sender, senderPass)
server.sendmail(sender, sendTo, msg.as_string())
server.quit()
print 'Email succesfully sent!'
