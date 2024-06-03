package com.vts.pfms.pfts.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vts.pfms.master.dto.DemandDetails;
import com.vts.pfms.pfts.controller.FileStatusController;
import com.vts.pfms.pfts.dao.PFTSDao;
import com.vts.pfms.pfts.dto.DemandOrderDetails;
import com.vts.pfms.pfts.dto.PFTSFileDto;
import com.vts.pfms.pfts.model.PFTSFile;
import com.vts.pfms.pfts.model.PftsFileOrder;

@Service
public class PFTSServiceImp implements PFTSService{
	
	@Autowired 
	PFTSDao dao;
	
	private static final Logger logger=LogManager.getLogger(PFTSServiceImp.class);
	
	private  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	private  SimpleDateFormat rdf=new SimpleDateFormat("dd-MM-yyyy");
	private  SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Override
	public List<Object[]> ProjectsList() throws Exception {

		return dao.ProjectsList();
	}
	
	@Override
	public Object[] ProjectData(String projectid) throws Exception
	{
		return dao.ProjectData(projectid);
	}
	
	@Override
	public List<Object[]> LoginProjectDetailsList(String empid,String Logintype,String LabCode)throws Exception
	{
		return dao.LoginProjectDetailsList(empid,Logintype,LabCode);
	}
	
	@Override
	public List<Object[]> getFileStatusList(String projectId) throws Exception {	
		return dao.getFileStatusList(projectId);
	}
	
	@Override
	public List<DemandDetails> getprevDemandFile(String projectId)throws Exception{
		
		logger.info(new Date() +" Inside SERVICE getprevDemandFile ");
		List<Object[]> data =dao.getprevDemandFile(projectId);
		List<DemandDetails> pervDD=new ArrayList<>();
		if(data!=null && data.size()>0) {
			for(Object[] obj:data) {
				DemandDetails DD =new DemandDetails();
				DD.setProjectId(Long.parseLong(obj[0].toString()));
				if(obj[1]!=null && obj[2]!=null) {
					DD.setDemandNo(obj[1].toString());
					DD.setDemandDate(obj[2].toString());
				}
				DD.setItemFor(obj[3].toString());
				DD.setEstimatedCost(Double.parseDouble(obj[4].toString()));
				pervDD.add(DD);
			}
		}
		
	 return pervDD;	
	}
	
	@Override
	public Long addDemandfile(PFTSFile pf) throws Exception{
		return dao.addDemandfile(pf);
	}
	
	@Override
	public List<Object[]> getStatusList(String fileid)throws Exception{
		return dao.getStatusList(fileid);
	}

	@Override
	public int upadteDemandFile(String fileId, String statusId, String eventDate,String remarks)throws Exception{
		logger.info(new Date() +" Inside SERVICE upadteDemandFile ");
		String update="";	

		switch(statusId) {
		    case "2" :
		    	update="SpcDate";
		    break ;	
		    case "3":
		    	update="EPCDate";
            break;
		    case "4":
		    	update="TenderDate";
		    break;	
		    
		/* Added by Dinesh - Receipt of Quotations */
		    case "5":
		    	update="QuotationsDate";
			break;	
			
		    case "6":
		    	update="TocDate";
			break;	
		    case "7":
		    	update="TecDate";
		    break;
		    case "8":
		    	update="TpcDate";
		    break;	
		    case "9":
		    	update="SanctionDate";
			break;	
		    case "10":
		    	update="OrderDate";
			break;	
		    case "11":
		    	update="RevisedDp";
			break;	
			
		/* Added by Dinesh - Issue of CDEC / EDEC */
		    case "12":
		    	update="CDECEDECDate";
			break;
			
		    case "13":
		    	update="RealizationDate";
			break;
		   
		/* Added by Dinesh - ATP/QTP Completed */
		    case "14":
		    	update="ATPQTPDate ";
			break;
			
		    case "15":
		    	update="DeliveryDate";
	        break;
		   
		    case "16":
		    	update="InspectionDate";
		    break;
		    case "17":
		    	update="PaymentDate";
			break;	
		    case "18":
		    	update="PartialChequeDate";
		    break;	
		    case "19":
		    	update="FinalChequeDate";
		    break;
		    
		  
		    /*       Old Code        */
		    
//		    case "2" :
//		    	update="SpcDate";
//		    break ;	
//		    case "3":
//		    	update="EPCDate";
//            break;
//		    case "4":
//		    	update="TenderDate";
//		    break;	
//		    case "5":
//		    	update="TocDate";
//			break;	
//		    case "6":
//		    	update="TecDate";
//		    break;
//		    case "7":
//		    	update="TpcDate";
//		    break;	
//		    case "8":
//		    	update="SanctionDate";
//			break;	
//		    case "9":
//		    	update="OrderDate";
//			break;	
//		    case "10":
//		    	update="RevisedDp";
//			break;	
//		    case "11":
//		    	update="ReceiptDate";
//			break;
//		    case "12":
//		    	update="InspectionDate";
//		    break;
//		    case "13":
//		    	update="CrvDate";
//	        break;
//		    case "14":
//		    	update="PaymentDate";
//			break;	
//		    case "15":
//		    	update="PartialChequeDate";
//		    break;	
//		    case "16":
//		    	update="FinalChequeDate";
//		    break;
		    
		}
		
		Date eventDateSql=new java.sql.Date(rdf.parse(eventDate).getTime());
		return dao.upadteDemandFile(fileId,statusId,eventDateSql,update, remarks);
	}
	
