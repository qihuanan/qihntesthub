package com.qihn.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;



/**
 * 常用工具类
 * @author qihn
 *
 */
public class Utils  {
	private static final DateFormat longDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static final DateFormat longDateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static final DateFormat longDateFormatHH = new SimpleDateFormat("yyyy-MM-dd HH");
	private static final DateFormat shortDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final DateFormat compactDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	private static final DateFormat compactDateFormat2 = new SimpleDateFormat("MMddHHmm");
	private static final DateFormat simpleDateFormat = new SimpleDateFormat("yyyyMM");
	private static final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final DateFormat yearFormat = new SimpleDateFormat("yyyy");
	private static final DateFormat monthFormat = new SimpleDateFormat("MM");
	private static final DateFormat dayFormat = new SimpleDateFormat("dd");
	//public static ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());// new ClassPathXmlApplicationContext("spring/application*.xml");
	private static final DateFormat compactDateFormatSSS = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	
	
	/**
	 * yyyy
	 * @return 最后修改：Oct 25, 2011 7:05:01 PM qihn
	 */
	public static String yearFormat() {
		return yearFormat.format(new Date());
	}

	/**
	 * MM
	 * @return 最后修改：Oct 25, 2011 7:05:09 PM qihn
	 */
	public static String monthFormat() {
		return monthFormat.format(new Date());
	}

