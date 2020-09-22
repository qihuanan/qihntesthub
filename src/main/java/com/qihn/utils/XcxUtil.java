package com.qihn.utils;

import com.qihn.controller.GoodsController;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class XcxUtil {

    /***
     *
     * Project Name:wechat-management-util
     * <p>各种海报合成图片工具类<br>
     *
     * @ClassName: ImageUtils
     * @date 2019年1月22日  下午3:52:43
     *
     * @author youqiang.xiong
     * @version 1.0
     * @since
     * @see
     */

    private static Log logger = LogFactory.getLog(XcxUtil.class);
        /****
         *
         * Project Name: wechat-management-util
         * <p>公开课小程序后台生成分享海报 <br>
         *
         * @author youqiang.xiong
         * @date 2019年1月11日  下午4:28:21
         * @version v1.0
         * @since
         * @param background
         * 			背景图
         * @param poster
         * 			教师形象图
         * @param qr
         * 			二维码图片
         * @param avatar
         * 			头像图片
         * @param nickname
         * 			昵称
         * @return
         * @throws IOException
         */
        public static BufferedImage createSharePoster(BufferedImage background, BufferedImage poster,
                                                      BufferedImage qr, BufferedImage avatar,
                                                      String nickname, List<String> strlist) throws  IOException{
            Font font = new Font("宋体",Font.BOLD,20);
            // 开启抗锯齿
            RenderingHints renderingHints = new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            // 使用高质量压缩
            renderingHints.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_SPEED);
            renderingHints.put(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_GASP);
            int height = background.getHeight() * 750 / background.getWidth();
            System.out.println("height: "+height);
            // 图片大小
            BufferedImage img = new BufferedImage(750, 1334, BufferedImage.TYPE_INT_RGB);
            // 开启画图
            Graphics2D g = (Graphics2D) img.getGraphics();

            try {
                g.setRenderingHints(renderingHints);
                // 画底图
                g.drawImage(background.getScaledInstance(750, 1334, Image.SCALE_FAST), 0, 0, null);

                // 教师海报图 - 需要将原图进行剪切 剪切后的长度是 750*830 上面部分图
                BufferedImage teacherImage = ImageUtils.zoomImage(poster,750,473);

                g.drawImage(teacherImage.getScaledInstance(750,teacherImage.getHeight(), Image.SCALE_FAST), 0, 0, null);

                // 画头像
                if (null != avatar) {
                    g.drawImage(XcxUtil.roundImage(avatar, avatar.getWidth(), avatar.getHeight(), 360).getScaledInstance(128, 128, Image.SCALE_FAST), 310, 510, null);

                    // 设置字体大小
                    font = new Font("微软雅黑",Font.PLAIN,34);
                    font = font.deriveFont(34f);
                    // 设置字体颜色
                    Color color = new Color(55,69,97);
                    g.setColor(color);
                    g.setFont(font);
                    if(nickname.length() > 5) {
                        //nickname = nickname.substring(0, 5) + "...";
                    }
                    // 计算文字长度，计算居中的x点坐标
                    FontMetrics fm = g.getFontMetrics(font);
                    int textWidth = fm.stringWidth(nickname);
                    int widthX = (750 - textWidth) / 2;
                    // 表示这段文字在图片上的位置(x,y) .第一个是你设置的内容。
                    g.drawString(nickname,widthX,680);

                }

                // 写提示文案名称
                font = new Font("微软雅黑",Font.BOLD,34);
                font = font.deriveFont(34f);
                Color color = new Color(55,69,97);
                g.setColor(color);
                g.setFont(font);
                // 计算文字长度，计算居中的x点坐标

                int curheight = 760;
                for(int i=0;i<strlist.size();i++){
                    FontMetrics fm = g.getFontMetrics(font);
                    int textWidth = fm.stringWidth(strlist.get(i));
                    int widthX = (750 - textWidth) / 2;
                    // 表示这段文字在图片上的位置(x,y) .第一个是你设置的内容。
                    g.drawString(strlist.get(i),widthX,curheight);
                    curheight+=50;
                }

                // 画二维码
                if (null != qr) {
                    //curheight+=50;
                    g.drawImage(qr.getScaledInstance(329, 325, Image.SCALE_FAST), 210, curheight, null);
                    String qrstr = "长按识别小程序码";
                    font = new Font("微软雅黑",Font.PLAIN,34);
                    // 设置字体颜色
                    color = new Color(55,69,97);
                    g.setColor(color);
                    g.setFont(font);
                    FontMetrics fm = g.getFontMetrics(font);
                    int textWidth = fm.stringWidth(qrstr);
                    int widthX = (750 - textWidth) / 2;
                    curheight+=325;
                    curheight+=50;
                    g.drawString(qrstr ,widthX,curheight);
                }


                img = Thumbnails.of(img).scale(1f).outputQuality(1f).asBufferedImage();
            } catch (IOException e) {
                throw  new IOException(e.getMessage());
            } finally {
                g.dispose();
            }
            return img;
        }


    public static int getWidth(FontRenderContext context, Graphics2D g, String text) {
        return (int) g.getFont().getStringBounds(text, context).getWidth();
    }

    public static int getHeight(FontRenderContext context, Graphics2D g, String text) {
        return (int) g.getFont().getStringBounds(text, context).getHeight();
    }
    public static BufferedImage roundImage(BufferedImage image, int width, int height, int cornerRadius) {
        BufferedImage outputImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = outputImage.createGraphics();
        g2.setComposite(AlphaComposite.Src);
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(Color.WHITE);
        g2.fill(new RoundRectangle2D.Float(0, 0, width, height, cornerRadius, cornerRadius));
        g2.setComposite(AlphaComposite.SrcAtop);
        g2.drawImage(image, 0, 0, null);
        g2.dispose();
        return outputImage;
    }

    public static BufferedImage roundImage(BufferedImage image, int cornerRadius) {
        return roundImage(image, image.getWidth(), image.getHeight(), cornerRadius);
    }


    public static String createshareimg( String bgimgpath,String shareimgpath,String qrcodepath,String avatarurl,String nickname, List<String> strlist,String resultimgpath){
        try {
            BufferedImage bg = ImageIO.read(new File(bgimgpath));
            BufferedImage poster = ImageIO.read(new File(shareimgpath));
            BufferedImage qr = ImageIO.read(new File(qrcodepath));
            BufferedImage avatar = ImageIO.read(new URL(avatarurl));
            //String nickname = "早起的小闹钟";
            //List<String> strList = new ArrayList<>();
            //strList.add("我已坚持打卡xx天");
            //strList.add("我参与了绿色家园建设每日打卡行动");
            //strList.add("邀请你一起来!");
            BufferedImage img = XcxUtil.createSharePoster(bg, poster, qr, avatar, nickname, strlist);
            ImageIO.write(img, "jpg", new File(resultimgpath));
            System.out.println("createshareimg-done: "+resultimgpath);
            return resultimgpath;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        try {
            BufferedImage bg = ImageIO.read(new File("E:\\temp\\bg.png"));
            BufferedImage poster = ImageIO.read(new File("E:\\temp\\sharebg.png"));
            BufferedImage qr = ImageIO.read(new File("E:\\temp\\xmfma.png"));
            BufferedImage avatar = ImageIO.read(new URL("https://thirdwx.qlogo.cn/mmopen/vi_32/hg8EqGcExhtxldAdeZibTncBKkibFicrvVHobbm6JF90vlQsINar1codibGmUXQgqq4hWpdt0XIWsFIe1icUQHPeMzg/132"));
            String nickname = "早起的小闹钟";
            List<String> strList = new ArrayList<>();
            //strList.add("我已坚持打卡xx天");
            strList.add("我参与了绿色家园建设每日打卡行动");
            strList.add("邀请你一起来!");
            BufferedImage img = XcxUtil.createSharePoster(bg, poster, qr, avatar, nickname, strList);
            ImageIO.write(img, "jpg", new File("E:\\temp\\result"+Utils.formatCompactDateSSS()+".jpg"));
            System.out.println("done: ");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
