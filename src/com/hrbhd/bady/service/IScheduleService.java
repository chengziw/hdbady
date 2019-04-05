package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.Schedule;

public interface IScheduleService {

	public Schedule findById(String id);

	public void editSchedule(Schedule model, String[] start_times, String[] end_times);

	public List<Schedule> findAll();


}
