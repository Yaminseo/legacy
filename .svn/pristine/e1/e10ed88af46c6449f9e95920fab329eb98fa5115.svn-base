package kr.co.sky.common.utl;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TokenMngUtil {

	private static final String TOKEN_KEY = "TOKEN_KEY";
	private static final Log log = LogFactory.getLog(TokenMngUtil.class);

	private static String toHex(byte[] digest) {
		StringBuffer buf = new StringBuffer();
		for(int i=0;i<digest.length;i++) {
			buf.append(Integer.toHexString((int)digest[i] & 0x00ff));
		}
		return buf.toString();
	}

	/**
	 * 로직처리를 위해 세션과 request에 Token 생성
	 *
	 * @param request
	 */
	public static void saveToken(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		long systemTime = System.currentTimeMillis();
		byte[] time = new Long(systemTime).toString().getBytes();
		byte[] id = session.getId().getBytes();

		try {
			MessageDigest SHA = MessageDigest.getInstance("SHA-512");
			SHA.update(id);
			SHA.update(time);

			String token = toHex(SHA.digest());
			request.setAttribute(TOKEN_KEY, token);
			session.setAttribute(TOKEN_KEY, token);

			log.info("#########################################################################");
			log.info("# Generate Token Key Value = " + token + " #");
			log.info("#########################################################################");

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 로직처리 이후 중복방지를 위해 세션의 Token 초기화
	 *
	 * @param request
	 */
	public static void resetToken(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			session.removeAttribute(TOKEN_KEY);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 세션과 request의 Token이 동일한지 비교
	 *
	 * @param request
	 * @return
	 */
	public static boolean isTokenValid(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String requestToken = request.getParameter(TOKEN_KEY);
		String sessionToken = (String) session.getAttribute(TOKEN_KEY);

		if (requestToken == null || sessionToken == null) {
			return false;
		} else {
			return requestToken.equals(sessionToken);
		}
	}
}