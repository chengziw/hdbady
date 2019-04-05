package com.hrbhd.bady.service;

import java.util.List;

import com.hrbhd.bady.domain.ClockConfig;

public interface IClockConfigService {

	public List<ClockConfig> findClockConfig();

	public void editClockConfig(ClockConfig model, String[] months, String[] clock_days);

	public List<ClockConfig> findAll();

}
