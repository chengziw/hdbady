package com.hrbhd.bady.domain;

import java.io.Serializable;

import javax.mail.Flags.Flag;

import org.apache.struts2.components.Else;
import org.junit.validator.PublicClassValidator;

public class School implements Serializable {

	private String id;

	private String school_name;
	private String province_name;
	private String city_name;

	private String area_name;
	private String school_addr;
	private String first_start_month;

	private String last_start_month;
	private String next_class_up_date;
	private String last_class_up_date;

	private String school_level;
	private String edit;
	////////////////////////// 下面是后加的
	private String about_info;

	private String first_termname;
	private String first_term_month;
	private String last_termname;

	private String last_term_month;
	private String up_month;
	private String up_day;

	private String tags;
	private String supply_way;
	private String supply_range;

	private String supply_number;
	private String supply_fee;
	private String cantact_man1;

	private String cantact_phone1;
	private String cantact_man2;
	private String cantact_phone2;

	private String sharesite_title;
	private String sharesite_desc;
	private String longitude;
	private String latitude;

	// 下面是后后来加的.
	private String imageUrl1;
	private String imageUrl2;
	private String imageUrl3;
	private String imageUrl4;
	private String imageUrl5;
	private String imageUrl6;

	private String imageUrl7;
	private String imageUrl8;
	private String imageUrl9;
	private String imageUrl10;
	private String imageUrl11;
	private String imageUrl12;

	private String imageUrl13;
	private String imageUrl14;
	private String imageUrl15;
	private String imageUrl16;
	private String imageUrl17;
	private String imageUrl18;

	public String deleteImageUrl(String index) {
		String flag = "";
		switch (index) {
		case "1":
			flag = imageUrl1;
			imageUrl1 = null;
			break;
		case "2":
			flag = imageUrl2;
			imageUrl2 = null;
			break;
		case "3":
			flag = imageUrl3;
			imageUrl3 = null;
			break;
		case "4":
			flag = imageUrl4;
			imageUrl4 = null;
			break;
		case "5":
			flag = imageUrl5;
			imageUrl5 = null;
			break;
		case "6":
			flag = imageUrl6;
			imageUrl6 = null;
			break;
		case "7":
			flag = imageUrl7;
			imageUrl7 = null;
			break;
		case "8":
			flag = imageUrl8;
			imageUrl8 = null;
			break;
		case "9":
			flag = imageUrl9;
			imageUrl9 = null;
			break;
		case "10":
			flag = imageUrl10;
			imageUrl10 = null;
			break;
		case "11":
			flag = imageUrl11;
			imageUrl11 = null;
			break;
		case "12":
			flag = imageUrl12;
			imageUrl12 = null;
			break;
		case "13":
			flag = imageUrl13;
			imageUrl13 = null;
			break;
		case "14":
			flag = imageUrl14;
			imageUrl14 = null;
			break;
		case "15":
			flag = imageUrl15;
			imageUrl15 = null;
			break;
		case "16":
			flag = imageUrl16;
			imageUrl16 = null;
			break;
		case "17":
			flag = imageUrl17;
			imageUrl17 = null;
			break;
		case "18":
			flag = imageUrl18;
			imageUrl18 = null;
			break;
		default:
			break;
		}

		return flag;
	}

	public int setImageUrl(String fileName, String type) {
		int flag = 0;
		switch (type) {
		case "1":
			if (imageUrl1 == null) {
				imageUrl1 = fileName;
				flag=1;
			} else if (imageUrl2 == null) {
				imageUrl2 = fileName;
				flag=2;
			} else if (imageUrl3 == null) {
				imageUrl3 = fileName;
				flag=3;
			} else if (imageUrl4 == null) {
				imageUrl4 = fileName;
				flag=4;
			} else if (imageUrl5 == null) {
				imageUrl5 = fileName;
				flag=5;
			} else if (imageUrl6 == null) {
				imageUrl6 = fileName;
				flag=6;
			}
			break;
		case "2":
			if (imageUrl7 == null) {
				imageUrl7 = fileName;
				flag=7;
			} else if (imageUrl8 == null) {
				imageUrl8 = fileName;
				flag=8;
			} else if (imageUrl9 == null) {
				imageUrl9 = fileName;
				flag=9;
			} else if (imageUrl10 == null) {
				imageUrl10 = fileName;
				flag=10;
			} else if (imageUrl11 == null) {
				imageUrl11 = fileName;
				flag=11;
			} else if (imageUrl12 == null) {
				imageUrl12 = fileName;
				flag=12;
			}
			break;
		case "3":
			if (imageUrl13 == null) {
				imageUrl13 = fileName;
				flag=13;
			} else if (imageUrl14 == null) {
				imageUrl14 = fileName;
				flag=14;
			} else if (imageUrl15 == null) {
				imageUrl15= fileName;
				flag=15;
			} else if (imageUrl16 == null) {
				imageUrl16 = fileName;
				flag=16;
			} else if (imageUrl17 == null) {
				imageUrl17 = fileName;
				flag=17;
			} else if (imageUrl18 == null) {
				imageUrl18 = fileName;
				flag=18;
			}
			break;

		default:
			break;
		}

		return flag;
	}

