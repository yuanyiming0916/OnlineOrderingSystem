package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.VO.BusinessVO;
import com.dao.BusinessDao;
import com.model.BusinessModel;

@Service
public class BusinessServiceImpl implements BusinessService {
	@Autowired
	private BusinessDao businessDao;

	@Override
	public int add(BusinessModel b) {
		return businessDao.add(b);
	}

	@Override
	public int del(int id) {
		return businessDao.del(id);
	}

	@Override
	public int update(BusinessModel b) {
		return businessDao.update(b);
	}

	@Override
	public BusinessModel findById(int id) {
		return businessDao.findById(id);
	}

	@Override
	public List<BusinessModel> findAll() {
		return businessDao.findAll();
	}

	@Override
	public List<BusinessModel> findByCondition(BusinessModel b) {
		return businessDao.findByCondition(b);
	}

	/**
	 * 查找用户订单历史记录
	 */
	@Override
	public List<BusinessVO> findByIdPlus(int id) {
		return businessDao.findByIdPlus(id);
	}

	/**
	 * 查找全部用户订单历史记录
	 */
	@Override
	public List<BusinessVO> findAll_1() {
		return businessDao.findAll_1();
	}

}
