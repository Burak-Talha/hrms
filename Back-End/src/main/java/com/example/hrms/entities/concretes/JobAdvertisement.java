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
@Table(name="job_advertisement")
public class JobAdvertisement {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="job_position_id")
	private int jobPositionId;
	
	@Column(name="employee_id")
	private int employeeId;
	
	@Column(name="advertisement_title")
	private String advertisementTitle;
	
	@Column(name="advertisement_context")
	private String advertisementContext;
	
	@Column(name="position_amount")
	private int positionAmount;
	
	@Column(name="min_salary")
	private double minSalary;
	
	@Column(name="max_salary")
	private double maxSalary;
	
	@Column(name="is_active")
	private boolean isActive;
	
}
