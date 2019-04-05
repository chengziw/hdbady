package com.hrbhd.bady.service.impl;

import com.hrbhd.bady.dao.ISchoolDao;
import com.hrbhd.bady.domain.School;
import com.hrbhd.bady.exception.DeletePictureException;
import com.hrbhd.bady.service.ISchoolService;
import com.hrbhd.bady.util.JsonUtil;
import com.hrbhd.bady.util.MD5Utils;
import com.hrbhd.bady.util.PageBean;
import com.hrbhd.bady.web.action.SchoolAction;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class SchoolServiceImpl implements ISchoolService{

	@Autowired
	private ISchoolDao schoolDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		schoolDao.pageQuery(pageBean);
	}

	@Override
	public School findById(String id) {
		return schoolDao.findById(id);
	}

	@Override
	public List<School> findAll() {
		return schoolDao.findAll();
	}

	@Override
	public void deletePicture(School school,String index) throws DeletePictureException, IOException {
		
		String flag = school.deleteImageUrl(index);
		if(!"".equals(flag)){
			schoolDao.save(school);
			//É¾³ýÎÄ¼þµÄÂß¼­
			URL resource = SchoolAction.class.getClassLoader().getResource("");
			String path = resource.getPath();
			path = StringUtils.substringBeforeLast(path, "/WEB-INF/classes");
			path =path +"/"+flag;
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
			
			String json ="{\"status\": 1,\"info\": \"É¾³ý³É¹¦£¡\"}";
			JsonUtil.writeJson(json);
		}else {
			throw new DeletePictureException("É¾³ýÍ¼Æ¬³ö´í");
		}
		
	}

	@Override
	public void importPicture(File[] img_file, String type) throws IOException {
		
		List<School> list = schoolDao.findAll();
		School school = null;
		if (list != null && list.size() > 0) {
			school = list.get(0);
		}

		URL resource = SchoolAction.class.getClassLoader().getResource("");
		String path = resource.getPath();
		path = StringUtils.substringBeforeLast(path, "/WEB-INF/classes");
		path = path + "/image/school/";
		// ServletInputStream fileInputStream =
		// ServletActionContext.getRequest().getInputStream();
		
		StringBuffer buffer1 = new StringBuffer();
		buffer1.append("{\"status\": 1,\"info\": [");
		for (int i=0;i<img_file.length;i++) {

			File inFile = img_file[i];
			FileInputStream fileInputStream = new FileInputStream(inFile);
			Random random = new Random();
			int nextInt = random.nextInt(1000000);
			String fileName = MD5Utils.md5(System.currentTimeMillis() + nextInt + "");
			File outFile = new File(path + fileName + ".jpg");
			System.out.println(outFile.getAbsolutePath());
			if (!outFile.exists())
				outFile.createNewFile();
			FileOutputStream fileOutputStream = new FileOutputStream(outFile);
			int c;
			byte buffer[] = new byte[1024];
			while ((c = fileInputStream.read(buffer)) != -1) {
				for (int j = 0; j < c; j++)
					fileOutputStream.write(buffer[j]);
			}
			
			fileInputStream.close();
			fileOutputStream.close();

			fileName = "image/school/" + fileName + ".jpg";
			int flag = school.setImageUrl(fileName, type);
			if (!"0".equals(flag)) {
				if(i==img_file.length-1){
					buffer1.append("{\"img_url\": \"http://localhost:8080/hdbady/"+fileName+"\",");
					buffer1.append("\"del_url\": \"http://localhost:8080/hdbady/schoolAction_deletePicture.action?index="+flag+"\"}");
				}else{
					buffer1.append("{\"img_url\": \"http://localhost:8080/hdbady/"+fileName+"\",");
					buffer1.append("\"del_url\": \"http://localhost:8080/hdbady/schoolAction_deletePicture.action?index="+flag+"\"},");
				}
			}
			
		}
		
		buffer1.append("]}");
		JsonUtil.writeJson(buffer1.toString());
		
	}

	@Override
	public void editSchool(School model) throws IOException {
		
		String id = model.getId();
		School school = schoolDao.findById(id);
		
		school.setAbout_info(model.getAbout_info());
		school.setSchool_addr(model.getSchool_addr());
		school.setArea_name(model.getArea_name());
		school.setCantact_man1(model.getCantact_man1());
		school.setCantact_man2(model.getCantact_man2());
		school.setCantact_phone1(model.getCantact_phone1());
		school.setCantact_phone2(model.getCantact_phone2());
		school.setCity_name(model.getCity_name());
		school.setFirst_term_month(model.getFirst_term_month());
		school.setFirst_termname(model.getFirst_termname());
		school.setLast_term_month(model.getLast_term_month());
		school.setLast_termname(model.getLast_termname());
		school.setSchool_name(model.getSchool_name());
		school.setProvince_name(model.getProvince_name());
		school.setSharesite_desc(model.getSharesite_desc());
		school.setSharesite_title(model.getSharesite_title());
		school.setSupply_fee(model.getSupply_fee());
		school.setSupply_number(model.getSupply_number());
		school.setSupply_range(model.getSupply_range());
		school.setSupply_way(model.getSupply_way());
		school.setTags(model.getTags());
		school.setUp_day(model.getUp_day());
		school.setUp_month(model.getUp_month());
		school.setLongitude(model.getLongitude());
		school.setLatitude(model.getLatitude());
		
		String json = JSONObject.fromObject(school).toString();
		JsonUtil.writeJson(json);
	}

	@Override
	public void save(School model) {
		schoolDao.save(model);
	}
}