	public String getImagerUrl(String index) {
		String imageUrl = "";
		switch (index) {
		case "1":
			imageUrl = imageUrl1;
			break;
		case "2":
			imageUrl = imageUrl2;
			break;
		case "3":
			imageUrl = imageUrl3;
			break;
		case "4":
			imageUrl = imageUrl4;
			break;
		case "5":
			imageUrl = imageUrl5;
			break;
		case "6":
			imageUrl = imageUrl6;
			break;
		case "7":
			imageUrl = imageUrl7;
			break;
		case "8":
			imageUrl = imageUrl8;
			break;
		case "9":
			imageUrl = imageUrl9;
			break;
		case "10":
			imageUrl = imageUrl10;
			break;
		case "11":
			imageUrl = imageUrl11;
			break;
		case "12":
			imageUrl = imageUrl12;
			break;
		case "13":
			imageUrl = imageUrl13;
			break;
		case "14":
			imageUrl = imageUrl14;
			break;
		case "15":
			imageUrl = imageUrl15;
			break;
		case "16":
			imageUrl = imageUrl16;
			break;
		case "17":
			imageUrl = imageUrl17;
			break;
		case "18":
			imageUrl = imageUrl18;
			break;
		default:
			break;
		}

		return imageUrl;

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public String getSchool_addr() {
		return school_addr;
	}

	public void setSchool_addr(String school_addr) {
		this.school_addr = school_addr;
	}

	public String getFirst_start_month() {
		return first_start_month;
	}

	public void setFirst_start_month(String first_start_month) {
		this.first_start_month = first_start_month;
	}

	public String getLast_start_month() {
		return last_start_month;
	}

	public void setLast_start_month(String last_start_month) {
		this.last_start_month = last_start_month;
	}

	public String getNext_class_up_date() {
		return next_class_up_date;
	}

	public void setNext_class_up_date(String next_class_up_date) {
		this.next_class_up_date = next_class_up_date;
	}

	public String getLast_class_up_date() {
		return last_class_up_date;
	}

	public void setLast_class_up_date(String last_class_up_date) {
		this.last_class_up_date = last_class_up_date;
	}

	public String getSchool_level() {
		return school_level;
	}

	public void setSchool_level(String school_level) {
		this.school_level = school_level;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getAbout_info() {
		return about_info;
	}

	public void setAbout_info(String about_info) {
		this.about_info = about_info;
	}

	public String getFirst_termname() {
		return first_termname;
	}

	public void setFirst_termname(String first_termname) {
		this.first_termname = first_termname;
	}

	public String getFirst_term_month() {
		return first_term_month;
	}

	public void setFirst_term_month(String first_term_month) {
		this.first_term_month = first_term_month;
	}

	public String getLast_termname() {
		return last_termname;
	}

	public void setLast_termname(String last_termname) {
		this.last_termname = last_termname;
	}

	public String getLast_term_month() {
		return last_term_month;
	}

	public void setLast_term_month(String last_term_month) {
		this.last_term_month = last_term_month;
	}

	public String getUp_month() {
		return up_month;
	}

	public void setUp_month(String up_month) {
		this.up_month = up_month;
	}

	public String getUp_day() {
		return up_day;
	}

	public void setUp_day(String up_day) {
		this.up_day = up_day;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getSupply_way() {
		return supply_way;
	}

	public void setSupply_way(String supply_way) {
		this.supply_way = supply_way;
	}

	public String getSupply_range() {
		return supply_range;
	}

	public void setSupply_range(String supply_range) {
		this.supply_range = supply_range;
	}

	public String getSupply_number() {
		return supply_number;
	}

	public void setSupply_number(String supply_number) {
		this.supply_number = supply_number;
	}

	public String getSupply_fee() {
		return supply_fee;
	}

	public void setSupply_fee(String supply_fee) {
		this.supply_fee = supply_fee;
	}

	public String getCantact_man1() {
		return cantact_man1;
	}

	public void setCantact_man1(String cantact_man1) {
		this.cantact_man1 = cantact_man1;
	}

	public String getCantact_phone1() {
		return cantact_phone1;
	}

	public void setCantact_phone1(String cantact_phone1) {
		this.cantact_phone1 = cantact_phone1;
	}

	public String getCantact_man2() {
		return cantact_man2;
	}

	public void setCantact_man2(String cantact_man2) {
		this.cantact_man2 = cantact_man2;
	}

	public String getCantact_phone2() {
		return cantact_phone2;
	}

	public void setCantact_phone2(String cantact_phone2) {
		this.cantact_phone2 = cantact_phone2;
	}

	public String getSharesite_title() {
		return sharesite_title;
	}

	public void setSharesite_title(String sharesite_title) {
		this.sharesite_title = sharesite_title;
	}

	public String getSharesite_desc() {
		return sharesite_desc;
	}

	public void setSharesite_desc(String sharesite_desc) {
		this.sharesite_desc = sharesite_desc;
	}
	
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getimageUrl1() {
		return imageUrl1;
	}

	public String getImageUrl1() {
		return imageUrl1;
	}

	public void setImageUrl1(String imageUrl1) {
		this.imageUrl1 = imageUrl1;
	}

	public String getImageUrl2() {
		return imageUrl2;
	}

	public void setImageUrl2(String imageUrl2) {
		this.imageUrl2 = imageUrl2;
	}

	public String getImageUrl3() {
		return imageUrl3;
	}

	public void setImageUrl3(String imageUrl3) {
		this.imageUrl3 = imageUrl3;
	}

	public String getImageUrl4() {
		return imageUrl4;
	}

	public void setImageUrl4(String imageUrl4) {
		this.imageUrl4 = imageUrl4;
	}

	public String getImageUrl5() {
		return imageUrl5;
	}

	public void setImageUrl5(String imageUrl5) {
		this.imageUrl5 = imageUrl5;
	}

	public String getImageUrl6() {
		return imageUrl6;
	}

	public void setImageUrl6(String imageUrl6) {
		this.imageUrl6 = imageUrl6;
	}

	public String getImageUrl7() {
		return imageUrl7;
	}

	public void setImageUrl7(String imageUrl7) {
		this.imageUrl7 = imageUrl7;
	}

	public String getImageUrl8() {
		return imageUrl8;
	}

	public void setImageUrl8(String imageUrl8) {
		this.imageUrl8 = imageUrl8;
	}

	public String getImageUrl9() {
		return imageUrl9;
	}

	public void setImageUrl9(String imageUrl9) {
		this.imageUrl9 = imageUrl9;
	}

	public String getImageUrl10() {
		return imageUrl10;
	}

	public void setImageUrl10(String imageUrl10) {
		this.imageUrl10 = imageUrl10;
	}

	public String getImageUrl11() {
		return imageUrl11;
	}

	public void setImageUrl11(String imageUrl11) {
		this.imageUrl11 = imageUrl11;
	}

	public String getImageUrl12() {
		return imageUrl12;
	}

	public void setImageUrl12(String imageUrl12) {
		this.imageUrl12 = imageUrl12;
	}

	public String getImageUrl13() {
		return imageUrl13;
	}

	public void setImageUrl13(String imageUrl13) {
		this.imageUrl13 = imageUrl13;
	}

	public String getImageUrl14() {
		return imageUrl14;
	}

	public void setImageUrl14(String imageUrl14) {
		this.imageUrl14 = imageUrl14;
	}

	public String getImageUrl15() {
		return imageUrl15;
	}

	public void setImageUrl15(String imageUrl15) {
		this.imageUrl15 = imageUrl15;
	}

	public String getImageUrl16() {
		return imageUrl16;
	}

	public void setImageUrl16(String imageUrl16) {
		this.imageUrl16 = imageUrl16;
	}

	public String getImageUrl17() {
		return imageUrl17;
	}

	public void setImageUrl17(String imageUrl17) {
		this.imageUrl17 = imageUrl17;
	}

	public String getImageUrl18() {
		return imageUrl18;
	}

	public void setImageUrl18(String imageUrl18) {
		this.imageUrl18 = imageUrl18;
	}

}
