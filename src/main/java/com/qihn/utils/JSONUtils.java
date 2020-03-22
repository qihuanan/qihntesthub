package com.qihn.utils;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.List;

/**
 * JSON转换工具
 *
 */
public class JSONUtils {

	private static final ObjectMapper om = new ObjectMapper();
    private static final String JSON_CHARSET = "UTF-8";

    static{
        om.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
    }

    private JSONUtils() {
	}
    private static Gson gson = new Gson();

    /**
     * 将一个对象转换成一个Json字符串
     * @param t
     * @return
     */
    public static <T> String objectToJson(T t){
        if (t instanceof String) {
            return t.toString();
        } else {
            return gson.toJson(t);
        }
    }

    /**
     * 将Json字符串转换成对应对象
     * @param jsonString	Json字符串
     * @param clazz		对应字节码文件.class
     * @return
     */
    @SuppressWarnings("unchecked")
    public static<T> T jsonToObject(String jsonString, Class<T> clazz){
        if (clazz == String.class) {
            return (T) jsonString;
        } else {
            return (T)gson.fromJson(jsonString, clazz);
        }
    }

    /**
     * 将List集合转换为json字符串
     * @param list	List集合
     * @return
     */
    public static<T> String listToJson(List<T> list){
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = null;
        try {
            for (int i = 0; i < list.size(); i++) {
                jsonObject = new JSONObject(objectToJson(list.get(i)));
                jsonArray.put(jsonObject);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } finally {
            if (jsonObject != null) {
                jsonObject = null;
            }
        }
        return jsonArray.toString();
    }

    /**
     * 将数组转换成json字符串
     * @param array		数组
     * @return
     */
    public static<T> String arrayToJson(T[] array){
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = null;
        try {
            for (int i = 0; i < array.length; i++) {
                jsonObject = new JSONObject(objectToJson(array[i]));
                jsonArray.put(jsonObject);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } finally {
            if (jsonObject != null) {
                jsonObject = null;
            }
        }
        return jsonArray.toString();
    }

    /**
     * 获取json字符串中的值
     * @param json	json字符串
     * @param key	键值
     * @param clazz	所取数据类型，例如：Integer.class，String.class，Double.class，JSONObject.class
     * @return  存在则返回正确值，不存在返回null
     */
    public static<T> T getJsonObjectValue(String json, String key, Class<T> clazz){
        try {
            return getJsonObjectValue(new JSONObject(json), key, clazz);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取jsonObject对象中的值
     * @param jsonObject	jsonObject对象
     * @param key	键值
     * @param clazz	所取数据类型，例如：Integer.class，String.class，Double.class，JSONObject.class
     * @return  存在则返回正确值，不存在返回null
     */
    @SuppressWarnings("unchecked")
    public static<T> T getJsonObjectValue(JSONObject jsonObject, String key, Class<T> clazz){
        T t = null;
        try {
            if (clazz == Integer.class) {
                t = (T) Integer.valueOf(jsonObject.getInt(key));
            }else if(clazz == Boolean.class){
                t = (T) Boolean.valueOf(jsonObject.getBoolean(key));
            }else if(clazz == String.class){
                t = (T) String.valueOf(jsonObject.getString(key));
            }else if(clazz == Double.class){
                t = (T) Double.valueOf(jsonObject.getDouble(key));
            }else if(clazz == JSONObject.class){
                t = (T) jsonObject.getJSONObject(key);
            }else if(clazz == JSONArray.class){
                t = (T) jsonObject.getJSONArray(key);
            }else if(clazz == Long.class){
                t = (T) Long.valueOf(jsonObject.getLong(key));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return t;
    }



	public static String toJSON(Object obj) throws Exception {
		if ( obj == null ) {
			return null;
		}

        if(obj instanceof String) {
            return (String)obj;
        }

		return new String(om.writeValueAsBytes(obj), JSON_CHARSET);
	}

    public static String toJSON2(Object obj) {
        if ( obj == null ) {
            return null;
        }

        if(obj instanceof String) {
            return (String)obj;
        }
        try {
            return new String(om.writeValueAsBytes(obj), JSON_CHARSET);
        }catch (Exception e){
                    e.printStackTrace();
        }
        return null;
    }

    public static String toPrettyJSON(Object obj) throws Exception {

        if ( obj == null ) {
            return null;
        }

        if(obj instanceof String) {
            return (String)obj;
        }

        return new String(om.writerWithDefaultPrettyPrinter().writeValueAsBytes(obj), JSON_CHARSET);
    }

    public static byte[] toJSONAsBytes(Object obj) throws Exception {
        if ( obj == null ) {
            return null;
        }
        return toJSON(obj).getBytes("UTF-8");
    }


    public static <T> T fromJson(byte[] data, Class<T> javaType) throws Exception {
        if ( data == null ) {
            return null;
        }

        return fromJson(new String(data,"UTF-8"), javaType);
    }


    public static <T> T fromJson(String jsonAsString, Class<T> valueType) {
        if(org.apache.commons.lang.StringUtils.isBlank(jsonAsString)) {
            return null;
        }
        if(String.class.isAssignableFrom(valueType)) {
            return (T)jsonAsString;
        }
        try {
            return om.readValue(jsonAsString, valueType);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static <T> T fromJson(String jsonAsString, JavaType javaType) {
        if(org.apache.commons.lang.StringUtils.isBlank(jsonAsString)) {
            return null;
        }
        try {
            return (T) om.readValue(jsonAsString, javaType);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static <E> List<E> fromJson(String jsonAsString, TypeReference<List<E>> typeReference) {
        if(org.apache.commons.lang.StringUtils.isBlank(jsonAsString)) {
            return null;
        }
        try {
            return (List<E>) om.readValue(jsonAsString, typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    public static void main(String[] args) throws Exception {

//        User user = new User();
//        user.setName(new String("中文".getBytes(), "GBK"));
//
//        System.out.println(fromJson(toJSONAsBytes(user), User.class).getName());

        System.out.println(fromJson("aa", String.class));

    }

}