	/**
	 * dd
	 * @return 最后修改：Oct 25, 2011 7:05:21 PM qihn
	 */
	public static String dayFormat() {
		return dayFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String formatLongDate() {
		return longDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String formatLongDate(Date date) {
		return longDateFormat.format(date);
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH
	 * @return
	 */
	public static String formatLongDateHH() {
		return longDateFormatHH.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH:mm
	 * @return
	 */
	public static String formatLongDate2() {
		return longDateFormat2.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH:mm
	 * @return
	 */
	public static String formatLongDate2(Date d) {
		return longDateFormat2.format(d);
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd
	 * @return
	 */
	public static String formatShortDate() {
		return shortDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMMddHHmmss
	 * @return
	 */
	public static String formatCompactDate() {
		return compactDateFormat.format(new Date());
	}
	
	/**
	 * 返回当前日期形式的字符，表现形式：yyyyMMddHHmmssSSS+DDD 最后三位随机数
	 * @return
	 */
	public static String formatCompactDateSSS() {
		StringBuffer sb = new StringBuffer();
		sb.append(compactDateFormatSSS.format(new Date())).append(new Random().nextInt(9)).append(new Random().nextInt(9)).append(new Random().nextInt(9));
		return sb.toString();
	}


	
	/**
	 * 返回当前日期，表现形式：MMddHHmm
	 * @return
	 */
	public static String formatCompactDate2() {
		return compactDateFormat2.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMM
	 * @return
	 */
	public static String formatSimpleDate() {
		return simpleDateFormat.format(new Date());
	}

	/**
	 * 	主键是否需要设置UUID ,字符串类型全部设置
	 * @param o May 4, 2012 11:12:28 AM qihn
	 */
	public static synchronized void pkUUID(Object o) {
		if (o == null)
			return;
		if (o instanceof String) {
			o = UUID.randomUUID().toString();
		}
	}

	/**
	 * 判断对象非空或 null 包括 Collection、Map、String. Object[]
	 * @param o
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean isNotNullOrEmpty(Object o) {
		if (o == null)
			return false;
		if (o instanceof String) {
			String str = (String) o;
			if (str.trim().equals(""))
				return false;
		} else if (o instanceof Collection) {
			Collection c = (Collection) o;
			return (c != null && c.size() != 0);
		} else if (o instanceof Map) {
			Map map = (Map) o;
			return (map != null && map.size() != 0);
		} else if (o instanceof Object[]) {
			Object[] a = (Object[]) o;
			if (a.length == 0) {
				return false;
			}
		}
		return true;
	}

	public static boolean isNullorEmpty(Object o) {
		if (o == null)
			return true;
		if (o instanceof String) {
			String str = (String) o;
			if (str.trim().equals(""))
				return true;
		} else if (o instanceof Collection) {
			Collection c = (Collection) o;
			return !(c != null && c.size() != 0);
		} else if (o instanceof Map) {
			Map map = (Map) o;
			return !(map != null && map.size() != 0);
		} else if (o instanceof Object[]) {
			Object[] a = (Object[]) o;
			if (a.length == 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 当前日期 向前或向后指定日期。入参 0，0，0 则返回当前日期字符串 20090909000000
	 */
	public static Date getDate4(Integer yearUp, Integer monthUp, Integer dateUp) {
		Calendar calendar = Calendar.getInstance();
		if (Utils.isNotNullOrEmpty(yearUp)) {
			calendar.add(Calendar.YEAR, yearUp);
		}
		if (Utils.isNotNullOrEmpty(monthUp)) {
			calendar.add(Calendar.MONTH, monthUp);
		}
		if (Utils.isNotNullOrEmpty(dateUp)) {
			calendar.add(Calendar.DATE, dateUp);
		}
		return calendar.getTime();
	}

	public static String getDate5(Integer hourup) {
		Calendar calendar = Calendar.getInstance();
		if (Utils.isNotNullOrEmpty(hourup)) {
			calendar.add(Calendar.HOUR_OF_DAY, hourup);
		}
		return longDateFormat.format(calendar.getTime());
	}

	/**
	 * 当前日期 向前或向后指定日期。入参 0，0，0 则返回当前日期字符串 20090909000000
	 */
	public static String getDate(Integer yearUp, Integer monthUp, Integer dateUp) {
		Calendar calendar = Calendar.getInstance();
		if (Utils.isNotNullOrEmpty(yearUp)) {
			calendar.add(Calendar.YEAR, yearUp);
		}
		if (Utils.isNotNullOrEmpty(monthUp)) {
			calendar.add(Calendar.MONTH, monthUp);
		}
		if (Utils.isNotNullOrEmpty(dateUp)) {
			calendar.add(Calendar.DATE, dateUp);
		}
		return shortDateFormat.format(calendar.getTime());
	}

	/**
	 * 当前日期 向前或向后指定日期。入参 0，0，0 则返回当前日期
	 */
	public static Date getDate3(Integer yearUp, Integer monthUp, Integer dateUp) {
		Calendar calendar = Calendar.getInstance();
		if (Utils.isNotNullOrEmpty(yearUp)) {
			calendar.add(Calendar.YEAR, yearUp);
		}
		if (Utils.isNotNullOrEmpty(monthUp)) {
			calendar.add(Calendar.MONTH, monthUp);
		}
		if (Utils.isNotNullOrEmpty(dateUp)) {
			calendar.add(Calendar.DATE, dateUp);
		}
		return calendar.getTime();
	}

	/**
	 *  当前日期 向前或向后指定日期。入参 0，0，0 则返回当前日期字符串 2009-09-09
	 * @param yearUp
	 * @param monthUp
	 * @param dateUp
	 * @return 最后修改：Mar 22, 2011 3:40:19 PM qihn
	 */
	public static String getDate2(Integer yearUp, Integer monthUp, Integer dateUp) {
		Calendar calendar = Calendar.getInstance();
		if (Utils.isNotNullOrEmpty(yearUp)) {
			calendar.add(Calendar.YEAR, yearUp);
		}
		if (Utils.isNotNullOrEmpty(monthUp)) {
			calendar.add(Calendar.MONTH, monthUp);
		}
		if (Utils.isNotNullOrEmpty(dateUp)) {
			calendar.add(Calendar.DATE, dateUp);
		}
		return dateFormat.format(calendar.getTime());
	}



	public static Object[] List2Array(List<Object> oList) {
		if (Utils.isNullorEmpty(oList)) {
			return null;
		}
		Object[] oArray = oList.toArray(new Object[] {});
		return oArray;
	}

	public static Class[] List2Array(List<Class> oList, Object o) {
		if (Utils.isNullorEmpty(oList)) {
			return null;
		}
		Class[] oArray = oList.toArray(new Class[] {});
		return oArray;
	}

	public static Object[] Set2Array(Set<Object> oSet) {
		if (Utils.isNullorEmpty(oSet)) {
			return null;
		}
		Object[] oArray = oSet.toArray(new Object[] {});
		return oArray;
	}

	public static <T extends Object> List<T> Set2List(Set<T> oSet) {
		if (Utils.isNullorEmpty(oSet)) {
			return null;
		}
		List<T> tList = new ArrayList<T>(oSet);
		return tList;
	}

	public static <T extends Object> List<T> Array2List(T[] tArray) {
		if (Utils.isNullorEmpty(tArray)) {
			return null;
		}
		List<T> tList = Arrays.asList(tArray);
		return tList;
	}

	public static <T extends Object> Set<T> List2Set(List<T> tList) {
		if (Utils.isNullorEmpty(tList)) {
			return null;
		}
		Set<T> tSet = new HashSet<T>(tList);
		return tSet;
	}

	public static <T extends Object> Set<T> Array2Set(T[] tArray) {
		if (Utils.isNullorEmpty(tArray)) {
			return null;
		}
		Set<T> tSet = new HashSet<T>(Arrays.asList(tArray));
		return tSet;
	}

	

	/**
	 * 读取 资源文件filepath.properties 的数据 
	 * @param name
	 * @return
	 * Oct 11, 2012 10:20:47 AM qihn
	 */
	public static String getProperty(String name) {
		String revalue = null;
		if (Utils.isNullorEmpty(name)) {
			return null;
		}
		Properties pp = new Properties();
		InputStream in = Utils.class.getResourceAsStream("/conf.properties");
		try {
			pp.load(in);
			revalue = pp.getProperty(name.trim());
		} catch (IOException e) {
			e.printStackTrace();
			return revalue;
		}
		return revalue;
	}
	public static String getProperty2(String name) {
		String revalue = null;
		if (Utils.isNullorEmpty(name)) {
			return null;
		}
		Properties pp = new Properties();
		InputStream in = Utils.class.getResourceAsStream("/conf2.properties");
		try {
			pp.load(in);
			revalue = pp.getProperty(name.trim());
		} catch (IOException e) {
			e.printStackTrace();
			return revalue;
		}
		return revalue;
	}

	public static String getPropertyFilepath(){
		String path = Utils.class.getClassLoader().getResource("conf2.properties").getPath();
		return path;
	}

	public static void updateProperties(String filepath,String keyname,String keyvalue) {
		try {
			Properties props = new Properties();
			props.load(new FileInputStream(filepath));
			// 调用 Hashtable 的方法 put，使用 getProperty 方法提供并行性。
			// 强制要求为属性的键和值使用字符串。返回值是 Hashtable 调用 put 的结果。
			OutputStream fos = new FileOutputStream(filepath);
			props.setProperty(keyname, keyvalue);
			// 以适合使用 load 方法加载到 Properties 表中的格式，
			// 将此 Properties 表中的属性列表（键和元素对）写入输出流
			props.store(fos, "Update '" + keyname + "' value");
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("属性文件更新错误");
		}
	}

	/**
	 * 读取 资源文件filepath.properties 的数据 
	 * @param name
	 * @return
	 * Oct 11, 2012 10:20:47 AM qihn
	 */
	public static Integer getPropertyInteger1(String name) {
		String revalue = Utils.getProperty(name);
		Integer i = null;
		try {
			i = new Integer(revalue);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return i;
		}
		return i;
	}

	/**
	 * 获取客服端真实ip
	 * @param request
	 * @return String 2013 10:29:21 AM
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public static String[] field2Name(Field[] f) {
		String[] name = new String[f.length];
		for (int i = 0; i < f.length; i++) {
			name[i] = f[i].getName();
		}
		return name;
	}

	public static Object[] field2Value(Field[] f, Object o) throws Exception {
		Object[] value = new Object[f.length];
		for (int i = 0; i < f.length; i++) {
			value[i] = f[i].get(o);
		}
		return value;
	}

	/**  
	 * 传入对象  
	 * @param obj 前提obj存在set get方法  
	 * @return返回对象存在的属性值  
	 * @throws Exception  
	 */
	public static String obj2json(Object obj) {
		/*Class userClass = obj.getClass();// Class.forName(obj.toString().split("@")[0]);//加载类   
		Field[] fields = userClass.getDeclaredFields();//获得对象方法集合   
		String fdname = null;
		Method method = null;
		JSONObject json = new JSONObject();
		try {
			for (Field field : fields) {// 遍历该数组
				fdname = field.getName();// 得到字段名，   
				method = userClass.getMethod("get" + change(fdname), null);// 根据字段名找到对应的get方法，null表示无参数   
				Object fdvalue = method.invoke(obj, null);// 调用该字段的get方法 
				json.put(fdname, fdvalue);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}finally{
			return json.toString();
		}*/
		return null;
	}

	/**  
	* @param src  源字符串  
	* @return 字符串，将src的第一个字母转换为大写，src为空时返回null  
	*/
	public static String change(String src) {
		if (src != null) {
			StringBuffer sb = new StringBuffer(src);
			sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
			return sb.toString();
		} else {
			return null;
		}
	}
	
	/**
	   * 产生随机字符串
	   * */
	private static Random randGen = null;
	private static char[] numbersAndLetters = null;

	/**
	 * 随机数 
	 * @param length
	 * @return
	 */
	public static final String randomString(int length) {
	         if (length < 1) {
	             return null;
	         }
	         if (randGen == null) {
	                randGen = new Random();
	                //numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
	                //   "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                  numbersAndLetters = ("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                 }
	         char [] randBuffer = new char[length];
	         for (int i=0; i<randBuffer.length; i++) {
	             //randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
	        	 randBuffer[i] = numbersAndLetters[randGen.nextInt(36)];
	         }
	         return new String(randBuffer);
	}
	
	public static void main(String[] args) {
		/*try {
			File f = new File("c:\\a.txt");
			InputStream in = new FileInputStream(f);
			byte [] buffer = new byte[1024];
			int i=0;
			
			File f2 = new File("c:\\b.txt");
			OutputStream out = new FileOutputStream(f2,true);
			while((i = in.read(buffer))!=-1){
				out.write(buffer, 0, i);
				
			}
			out.flush();
			in.close();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
		
		}*/
		
		StringBuffer sb = new StringBuffer();
		sb.append(new Random().nextInt(9)).append(new Random().nextInt(9)).append(new Random().nextInt(9));
		System.out.println(sb);
		
		System.out.println(randomString(5));
		
	}
	

}
