package com.qihn.utils;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


/**
 * ͼƬ�����࣬ ͼƬˮӡ������ˮӡ�����ţ����׵�
 * @author
 */
public final class ImageUtils {
    /**ͼƬ��ʽ��JPG*/
    private static final String PICTRUE_FORMATE_JPG = "jpg";

    private ImageUtils(){}
    /**
     * ���ͼƬˮӡ
     * @param targetImg Ŀ��ͼƬ·�����磺C://myPictrue//1.jpg
     * @param waterImg  ˮӡͼƬ·�����磺C://myPictrue//logo.png
     * @param x ˮӡͼƬ����Ŀ��ͼƬ����ƫ���������x<=0, �������м�
     * @param y ˮӡͼƬ����Ŀ��ͼƬ�ϲ��ƫ���������y<=0, �������м�
     * @param alpha ͸����(0.0 -- 1.0, 0.0Ϊ��ȫ͸����1.0Ϊ��ȫ��͸��)
     */
    public final static void pressImage(String targetImg, String waterImg, int x, int y, float alpha) {
        try {
            File file = new File(targetImg);
            Image image = ImageIO.read(file);
            int width = image.getWidth(null);
            int height = image.getHeight(null);
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufferedImage.createGraphics();
            g.drawImage(image, 0, 0, width, height, null);

            Image waterImage = ImageIO.read(new File(waterImg));    // ˮӡ�ļ�
            int width_1 = waterImage.getWidth(null);
            int height_1 = waterImage.getHeight(null);
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));

