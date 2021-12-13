package com.cong.cmgeval.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cong.cmgeval.dto.EvalResultDto;
import com.cong.cmgeval.dto.ExcelFileDto;
import com.cong.cmgeval.dto.ResourceDto;
import com.cong.cmgeval.dto.TotalEvalResultDto;
import com.cong.cmgeval.repository.CompanyRepository;
import com.cong.cmgeval.repository.ExcelFileRepository;
import com.cong.cmgeval.repository.ResourceRepository;
import com.cong.cmgeval.vo.CompanyVo;
import com.cong.cmgeval.vo.ExcelFileVo;
import com.cong.cmgeval.vo.ResourceVo;

@Service
public class EvalService {
	
	@Autowired
	private ResourceRepository resourceRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private ExcelFileRepository excelFileRepository;
	
	@Value("${excelFilePath}")
	String filePath;
	
	public Optional<ExcelFileVo> findById(Long efno){
		Optional<ExcelFileVo> excelFile = excelFileRepository.findById(efno);
		
		return excelFile;
	}
	
	public ExcelFileDto findExcelFile(String secret, String fileName) throws Exception{
		Optional<CompanyVo> company = companyRepository.findBySecret(secret);
		if(!company.isPresent()) {
			throw new Exception("엑셀 파일을 찾기 위한 회사가 존재하지 않습니다. secret을 확인하세요");
		}
		ExcelFileDto excelFile = new ExcelFileDto();
		boolean flag = true;
		for(ExcelFileVo file:company.get().getExcelFiles()) {
			if(file.getTitle().equals(fileName)) {
				flag = false;
				BeanUtils.copyProperties(file, excelFile);
				break;
			}
		}
		if(flag) {
			throw new Exception(fileName+" 엑셀 파일이 존재하지 않습니다.");
		}
		return excelFile;
		
	}
	
	
	public boolean deleteById(Long efno) {
		excelFileRepository.deleteById(efno);
		return true;
		/////////수정해야함
	}
	
