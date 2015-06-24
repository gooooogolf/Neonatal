/**
 * 
 */
package th.mu.rama.ped.test;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

import org.tempuri.patientservice.wsdl.Patientservice;
import org.tempuri.patientservice.wsdl.PatientserviceLocator;
import org.tempuri.patientservice.wsdl.PatientserviceSoapBindingStub;
import org.tempuri.patientservice.wsdl.PatientserviceSoapPort;

import th.mu.rama.ped.config.Configuration;

/**
 * @author 006223
 *
 */
public class PatientServiceXMLTest {

	/**
	 * @param args
	 * @throws ServiceException 
	 * @throws MalformedURLException 
	 * @throws RemoteException 
	 */
	public static void main(String[] args) throws MalformedURLException, ServiceException, RemoteException {
    	Patientservice locator = new PatientserviceLocator();
    	PatientserviceSoapPort port = locator.getpatientserviceSoapPort(new URL(Configuration.WS_SOAP_PATIENTSERVICE_WSDL));
    	PatientserviceSoapBindingStub stub = (PatientserviceSoapBindingStub)port;
    	String xml = stub.get_demographic_long("4224722");
    	System.out.println(xml);
	}

}
