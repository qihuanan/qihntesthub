package com.qihn.utils;

//������ͼƬ�ϳ�һ��
import java.awt.AlphaComposite;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/** ******ͼƬˮӡЧ��*********** */
public class TwoPic {
	public void createOneByTwo() {
		BufferedImage bi1 = null;
		BufferedImage bi2 = null;
		try {
			bi1 = javax.imageio.ImageIO.read(new File("d:\\ewm.png"));
			bi2 = javax.imageio.ImageIO.read(new File("d:/a.png"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		Graphics g = bi1.getGraphics();
		g.drawImage(bi2, 0, 0,240,240, null);
		FileOutputStream out = null; // ������ļ���
		try {
			out = new FileOutputStream("d:\\out.png");
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bi1);
			param.setQuality(1f, false);
			encoder.setJPEGEncodeParam(param);
			encoder.encode(bi1);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// p1����ͼ��p2ӡ�£�pΪ���ͼ��p2Ҫ��gif��png��֧��͸��ͼ��ġ�
		// x,y Ϊ�ڱ���ͼ����ӡ�µ����꣨ ���Ͻǿ�ʼ�㣩��
		// ��Java2D�����û�ͼ��͸���ȣ�
		float alpha = 0.5f; // ͸����
		Graphics2D g2d = bi2.createGraphics();
		// ����͸��
		g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha)); // ��ʼ
		// g2d.drawImage(); // ��ͼ
		g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER)); // ����
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TwoPic twoPic = new TwoPic();
		twoPic.createOneByTwo();
	}
}