package com.cong.cmgeval.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cong.cmgeval.dto.EvalResultDto;
import com.cong.cmgeval.dto.ExcelFileDto;
import com.cong.cmgeval.dto.ResourceDto;
import com.cong.cmgeval.dto.TotalEvalResultDto;
import com.cong.cmgeval.service.EvalService;
import com.cong.cmgeval.vo.ResourceVo;


@Controller
public class CmgController {
	
	@Autowired
	EvalService evalService;
	
	@RequestMapping(value="/")
	public String home() {
		return "index.html";
	}
	
	@RequestMapping(value="/Main")
	public String Main(Model model) {
		
		model.addAttribute("name", "testname");		
		return "Main";
	}
	
	@RequestMapping(value="/Explain")
	public String Explain(Model model) {
		
		model.addAttribute("name", "testname");		
		return "Explain";
	}
	
	@RequestMapping(value="/topol")
	public String topol(Model model) {
		
		model.addAttribute("name", "testname");		
		return "topol";
	}
	

	//다빈님이 수정해주신 코드
	@RequestMapping(value="/Gen")
	public String Gen(Model model) {
		ExcelFileDto excelFile;
		List<ResourceDto> resourceList;
		//List<EvalResultDto> evalResultList;
		TotalEvalResultDto totalEvalResult;
		try {
			
			excelFile = evalService.findExcelFile("21bc3387-5ad7-4755-90b5-4095395c8440", "guide (1).xlsx");
			resourceList = evalService.excelToResources(new File(excelFile.getPath()));
			totalEvalResult = evalService.totalEvaluate(resourceList);
			//model.addAttribute("match", evalResultList.get(0));
			model.addAttribute("total", totalEvalResult);
			return "Gen";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
	
	@RequestMapping(value="/High")
	public String High(Model model) {
		ExcelFileDto excelFile;
		List<ResourceDto> resourceList;
		//List<EvalResultDto> evalResultList;
		TotalEvalResultDto totalEvalResult;
		try {
			
			excelFile = evalService.findExcelFile("21bc3387-5ad7-4755-90b5-4095395c8440", "guide (1).xlsx");
			resourceList = evalService.excelToResources(new File(excelFile.getPath()));
			totalEvalResult = evalService.totalEvaluate(resourceList);
			//model.addAttribute("match", evalResultList.get(0));
			model.addAttribute("total", totalEvalResult);
			return "High";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
//	@RequestMapping(value="/Compare")
//	public String Compare(Model model) {
//		
//		model.addAttribute("name", "testname");		
//		return "Compare";
//	}
	
	/*@RequestMapping(value="/Input/{secret}/{filename}")
	public String Core(@PathVariable("secret") String secret, @PathVariable("filename") String fileName, Model model){
		ExcelFileDto excelFile;
		List<ResourceDto> resourceList;
		List<EvalResultDto> evalResultList;
		try {
			excelFile = evalService.findExcelFile(secret, fileName);
			resourceList = evalService.excelToResources(new File(excelFile.getPath()));
			evalResultList = evalService.totalEvaluate(resourceList);
			model.addAttribute("match", evalResultList.get(0));
			model.addAttribute("unmatch", resourceList);
			
			return "Input";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return "error";
		}
	}*/
		
		/*@RequestMapping(value="/Input")
		public String Core2(Model model){
			ExcelFileDto excelFile;
			List<ResourceDto> resourceList;
			List<EvalResultDto> evalResultList;
			try {
				excelFile = evalService.findExcelFile("21bc3387-5ad7-4755-90b5-4095395c8440", "guide (1).xlsx");
				resourceList = evalService.excelToResources(new File(excelFile.getPath()));
				evalResultList = evalService.totalEvaluate(resourceList);
				model.addAttribute("match", evalResultList.get(0));
				model.addAttribute("unmatch", resourceList.get(0));
				
				return "Input";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				return "error";
			}
	
	}*/
	
}
