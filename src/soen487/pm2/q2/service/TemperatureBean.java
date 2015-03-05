package soen487.pm2.q2.service;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;

/**
 * Singleton Session Bean
 */
@Singleton
@LocalBean
public class TemperatureBean {

    public TemperatureBean() {
        this.temperature = new Integer(0);
    }
    
    public Integer getTemperature() {
		return temperature;
	}


	public void setTemperature(Integer temperature) {
		this.temperature = temperature;
	}

	private Integer temperature;
}