	public ExcelFileVo createExcelFile(String secret, MultipartFile requestFile) throws Exception {
		Optional<CompanyVo> company = companyRepository.findBySecret(secret);
		if(!company.isPresent()) {
			throw new Exception("엑셀파일을 저장하기 위한 company가 없습니다.");
		}
		boolean flag = false;
		for(ExcelFileVo file:company.get().getExcelFiles()) {
			if(file.getTitle().equals(requestFile.getOriginalFilename())) {
				flag = true;
				break;
			}
		}
		if(flag) {
			throw new Exception("중복된 엑셀 파일이 있습니다.");
		}
		String newFilePath = filePath+"\\"+company.get().getName()+"_"+company.get().getId();
		if(!Files.exists(Paths.get(newFilePath))) {
			new File(newFilePath).mkdir();
		}
		File newFile = new File(newFilePath+"\\"+requestFile.getOriginalFilename());
		newFile.createNewFile();
		try {
			requestFile.transferTo(newFile);
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		try {
			List<ResourceDto> resourceList = excelToResources(newFile);
		}catch(Exception e) {
			newFile.delete();
			e.printStackTrace();
			throw new Exception("잘못된 자원 형식입니다.");
		}
		ExcelFileVo excelFile = new ExcelFileVo();
		excelFile.setTitle(newFile.getName());
		excelFile.setPath(newFilePath+"\\"+requestFile.getOriginalFilename());
		excelFile.setCompany(company.get());
		ExcelFileVo temp_result = null;
		try {
			temp_result = excelFileRepository.save(excelFile);
		}catch(Exception e) {
			newFile.delete();
			e.printStackTrace();
			throw new Exception("엑셀 파일 db저장 실패");
		}
		return temp_result;
	}
	
	public boolean updateById(Long efno, ExcelFileDto excelFileRequest) throws Exception {
		Optional<ExcelFileVo> excelFile = excelFileRepository.findById(efno);
		if(!excelFile.isPresent()) {
			throw new Exception("수정하려는 파일 넘버가 존재하지 않습니다.");
		}
		BeanUtils.copyProperties(excelFileRequest, excelFile.get());
		excelFileRepository.save(excelFile.get());
		//////////////바꿔야함
		return true;
	}
	
	public List<ResourceDto> excelToResources(File file){
		String fileName = file.getName();
		String extension = FilenameUtils.getExtension(fileName);
		List<ResourceDto> resourceList = new ArrayList<>();
		Workbook workbook = null;
		if(extension.equals("xlsx")) {
			try {
				workbook = new XSSFWorkbook(file);
			} catch (InvalidFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(extension.equals("xls")) {
			try {
				workbook = new HSSFWorkbook(new FileInputStream(file));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		Sheet sheet = workbook.getSheetAt(1);
		for(int i=1; i<4; i++) {
			Row row = sheet.getRow(i);
			/*ResourceVo resource = new ResourceVo(row.getCell(6).getStringCellValue(), 
					(int)row.getCell(0).getNumericCellValue(), (float)row.getCell(1).getNumericCellValue(), (float)row.getCell(2).getNumericCellValue(), 
					(float)row.getCell(3).getNumericCellValue(), (float)row.getCell(4).getNumericCellValue(), (float)row.getCell(5).getNumericCellValue());*/
			ResourceDto resourceDto = new ResourceDto();
			System.out.println(row.getCell(0));
			System.out.println(row.getCell(6));
			System.out.println(row.getCell(6).getStringCellValue());
			resourceDto.setOs(row.getCell(6).getStringCellValue());
			resourceDto.setCore((int)row.getCell(0).getNumericCellValue());
			resourceDto.setCpu((float)row.getCell(1).getNumericCellValue());
			resourceDto.setMemTot((int)row.getCell(2).getNumericCellValue());
			resourceDto.setMem((float)row.getCell(3).getNumericCellValue());
			resourceDto.setDiskTot((float)row.getCell(4).getNumericCellValue());
			resourceDto.setDisk((float)row.getCell(5).getNumericCellValue());
			////////////resource가 올바른 형태인지 valid 체크 필요 unvalid 하면 익셉션
			resourceList.add(resourceDto);
		}
		return resourceList;
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public boolean Is_valid(int Core, int Mem){
        int[][] arr = {{1, 1},{1, 2}, {2, 2}, {2, 4}, {4, 4}, {4, 8}, {8, 8}, {8, 16}, {12, 16}, {12,32},
                {16,16}, {16,32}, {20,20}, {20,40}, {24,24}, {24,48}, {32,32},{32,62},{32,64},{64,64}};
        for (int i=0 ; i<20 ; i++)
            if(arr[i][0] == Core && arr[i][1] == Mem) return true;
        return false;
    }

    public boolean Is_valid_high_memory(int Core, int Mem){
        int[][] arr = {{2, 8}, {2, 16}, {4, 16}, {4, 32}, {8, 32}, {8, 62}, {8, 64}, {16, 62}, {16, 64},
                {16, 124}, {16, 128}, {16, 160}, {20, 80}, {20, 160}, {24, 96}, {24, 160}, {24, 192},
                {32, 124}, {32, 128}, {32, 160}, {32, 256}, {64, 128}, {64, 256}};
        for (int i=0 ; i<23 ; i++)
            if(arr[i][0] == Core && arr[i][1] == Mem) return true;
        return false;
    }

    // 사용률을 기반으로 최적의 상품 매칭 (server)
    public int[] Optimize(int Core, int Mem) {
        int[][] arr = {{1, 1}, {1, 2}, {2, 2}, {2, 4}, {4, 4}, {4, 8}, {8, 8}, {8, 16}, {12, 16}, {12, 32}, {16, 16},
                {16, 32}, {20, 20}, {20, 40}, {24, 24}, {24, 48}, {32, 32}, {32, 62}, {32, 64}, {64, 64}};
        for (int i = 0; i < 20; i++) {
            if(arr[i][0]>=Core && arr[i][1] >= Mem) return arr[i];
        }
        return new int[] {-1, -1};
    }

    public int[] Optimize_high_Memory(int Core, int Mem) {
        int[][] arr = {{2, 8}, {2, 16}, {4, 16}, {4, 32}, {8, 32}, {8, 62}, {8, 64}, {16, 62}, {16, 64}, {16, 124},
                {16, 128}, {16, 160}, {20, 80}, {20, 160}, {24, 96}, {24, 160}, {24, 192}, {32, 124}, {32, 128},
                {32, 160}, {32, 256}, {64, 128}, {64, 256}};
        for (int i = 0; i < 23; i++) {
            if(arr[i][0]>=Core && arr[i][1] >= Mem) return arr[i];
        }
        return new int[] {-1, -1};
    }

    // 코어 사용률 기반 적절한 코어 수 매칭
    public int CoreMatch(int CPU_Core, double CPU_rate){
        int[] CPU_level={1, 2, 4, 8, 12, 16, 20, 24, 32, 64};
        int level=0;
        for(int i=0;i<10;i++){
            if(CPU_Core <= CPU_level[i]){
                level = i;
                CPU_Core = CPU_level[i];
                break;
            }
        }
        int result_core=CPU_Core;
        if(CPU_rate < 0.3){
            if(CPU_Core == 1) return result_core;
            level--;
            result_core = CPU_level[level];
        }
        if(CPU_rate > 0.8){
            if(CPU_Core >= 64) return 64;
            level++;
            result_core = CPU_level[level];
        }
        return result_core;
    }

    // 메모리 사용률 기반 적절한 메모리 용량 매칭
    public int MemMatch(int Memory, double Memory_rate){
        int[] Mem_level={1, 2, 4, 8, 16, 20, 24, 32, 40, 48, 62, 64};
        int level=0;
        for(int i=0;i<12;i++) {
            if (Memory <= Mem_level[i]) {
                level = i;
                Memory = Mem_level[i];
                break;
            }
        }

        int result_Mem=Memory;
        if(Memory_rate < 0.3){
            if(Memory == 1) return result_Mem;
            level--;
            result_Mem = Mem_level[level];
        }
        if(Memory_rate > 0.8){
            if(Memory >= 64) return 64;
            level++;
            result_Mem = Mem_level[level];
        }
        return result_Mem;
    }

    //가격 및 상품 매치 (서버)
    public int CostMatch_Server(int core, int mem){
        int cost =0;
        if(core == 1 && mem == 1)cost=22500; if(core == 1 && mem == 2)cost=38600; if(core == 2 && mem == 2)cost=46700;
        if(core == 2 && mem == 4)cost=77300; if(core == 4 && mem == 4)cost=93500; if(core == 4 && mem == 8)cost=154600;
        if(core == 8 && mem == 8)cost=187100; if(core == 8 && mem == 16)cost=309300; if(core == 12 && mem == 16)cost=373500;
        if(core == 12 && mem == 32)cost=550080; if(core == 16 && mem == 16)cost=374300; if(core == 16 && mem == 32)cost=618600;
        if(core == 20 && mem == 20)cost=558300; if(core == 20 && mem == 40)cost=761580; if(core == 24 && mem == 24)cost=561300;
        if(core == 24 && mem == 48)cost=927900; if(core == 32 && mem == 32)cost=748700; if(core == 32 && mem == 62)cost=1212100;
        if(core == 32 && mem == 64)cost=1237200; if(core == 64 && mem == 64)cost=1497400;
        return cost;
    }

    //가격 및 상품 매치 (high memory 서버)
    public int CostMatch_High_Memory_Server(int core, int mem){
        int cost =0;
        if(core == 2 && mem == 8)cost=98800; if(core == 2 && mem == 16)cost=120400; if(core == 4 && mem == 16)cost=197700;
        if(core == 4 && mem == 32)cost=240800; if(core == 8 && mem == 32)cost=395500; if(core == 8 && mem == 62)cost=470000; if(core == 8 && mem == 64)cost=481600;
        if(core == 16 && mem == 62)cost=773100; if(core == 16 && mem == 64)cost=791000; if(core == 16 && mem == 124)cost=940100; 
        if(core == 16 && mem == 128)cost=963200; if(core == 16 && mem == 160)cost=1460120; 
        if(core == 20 && mem == 80)cost=1027690; if(core == 20 && mem == 160)cost=1559910;
        if(core == 24 && mem == 96)cost=1186500; if(core == 24 && mem == 160)cost=1659700; if(core == 24 && mem == 192)cost=1444800;
        if(core == 32 && mem == 124)cost=1546200; if(core == 32 && mem == 128)cost=1582000; if(core == 32 && mem == 160)cost=1869500;
        if(core == 32 && mem == 256)cost=1926400; if(core == 64 && mem == 128)cost=2474400; if(core == 64 && mem == 256)cost=2474400;
        return cost;
    }

    //가격 및 상품 매치 (Storage)
    public int CostMatch_SSD(int Disk, int IOPS){
        int result = 220000;
        result += ((Disk/100)-1)*10000 + ((IOPS-6000)/1000) *35000;
        return result;
    }

    public int CostMatch_DB(int Disk, int IOPS){
        int result = 220000;
        result += ((Disk/100)-1)*10000 + ((IOPS-6000)/1000) *35000;


        return result;
    }

    //가격 및 상품 매치 (운영체제)
    public int CostMatch_OS(String OS){
        String[] Linux_list=new String[]{"CentOS 7.0 (64bit)","CentOS 7.1 (64bit)","CentOS 7.2 (64bit)","CentOS 7.6 (64bit)","Ubuntu 16.04 (64bit)","Ubuntu 18.04 (64bit)","Debian9 (64bit)","Redhat Enterprise Linux 7.0 (64bit)","Redhat Enterprise Linux 7.2 (64bit)","Redhat Enterprise Linux 7.6 (64bit)",};
        String[] Windows_list=new String[]{"Windows Server 2012 Standard (64bit)", "Windows Server 2012 R2 Standard (64bit)", "Windows Server 2016 Standard (64bit)", "Windows Server 2019 Standard (64bit)"};
        /*for(int i=0;i<10;i++){
            if(OS.equals(Linux_list[i])) return 0; // 리눅스는 무료
        }
        for(int i=0;i<4;i++){
            if(OS.equals(Windows_list[i])) return 20000; // 윈도우의 경우 20000원 리턴
            //System.out.println("Debug : "+Windows_list[i]);
        }*/	
        if(OS.contains("Windows")) {
        	return 20000;
        }
        else {
        	return 0;
        }
        //System.out.println("Debug : "+OS);
        //return -1; // 운영체제가 목록에 없는 경우 -1 반환
    }
    
    // high memory 여부 판별
    public boolean Is_high_Memory(int Core, int Mem){
        if(3*Core<=Mem || Mem >= 128) return true; // 메모리가 코어의 3배 이상이거나 메모리가 128기가를 초과하는 경우
        return false;
    }

    public EvalResultDto evaluate(ResourceDto resource){
        int CPU_Core = resource.getCore(); // 코어 수
        int Memory = (int)resource.getMemTot(); // 메모리 용량
        double CPU_rate = resource.getCpu()/100; // 코어 사용량
        double Memory_rate = resource.getMem()/100; // 메모리 사용량
        int Disk = (int)resource.getDiskTot(); // 디스크 용량
        int IOPS = 9000; // IOPS -> 사용자가 직접 입력
        String OS = resource.getOs(); // OS
        String DB = new String("Mysql"); // OS


        int Matched_CPU_high = 0;
        int Matched_Memory_high =0;


        // CPU Match
        int Matched_CPU = CoreMatch(CPU_Core, CPU_rate);
        int Matched_Memory = MemMatch(Memory, Memory_rate);

        //상품에 존재하는지 여부 판단 (high Memory)
        if(Is_valid_high_memory(Matched_CPU, Matched_Memory)==false && Is_high_Memory(Matched_CPU, Matched_Memory)){
            Matched_CPU_high = Optimize_high_Memory(Matched_CPU, Matched_Memory)[0];
            Matched_Memory_high = Optimize_high_Memory(Matched_CPU, Matched_Memory)[1];
        }
        //상품에 존재하는지 여부 판단 (일반 서버)
        if(Is_valid(Matched_CPU, Matched_Memory) == false){
            Matched_CPU = Optimize(Matched_CPU, Matched_Memory)[0];
            Matched_Memory = Optimize(Matched_CPU, Matched_Memory)[1];
        }
        //가격 계산 Code
        int Matched_Server_Cost = CostMatch_Server(Matched_CPU, Matched_Memory);
        int Matched_SSD_Cost = CostMatch_SSD(Disk, IOPS);
        int Matched_OS_Cost = CostMatch_OS(OS);
        int Total_Cost_general = Matched_Server_Cost + Matched_SSD_Cost + Matched_OS_Cost; // 전체 가격
        int Total_Cost_high = 0; // 전체 가격
        
        int Matched_Server_Cost_high = 0;

        //출력 부분
        System.out.println("Matched Core : " + Matched_CPU);
        System.out.println("Matched Memory : " + Matched_Memory);
        System.out.println("Matched KT_Cloud Server Cost : " + Matched_Server_Cost);
        System.out.println("Matched KT_Cloud SSD Cost : " + Matched_SSD_Cost);
        System.out.println("Matched KT_Cloud OS Cost : " + Matched_OS_Cost);
        System.out.println("Is Matched Core & Memory Valid : " + Is_valid(Matched_CPU, Matched_Memory));
        //System.out.println("Is High_memory_recommend? : " + Is_high_Memory(CPU_Core, Memory));
        //High Memory 적용 대상인 경우 High Memory 매칭결과 추가
        if(Is_high_Memory(CPU_Core, Memory) == true){
            Total_Cost_high = CostMatch_High_Memory_Server(Matched_CPU_high, Matched_Memory_high) + Matched_SSD_Cost + Matched_OS_Cost;
            Matched_Server_Cost_high = CostMatch_High_Memory_Server(Matched_CPU_high, Matched_Memory_high);
            System.out.println("--------------High Memory 권장 대상입니다--------------");
            System.out.println("Matched CPU_High_Memory : " + Matched_CPU_high);
            System.out.println("Matched Memory_High_Memory : " + Matched_Memory_high);
            System.out.println("Recommended High Memory Cost : " + Matched_Server_Cost_high);
        }
        System.out.println("Matched Total Cost : " + Total_Cost_general + " (Using general Server)");
        System.out.println("Matched Total Cost : " + Total_Cost_high + " (Using high memory Server)");
        
        EvalResultDto evalResult = new EvalResultDto();
        evalResult.setCore(Matched_CPU);
        evalResult.setMemory(Matched_Memory);
        evalResult.setServerCost(Matched_Server_Cost);
        evalResult.setSsdCost(Matched_SSD_Cost);
        evalResult.setOsCost(Matched_OS_Cost);
        evalResult.setHighCore(Matched_CPU_high);
        evalResult.setHighMemory(Matched_Memory_high);
        evalResult.setHighServerCost(Matched_Server_Cost_high);
        evalResult.setTotalCost(Total_Cost_general);
        evalResult.setHighTotalCost(Total_Cost_high);
        
        evalResult.setOs(OS);
        
        return evalResult;
    }
    
    //public List<EvalResultDto> totalEvaluate(List<ResourceDto> resourceList) {
    public TotalEvalResultDto totalEvaluate(List<ResourceDto> resourceList) {
    	//List<EvalResultDto> evalResultList = new ArrayList<>();
    	int IOPS = 9000;
    	
    	int preCore = 0;
    	int preMemory = 0;
    	int preServerCost = 0;
    	int preSsdCost = 0;
    	int core = 0;
    	int memory = 0;
    	int serverCost = 0;
    	int ssdCost = 0;
    	int highCore = 0;
    	int highMemory = 0;
    	int highServerCost = 0;
    	int totalServerCost = 0;
    	int DBCost =0;
    	int OSCost =0;
    	double diskRate = 0;
    	
    	int total =0;
    	int list_size = resourceList.size();
    	
    	TotalEvalResultDto totalEvalResult = new TotalEvalResultDto();
    	for(ResourceDto resource:resourceList) {
    		
    		int Matched_CPU =resource.getCore();
    		int Matched_Memory =resource.getMemTot();
    		int Matched_CPU_high = 0;
    		int Matched_Memory_high =0;
    		int precpu_tmp = resource.getCore();
    		int premem_tmp = resource.getMemTot();
    		int preservercost_tmp=0;
    		
            //상품에 존재하는지 여부 판단 (일반 서버)
            if(Is_valid(precpu_tmp, premem_tmp) == false){
            	precpu_tmp = Optimize(precpu_tmp, premem_tmp)[0];
            	premem_tmp = Optimize(precpu_tmp, premem_tmp)[1];
            }
            preServerCost += CostMatch_Server(precpu_tmp, premem_tmp);
    		
    		
            Matched_CPU = CoreMatch(resource.getCore(), resource.getCpu());
            Matched_Memory = MemMatch(resource.getMemTot(), resource.getMem());
    		
            //상품에 존재하는지 여부 판단 (high Memory)
            if(Is_valid_high_memory(Matched_CPU, Matched_Memory)==false && Is_high_Memory(Matched_CPU, Matched_Memory)){
                Matched_CPU_high = Optimize_high_Memory(Matched_CPU, Matched_Memory)[0];
                Matched_Memory_high = Optimize_high_Memory(Matched_CPU, Matched_Memory)[1];
            }
            //상품에 존재하는지 여부 판단 (일반 서버)
            if(Is_valid(Matched_CPU, Matched_Memory) == false && !Is_high_Memory(Matched_CPU, Matched_Memory)){
                Matched_CPU = Optimize(Matched_CPU, Matched_Memory)[0];
                Matched_Memory = Optimize(Matched_CPU, Matched_Memory)[1];
            }
            
            
    		
    		EvalResultDto evalResult = evaluate(resource);
    		//evalResultList.add(evalResult);
    		diskRate = resource.getDisk();
    		preCore += resource.getCore();
    		preMemory += (int)resource.getMemTot();
    		int Matched_Server_Cost = CostMatch_Server(resource.getCore(), (int)resource.getMemTot());
            int Matched_SSD_Cost = CostMatch_SSD((int)resource.getDiskTot(), IOPS);
            int Matched_OS_Cost = CostMatch_OS(resource.getOs());
            DBCost += CostMatch_DB((int)resource.getDiskTot(), IOPS);           
            OSCost += CostMatch_OS(resource.getOs());
            
    		//preServerCost += Matched_Server_Cost;
    		preSsdCost += CostMatch_SSD((int)resource.getDiskTot(), IOPS);
    		
    		ssdCost += CostMatch_SSD((int)(resource.getDiskTot()*(diskRate/100)), IOPS);
//    		if(evalResult.getHighServerCost()!=0 && evalResult.getHighServerCost()<=evalResult.getServerCost()) {
//    			highCore += evalResult.getHighCore();
//    			highMemory += evalResult.getHighMemory();
//    			highServerCost += evalResult.getHighServerCost();
//    		}
//    		else {
//    			core += evalResult.getCore();
//    			memory += evalResult.getMemory();
//    			serverCost += evalResult.getServerCost();
//    		}
    		
    	if(Matched_CPU_high!=0) {
    		highCore += evalResult.getHighCore();
    		highMemory += evalResult.getHighMemory();
    		highServerCost += CostMatch_High_Memory_Server(Matched_CPU_high, Matched_Memory_high);
    	}
    	else {
    		core += evalResult.getCore();
    		memory += evalResult.getMemory();
    		serverCost += evalResult.getServerCost();
    	}
    	
    	}
    	totalServerCost += highServerCost + serverCost;
    	total += serverCost + highServerCost + ssdCost + DBCost + OSCost;
    	totalEvalResult.setListsize(list_size);
    	totalEvalResult.setDBCost(DBCost);
    	totalEvalResult.setOsCost(OSCost);
    	totalEvalResult.setPreCore(preCore);
    	totalEvalResult.setPreMemory(preMemory);
    	totalEvalResult.setPreServerCost(preServerCost);
    	totalEvalResult.setPreSsdCost(preSsdCost);
    	totalEvalResult.setHighCore(highCore);
    	totalEvalResult.setHighMemory(highMemory);
    	totalEvalResult.setHighServerCost(highServerCost);
    	totalEvalResult.setCore(core);
    	totalEvalResult.setMemory(memory);
    	totalEvalResult.setServerCost(serverCost);
    	totalEvalResult.setSsdCost(ssdCost);
    	totalEvalResult.setTotalServerCost(totalServerCost);
    	totalEvalResult.setTotal(total);
    	
    	//return evalResultList;
    	
    	return totalEvalResult;
    }
    
}
