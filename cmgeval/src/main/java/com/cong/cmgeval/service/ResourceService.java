package com.cong.cmgeval.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cong.cmgeval.dto.ExcelFileDto;
import com.cong.cmgeval.dto.ResourceDto;
import com.cong.cmgeval.repository.CompanyRepository;
import com.cong.cmgeval.repository.ResourceRepository;
import com.cong.cmgeval.vo.CompanyVo;
import com.cong.cmgeval.vo.ExcelFileVo;
import com.cong.cmgeval.vo.ResourceVo;

@Service
public class ResourceService {
	
	@Autowired
	private ResourceRepository resourceRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public List<ResourceVo> findAll(){
		List<ResourceVo> resources = new ArrayList<>();
		resourceRepository.findAll().forEach(e -> resources.add(e));
		
		return resources;
	}
	
	public Optional<ResourceVo> findById(Long rno){
		Optional<ResourceVo> resource = resourceRepository.findById(rno);
		
		return resource;
	}
	
	public List<ResourceDto> findResourceList(String secret) throws Exception{
		Optional<CompanyVo> company = companyRepository.findBySecret(secret);
		if(!company.isPresent()) {
			throw new Exception("자원을 찾기 위한 회사가 존재하지 않습니다. secret을 확인하세요");
		}
		List<ResourceVo> resourceVoList = company.get().getResources();
		List<ResourceDto> resourceList = new ArrayList<>();
		for(ResourceVo resourceVo:resourceVoList) {
			ResourceDto resource = new ResourceDto();
			BeanUtils.copyProperties(resourceVo, resource);
			resourceList.add(resource);
		}
		return resourceList;
		
	}
	
	public boolean deleteById(Long rno) {
		resourceRepository.deleteById(rno);
		return true;
		/////////수정해야함
	}
	
	public ResourceVo createResource(ResourceDto resourceRequest, String secret) throws Exception {
		Optional<CompanyVo> company = companyRepository.findBySecret(secret);
		if(!company.isPresent()) {
			throw new Exception("자원을 저장하기 위한 company가 없습니다.");
		}
		
		ResourceVo resource = new ResourceVo();
		BeanUtils.copyProperties(resourceRequest, resource);
		resource.setCompany(company.get());
		return resourceRepository.save(resource);
	}
	
	public boolean updateById(Long rno, ResourceDto resourceRequest) throws Exception {
		Optional<ResourceVo> resource = resourceRepository.findById(rno);
		if(!resource.isPresent()) {
			throw new Exception("수정하려는 자원 넘버가 존재하지 않습니다.");
		}
		BeanUtils.copyProperties(resourceRequest, resource.get());
		resourceRepository.save(resource.get());
		//////////////바꿔야함
		return true;
	}
}
