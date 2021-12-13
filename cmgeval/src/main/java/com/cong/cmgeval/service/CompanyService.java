package com.cong.cmgeval.service;

import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cong.cmgeval.repository.CompanyRepository;
import com.cong.cmgeval.vo.CompanyVo;

@Service
public class CompanyService {
	@Autowired
	private CompanyRepository companyRepository;
	
	public CompanyVo createCompany(CompanyVo companyRequest) throws Exception {
		Optional<CompanyVo> company = companyRepository.findById(companyRequest.getId());
	    if(!company.isPresent()) {
	    	companyRequest.setSecret(UUID.randomUUID().toString());
	    	return companyRepository.save(companyRequest);
	    }
	    else {
	    	throw new Exception("중복된 아이디입니다.");
	    }
	}
}
