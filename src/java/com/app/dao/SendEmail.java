package com.app.dao;

import com.app.entities.OrderData;
import com.app.entities.User;
import java.io.File;

import java.util.*;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean SendEmail(User user) {
        boolean test = false;
        String toEamil = user.getEmail();
        String fromEmail = "jayrajsinhvaghela446@gmail.com";
        String password = "kkxzunoxkbbkterp";

        try {

            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "465");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.setProperty("mail.smtp.socketFactory.port", "465");
            pr.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//            pr.setProperty("javax.net.ssl.trustStore", "C:/.keystore");
//            pr.setProperty("javax.net.ssl.trustStorePassword", "changeit");
//            

            //get session
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEamil));
            mess.setSubject("User Email Verification");
            mess.setText("Registration SUccessfully. Please verify your account using this code: " + user.getCode());

            Transport.send(mess);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public boolean sendEmailWithAttachment(User user, OrderData data) {

        boolean flag = false;
        String toEamil = user.getEmail();
        String fromEmail = "jayrajsinhvaghela446@gmail.com";
        String password = "kkxzunoxkbbkterp";

        Properties pr = new Properties();
        pr.setProperty("mail.smtp.host", "smtp.gmail.com");
        pr.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
        pr.setProperty("mail.smtp.port", "465");
        pr.setProperty("mail.smtp.auth", "true");
        pr.setProperty("mail.smtp.starttls.enable", "true");
        pr.setProperty("mail.smtp.socketFactory.port", "465");
        pr.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEamil));
            mess.setSubject("Bill PDF");

//            MimeBodyPart part1 = new MimeBodyPart();
//            for(int i=0;i<3;i++){
            Object message = "Thankyou! <b>" + user.getName() + "</b> For Visiting"
                    + "<br>"
                    + "<br><table style='text:center; border:1px solid balck; width: 100%; border-collapse: collapse; ' border='3'>\n"
                    + "  <tr style='text:center; border:1px solid balck;'>\n"
                    + "    <th style='text:center; border:1px solid balck;'>Name</th>\n"
                    + "    <th style='text:center; border:1px solid balck;'>Product</th>\n"
                    + "    <th style='text:center; border:1px solid balck;'>Price</th>\n"
                    + "    <th style='text:center; border:1px solid balck;'>Date</th>\n"
                    + "  </tr>\n"
                    + "  <tr style='text:center; border:1px solid balck;'>\n"
                    + "   <td style='text:center; border:1px solid balck;'>" + user.getName() + "</td>\n"
                    + "   <td style='text:center; border:1px solid balck;'>" + data.getPrname() + "</td>\n"
                    + "   <td style='text:center; border:1px solid balck;'>" + (data.getPrprice() + data.getPrprice() * 0.15) + "</td>\n"
                    + "   <td style='text:center; border:1px solid balck;'>" + user.getDate() + "</td>\n"
                    + "  </tr>\n"
                    + "</table>"
                    + "<br>"
                    + "<b>Order placed Successfully.</b>";

//            part1.setText(messgg);
//            }
//            MimeBodyPart part2 = new MimeBodyPart();
//            part2.attachFile(file);
//            MimeMultipart mimeMultipart = new MimeMultipart();
//            mimeMultipart.addBodyPart(part1);
////            mimeMultipart.addBodyPart(part2);
//
            mess.setContent(message, "text/html;  charset=utf-8");
            Transport.send(mess);
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;

    }

    public boolean SendForgotPasswordEmail(String otp) {

        boolean test = false;
        String toEamil = "rameshdarbar303@gmail.com";
        String fromEmail = "jayrajsinhvaghela446@gmail.com";
        String password = "kkxzunoxkbbkterp";

        try {

            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "465");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.setProperty("mail.smtp.socketFactory.port", "465");
            pr.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//            pr.setProperty("javax.net.ssl.trustStore", "C:/.keystore");
//            pr.setProperty("javax.net.ssl.trustStorePassword", "changeit");
//            

            //get session
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEamil));
            mess.setSubject("User Email Verification");
                      
            
            mess.setText("Please verify your account using this link and OTP: " + "https://linkenc.net/CXN8f~AK7t5ZDjaTC6qeQSI3koTsSa-iz6zOwT6n3sFLNzxmTvbDg.mT2Asv~PY4gyeola5OLUwgw2HxB-WTEGN4D9ZPgVfZFwR~FesqrvsT5t9wRuv4aJLp4f4Ogw!"+
                    "<br>OTP is : "+otp);
            
           

            Transport.send(mess);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}
