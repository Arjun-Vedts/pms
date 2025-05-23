package com.vts.pfms.committee.dto;

import org.springframework.web.multipart.MultipartFile;

public class ActionSubDto {
	
        private String FileName;
        private String FileNamePath;
	    private MultipartFile multipartfile;
	    private String ActionSubId;
		private String ActionAssignId;
		private String Progress;
		private String ProgressDate;
		private String Remarks;
		private String LabCode;
		private String CreatedBy;
		private String CreatedDate;
		private String ModifiedBy;
		private String ModifiedDate;
		
		
		
		public String getLabCode() {
			return LabCode;
		}
		public void setLabCode(String labCode) {
			LabCode = labCode;
		}
		public String getFileName() {
			return FileName;
		}
		public void setFileName(String fileName) {
			FileName = fileName;
		}
		public String getFileNamePath() {
			return FileNamePath;
		}
		public void setFileNamePath(String fileNamePath) {
			FileNamePath = fileNamePath;
		}
		
		public MultipartFile getMultipartfile() {
			return multipartfile;
		}
		public void setMultipartfile(MultipartFile multipartfile) {
			this.multipartfile = multipartfile;
		}
		public String getActionSubId() {
			return ActionSubId;
		}
		public void setActionSubId(String actionSubId) {
			ActionSubId = actionSubId;
		}
	
		public String getActionAssignId() {
			return ActionAssignId;
		}
		public void setActionAssignId(String actionAssignId) {
			ActionAssignId = actionAssignId;
		}
		public String getProgress() {
			return Progress;
		}
		public void setProgress(String progress) {
			Progress = progress;
		}
		public String getProgressDate() {
			return ProgressDate;
		}
		public void setProgressDate(String progressDate) {
			ProgressDate = progressDate;
		}
		public String getRemarks() {
			return Remarks;
		}
		public void setRemarks(String remarks) {
			Remarks = remarks;
		}
		public String getCreatedBy() {
			return CreatedBy;
		}
		public void setCreatedBy(String createdBy) {
			CreatedBy = createdBy;
		}
		public String getCreatedDate() {
			return CreatedDate;
		}
		public void setCreatedDate(String createdDate) {
			CreatedDate = createdDate;
		}
		public String getModifiedBy() {
			return ModifiedBy;
		}
		public void setModifiedBy(String modifiedBy) {
			ModifiedBy = modifiedBy;
		}
		public String getModifiedDate() {
			return ModifiedDate;
		}
		public void setModifiedDate(String modifiedDate) {
			ModifiedDate = modifiedDate;
		}
		
}
