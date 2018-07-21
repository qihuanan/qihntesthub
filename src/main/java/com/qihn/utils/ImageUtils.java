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
 * 图片工具类， 图片水印，文字水印，缩放，补白等
 * @author
 */
public final class ImageUtils {
    /**图片格式：JPG*/
    private static final String PICTRUE_FORMATE_JPG = "jpg";

    private ImageUtils(){}
    /**
     * 添加图片水印
     * @param targetImg 目标图片路径，如：C://myPictrue//1.jpg
     * @param waterImg  水印图片路径，如：C://myPictrue//logo.png
     * @param x 水印图片距离目标图片左侧的偏移量，如果x<=0, 则在正中间
     * @param y 水印图片距离目标图片上侧的偏移量，如果y<=0, 则在正中间
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
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

            Image waterImage = ImageIO.read(new File(waterImg));    // 水印文件
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
            g.drawImage(waterImage, x, y, width_1, height_1, null); // 水印文件结束
            g.dispose();
            ImageIO.write(bufferedImage, PICTRUE_FORMATE_JPG, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 添加文字水印
     * @param targetImg 目标图片路径，如：C://myPictrue//1.jpg
     * @param pressText 水印文字， 如：中国证券网
     * @param fontName 字体名称，    如：宋体
     * @param fontStyle 字体样式，如：粗体和斜体(Font.BOLD|Font.ITALIC)
     * @param fontSize 字体大小，单位为像素
     * @param color 字体颜色
     * @param x 水印文字距离目标图片左侧的偏移量，如果x<=0, 则在正中间
     * @param y 水印文字距离目标图片上侧的偏移量，如果y<=0, 则在正中间
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
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
     * 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
     * @param text
     * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.
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
     * 图片缩放
     * @param filePath 图片路径
     * @param height 高度
     * @param width 宽度
     * @param bb 比例不对时是否需要补白
     */
    public static void resize(String filePath, int height, int width, boolean bb) {
        try {
            double ratio = 0; //缩放比例
            File f = new File(filePath);
            BufferedImage bi = ImageIO.read(f);
            Image itemp = bi.getScaledInstance(width, height, BufferedImage.SCALE_SMOOTH);
            //计算比例
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
     * 根据文字生成指定大小的图片
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
     * 根据给定的图片生成一个指定偏移量 的图片
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
                //缩放
                bi = ImageUtils.zoomImage(bi, cusimgwidth, cusimgheight);
                //裁剪
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
     * 缩放到制定的大小
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
     * 对图片进行放大
     * @param originalImage 原始图片
     * @param times 放大倍数
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
     * 对图片进行放大
     * @param srcPath 原始图片路径(绝对路径)
     * @param newPath 放大后图片路径（绝对路径）
     * @param times 放大倍数
     * @return 是否放大成功
     */
    public static boolean zoomInImage(String srcPath,String newPath,Integer times){
        BufferedImage bufferedImage = null;
        try {
            File of = new File(srcPath);
            if(of.canRead()){
                bufferedImage =  ImageIO.read(of);
            }
        } catch (IOException e) {
            //TODO: 打印日志
            return false;
        }
        if(bufferedImage != null){
            bufferedImage = zoomInImage(bufferedImage,times);
            try {
                //TODO: 这个保存路径需要配置下子好一点
                ImageIO.write(bufferedImage, "JPG", new File(newPath)); //保存修改后的图像,全部保存为JPG格式
            } catch (IOException e) {
                // TODO 打印错误信息
                return false;
            }
        }
        return true;
    }
    /**
     * 对图片进行缩小
     * @param originalImage 原始图片
     * @param times 缩小倍数
     * @return 缩小后的Image
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
     * 对图片进行缩小
     * @param srcPath 源图片路径（绝对路径）
     * @param newPath 新图片路径（绝对路径）
     * @param times 缩小倍数
     * @return 保存是否成功
     */
    public static boolean zoomOutImage(String srcPath,String newPath,Integer times){
        BufferedImage bufferedImage = null;
        try {
            File of = new File(srcPath);
            if(of.canRead()){
                bufferedImage =  ImageIO.read(of);
            }
        } catch (IOException e) {
            //TODO: 打印日志
            return false;
        }
        if(bufferedImage != null){
            bufferedImage = zoomOutImage(bufferedImage,times);
            try {
                //TODO: 这个保存路径需要配置下子好一点
                ImageIO.write(bufferedImage, "JPG", new File(newPath)); //保存修改后的图像,全部保存为JPG格式
            } catch (IOException e) {
                // TODO 打印错误信息
                return false;
            }
        }
        return true;
    }


    /**
     * 指定区域图片裁剪
     * Sep 26, 2012 6:21:34 PM qihn
     */
    public static void cutimg(String imgPath,String tarimgPath, int left,int top,int leftend,int topend){
        try {
            // 取得图片读入器
            Iterator<ImageReader> readers = ImageIO.getImageReadersByFormatName("jpg");
            ImageReader reader = (ImageReader)readers.next();
            // 取得图片读入流
            InputStream source= new FileInputStream(new File(imgPath));
            ImageInputStream iis = ImageIO.createImageInputStream(source);
            reader.setInput(iis, true);
            // 图片参数
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
     * 图片合成，添加水印
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
        FileOutputStream out = null; // 输出到文件流
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
        // p1背景图，p2印章，p为输出图。p2要是gif或png等支持透明图象的。
        // x,y 为在背景图放置印章的坐标（ 左上角开始算）。
        // 在Java2D中设置画图的透明度：
        float alpha = 0.5f; // 透明度
        Graphics2D g2d = bi2.createGraphics();
        // 设置透明
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha)); // 开始
        // g2d.drawImage(); // 画图
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER)); // 结束
    }

    public static void main(String[] args) throws IOException {
        //pressImage("e://temp//bz.jpg", "e://temp//wbg.png", 0, 0, 0.5f);
        //pressText("d:a.png", "二维云码 E123456789", "宋体", Font.BOLD|Font.ITALIC, 20, Color.BLACK, 0, 0, 8f);
        //resize("e://temp//yl.jpg", 250, 250, true);
        generatePNG("二维云码 E123456789", new Font("宋体", Font.ITALIC, 10), new File("d://a.png"), Color.black, 60, 220, 240, 240);
    }

} 
