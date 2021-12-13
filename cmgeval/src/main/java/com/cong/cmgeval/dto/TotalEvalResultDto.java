package com.cong.cmgeval.dto;

import lombok.Data;

@Data
public class TotalEvalResultDto {
	private int preCore;
	private int preMemory;
	private int preServerCost;
	private int preSsdCost;
	
	private int core; //매치된 코어수
	private int memory; //매치된 메모리
	private int serverCost; //매치된 서버의 비용
	private int ssdCost; //매치된 디스크의 비용
	private int DBCost; //매치된 DB의 비용
	private int OsCost; //매치된 DB의 비용
	/////////////////////////
	/////////////////////////하단은 high메모리
	private int highCore; //매치된 하이메모리버전 코어수
	private int highMemory; //매치된 하이메모리버전 메모리
	private int highServerCost;//매치된 하이메모리버전 서버 비용
	
	private int totalServerCost;
	private int listsize;
	private int Total;
}
