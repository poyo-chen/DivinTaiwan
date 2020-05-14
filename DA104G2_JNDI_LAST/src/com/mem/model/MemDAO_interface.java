package com.mem.model;

import java.util.List;


public interface MemDAO_interface {
	public void insert(MemVO memVO);

	public void update(MemVO memVO);

	public void delete(String mem_no);

	public MemVO findByPrimaryKey(String mem_no);
	
	public MemVO findByAccount(String mem_id);

	public List<MemVO> getAll();
	
	public List<MemVO> getAllStores();

	public List<MemVO> getAllByStatus(Integer mem_per,Integer mem_type);
}