            int widthDiff = width - width_1;
            int heightDiff = height - height_1;
            if(x <= 0){
                x = widthDiff / 2;
            }else if(x > widthDiff){
                x = widthDiff;
            }
            if(y <= 0){
                y = heightDiff / 2;
            }else if(y > heightDiff){
                y = heightDiff;
            }
            g.drawImage(waterImage, x, y, width_1, height_1, null); // ˮӡ�ļ�����
            g.dispose();
            ImageIO.write(bufferedImage, PICTRUE_FORMATE_JPG, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * �������ˮӡ
     * @param targetImg Ŀ��ͼƬ·�����磺C://myPictrue//1.jpg
     * @param pressText ˮӡ���֣� �磺�й�֤ȯ��
     * @param fontName �������ƣ�    �磺����
     * @param fontStyle ������ʽ���磺�����б��(Font.BOLD|Font.ITALIC)
     * @param fontSize �����С����λΪ����
     * @param color ������ɫ
     * @param x ˮӡ���־���Ŀ��ͼƬ����ƫ���������x<=0, �������м�
     * @param y ˮӡ���־���Ŀ��ͼƬ�ϲ��ƫ���������y<=0, �������м�
     * @param alpha ͸����(0.0 -- 1.0, 0.0Ϊ��ȫ͸����1.0Ϊ��ȫ��͸��)
     */
    public static void pressText(String targetImg, String pressText, String fontName, int fontStyle, int fontSize, Color color, int x, int y, float alpha) {
        try {
            File file = new File(targetImg);

            Image image = ImageIO.read(file);
            int width = image.getWidth(null);
            int height = image.getHeight(null);
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufferedImage.createGraphics();
            g.drawImage(image, 0, 0, width, height, null);
            g.setFont(new Font(fontName, fontStyle, fontSize));
            g.setColor(color);
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));

            int width_1 = fontSize * getLength(pressText);
            int height_1 = fontSize;
            int widthDiff = width - width_1;
            int heightDiff = height - height_1;
            if(x <= 0){
                x = widthDiff / 2;
            }else if(x > widthDiff){
                x = widthDiff;
            }
            if(y <= 0){
                y = heightDiff / 2;
            }else if(y > heightDiff){
                y = heightDiff;
            }

            g.drawString(pressText, x, y + height_1);
            g.dispose();
            ImageIO.write(bufferedImage, PICTRUE_FORMATE_JPG, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * ��ȡ�ַ����ȣ�һ��������Ϊ 1 ���ַ�, һ��Ӣ����ĸ��Ϊ 0.5 ���ַ�
     * @param text
     * @return �ַ����ȣ��磺text="�й�",���� 2��text="test",���� 2��text="�й�ABC",���� 4.
     */
    public static int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }

    /**
     * ͼƬ����
     * @param filePath ͼƬ·��
     * @param height �߶�
     * @param width ���
     * @param bb ��������ʱ�Ƿ���Ҫ����
     */
    public static void resize(String filePath, int height, int width, boolean bb) {
        try {
            double ratio = 0; //���ű���
            File f = new File(filePath);
            BufferedImage bi = ImageIO.read(f);
            Image itemp = bi.getScaledInstance(width, height, BufferedImage.SCALE_SMOOTH);
            //�������
            if ((bi.getHeight() > height) || (bi.getWidth() > width)) {
                if (bi.getHeight() > bi.getWidth()) {
                    ratio = (new Integer(height)).doubleValue() / bi.getHeight();
                } else {
                    ratio = (new Integer(width)).doubleValue() / bi.getWidth();
                }
                AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(ratio, ratio), null);
                itemp = op.filter(bi, null);
            }
            if (bb) {
                BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = image.createGraphics();
                g.setColor(Color.white);
                g.fillRect(0, 0, width, height);
                if (width == itemp.getWidth(null))
                    g.drawImage(itemp, 0, (height - itemp.getHeight(null)) / 2, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);
                else
                    g.drawImage(itemp, (width - itemp.getWidth(null)) / 2, 0, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);
                g.dispose();
                itemp = image;
            }
            ImageIO.write((BufferedImage) itemp, "jpg", f);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * ������������ָ����С��ͼƬ
     * Sep 25, 2012 2:15:00 PM qihn
     */
    public static boolean generatePNG(String text, Font font, File imagefile, Color color, int offsetx, int offsety,int width,int height) {
        boolean reflag = false;
        String _text_ = text.replaceAll("&nbsp;", " ");
        String[] texts = _text_.split("<BR>");
        BufferedImage target = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D graphic = (Graphics2D) target.getGraphics();
        target = graphic.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT);
        graphic.dispose();
        graphic = target.createGraphics();
        graphic.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphic.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        graphic.setFont(font);
        graphic.setPaint(color);
        int i = 0;
        for (String a : texts) {
            i = i + font.getSize();
            graphic.drawString(a, offsetx, offsety + i);
        }
        graphic.dispose();
        reflag = true;
        try {
            ImageIO.write(target, "PNG", imagefile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return reflag;
    }


    /**
     * ���ݸ�����ͼƬ����һ��ָ��ƫ���� ��ͼƬ
     * Sep 25, 2012 12:26:02 PM qihn
     */
    public static String createTempimg(String filepath,int width,int height,String absfilepathCustomer ,int top,int left,int cusimgwidth,int cusimgheight){
        BufferedImage target = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D graphic = (Graphics2D) target.getGraphics();
        File input = new File(absfilepathCustomer);
        BufferedImage bi =null;
        try {
            bi = ImageIO.read(input);
            if(bi.getWidth()>width || bi.getHeight()>height || bi.getWidth()!=cusimgwidth || bi.getHeight()!=cusimgheight ){
                //����
                bi = ImageUtils.zoomImage(bi, cusimgwidth, cusimgheight);
                //�ü�
                //cutimg(absfilepathCustomer, absfilepathCustomer, 0, 0, width, height);
                //input = new File(absfilepathCustomer);
                //bi = ImageIO.read(input);
            }

        } catch (IOException e1) {
            e1.printStackTrace();
        }
        target = graphic.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT);
        graphic.dispose();
        graphic = target.createGraphics();
        graphic.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphic.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        graphic.drawImage(bi, null, top, left);

        graphic.dispose();
        try {
            File f = new File(filepath);
            ImageIO.write(target, "PNG", f);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return filepath;
    }

    /**
     * ���ŵ��ƶ��Ĵ�С
     * Sep 18, 2012 4:11:00 PM qihn
     */
    public static BufferedImage  zoomImage(BufferedImage  originalImage, int width,int height){
        BufferedImage newImage = new BufferedImage(width,height,originalImage.getType());
        Graphics g = newImage.getGraphics();
        g.drawImage(originalImage, 0,0,width,height,null);
        g.dispose();
        return newImage;
    }

    /**
     * ��ͼƬ���зŴ�
     * @param originalImage ԭʼͼƬ
     * @param times �Ŵ���
     * @return
     */
    public static BufferedImage  zoomInImage(BufferedImage  originalImage, Integer times){
        int width = originalImage.getWidth()*times;
        int height = originalImage.getHeight()*times;
        BufferedImage newImage = new BufferedImage(width,height,originalImage.getType());
        Graphics g = newImage.getGraphics();
        g.drawImage(originalImage, 0,0,width,height,null);
        g.dispose();
        return newImage;
    }
    /**
     * ��ͼƬ���зŴ�
     * @param srcPath ԭʼͼƬ·��(����·��)
     * @param newPath �Ŵ��ͼƬ·��������·����
     * @param times �Ŵ���
     * @return �Ƿ�Ŵ�ɹ�
     */
    public static boolean zoomInImage(String srcPath,String newPath,Integer times){
        BufferedImage bufferedImage = null;
        try {
            File of = new File(srcPath);
            if(of.canRead()){
                bufferedImage =  ImageIO.read(of);
            }
        } catch (IOException e) {
            //TODO: ��ӡ��־
            return false;
        }
        if(bufferedImage != null){
            bufferedImage = zoomInImage(bufferedImage,times);
            try {
                //TODO: �������·����Ҫ�������Ӻ�һ��
                ImageIO.write(bufferedImage, "JPG", new File(newPath)); //�����޸ĺ��ͼ��,ȫ������ΪJPG��ʽ
            } catch (IOException e) {
                // TODO ��ӡ������Ϣ
                return false;
            }
        }
        return true;
    }
    /**
     * ��ͼƬ������С
     * @param originalImage ԭʼͼƬ
     * @param times ��С����
     * @return ��С���Image
     */
    public static BufferedImage  zoomOutImage(BufferedImage  originalImage, Integer times){
        int width = originalImage.getWidth()/times;
        int height = originalImage.getHeight()/times;
        BufferedImage newImage = new BufferedImage(width,height,originalImage.getType());
        Graphics g = newImage.getGraphics();
        g.drawImage(originalImage, 0,0,width,height,null);
        g.dispose();
        return newImage;
    }
    /**
     * ��ͼƬ������С
     * @param srcPath ԴͼƬ·��������·����
     * @param newPath ��ͼƬ·��������·����
     * @param times ��С����
     * @return �����Ƿ�ɹ�
     */
    public static boolean zoomOutImage(String srcPath,String newPath,Integer times){
        BufferedImage bufferedImage = null;
        try {
            File of = new File(srcPath);
            if(of.canRead()){
                bufferedImage =  ImageIO.read(of);
            }
        } catch (IOException e) {
            //TODO: ��ӡ��־
            return false;
        }
        if(bufferedImage != null){
            bufferedImage = zoomOutImage(bufferedImage,times);
            try {
                //TODO: �������·����Ҫ�������Ӻ�һ��
                ImageIO.write(bufferedImage, "JPG", new File(newPath)); //�����޸ĺ��ͼ��,ȫ������ΪJPG��ʽ
            } catch (IOException e) {
                // TODO ��ӡ������Ϣ
                return false;
            }
        }
        return true;
    }


    /**
     * ָ������ͼƬ�ü�
     * Sep 26, 2012 6:21:34 PM qihn
     */
    public static void cutimg(String imgPath,String tarimgPath, int left,int top,int leftend,int topend){
        try {
            // ȡ��ͼƬ������
            Iterator<ImageReader> readers = ImageIO.getImageReadersByFormatName("jpg");
            ImageReader reader = (ImageReader)readers.next();
            // ȡ��ͼƬ������
            InputStream source= new FileInputStream(new File(imgPath));
            ImageInputStream iis = ImageIO.createImageInputStream(source);
            reader.setInput(iis, true);
            // ͼƬ����
            ImageReadParam param = reader.getDefaultReadParam();
            Rectangle rect = new Rectangle(left,top,leftend,topend);
            param.setSourceRegion(rect);
            BufferedImage bi = reader.read(0,param);
            ImageIO.write(bi, "jpg", new File(tarimgPath));
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**
     * ͼƬ�ϳɣ����ˮӡ
     * @param orgFilePath
     * @param bgFilePath
     * @param tarFilepath
     */
    public static void pressImg(String orgFilePath,String bgFilePath,String tarFilepath) {
        BufferedImage bi1 = null;
        BufferedImage bi2 = null;
        try {
            bi1 = javax.imageio.ImageIO.read(new File(orgFilePath));
            bi2 = javax.imageio.ImageIO.read(new File(bgFilePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        Graphics g = bi1.getGraphics();
        g.drawImage(bi2, 0, 0,240,240, null);
        FileOutputStream out = null; // ������ļ���
        try {
            out = new FileOutputStream(tarFilepath);
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

    public static void main(String[] args) throws IOException {
        //pressImage("e://temp//bz.jpg", "e://temp//wbg.png", 0, 0, 0.5f);
        //pressText("d:a.png", "��ά���� E123456789", "����", Font.BOLD|Font.ITALIC, 20, Color.BLACK, 0, 0, 8f);
        //resize("e://temp//yl.jpg", 250, 250, true);
        generatePNG("��ά���� E123456789", new Font("����", Font.ITALIC, 10), new File("d://a.png"), Color.black, 60, 220, 240, 240);
    }

} 
