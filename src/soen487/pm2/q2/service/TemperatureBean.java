package soen487.pm2.q2.service;

import javax.ejb.LocalBean;
import javax.ejb.Lock;
import javax.ejb.LockType;
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

    /**
     * Get the current temperature
     * @return
     */
    public Integer getTemperature() {
		return temperature;
	}

    /**
     * Update temperature
     */
    @Lock(LockType.WRITE)
	public void setTemperature(Integer temperature) {
		this.temperature = temperature;
	}

	private Integer temperature;
}
