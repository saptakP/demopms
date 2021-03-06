package com.uberotel.b2b.business.domain;
// Generated Oct 1, 2016 10:41:23 PM by Hibernate Tools 3.5.0.Final

import java.util.Date;


/**
 * Amenity generated by hbm2java
 */

public class Amenity implements java.io.Serializable {

	private Integer amenityId;
	private String shortDesc;
	private String longDesc;
	private String status;
	private Date created;
	private Date updated;
	private String createdBy;
	private String updatedBy;

	public Amenity() {
	}

	public Amenity(String shortDesc, String longDesc, String status, Date created, Date updated, String createdBy,
			String updatedBy) {
		this.shortDesc = shortDesc;
		this.longDesc = longDesc;
		this.status = status;
		this.created = created;
		this.updated = updated;
		this.createdBy = createdBy;
		this.updatedBy = updatedBy;
	}

	public Integer getAmenityId() {
		return this.amenityId;
	}

	public void setAmenityId(Integer amenityId) {
		this.amenityId = amenityId;
	}

	
	public String getShortDesc() {
		return this.shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	
	public String getLongDesc() {
		return this.longDesc;
	}

	public void setLongDesc(String longDesc) {
		this.longDesc = longDesc;
	}

	
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	
	
	public Date getUpdated() {
		return this.updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	
	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	
	public String getUpdatedBy() {
		return this.updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

}
