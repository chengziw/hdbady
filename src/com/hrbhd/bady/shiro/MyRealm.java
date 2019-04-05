package com.hrbhd.bady.shiro;

import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.hrbhd.bady.dao.ITeacherDao;
import com.hrbhd.bady.domain.Teacher;
import com.hrbhd.bady.service.ITeacherService;
import com.hrbhd.bady.util.TimeUtil;

public class MyRealm extends AuthorizingRealm {

	@Autowired
	private ITeacherService teacherService;
	
	@Autowired
	private ITeacherDao teacherDao;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername();// 从令牌中获得用户名

		// User user = userDao.findUserByUsername(username);
		List<Teacher> list = teacherDao.findByPhone(username);

		if (list != null && list.size() > 0) {
			// 用户名存在
			Teacher teacher = list.get(0);
			String password = teacher.getPassword();
			// 创建简单认证信息对象
			/***
			 * 参数一：签名，程序可以在任意位置获取当前放入的对象 参数二：从数据库中查询出的密码 参数三：当前realm的名称
			 */
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(teacher, password,
					this.getClass().getSimpleName());
			return info;// 返回给安全管理器，由安全管理器负责比对数据库中查询出的密码和页面提交的密码
		} else {
			return null;
		}

	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		/*SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//根据当前登录用户查询其对应的权限，授权
		User user = (User) principals.getPrimaryPrincipal();
		List<Function> list = null;
		if(user.getUsername().equals("admin")){
			//当前用户是超级管理员，查询所有权限，为用户授权
			list = functionDao.findAll();
		}else{
			//普通用户，根据用户id查询对应的权限
			list = functionDao.findListByUserid(user.getId());
		}
		for (Function function : list) {
			info.addStringPermission(function.getCode());
		}
		return info;
		}*/
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Teacher teacher = (Teacher)principals.getPrimaryPrincipal();
		
		Set<String> pset = teacherService.getPagePower(teacher);
		Set<String> eset = teacherService.getElementPower(teacher);
		
		/*for (String string : pset) {
			System.out.println(string);
		}
		for (String string : eset) {
			System.out.println(string);
		}*/
		//这个方法能直接添加集合
		info.addStringPermissions(pset);
		info.addStringPermissions(eset);
		/*info.addStringPermission("page_student_student-bespeak");
		info.addStringPermission("page_student_student");
		info.addStringPermission("page_student_student-change-log");*/
		
		return info;
	}
}
