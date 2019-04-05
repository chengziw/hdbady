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
		String username = upToken.getUsername();// �������л���û���

		// User user = userDao.findUserByUsername(username);
		List<Teacher> list = teacherDao.findByPhone(username);

		if (list != null && list.size() > 0) {
			// �û�������
			Teacher teacher = list.get(0);
			String password = teacher.getPassword();
			// ��������֤��Ϣ����
			/***
			 * ����һ��ǩ�����������������λ�û�ȡ��ǰ����Ķ��� �������������ݿ��в�ѯ�������� ����������ǰrealm������
			 */
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(teacher, password,
					this.getClass().getSimpleName());
			return info;// ���ظ���ȫ���������ɰ�ȫ����������ȶ����ݿ��в�ѯ���������ҳ���ύ������
		} else {
			return null;
		}

	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		/*SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//���ݵ�ǰ��¼�û���ѯ���Ӧ��Ȩ�ޣ���Ȩ
		User user = (User) principals.getPrimaryPrincipal();
		List<Function> list = null;
		if(user.getUsername().equals("admin")){
			//��ǰ�û��ǳ�������Ա����ѯ����Ȩ�ޣ�Ϊ�û���Ȩ
			list = functionDao.findAll();
		}else{
			//��ͨ�û��������û�id��ѯ��Ӧ��Ȩ��
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
		//���������ֱ����Ӽ���
		info.addStringPermissions(pset);
		info.addStringPermissions(eset);
		/*info.addStringPermission("page_student_student-bespeak");
		info.addStringPermission("page_student_student");
		info.addStringPermission("page_student_student-change-log");*/
		
		return info;
	}
}
