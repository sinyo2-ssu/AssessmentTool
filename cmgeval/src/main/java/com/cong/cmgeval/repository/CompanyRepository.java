package com.cong.cmgeval.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cong.cmgeval.vo.CompanyVo;

@Repository
public interface CompanyRepository extends JpaRepository<CompanyVo, Long>{
	
	public Optional<CompanyVo> findBySecret(String secret);
	public Optional<CompanyVo> findById(String id);
}
