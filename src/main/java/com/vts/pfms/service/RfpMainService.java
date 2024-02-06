package com.vts.pfms.service;

import java.util.ArrayList;
import java.util.List;

import com.vts.pfms.login.CCMView;
import com.vts.pfms.login.ProjectHoa;
import com.vts.pfms.model.FinanceChanges;
import com.vts.pfms.model.IbasLabMaster;
import com.vts.pfms.model.LabMaster;
import com.vts.pfms.model.Notice;

public interface RfpMainService {

	
	public List<Object[]> DashBoardFormUrlList(String FormModuleId,String loginId )throws Exception;
	public List<Object[]> UserManagerList()throws Exception;
	public int  LoginStampingUpdate(String Logid,String LogoutType)throws Exception;
	public LabMaster LabDetailes()throws Exception;
	public List<Object[]> LabDetails()throws Exception;
	public String DesgId(String Empid)throws Exception;
	public List<Object[]> getIndividualNoticeList(String userId)throws Exception;
	public Long addNotice(Notice notice)throws Exception;
	public List<Object[]> AllActionsCount(String logintype, String empid,String LoginId,String LabCode) throws Exception;
	public List<Object[]> GetNotice(String LabCode)throws Exception;
	public List<Object[]> getAllNotice()throws Exception;
	public int GetNoticeEligibility(String empId)throws Exception;
	public List<Object> SelfActionsList(String empId) throws Exception;
	public List<Object[]>  getIndividualNoticeList(String empId, String fdate, String tdate)throws Exception;
	public List<Object[]>  noticeEditData(String noticeId)throws Exception;
	public int noticeDelete(String noticeId)throws Exception;
	public int editNotice(Notice notice)throws Exception;
	public List<Object[]> ProjectBudgets() throws Exception;
	public Object[] AllSchedulesCount(String LoginType,String loginid) throws Exception;
	public List<Object[]> ProjectMeetingCount(String LoginType,String empid,String LabCode) throws Exception;
	public List<Object[]> ProjectList(String LoginType,String LoginId,String labcode) throws Exception;
	public ArrayList<String> ProjectQuaters(String ProjectId)throws Exception;
	public String getEmpNo(long empId) throws Exception;
	public List<Object[]> GanttChartList() throws Exception;
	public List<Object[]> ProjectHealthData(String LabCode) throws Exception;
	public Object[] ProjectHealthTotalData(String ProjectId,String EmpId,String LoginType,String LabCode,String IsAll) throws Exception;
	public long ProjectHealthUpdate(String EmpId,String UserName)throws Exception;
	public long ProjectHoaUpdate(List<ProjectHoa> hoa, String Username, List<IbasLabMaster> LabDetails) throws Exception;
	public Object[] ChangesTotalCountData(String ProjectId) throws Exception;
	public List<Object[]> MeetingChanges(String ProjectId,String Interval,String LabCode) throws Exception;
	public List<Object[]> MilestoneChanges(String ProjectId,String Interval,String LabCode) throws Exception;
	public List<Object[]> ActionChanges(String ProjectId,String Interval,String LabCode) throws Exception;
	public List<Object[]> RiskChanges(String ProjectId,String Interval,String LabCode) throws Exception;
	public List<Object[]> FinanceDataPartA(String ProjectId, String Interval) throws Exception;
	public long ProjectFinanceChangesUpdate(List<FinanceChanges> Monthly, List<FinanceChanges> Weekly, List<FinanceChanges> Today, String UserId,String EmpId) throws Exception;
	public Object[] ProjectData(String projectid) throws Exception;
	public long CCMViewDataUpdate(List<CCMView> CCMViewData, String LabCode, String ClusterId, String UserId, String EmpId) throws Exception;
	public List<Object[]> getCCMData(String EmpId,String LoginType,String LabCode)throws Exception;
	public List<Object[]> DashboardFinanceCashOutGo(String LoginType, String EmpId, String LabCode, String ClusterId) throws Exception;
	public List<Object[]> DashboardFinance(String LoginType, String EmpId, String LabCode, String ClusterId) throws Exception;
	public List<Object[]> DashboardProjectFinanceCashOutGo(String projectcode) throws Exception;
	public Object[] ProjectAttributes(String projectcode) throws Exception;
	public long GetSMSInitiatedCount(String SmsTrackingType) throws Exception;
	public long InsertSmsTrackInitiator(String TrackingType) throws Exception;
	public List<Object[]> GetDailyPendingAssigneeEmpData() throws Exception;
	public long InsertDailySmsPendingInsights(long smsTrackingId) throws Exception;
	public Object[] ActionAssignCounts(long EmpId, String actionDate) throws Exception;
	public long UpdateParticularEmpSmsStatus(String SmsPurpose, String SmsStatus, long EmpId,long effectivelyFinalSmsTrackingId, String message) throws Exception;
	public long updateSmsSuccessCount(long smsTrackingId, int SuccessCount, String TrackingType) throws Exception;
	public long UpdateNoSmsPendingReply(String TrackingType) throws Exception;
	public long DirectorInsertSmsTrackInitiator(String TrackingType) throws Exception;
	public List<Object[]> GetDirectorDailyPendingAssignEmpData(String Lab) throws Exception;
	public long DirectorInsertDailySmsPendingInsights(long smsTrackingId) throws Exception;
	public Object[] DirectorActionAssignCounts(String PdcDate) throws Exception;
	public long GetCommitteSMSInitiatedCount(String SmsTrackingType) throws Exception;
	public long InsertCommitteSmsTrackInitiator(String TrackingType) throws Exception;
	public List<Object[]> GetCommitteEmpsDetailstoSendSms() throws Exception;
	public long InsertDailyCommitteSmsInsights(long committeSmsTrackingId) throws Exception;
	public List<Object[]> getCommittedata(long EmpId) throws Exception;
	public long UpdateParticularCommitteEmpSmsStatus(String SmsPurpose, String SmsStatus, long empId,long effectivelyFinalSmsTrackingId, String message) throws Exception;
	public long updateCommitteSmsSuccessCount(long committeSmsTrackingId, int SuccessCount, String TrackingType) throws Exception;
	public long UpdateCommitteNoSmsPending(String TrackingType) throws Exception;
}
