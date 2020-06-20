package com.dao;

import java.util.List;

import com.VO.BusinessVO;
import com.model.BusinessModel;

public interface BusinessDao extends BaseDao<BusinessModel> {
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
