package com.qihn.utils;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

public class XcxUtilbak {

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

    private static Log logger = LogFactory.getLog(XcxUtilbak.class);
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
         * @param font
         * 			字体
         * @param nickname
         * 			昵称
         * @param courseName
         * 			课程名称
         * @param courseTip
         * 			课程大纲
         * @return
         * @throws IOException
         */
        public static BufferedImage createSharePoster(BufferedImage background, BufferedImage poster,
                                                      BufferedImage qr, BufferedImage avatar, Font font, String nickname, String courseName, String courseTip ) throws  IOException{
            // 开启抗锯齿
            RenderingHints renderingHints = new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            // 使用高质量压缩
            renderingHints.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_SPEED);
            renderingHints.put(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_GASP);
            int height = background.getHeight() * 750 / background.getWidth();
            // 图片大小
            BufferedImage img = new BufferedImage(750, height, BufferedImage.TYPE_INT_RGB);
            // 开启画图
            Graphics2D g = (Graphics2D) img.getGraphics();

            try {
                g.setRenderingHints(renderingHints);
                // 教师海报图 - 需要将原图进行剪切 剪切后的长度是 750*830
                BufferedImage teacherImage = null; // cutPic(poster, 158, 0, 750, 830);
                teacherImage = ImageUtils.zoomImage(poster,750,830);
                g.drawImage(teacherImage.getScaledInstance(750,teacherImage.getHeight(), Image.SCALE_FAST), 0, 0, null);
                // 画底图
                g.drawImage(background.getScaledInstance(750, height, Image.SCALE_FAST), 0, 0, null);
                // 画头像
                if (null != avatar) {
                    g.drawImage(XcxUtilbak.roundImage(avatar, avatar.getWidth(), avatar.getHeight(), 360).getScaledInstance(45*2, 45*2, Image.SCALE_FAST), 25*2, 603*2, null);
                }
                // 画二维码
                if (null != qr) {
                    g.drawImage(qr.getScaledInstance(70*2, 70*2, Image.SCALE_FAST), 286*2, 591*2, null);
                }

                // 设置字体大小
                font = font.deriveFont(34f);
                // 设置字体颜色
                Color color = new Color(55,69,97);
                g.setColor(color);
                g.setFont(font);
                //昵称
                nickname = nickname == null ? "" : nickname;
                //nickname = EmojiUtils.emojiRecovery(nickname);

                if(nickname.length() > 5) {
                    nickname = nickname.substring(0, 9) + "...";
                }

                int stringWidth = getWidth(g.getFontRenderContext(), g, nickname);
                g.drawString(nickname, 84 * 2 , 623 * 2);

                /*//画'向您推荐好课'
                String recommendText = "早起的小闹钟";
                font = font.deriveFont(24f);
                // 设置字体颜色
                color = new Color(55,69,97);
                g.setColor(color);
                g.setFont(font);
                g.drawString(recommendText, 84 * 2 +  stringWidth , 623 * 2);*/

                // 写课程名称
                font = font.deriveFont(60.0f);
                color = new Color(69,75,106);
                g.setColor(color);
                g.setFont(font);
                int courseWidth = getWidth(g.getFontRenderContext(), g, courseName);
                if(courseWidth >= 334*2) {
                    String c1 = courseName.substring(0, 10);
                    String c2 = courseName.substring(10, courseName.length());
                    int courseHeight = getHeight(g.getFontRenderContext(), g, c1);
                    g.drawString(c1, 21 * 2 , (430 * 2) - 2);
                    g.drawString(c2, 21 * 2 , 420 * 2 + courseHeight + 2);

                }else {
                    g.drawString(courseName, 21 * 2 , 448 * 2);

                }

               /* //写课程大纲
                List<String> tipList = Arrays.asList(courseTip.split("\n"));
                String tip1 = tipList.get(0);
                if(tip1.length() >= 20) {
                    tip1 = tip1.substring(0, 19) + "...";
                }
                String tip2 = tipList.get(1);
                if(tip2.length() >= 20) {
                    tip2 = tip2.substring(0, 19) + "...";
                }
                String tip3 = tipList.get(2);
                if(tip3.length() >= 20) {
                    tip3 = tip3.substring(0, 19) + "...";
                }
                font = font.deriveFont(30.0f);
                color = new Color(176,153,104);
                g.setColor(color);
                g.setFont(font);
                g.drawString(tip1, 47 * 2 , 494 * 2);
                g.drawString(tip2, 47 * 2 , 527 * 2);
                g.drawString(tip3, 47 * 2 , 559 * 2);*/

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

    public static Font getPingFang() {
            return new Font("宋体",Font.BOLD,20);
    }


    public static void main(String[] args) {
        try {
            BufferedImage bg = ImageIO.read(new File("E:\\temp\\sharebg.png"));
            BufferedImage poster = ImageIO.read(new File("E:\\temp\\poster.jpg"));
            BufferedImage qr = ImageIO.read(new File("E:\\temp\\qr.jpg"));
            BufferedImage avatar = ImageIO.read(new URL("https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK4DYtvaMV6YIficQnj2D8CiaabaSAq1kzNZUAZCWn5oGv6n8AnjuYTH3bBqELica2yeKbYiakSUMsQIQ/132"));
            String nickname = "早起的小闹钟";
            String courseName = "我已坚持打卡xx天，我参与了绿色家园建设每日打卡行动，邀请你一起来!";
            String courseTip = "给人看和给人讲的PPT有什么区别？\n为什么用了模板还是很丑为什么用了模板还是很丑为什么用了模板还是很丑？\n如何体现PPT制作的专业性?";
            BufferedImage img = XcxUtilbak.createSharePoster(bg, poster, qr, avatar, getPingFang(), nickname, courseName, courseTip);
            ImageIO.write(img, "jpg", new File("E:\\temp\\result"+Utils.formatCompactDateSSS()+".jpg"));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
