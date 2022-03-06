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
@Table(name="job_experiences")
public class JobExperiences {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="corporation_name")
	private String name;

	@Column(name="curriculum_vitae_id")
	private int curriculumVitaeId;
	
	@Column(name="position_id")
	private int jobPositionId;
	
	@Column(name="beginning")
	private String beginning;
	
	@Column(name="finish")
	private String finish;
}
