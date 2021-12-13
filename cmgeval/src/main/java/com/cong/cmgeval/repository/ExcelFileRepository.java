package com.cong.cmgeval.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cong.cmgeval.vo.ExcelFileVo;

@Repository
public interface ExcelFileRepository extends JpaRepository<ExcelFileVo, Long>{
	
	public List<ExcelFileVo> findByEfno(Long efno);
}
