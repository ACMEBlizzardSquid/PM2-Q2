package soen487.pm2.q2.service;

import javax.ejb.EJB;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Soen 487
 * PM2 - Question 2 -A
 * 
 * The Restfull Temperature service
 * 
 * @author shake0
 *
 */
@Path("/Temperature")
public class TemperatureService {

	/*
	 * Entreprise Java Bean - Singleton
	 */
	@EJB
	private TemperatureBean temp;
	
	/**
	 * Get the service temperature
	 * @return the string representation of the temperature in degrees
	 */
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String getTemperature(){
		return temp.getTemperature().toString()+" degrees";
	}
	
	/**
	 * Get the service temperature
	 * @return the string representation of the temperature in degrees
	 */
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public String getXML(){
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version=\"1.0\"?>");
		sb.append("<temperature>");
		sb.append(temp.getTemperature().toString());
		sb.append("</temperature>");
		return sb.toString();
	}
	
	/**
	 * Update the service temperature
	 * @param t the new temperature to set
	 */
	@PUT
	public void putXML(@FormParam("temp") int t){
		temp.setTemperature(t);
	}
}
