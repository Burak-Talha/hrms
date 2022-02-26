package com.example.hrms.entities.concretes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name="school")
public class School {
	
	@Id
	@Column(name="id")
	private int id;

	@Column(name="school_name")
	private String schoolName;

	@Column(name="curriculum_vitae_id")
	private int curriculumVitaeId;

	@Column(name="section")
	private String section;
	
	@Column(name="graduation_year")
	private int graduationYear;
	
	@Column(name="beginning")
	private String beginning;
	
	@Column(name="finish")
	private String finish;
}
