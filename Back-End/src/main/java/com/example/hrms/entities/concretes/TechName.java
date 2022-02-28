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
@Table(name="tech_name")
public class TechName {

	@Id
	@Column(name="id")
	private int id;

	@Column(name="curriculum_vitae_id")
	private int curriculumVitaeId;

	@Column(name="tech_name")
	private String techName;
}
