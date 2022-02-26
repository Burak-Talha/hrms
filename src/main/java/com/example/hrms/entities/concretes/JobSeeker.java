package com.example.hrms.entities.concretes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
// Getter ve setter anotasyonları bazen çalışmıyor(bulunamıyor).
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name="job_seeker")
public class JobSeeker {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="surname")
	private String surname;

	@Column(name="mail")
	private String mail;

	@Column(name="password")
	private String password;
	
	@Column(name="tc_no")
	private String tcNo;
	
	@Column(name="birth_year")
	private int birthYear;
	
	}
