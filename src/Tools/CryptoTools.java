package Tools;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CryptoTools {

	// create md5 hash
	public static String md5(String message){
		String digest = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] hash = md.digest(message.getBytes("UTF-8"));
			StringBuilder sb = new StringBuilder(2*hash.length);
			for(byte b : hash){
				sb.append(String.format("%02x", b&0xff));
			}
			digest = sb.toString();
		} catch (UnsupportedEncodingException ex) {

		} catch (NoSuchAlgorithmException ex) {

		}
		return digest;
	}
}
