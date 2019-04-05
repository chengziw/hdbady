package com.hrbhd.bady.service.impl;

import java.util.List;

import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hrbhd.bady.dao.IScheduleDao;
import com.hrbhd.bady.domain.Schedule;
import com.hrbhd.bady.service.IScheduleService;

@Service
@Transactional
public class ScheduleServiceImpl implements IScheduleService{
	
	@Autowired
	private IScheduleDao scheduleDao;

	@Override
	public Schedule findById(String id) {
		return scheduleDao.findById(id);
	}

	@Override
	public void editSchedule(Schedule model, String[] start_times, String[] end_times) {
		
		//String id = model.getId();
		//Schedule schedule = scheduleDao.findById(id);
		
		StringBuffer bstart_time = new StringBuffer();
		StringBuffer bend_time = new StringBuffer();
		StringBuffer start_end_time = new StringBuffer();
		
		for (int i=0;i<start_times.length;i++) {
			if(i==start_times.length-1){
				bstart_time.append(start_times[i]);
				bend_time.append(end_times[i]);
				start_end_time.append(start_times[i]+"-"+end_times[i]);
			}else{
				bstart_time.append(start_times[i]+",");
				bend_time.append(end_times[i]+",");
				start_end_time.append(start_times[i]+"-"+end_times[i]+",");
			}
			
		}
		
		model.setStart_end_time(start_end_time.toString());
		model.setStart_time(bstart_time.toString());
		model.setEnd_time(bend_time.toString());
		
		String week_type_label = model.getWeek_type_label();
		
		if("1".equals(week_type_label)){
			model.setDayNum("5");
		}else if("4".equals(week_type_label)){
			model.setDayNum("7");
		}else{
			model.setDayNum("6");
		}
		
		scheduleDao.saveOrUpdate(model);
		
		/*String morning_start = model.getMorning_start();
		String morning_has_num = model.getMorning_has_num();
		String afternoon_start = model.getAfternoon_start();
		String afternoon_has_num = model.getAfternoon_has_num();
		
		String duration = model.getDuration();
		String rest_duration = model.getRest_duration();
		String week_type_label = model.getWeek_type_label();
		
		schedule.setMorning_start(morning_start);
		schedule.setMorning_has_num(morning_has_num);
		schedule.setAfternoon_start(afternoon_start);
		schedule.setAfternoon_has_num(afternoon_has_num);
		
		schedule.setDuration(duration);
		schedule.setRest_duration(rest_duration);
		schedule.setWeek_type_label(week_type_label);*/
		
	}

	@Override
	public List<Schedule> findAll() {
		return scheduleDao.findAll();
	}

}
