package com.hrbhd.bady.web.action.base;

import java.io.IOException;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import com.hrbhd.bady.service.IAskService;
import com.hrbhd.bady.service.IStudentCheckService;
import com.hrbhd.bady.service.IClassTypeService;
import com.hrbhd.bady.service.IClassesService;
import com.hrbhd.bady.service.IClockConfigService;
import com.hrbhd.bady.service.ICookBookService;
import com.hrbhd.bady.service.ICurriculaTableItemService;
import com.hrbhd.bady.service.ICurriculaTableService;
import com.hrbhd.bady.service.IElementService;
import com.hrbhd.bady.service.IGradeService;
import com.hrbhd.bady.service.IHomeWorkService;
import com.hrbhd.bady.service.INoticeService;
import com.hrbhd.bady.service.IRoleService;
import com.hrbhd.bady.service.IScheduleService;
import com.hrbhd.bady.service.IStructureService;
import com.hrbhd.bady.service.IStudentBespeakDescService;
import com.hrbhd.bady.service.IStudentBespeakService;
import com.hrbhd.bady.service.IStudentChangeLogService;
import com.hrbhd.bady.service.IStudentService;
import com.hrbhd.bady.service.IStudentVacationService;
import com.hrbhd.bady.service.ISubjectService;
import com.hrbhd.bady.service.ITeacherChangeLogService;
import com.hrbhd.bady.service.ITeacherCheckService;
import com.hrbhd.bady.service.ITeacherDutyService;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.service.ITeacherVacationService;
import com.hrbhd.bady.util.PageBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {

	protected DetachedCriteria detachedCriteria = null;
	
	protected PageBean pageBean = new PageBean();
	// 模型对象
	protected T model;

	public T getModel() {
		return model;
	}

	public void writePageBean2Json(PageBean pageBean, String[] excludes) throws IOException {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		JSONObject jsonObject = JSONObject.fromObject(pageBean, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
	}

	/**
	 * 在构造方法中动态获得实现类型，通过反射创建模型对象
	 */
	public BaseAction() {
		ParameterizedType genericSuperclass = null;

		if (this.getClass().getGenericSuperclass() instanceof ParameterizedType) {
			genericSuperclass = (ParameterizedType) this.getClass().getGenericSuperclass();
		} else {// 当前为Action创建了代理
			genericSuperclass = (ParameterizedType) this.getClass().getSuperclass().getGenericSuperclass();
		}

		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		// 获得实体类型
		Class<T> entityClass = (Class<T>) actualTypeArguments[0];
		detachedCriteria = DetachedCriteria.forClass(entityClass);
		pageBean.setDetachedCriteria(detachedCriteria);
		try {
			// 通过反射创建对象
			model = entityClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	public void writeList2Json(List list, String[] excludes) throws IOException {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		JSONArray jsonObject = JSONArray.fromObject(list, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
	}

	public void writeObject2Json(Object object, String[] excludes) throws IOException {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		JSONObject jsonObject = JSONObject.fromObject(object, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
	}
}
