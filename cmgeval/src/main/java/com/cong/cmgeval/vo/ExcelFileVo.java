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
@Entity(name="excel_file")
public class ExcelFileVo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long efno;
	@ManyToOne
	@JoinColumn(name ="cno")
	@JsonManagedReference
	private CompanyVo company;
	private String title;
	private String path;
	@Column(name = "time", nullable = false, updatable = false, insertable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Timestamp time;
	
	@Builder
	public ExcelFileVo(CompanyVo company, String title, String path) {
		this.company = company;
		this.title = title;
		this.path = path;
	}
	
}
