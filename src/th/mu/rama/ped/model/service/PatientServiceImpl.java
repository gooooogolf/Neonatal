/**
 * 
 */
package th.mu.rama.ped.model.service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.URL;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.tempuri.patientservice.wsdl.Patientservice;
import org.tempuri.patientservice.wsdl.PatientserviceLocator;
import org.tempuri.patientservice.wsdl.PatientserviceSoapBindingStub;
import org.tempuri.patientservice.wsdl.PatientserviceSoapPort;

import th.mu.rama.ped.config.Configuration;
import th.mu.rama.ped.model.wrapper.PatientDetail;
import th.mu.rama.ped.model.wrapper.PatientDetailWrapper;
import th.mu.rama.ped.model.wrapper.StaffDetailWrapper;


/**
 * @author 006223
 *
 */
@Service("patientService")
public class PatientServiceImpl implements PatientService {
	

	protected static Logger logger = Logger.getLogger(PatientServiceImpl.class);

	/* (non-Javadoc)
	 * @see th.mu.rama.ped.model.service.PatientService#isAuthenticate(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean isAuthenticate(String username, String password) {
	    try{
	    	Patientservice locator = new PatientserviceLocator();
	    	PatientserviceSoapPort port = locator.getpatientserviceSoapPort(new URL(Configuration.WS_SOAP_PATIENTSERVICE_WSDL));
	    	PatientserviceSoapBindingStub stub = (PatientserviceSoapBindingStub)port;
	    	stub.setTimeout(3000);
	    	String xml = stub.get_staff_detail(username, password);
	    	if(xml!=null && !xml.isEmpty()){
		    	ByteArrayInputStream byteStream = new ByteArrayInputStream(xml.getBytes("UTF-8"));
		    	JAXBContext context = JAXBContext.newInstance(new Class[] {StaffDetailWrapper.class});
		    	Unmarshaller unmarshaller = context.createUnmarshaller();
		    	StaffDetailWrapper wrapper = (StaffDetailWrapper)unmarshaller.unmarshal((InputStream)byteStream);
		    	logger.debug(!wrapper.getStaffDetail().getName().isEmpty());
		    	return (!wrapper.getStaffDetail().getName().isEmpty())?true:false;
	    	}
	    }catch(Exception e){
	    	throw new RuntimeException(e.getMessage());
	    }
		return false;
	}

	@Override
	public PatientDetail getPatientDetailByMrn(String mrn) {

	    try{
	    	Patientservice locator = new PatientserviceLocator();
	    	PatientserviceSoapPort port = locator.getpatientserviceSoapPort(new URL(Configuration.WS_SOAP_PATIENTSERVICE_WSDL));
	    	PatientserviceSoapBindingStub stub = (PatientserviceSoapBindingStub)port;
	    	stub.setTimeout(3000);
	    	String xml = stub.get_demographic_long(mrn);
	    	if(xml!=null && !xml.isEmpty()){
		    	ByteArrayInputStream byteStream = new ByteArrayInputStream(xml.getBytes("UTF-8"));
		    	JAXBContext context = JAXBContext.newInstance(new Class[] {PatientDetailWrapper.class});
		    	Unmarshaller unmarshaller = context.createUnmarshaller();
		    	PatientDetailWrapper wrapper = (PatientDetailWrapper)unmarshaller.unmarshal((InputStream) byteStream);
		    	return wrapper.getPatientDetail()== null ? null : wrapper.getPatientDetail();
	    	}
	    }catch(Exception e){
	    	throw new RuntimeException(e.getMessage());
	    }
		return null;
	
	}


}
