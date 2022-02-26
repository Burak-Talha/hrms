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
@Table(name="job_position")
public class JobPosition {
	
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="job_name")
	private String jobName;
	
	@Column(name="job_explanation")
	private String jobExplanation;	

}
