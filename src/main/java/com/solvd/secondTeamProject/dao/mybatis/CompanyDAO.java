package com.solvd.secondTeamProject.dao.mybatis;


import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.secondTeamProject.dao.ICompanyDAO;
import com.solvd.secondTeamProject.model.Company;

public class CompanyDAO implements ICompanyDAO{
	private Logger log = LogManager.getLogger(CompanyDAO.class);


	public Company save(Company g) {

		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

			ICompanyDAO bhDao = sqlSessionFactory.openSession(true).getMapper(ICompanyDAO.class);
			
			bhDao.save(g);
			
		} catch (IOException e) {
			log.error(e);
		}
		return g;
		
	}


	public Company getById(long id) {

		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

			ICompanyDAO bhDao = sqlSessionFactory.openSession(true).getMapper(ICompanyDAO.class);
			if(bhDao.getById(id)!=null)
				return bhDao.getById(id);
			
		} catch (IOException e) {
			log.error(e);
		}
		return new Company();
	}


	public void remove(long id) {
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

			ICompanyDAO bhDao = sqlSessionFactory.openSession(true).getMapper(ICompanyDAO.class);
			
			bhDao.remove(id);
			
		} catch (IOException e) {
			log.error(e);
		}
		
	}

}