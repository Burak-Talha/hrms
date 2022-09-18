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
@Table(name="language")
public class Languages {

	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="language_name")
	private String languageName;

	@Column(name="curriculum_vitae_id")
	private int curriculumVitaeId;

	@Column(name="level")
	private int level;
}
