package com.cong.cmgeval.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;



import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity(name="company")
public class CompanyVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cno;
	private String id;
	private String passwd;
	private String secret;
	private String name;
	@OneToMany(mappedBy="company", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonBackReference
	private List<ResourceVo> resources = new ArrayList<>();
	@OneToMany(mappedBy="company", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonBackReference
	private List<ExcelFileVo> excelFiles = new ArrayList<>();
	@Column(name = "time", nullable = false, updatable = false, insertable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Timestamp time;
	
	@Builder
	public CompanyVo(String id, String passwd, String secret, String name, List<ResourceVo> resources, List<ExcelFileVo> excelFiles) {
		this.id = id;
		this.passwd = passwd;
		this.secret = secret;
		this.name = name;
		this.resources = resources;
		this.excelFiles = excelFiles;
	}
	
}
