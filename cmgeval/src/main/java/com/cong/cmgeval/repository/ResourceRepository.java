package com.cong.cmgeval.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cong.cmgeval.vo.ResourceVo;

@Repository
public interface ResourceRepository extends JpaRepository<ResourceVo, Long>{
	
}
