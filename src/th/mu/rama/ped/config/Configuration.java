/**
 * 
 */
package th.mu.rama.ped.config;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author 006223
 *
 */
public class Configuration {
	
	public static final String VERSION;
	public static final String WS_SOAP_PATIENTSERVICE_WSDL;
	
	static {
		
		Properties prop = new Properties();
		String propFileName = "project.properties";
 
		try {
			InputStream inputStream = Configuration.class.getClassLoader().getResourceAsStream(propFileName);
			 
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		
		VERSION =  prop.getProperty("version");		
		WS_SOAP_PATIENTSERVICE_WSDL = prop.getProperty("ws.soap.patientservice.wsdl");

	}

}
