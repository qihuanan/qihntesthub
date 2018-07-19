package com.qihn.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;


public class Jmailtest {

	static ApplicationContext ctx = new ClassPathXmlApplicationContext("mvc*.xml");

	public static void main(String[] args) {
		try {
			Jmailtest jmailtest = new Jmailtest();
			JavaMailSender jmail = (JavaMailSender) Jmailtest.ctx.getBean("jmail");
			//jmailtest.sendTextMail(jmail, "515934015@qq.com", "测试", "dddddddddddddddddddd");

			String cont = "测试发送邮件";//Jmailtest.getURLContent("http://www.liyi99.com/");
			jmailtest.sendHTMLMail(jmail, "515934015@qq.com", "liyi99com", cont);
			//jmailtest.sendMimeMail(jmail);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	public void sendTextMail(JavaMailSender jmail, String email, String object, String text) {
		SimpleMailMessage simmess = (SimpleMailMessage) ctx.getBean("mailMess");
		simmess.setFrom("qihntest@163.com");
		simmess.setTo(email);
		simmess.setSubject(object);
		simmess.setText(text);
		jmail.send(simmess);
	}

	public void sendHTMLMail(JavaMailSender jmail, String email, String object, String text) throws MessagingException {
		MimeMessage message = jmail.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setFrom("qihntest@163.com");
		helper.setTo(email);
		helper.setSubject(object);
		helper.setText(text, true);
		jmail.send(message);
	}

	public void sendMimeMail(JavaMailSender jmail) {
		final List<String> files = new ArrayList<String>();
		MimeMessagePreparator mimeMail = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMess) throws Exception {
				mimeMess.setRecipient(Message.RecipientType.TO, new InternetAddress("515934015@qq.com"));
				mimeMess.setFrom(new InternetAddress("qihntest@163.com"));
				mimeMess.setSubject("带附件的发送测试", "UTF-8");
				Multipart mp = new MimeMultipart();
				MimeBodyPart context = new MimeBodyPart();
				context.setText("这是我给你发的Spring带附件的邮件", "UTF-8");
				mp.addBodyPart(context);
				files.add("src_config/hibernate.cfg.xml");
				for (Iterator<String> iterator = files.iterator(); iterator.hasNext();) {
					String filename = iterator.next();
					MimeBodyPart attfile = new MimeBodyPart();
					FileDataSource fds = new FileDataSource(filename);
					attfile.setDataHandler(new DataHandler(fds));
					attfile.setFileName(fds.getName());
					mp.addBodyPart(attfile);
				}
				files.clear();
				// MimeMessage添加Multipart
				mimeMess.setContent(mp);
				mimeMess.setSentDate(new Date());
			}
		};
		// 发送带附件的邮件
		jmail.send(mimeMail);
		System.out.println("发送邮件成功了！！");
	}

	public static String getURLContent(String urlfile) {
		StringBuffer document = new StringBuffer();
		try {
			URL url = new URL(urlfile);
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null)
				document.append(line + "\n");
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return document.toString();

	}
}
