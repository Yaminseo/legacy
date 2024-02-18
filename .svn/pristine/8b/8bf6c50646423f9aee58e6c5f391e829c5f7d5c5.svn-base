package kr.co.sky.common.utl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

/**
 * 공통 암호화 만들어주는  클래스
 * @author 정영진
 * @since 2017. 12. 05. 오후 4:54:22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		    수정자				수정내용
 *  -------    	--------    ---------------------------
 * 2017. 12. 05.   정영진 		 		최초생성
 *
 * </pre>
 */


public class Encryptor {

	private static Log log = LogFactory.getLog(Encryptor.class);

	public static void main(String[] args) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		// StandardPBEStringEncryptor encryptor2 = new StandardPBEStringEncryptor();
		encryptor.setPassword("jdbcPassWord");		// xml에 configurationEncryptor 빈에 들어갈 passWord
		// encryptor2.setPassword("jdbcPassWord");	// xml에 configurationEncryptor 빈에 들어갈 passWord

		String orcleUrl = encryptor.encrypt("jdbc:oracle:thin:@www.skysky.co.kr:1235:SKY");
		String orcleUserName = encryptor.encrypt("skysky");
		String orclePassWord = encryptor.encrypt("sky1234");

		// 버전 5.1.x 이후 버전부터는 타임존을 인식하지 못하는 이슈가 있음
		// 기존 String mysqlUrl = encryptor2.encrypt("jdbc:mysql://www.anyserver.xyz:1562/spring");에서 아래와 같이 추가해줘야된다..
		// String mysqlUrl = encryptor2.encrypt("jdbc:mysql://www.anyserver.xyz:1562/spring?serverTimezone=UTC&amp;verifyServerCertificate=false&amp;useSSL=false");
		/*String mysqlUrl = encryptor2.encrypt("jdbc:mysql://www.skysky.co.kr:1562/spring?serverTimezone=UTC&useSSL=false");
		String mysqlUserName = encryptor2.encrypt("remember");
		String mysqlPassWord = encryptor2.encrypt("!skysky1562");*/

		System.out.println("");
		System.out.println("jdbc.oracleDriver=oracle.jdbc.driver.OracleDriver");
		System.out.println("jdbc.oracleUrl=ENC("+ orcleUrl +")");
		System.out.println("jdbc.oracleUserName=ENC("+ orcleUserName +")");
		System.out.println("jdbc.oraclePassWord=ENC("+ orclePassWord +")");
		/*System.out.println("");
		System.out.println("mysql.mysqlDriver=com.mysql.jdbc.Driver");
		System.out.println("mysql.mysqlUrl=ENC("+ mysqlUrl +")");
		System.out.println("mysql.mysqlUserName=ENC("+ mysqlUserName +")");
		System.out.println("mysql.mysqlPassWord=ENC("+ mysqlPassWord +")");*/
	}
}