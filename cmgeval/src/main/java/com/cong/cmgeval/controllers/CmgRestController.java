package com.cong.cmgeval.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cong.cmgeval.dto.EvalResultDto;
import com.cong.cmgeval.dto.ExcelFileDto;
import com.cong.cmgeval.dto.ResourceDto;
import com.cong.cmgeval.service.CompanyService;
import com.cong.cmgeval.service.EvalService;
import com.cong.cmgeval.service.ResourceService;
import com.cong.cmgeval.vo.CompanyVo;
import com.cong.cmgeval.vo.ExcelFileVo;
import com.cong.cmgeval.vo.ResourceVo;

@RestController
public class CmgRestController {
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	ResourceService resourceService;
	
	@Autowired
	EvalService evalService;
	
	@Value("${spring.servlet.multipart.location}")
	String filePath;
	
	@GetMapping(value="/value")
	public String getValue() {
		return "test rest api";
	}
	
	@GetMapping(value="/resource")
	public ResponseEntity<List<ResourceVo>> getResourceList() {
		List<ResourceVo> resourceList = resourceService.findAll();
		return new ResponseEntity<List<ResourceVo>>(resourceList, HttpStatus.OK);
	}
	
	@PostMapping(value="/resource/{secret}")
	public ResponseEntity<ResourceVo> createResource(@RequestBody ResourceDto resourceRequest, @PathVariable("secret") String secret) throws Exception{
		return new ResponseEntity<ResourceVo>(resourceService.createResource(resourceRequest, secret), HttpStatus.OK);
	}
	
	@GetMapping("/download")
	public ResponseEntity<Resource> download() throws IOException{
		Path path = Paths.get(filePath+"\\guide.xlsx");
		String contentType = Files.probeContentType(path);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename("guide.xlsx", StandardCharsets.UTF_8).build());
		headers.add(HttpHeaders.CONTENT_TYPE, contentType);
		Resource fileResource = new InputStreamResource(Files.newInputStream(path));
		return new ResponseEntity<>(fileResource, headers, HttpStatus.OK);
	}
	
	@GetMapping("/download/windows")
	public ResponseEntity<Resource> downloadwindows() throws IOException{
		Path path = Paths.get(filePath+"\\cmgClient.exe");
		String contentType = Files.probeContentType(path);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename("cmgClient.exe", StandardCharsets.UTF_8).build());
		headers.add(HttpHeaders.CONTENT_TYPE, contentType);
		Resource fileResource = new InputStreamResource(Files.newInputStream(path));
		return new ResponseEntity<>(fileResource, headers, HttpStatus.OK);
	}
	
	@PostMapping(value="/company")
	public ResponseEntity<CompanyVo> createCompany(CompanyVo companyRequest) throws Exception{
		return new ResponseEntity<CompanyVo>(companyService.createCompany(companyRequest), HttpStatus.OK);
	}
	 
	@PostMapping(value="/excel/{secret}")
	public ResponseEntity<ExcelFileVo> createExcelFile(@PathVariable("secret") String secret, @RequestParam(name="file") MultipartFile file) throws Exception{
		String fileName = file.getOriginalFilename();
		String extension = FilenameUtils.getExtension(fileName);
		if(!extension.equals("xlsx") && !extension.equals("xls")) {
			throw new IOException("엑셀 파일만 업로드하세요.");
		}
		return new ResponseEntity<ExcelFileVo>(evalService.createExcelFile(secret, file), HttpStatus.OK);
	}
	
	/*@PostMapping(value="/evaluate/excel/{secret}")
	public ResponseEntity<List<EvalResultDto>> evalauateExcelFile(@PathVariable("secret") String secret, @RequestParam(name="filename") String fileName) throws Exception{
		ExcelFileDto excelFile = evalService.findExcelFile(secret, fileName);
		List<ResourceDto> resourceList = evalService.excelToResources(new File(excelFile.getPath()));
		List<EvalResultDto> evalResultList = evalService.totalEvaluate(resourceList);
		return new ResponseEntity<List<EvalResultDto>>(evalResultList, HttpStatus.OK);
	}
	
	@PostMapping(value="/evaluate/resource/{secret}")
	public ResponseEntity<List<EvalResultDto>> evalauateResource(@PathVariable("secret") String secret) throws Exception{
		List<ResourceDto> resourceList = resourceService.findResourceList(secret);
		List<EvalResultDto> evalResultList = evalService.totalEvaluate(resourceList);
		return new ResponseEntity<List<EvalResultDto>>(evalResultList, HttpStatus.OK);
	}*/
	
	
	
	
	
}
