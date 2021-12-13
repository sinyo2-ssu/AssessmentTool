package com.cong.cmgeval.dto;

import lombok.Data;

@Data
public class ResourceDto {
	private String os;
	private int core;
	private float cpu;
	private int memTot;
	private float mem;
	private float diskTot;
	private float disk;
}
