package com.service;

import java.util.List;

import com.VO.BusinessVO;
import com.model.BusinessModel;

public interface BusinessService {
	int add(BusinessModel b);

	int del(int id);

	int update(BusinessModel b);

	BusinessModel findById(int id);

	List<BusinessModel> findAll();

	List<BusinessModel> findByCondition(BusinessModel b);

	/**
	 * 查找用户订单历史记录
	 * 
	 * @param id
	 * @return
	 */
	List<BusinessVO> findByIdPlus(int id);

	/**
	 * 查找全部用户订单历史记录
	 * 
	 * @return
	 */
	List<BusinessVO> findAll_1();
}
