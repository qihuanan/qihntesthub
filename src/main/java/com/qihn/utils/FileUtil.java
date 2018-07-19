package com.qihn.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileSystemUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.io.filefilter.PrefixFileFilter;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUtil {

	/**
	 * 文件操作基本类
	 *
	 * @param args
	 */
	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

	/**
	 * <p>
	 * 返回该目录的路径（如果该目录不存在，则新建目录，并返回目录路径）
	 *
	 * @param directoryName
	 * @return
	 */
	public static String getDirctoryName(File directoryName) {
		if (directoryName.isDirectory()) {
			return directoryName.getAbsolutePath();
		} else {
			try {
				FileUtils.forceMkdir(directoryName);

			} catch (IOException ex) {
				logger.error("mkdir Exception directoryName:" + directoryName, ex);
			} catch (NullPointerException ex) {
				logger.error("mkdir Exception directoryName:" + directoryName, ex);
			}

		}
		return directoryName.getAbsolutePath();
	}

	/**
	 * <p>
	 * 返回给文件是否可写
	 *
	 * @param file
	 * @return
	 */
	public static boolean fileCanWrite(File file) {
		return file.canWrite();
	}

	/**
	 * <p>
	 * 获取该目录下的所有文件
	 *
	 * @param directoryName
	 * @return
	 */
	public static Iterator getAllFileInDirecory(String directoryName) {
		return FileUtils.iterateFiles(new File(directoryName), null, false);
	}

	/**
	 * <p>
	 * 获取指定目录下的符合文件前缀的文件
	 *
	 * @param basePath
	 * @param strPrefix
	 * @return
	 */
	public static Iterator getFileListInDirectory(String basePath, String[] strPrefix) {
		return FileUtils.iterateFiles(new File(basePath), new PrefixFileFilter(strPrefix), TrueFileFilter.INSTANCE);
	}

	/**
	 * 获取指定目录下的符合文件后缀的文件
	 *
	 * @param basePath
	 * @param strSuffix
	 * @return
	 */
	public static Iterator getFileListInDirectoryBySuffix(String basePath, String[] strSuffix) {
		return FileUtils.iterateFiles(new File(basePath), strSuffix, false);
	}

	/**
	 * 获取指定目录下的剩余磁盘空间
	 *
	 * @return
	 */
	public static Long getFreeSpaceInDirectory(String path) {
		try {
			return FileSystemUtils.freeSpaceKb(path);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("获取指定目录下的剩余磁盘空间", path, e);
		}
		return new Long(0);
	}

	/**
	 * 读取文件内容
	 *
	 * @return
	 */
	public static List getFileContext(String fileName) {
		try {
			return IOUtils.readLines(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(" read file Exception->fileName:" + fileName, e);
		}
		return null;
	}

	/**
	 * 写文件内容
	 *
	 * @return
	 */
	public static int writeContextToFile(List list, OutputStream outPut) {
		int result = -1;
		try {
			IOUtils.writeLines(list, null, outPut);
			// FileUtils.writeLines(file,list);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 文件更名
	 *
	 * @param oldFileName
	 * @param newFileName
	 * @return
	 */
	public static int reNameFile(String oldFileName, String newFileName) {
		int nRet = 0;
		Process process = null;
		try {
			if ((new File(oldFileName)).exists() && (new File(oldFileName)).isFile()) {
				process = Runtime.getRuntime().exec("mv " + oldFileName + "   " + newFileName);
				process.waitFor();
				nRet = process.exitValue();
			} else {
				nRet = -1;
				System.out.println("reNameFile oldFileName not find:" + oldFileName);
				logger.error("reNameFile oldFileName not find :" + oldFileName);
			}
		} catch (IOException e) {
			if (process != null)
				nRet = process.exitValue();
			logger.error("reNameFile error -> oldFileName:" + oldFileName + "|newFileName:" + newFileName);
			e.printStackTrace(); // To change body of catch statement use
			// File |
			// Settings | File Templates.
		} catch (InterruptedException e) {
			e.printStackTrace(); // To change body of catch statement use
			// File |
			// Settings | File Templates.
			logger.error("reNameFile error -> oldFileName:" + oldFileName + "|newFileName:" + newFileName);
		}
		return nRet;
	}

	private static void createDirectory(String directory, String subDirectory) {
		String dir[];
		File fl = new File(directory);
		try {
			if (subDirectory == "" && fl.exists() != true)
				fl.mkdir();
			else if (subDirectory != "") {
				dir = subDirectory.replace('\\', '/').split("/");
				for (int i = 0; i < dir.length; i++) {
					File subFile = new File(directory + File.separator + dir[i]);
					if (subFile.exists() == false)
						subFile.mkdir();
					directory += File.separator + dir[i];
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		list.add("1234555454545");
		list.add("1234555454545");
		list.add("1234555454545");
		list.add("1234555454545");
		list.add("1234555454545");
		list.add("1234555454545");
		list.add("1234555454545");
		list.add("1234555454545");
		File file = new File("d://bb.txt");
		// try {
		// FileWriter writer = new FileWriter("d://bb.txt",true);
		// FileOutputStream fout=new FileOutputStream("d://bb.txt");
		// IOUtils.writeLines(list,null,fout);
		// // writer.flush();
		// // writer.close();
		// fout.flush();
		// fout.close();
		// System.out.println("end");
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// FileUtil.reNameFile("D://aa/aa/OLYVC_20071214000.531","d://aa/aa/OLYVC_20071214000.bak");
		File a = new File("D://aa/aa/OLYVC_20071214000.531");
		a.renameTo(new File("D://aa/aa/OLYVC_20071214000.531.bak"));
		String aa = "OLYVC_20071214000.531";
		System.out.println(aa.substring(aa.length() - 3));
	}

	/**
	 * 复制文件
	 *
	 * @param sourceFile
	 * @param targetFile
	 * @throws IOException
	 *             Feb 10, 20142:48:59 PM qihn
	 */
	public static void copyFile(File sourceFile, File targetFile) throws IOException {
		if (sourceFile.exists() && sourceFile.isFile()) {
			if (targetFile.exists()) {
				if (sourceFile.lastModified() == targetFile.lastModified()) {
					return;
				}
			}
		}

		BufferedInputStream inBuff = null;
		BufferedOutputStream outBuff = null;
		try {
			// 新建文件输入流并对它进行缓冲
			inBuff = new BufferedInputStream(new FileInputStream(sourceFile));

			// 新建文件输出流并对它进行缓冲
			outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));

			// 缓冲数组
			byte[] b = new byte[1024 * 5];
			int len;
			while ((len = inBuff.read(b)) != -1) {
				outBuff.write(b, 0, len);
			}
			// 刷新此缓冲的输出流
			outBuff.flush();
		} finally {
			// 关闭流
			if (inBuff != null)
				inBuff.close();
			if (outBuff != null)
				outBuff.close();
		}
	}

	// 复制文件夹
	public static void copyDirectiory(String sourceDir, String targetDir) throws IOException {
		// 新建目标目录
		(new File(targetDir)).mkdirs();
		// 获取源文件夹当前下的文件或目录
		File[] file = (new File(sourceDir)).listFiles();
		for (int i = 0; i < file.length; i++) {
			if (file[i].isFile()) {
				// 源文件
				File sourceFile = file[i];
				// 目标文件
				File targetFile = new File(new File(targetDir).getAbsolutePath() + File.separator + file[i].getName());
				copyFile(sourceFile, targetFile);
			}
			if (file[i].isDirectory()) {
				// 准备复制的源文件夹
				String dir1 = sourceDir + "/" + file[i].getName();
				// 准备复制的目标文件夹
				String dir2 = targetDir + "/" + file[i].getName();
				copyDirectiory(dir1, dir2);
			}
		}
	}

	/**
	 *
	 * @param srcFileName
	 * @param destFileName
	 * @param srcCoding
	 * @param destCoding
	 * @throws IOException
	 */
	public static void copyFile(File srcFileName, File destFileName, String srcCoding, String destCoding) throws IOException {// 把文件转换为GBK文件
		BufferedReader br = null;
		BufferedWriter bw = null;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(srcFileName), srcCoding));
			bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(destFileName), destCoding));
			char[] cbuf = new char[1024 * 5];
			int len = cbuf.length;
			int off = 0;
			int ret = 0;
			while ((ret = br.read(cbuf, off, len)) > 0) {
				off += ret;
				len -= ret;
			}
			bw.write(cbuf, 0, off);
			bw.flush();
		} finally {
			if (br != null)
				br.close();
			if (bw != null)
				bw.close();
		}
	}

	public static void readFileByBytes(String fileName) {
		File file = new File(fileName);
		InputStream in = null;
		/*
		 * try { System.out.println("以字节为单位读取文件内容，一次读一个字节："); // 一次读一个字节 in =
		 * new FileInputStream(file); int tempbyte; while ((tempbyte =
		 * in.read()) != -1) { System.out.write(tempbyte); } in.close(); } catch
		 * (IOException e) { e.printStackTrace(); return; }
		 */
		try {
			System.out.println("以字节为单位读取文件内容，一次读多个字节：");
			// 一次读多个字节
			byte[] tempbytes = new byte[1024];
			int byteread = 0;
			in = new FileInputStream(fileName);
			showAvailableBytes(in);
			// 读入多个字节到字节数组中，byteread为一次读入的字节数
			while ((byteread = in.read(tempbytes)) != -1) {
				System.out.write(tempbytes, 0, byteread);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	/**
	 * 以字符为单位读取文件，常用于读文本，数字等类型的文件
	 */
	public static void readFileByChars(String fileName) {
		File file = new File(fileName);
		Reader reader = null;
		/*
		 * try { System.out.println("以字符为单位读取文件内容，一次读一个字节："); // 一次读一个字符 reader =
		 * new InputStreamReader(new FileInputStream(file)); int tempchar; while
		 * ((tempchar = reader.read()) != -1) { //
		 * 对于windows下，\r\n这两个字符在一起时，表示一个换行。 // 但如果这两个字符分开显示时，会换两次行。 //
		 * 因此，屏蔽掉\r，或者屏蔽\n。否则，将会多出很多空行。 if (((char) tempchar) != '\r') {
		 * System.out.print((char) tempchar); } } reader.close(); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */
		try {
			System.out.println("以字符为单位读取文件内容，一次读多个字节：");
			// 一次读多个字符
			char[] tempchars = new char[1024];
			int charread = 0;
			reader = new InputStreamReader(new FileInputStream(fileName));
			// 读入多个字符到字符数组中，charread为一次读取字符数
			while ((charread = reader.read(tempchars)) != -1) {
				// 同样屏蔽掉\r不显示
				if ((charread == tempchars.length) && (tempchars[tempchars.length - 1] != '\r')) {
					System.out.print(tempchars);
				} else {
					for (int i = 0; i < charread; i++) {
						if (tempchars[i] == '\r') {
							continue;
						} else {
							System.out.print(tempchars[i]);
						}
					}
				}
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	/**
	 * 以行为单位读取文件，常用于读面向行的格式化文件
	 */
	public static List<String> readFileByLines(String fileName) {
		List<String> arr = new ArrayList<String>();
		File file = new File(fileName);
		BufferedReader reader = null;
		try {
			System.out.println("以行为单位读取文件内容，一次读一整行：");
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			int line = 1;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				// System.out.println("line " + line + ": " + tempString);
				//System.out.println(tempString);
				line++;
				arr.add(tempString);
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
		return arr;
	}

	/**
	 * 随机读取文件内容
	 */
	public static void readFileByRandomAccess(String fileName) {
		RandomAccessFile randomFile = null;
		try {
			System.out.println("随机读取一段文件内容：");
			// 打开一个随机访问文件流，按只读方式
			randomFile = new RandomAccessFile(fileName, "r");
			// 文件长度，字节数
			long fileLength = randomFile.length();
			// 读文件的起始位置
			int beginIndex = (fileLength > 4) ? 4 : 0;
			// 将读文件的开始位置移到beginIndex位置。
			randomFile.seek(beginIndex);
			byte[] bytes = new byte[10];
			int byteread = 0;
			// 一次读10个字节，如果文件内容不足10个字节，则读剩下的字节。
			// 将一次读取的字节数赋给byteread
			while ((byteread = randomFile.read(bytes)) != -1) {
				System.out.write(bytes, 0, byteread);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (randomFile != null) {
				try {
					randomFile.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	/**
	 * 显示输入流中还剩的字节数
	 */
	private static void showAvailableBytes(InputStream in) {
		try {
			System.out.println("当前字节输入流中的字节数为:" + in.available());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * A方法追加文件：使用RandomAccessFile
	 */
	public static void appendMethodA(String fileName, String content) {
		try {
			// 打开一个随机访问文件流，按读写方式
			RandomAccessFile randomFile = new RandomAccessFile(fileName, "rw");
			// 文件长度，字节数
			long fileLength = randomFile.length();
			// 将写文件指针移到文件尾。
			randomFile.seek(fileLength);
			randomFile.writeBytes(content);
			randomFile.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * B方法追加文件：使用FileWriter
	 */
	public static void appendMethodB(String fileName, String content) {
		try {
			// 打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件
			FileWriter writer = new FileWriter(fileName, true);
			writer.write(content);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	static final int BUFFER = 2048;

	/**
	 * zip 打包压缩文件
	 * @param zipfilepath
	 * @param zipfilename Feb 11, 20143:52:48 PM qihn
	 */
	public static void zip(List<File> files,String zipfilename){
		try {
			BufferedInputStream origin = null;
			FileOutputStream dest = new FileOutputStream(zipfilename);
			ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(
					dest));
			byte data[] = new byte[BUFFER];
			for (int i = 0; i < files.size(); i++) {
				FileInputStream fi = new FileInputStream(files.get(i));
				origin = new BufferedInputStream(fi, BUFFER);
				ZipEntry entry = new ZipEntry(files.get(i).getName());
				out.putNextEntry(entry);
				int count;
				while ((count = origin.read(data, 0, BUFFER)) != -1) {
					out.write(data, 0, count);
				}
				origin.close();
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * zip 打包压缩文件
	 * @param zipfilepath
	 * @param zipfilename Feb 11, 20143:52:48 PM qihn
	 */
	public static void zip(String zipfilepath,String zipfilename){
		//String zipfilepath = "e://test//a//";
		//String zipfilename = "E://test//myfiles.zip";
		try {
			BufferedInputStream origin = null;
			FileOutputStream dest = new FileOutputStream(zipfilename);
			ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(
					dest));
			byte data[] = new byte[BUFFER];
			File f = new File(zipfilepath);
			File files[] = f.listFiles();
			for (int i = 0; i < files.length; i++) {
				FileInputStream fi = new FileInputStream(files[i]);
				origin = new BufferedInputStream(fi, BUFFER);
				ZipEntry entry = new ZipEntry(files[i].getName());
				out.putNextEntry(entry);
				int count;
				while ((count = origin.read(data, 0, BUFFER)) != -1) {
					out.write(data, 0, count);
				}
				origin.close();
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * unzip 文件
	 * @param zipfilename
	 * @param zipfilepath Feb 11, 20143:53:06 PM qihn
	 */
	public static void unzip(String zipfilename ,String zipfilepath ){

		try {
			String fileName = zipfilename;// "E://test//myfiles.zip";
			String filePath = zipfilepath;// "E://test//";
			ZipFile zipFile = new ZipFile(fileName);
			Enumeration emu = zipFile.entries();
			int i=0;
			while(emu.hasMoreElements()){
				ZipEntry entry = (ZipEntry)emu.nextElement();
				//会把目录作为一个file读出一次，所以只建立目录就可以，之下的文件还会被迭代到。
				if (entry.isDirectory())
				{
					new File(filePath + entry.getName()).mkdirs();
					continue;
				}
				BufferedInputStream bis = new BufferedInputStream(zipFile.getInputStream(entry));
				File file = new File(filePath + entry.getName());
				//加入这个的原因是zipfile读取文件是随机读取的，这就造成可能先读取一个文件
				//而这个文件所在的目录还没有出现过，所以要建出目录来。
				File parent = file.getParentFile();
				if(parent != null && (!parent.exists())){
					parent.mkdirs();
				}
				FileOutputStream fos = new FileOutputStream(file);
				BufferedOutputStream bos = new BufferedOutputStream(fos,BUFFER);

				int count;
				byte data[] = new byte[BUFFER];
				while ((count = bis.read(data, 0, BUFFER)) != -1)
				{
					bos.write(data, 0, count);
				}
				bos.flush();
				bos.close();
				bis.close();
			}
			zipFile.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
