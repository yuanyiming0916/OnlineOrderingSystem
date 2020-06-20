package com.dao;

import java.util.List;

public interface BaseDao<T> {
	int add(T t);

	int del(int id);

	int update(T t);

	T findById(int id);

	List<T> findAll();

	List<T> findByCondition(T t);
}
