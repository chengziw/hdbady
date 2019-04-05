package com.hrbhd.bady.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hamcrest.core.IsInstanceOf;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hrbhd.bady.dao.base.IBaseDao;
import com.hrbhd.bady.domain.StudentChangeLog;
import com.hrbhd.bady.util.PageBean;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T> {
	// ʵ������
	private Class<T> entityClass;

	// ʹ��ע�ⷽʽ��������ע��
	@Resource
	// @Autowired
	// @Qualifier(value="abc")
	public void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	/**
	 * �ڹ��췽���ж�̬��ò�����ʵ������
	 */
	public BaseDaoImpl() {
		// ��ø��ࣨBaseDaoImpl<T>������
		ParameterizedType genericSuperclass = (ParameterizedType) this.getClass().getGenericSuperclass();
		// ��ø����ϵķ�������
		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		entityClass = (Class<T>) actualTypeArguments[0];
	}

	public void save(T entity) {
		this.getHibernateTemplate().save(entity);
	}

	public void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}

	public T findById(Serializable id) {
		return this.getHibernateTemplate().get(entityClass, id);
	}

	public List<T> findAll() {// FROM User
		String hql = "FROM  " + entityClass.getSimpleName();
		return this.getHibernateTemplate().find(hql);
	}

	/**
	 * ͨ�ø��·���
	 */
	public void executeUpdate(String queryName, Object... objects) {
		Session session = this.getSession();// �ӱ����߳��л��session����

		// ʹ��������ѯ�����һ����ѯ����
		Query query = session.getNamedQuery(queryName);
		// ΪHQL����еģ���ֵ
		int i = 0;
		for (Object arg : objects) {
			query.setParameter(i++, arg);
		}
		query.executeUpdate();// ִ�и���
	}

	/**
	 * ͨ�÷�ҳ��ѯ����
	 */
	public void pageQuery(PageBean pageBean) {
		int currentPage = pageBean.getCurrentPage();
		int pageSize = pageBean.getPageSize();
		DetachedCriteria detachedCriteria = pageBean.getDetachedCriteria();
		// ��������----select count(*) from bc_staff
		// �ı�Hibernate��ܷ�����sql��ʽ
		detachedCriteria.setProjection(Projections.rowCount());// select
																// count(*) from
																// bc_staff
		List<Long> list = this.getHibernateTemplate().findByCriteria(detachedCriteria);
		Long total = list.get(0);
		pageBean.setTotal(total.intValue());// ������������
		detachedCriteria.setProjection(null);// �޸�sql����ʽΪselect * from ....
		// ���ñ�����ӳ���ϵ
		detachedCriteria.setResultTransformer(DetachedCriteria.ROOT_ENTITY);
		// ��ǰҳչʾ�����ݼ���
		int firstResult = (currentPage - 1) * pageSize;
		int maxResults = pageSize;
		List rows = this.getHibernateTemplate().findByCriteria(detachedCriteria, firstResult, maxResults);
		pageBean.setRows(rows);
	}

	public void saveOrUpdate(T entity) {
		this.getHibernateTemplate().saveOrUpdate(entity);
	}

	public List<T> findByCriteria(DetachedCriteria detachedCriteria) {
		return this.getHibernateTemplate().findByCriteria(detachedCriteria);
	}
}
