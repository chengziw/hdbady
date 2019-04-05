package com.hrbhd.bady.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import com.hrbhd.bady.dao.IClockConfigDao;
import com.hrbhd.bady.domain.ClockConfig;
import com.hrbhd.bady.service.IClockConfigService;

@Service
@Transactional
public class ClockConfigServiceImpl implements IClockConfigService {

	@Autowired
	private IClockConfigDao clockConfigDao;

	@Override
	public List<ClockConfig> findClockConfig() {
		return clockConfigDao.findAll();
	}

	@Override
	public void editClockConfig(ClockConfig model, String[] months, String[] clock_days) {
		//String id = model.getId();
		//ClockConfig clockConfig = clockConfigDao.findById(id);

		StringBuffer MBuffer = null;
		if (months != null) {
			MBuffer = new StringBuffer();
			for(int i=0;i<months.length;i++){
				System.out.println(months[i]);
				if(i==months.length-1){
					MBuffer.append(months[i]);
					continue;
				}
				MBuffer.append(months[i]+",");
			}
		}
		
		/*StringBuffer CBuffer = null;
		if (clock_days != null) {
			CBuffer = new StringBuffer();
			for(int i=0;i<clock_days.length;i++){
				System.out.println(clock_days[i]);
				if(i==clock_days.length-1){
					CBuffer.append(clock_days[i]);
					continue;
				}
				CBuffer.append(clock_days[i]+",");
			}
		}*/
		
		model.setMonth(MBuffer.toString());
		//model.setClock_day(clock_days.toString());
		
		clockConfigDao.update(model);
	}

	@Override
	public List<ClockConfig> findAll() {
		return clockConfigDao.findAll();
	}
}