	@Override
	public long updateCostOnDemand(List<DemandOrderDetails> dd ,String fileId,String userid)throws Exception{
		logger.info(new Date() +" Inside SERVICE updateCostOnDemand ");
		if(dd.size()>0) {
		String isPresent = dd.get(0).getIsPresent();
		if(isPresent!=null) {
			System.out.println("Manual Deamand");
		}else {
			dao.updatePftsFileId(fileId);
		}
		}
		long result=0; 
		for(DemandOrderDetails dod:dd) {
        	 PftsFileOrder pfo=new PftsFileOrder();
        	 pfo.setItemFor(dod.getItemFor());
        	 pfo.setOrderNo(dod.getOrderNo());
        	 pfo.setVendorName(dod.getVendorName());
        	 pfo.setDpDate(dod.getDpDate());
        	 pfo.setOrderDate(dod.getOrderDate());
        	 pfo.setOrderCost(dod.getOrderCost());
        	 pfo.setPftsFileId(Long.parseLong(fileId));
        	 pfo.setCreatedBy(userid);
        	 pfo.setCreatedDate(sdf1.format(new Date()));
        	 if(dod.getIsPresent()!=null && dod.getIsPresent().equalsIgnoreCase("N")) {
        		pfo.setIsPresent("N"); 
        	 }else {
        		 pfo.setIsPresent("Y"); 
        	 }
        	 pfo.setIsActive(1);
        	 try {
        	 result=dao.addDemandfileOrder(pfo);
        	 }catch (Exception e) {
        		 
			}        
        }
	     return result;
	}

	@Override
	public int FileInActive(String fileId, String userId) throws Exception {
		
		return dao.FileInActive(fileId, userId);
	}
	
	@Override
	public Object[] getFilePDCInfo(String fileid)throws Exception
	{
		return dao.getFilePDCInfo(fileid);
	}
	
	@Override
	public long UpdateFilePDCInfo (String fileid,String PDCDate,String IntegrationDate,String UserId)throws Exception
	{
		PFTSFile fileFetch = dao.getPftsFile(fileid);
		fileFetch.setPDC(sdf.format(rdf.parse(PDCDate)));
		fileFetch.setIntegrationDate(sdf.format(rdf.parse(IntegrationDate)));
		return dao.addDemandfile(fileFetch);
	}
	
	@Override
	public int getpftsFieldId(String enviId) throws Exception {
		return dao.getpftsFieldId(enviId);
	}

	@Override
	public long updateEnvi(PFTSFile pf, String userId) throws Exception {
		pf.setModifiedBy(userId);
		pf.setModifiedDate(sdf.format(new Date()));
		return dao.updatepftsEnvi(pf);
	}
	@Override
	public Object[] getEnviData(String PftsFileId)throws Exception
	{
		return dao.getEnviData(PftsFileId);
	}
	
	@Override
	public List<Object[]> getpftsStageList() throws Exception {
		
		return  dao.getpftsStageList();
	}
	@Override
	public Object[] getpftsFileViewList(String procFileId) throws Exception {

		return dao.getpftsFileViewList(procFileId);
	}
	
	@Override
	public List<Object[]> getOrderDetailsAjax(String fileId) throws Exception {
		
		return dao.getOrderDetailsAjax(fileId);
	}
	
	@Override
	public long ManualOrderSubmit(PftsFileOrder order, String orderid) throws Exception {
		
		return dao.ManualOrderSubmit(order,orderid);
	}
	
	@Override
	public long manualDemandEditSubmit(PFTSFileDto pftsDto) throws Exception {
		
		return dao.manualDemandEditSubmit(pftsDto);
	}
	
	@Override
	public List<Object[]> getDemandNoList() throws Exception{
		
		return dao.getDemandNoList();
	}

}
