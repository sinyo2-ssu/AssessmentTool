package com.cong.cmgeval.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="resource")
public class ResourceVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long rno;
	@ManyToOne
	@JoinColumn(name ="cno")
	@JsonManagedReference
	private CompanyVo company;
	private String os;
	private int core;
	private float cpu;
	private float memTot;
	private float mem;
	private float diskTot;
	private float disk;
	@Column(name = "time", nullable = false, updatable = false, insertable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Timestamp time;
	
	@Builder
	public ResourceVo(CompanyVo company, String os, int core, float cpu, float memTot, 
			float mem, float diskTot, float disk) {
		this.company = company;
		this.os = os;
		this.core = core;
		this.cpu = cpu;
		this.memTot = memTot;
		this.mem = mem;
		this.diskTot = diskTot;
		this.disk = disk;
	}
	
}
