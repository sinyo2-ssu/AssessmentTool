package com.cong.cmgeval.dto;

import lombok.Data;

@Data
public class EvalResultDto {
	
	private String os;
	
	private int core;
	private int memory;
	private int serverCost;
	private int ssdCost;
	private int OsCost;
	/////////////////////////하단은 high메모리
	private int highCore;
	private int highMemory;
	private int highServerCost;
	private int DBCost;
	private int totalCost;
	private int highTotalCost;
}
