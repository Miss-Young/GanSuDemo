package com.powersi.ssm.biz.medicare.diagnose.action;

import java.net.URLDecoder;
import java.text.DateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.powersi.hygeia.framework.util.UtilFunc;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.powersi.biz.medicare.diagnose.pojo.DiagnoseInfoDTO;
import com.powersi.biz.medicare.diagnose.pojo.FeeInfoDTO;
import com.powersi.biz.medicare.diagnose.service.DiagnoseSaveBizService;
import com.powersi.biz.medicare.inhospital.service.util.CommunalService;
import com.powersi.hygeia.comm.service.HygeiaServiceManager;
import com.powersi.hygeia.framework.CodetableMapping;
import com.powersi.hygeia.framework.util.DateFunc;
import com.powersi.hygeia.web.BaseAction;
import com.powersi.log.service.ErrLogSnService;
import com.powersi.log.service.ErrLogSnService.ProjectType;
import com.powersi.ssm.biz.medicare.common.service.CodetableCacheMapping;
import com.powersi.ssm.biz.medicare.common.util.BizHelper;
import com.powersi.ssm.biz.medicare.diagnose.service.DiagnoseRegisterService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Action(value = "DiagnoseRegisterAction", results = {
		@Result(name = "registerhealthposts", location = "/pages/biz/medicare/diagnose/diagnoseRegister_Healthposts.jsp"),
		@Result(name = "register", location = "/pages/biz/medicare/diagnose/diagnoseCharge.jsp"),
		@Result(name = "registerbirth", location = "/pages/biz/medicare/diagnose/diagnoseRegister_birth.jsp"),
		@Result(name = "registerDrug", location = "/pages/biz/medicare/diagnose/diagnoseCharge_drug.jsp"),
		@Result(name = "registerMaternity", location = "/pages/biz/medicare/diagnose/diagnoseCharge_maternity.jsp"),
		@Result(name = "registerAccident", location = "/pages/biz/medicare/diagnose/diagnoseCharge_accident.jsp"),
		@Result(name = "registerRetire", location = "/pages/biz/medicare/diagnose/diagnoseCharge_retire.jsp"),
		@Result(name = "registerFm", location = "/pages/biz/medicare/diagnose/diagnoseCharge_fm.jsp") })
public class DiagnoseRegisterAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private DiagnoseInfoDTO diagnoseInfoDTO;
	private FeeInfoDTO feeInfoDTO;
	private String ake007;
	@Autowired
	private CommunalService communalService;
	@Autowired
	@Qualifier("errLogSnService")
	private ErrLogSnService errLogSnService;
	@Autowired
	private HygeiaServiceManager hygeiaServiceManager;
	@Autowired
	private DiagnoseRegisterService diagnoseRegisterService;

	public String registerhealthposts() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		return "registerhealthposts";
	}

	public String register() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "register";
	}
	
	public String registerMaternity() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "registerMaternity";
	}
	
	public String registerAccident() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "registerAccident";
	}

	public String registerBirth() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "registerbirth";
	}

	public String registerDrug() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "registerDrug";
	}

	public String registerRetire() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "registerRetire";
	}
	
	public String registerFm() {
		if (!isPostRequest()) {
			loadCodeSelectData();
		}
		if (diagnoseInfoDTO == null) {
			diagnoseInfoDTO = new DiagnoseInfoDTO();
		}
		diagnoseInfoDTO.setAae030(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		this.setAke007(DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "registerFm";
	}

	@SuppressWarnings("rawtypes")
	private void loadCodeSelectData() {
		Map bka019List = new LinkedHashMap();
		Map bka021List = new LinkedHashMap();
		Map bka503List = new LinkedHashMap();
		loadBka019List(bka019List);
		setAttribute("bka019List", bka019List);
		setAttribute("bka021List", bka021List);
		setAttribute("bka503List", bka503List);
	}

	/**
	 * 试算
	 * 
	 * 
	 * @return
	 */
	@SuppressWarnings({"unchecked", "rawtypes" })
	public String diagnoseCalcSave() {
		String aka130Name = CodetableCacheMapping.getDisplayValue("aka130",diagnoseInfoDTO.getAka130(),"门诊");
		try {
			diagnoseInfoDTO.setAkb020(BizHelper.getAkb020());
			diagnoseInfoDTO.setAkb021(BizHelper.getAkb021());
			diagnoseInfoDTO.setAae011(BizHelper.getLoginUser());
			diagnoseInfoDTO.setBka015(BizHelper.getUserName());
			diagnoseInfoDTO.setAae030(this.getDiagnoseInfoDTO().getAae030());
			if(diagnoseInfoDTO.getAaa027()==null ||diagnoseInfoDTO.getAaa027()==""){
				diagnoseInfoDTO.setAaa027(BizHelper.getAaa027());
			}
			if (StringUtils.isBlank(this.getDiagnoseInfoDTO().getBka020())
					&& StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getAkf001())) {
				this.getDiagnoseInfoDTO().setBka020(this.getDiagnoseInfoDTO().getAkf001());
			}
			if (StringUtils.isBlank(this.getDiagnoseInfoDTO().getBka022())
					&& StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getBka021())) {
				this.getDiagnoseInfoDTO().setBka022(this.getDiagnoseInfoDTO().getBka021());
			}
			String bka006 = this.getDiagnoseInfoDTO().getBka006();
			if (StringUtils.isNotBlank(bka006)) {
				this.getDiagnoseInfoDTO().setBka006_name(CodetableMapping.getDisplayValue("bka006", bka006, bka006));
			}
			String jsonFee = URLDecoder.decode(this.getParameter("feeinfo"), "UTF-8");
			JSONArray jsonArray = JSONArray.fromObject(jsonFee);
			List<Map> listFeeInfoDTORows = JSONArray.toList(jsonArray, new HashMap(), new JsonConfig());
			for (int i = 0; listFeeInfoDTORows != null && i < listFeeInfoDTORows.size(); i++) {
				listFeeInfoDTORows.get(i).put("bka063", BizHelper.getLoginUser());
				listFeeInfoDTORows.get(i).put("bka064", BizHelper.getUserName());
			}
			List payinfoList = this.diagnoseRegisterService.diagnoseCalcSave(this.getDiagnoseInfoDTO(), 
					listFeeInfoDTORows);
			
			/* TS19032800229 - 【需求开发】电子社保卡应用相关功能模块改造  如果是前台扫码结算修改提示信息  modified 675 2019年3月28日 */
			if("2".equals(diagnoseInfoDTO.getEsscno())) {
				this.setJSONReturn(aka130Name + "扫码支付成功!\n请通过渠道APP输入密码确认结算后再查询订单结果！", payinfoList);
			}else {
				this.setJSONReturn(aka130Name + "试算成功！", payinfoList);
			}
			
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			
			/* TS19032800229 - 【需求开发】电子社保卡应用相关功能模块改造  如果是前台扫码结算修改提示信息  modified 675 2019年3月28日 */
			if("2".equals(diagnoseInfoDTO.getEsscno())) {
				this.saveJSONError(aka130Name + "扫码结算失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
			}else {
				this.saveJSONError(aka130Name + "试算失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
			}
		}
		return NONE;
	}

	/**
	 * 支付宝渠道结算  
	 * @return
	 */
	@SuppressWarnings({"unchecked", "rawtypes" })
	public String diagnoseCalcSaveAli() {
		String aka130Name = CodetableCacheMapping.getDisplayValue("aka130",diagnoseInfoDTO.getAka130(),"门诊");
		try {
			diagnoseInfoDTO.setAkb020(BizHelper.getAkb020());
			diagnoseInfoDTO.setAkb021(BizHelper.getAkb021());
			diagnoseInfoDTO.setAae011(BizHelper.getLoginUser());
			diagnoseInfoDTO.setBka015(BizHelper.getUserName());
			diagnoseInfoDTO.setAae030(this.getDiagnoseInfoDTO().getAae030());
			if(diagnoseInfoDTO.getAaa027()==null ||diagnoseInfoDTO.getAaa027()==""){
				diagnoseInfoDTO.setAaa027(BizHelper.getAaa027());
			}
			if (StringUtils.isBlank(this.getDiagnoseInfoDTO().getBka020())
					&& StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getAkf001())) {
				this.getDiagnoseInfoDTO().setBka020(this.getDiagnoseInfoDTO().getAkf001());
			}
			if (StringUtils.isBlank(this.getDiagnoseInfoDTO().getBka022())
					&& StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getBka021())) {
				this.getDiagnoseInfoDTO().setBka022(this.getDiagnoseInfoDTO().getBka021());
			}
			String jsonFee = URLDecoder.decode(this.getParameter("feeinfo"), "UTF-8");
			JSONArray jsonArray = JSONArray.fromObject(jsonFee);
			List<Map> listFeeInfoDTORows = JSONArray.toList(jsonArray, new HashMap(), new JsonConfig());
			for (int i = 0; listFeeInfoDTORows != null && i < listFeeInfoDTORows.size(); i++) {
				listFeeInfoDTORows.get(i).put("bka063", BizHelper.getLoginUser());
				listFeeInfoDTORows.get(i).put("bka064", BizHelper.getUserName());
			}
			List payinfoList = this.diagnoseRegisterService.diagnoseCalcSaveAli(this.getDiagnoseInfoDTO(), 
					listFeeInfoDTORows);
			
			this.setJSONReturn(aka130Name + "结算成功！", payinfoList);
			
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			
			/* TS19032800229 - 【需求开发】电子社保卡应用相关功能模块改造  如果是前台扫码结算修改提示信息  modified 675 2019年3月28日 */
			if("2".equals(diagnoseInfoDTO.getEsscno())) {
				this.saveJSONError(aka130Name + "扫码结算失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
			}else {
				this.saveJSONError(aka130Name + "试算失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
			}
		}
		return NONE;
	}
	
	/**
	 * 收费或退费
	 * @return
	 */
	@SuppressWarnings({"rawtypes", "unchecked" })
	public String diagnoseCalcEnPay() {
		String aka130Name = CodetableCacheMapping.getDisplayValue("aka130",diagnoseInfoDTO.getAka130(),"门诊");
		try {
			diagnoseInfoDTO.setAkb020(BizHelper.getAkb020());
			diagnoseInfoDTO.setAkb021(BizHelper.getAkb021());
			diagnoseInfoDTO.setAae011(BizHelper.getLoginUser());
			diagnoseInfoDTO.setBka015(BizHelper.getUserName());
			diagnoseInfoDTO.setEcIndexNo("223");
			diagnoseInfoDTO.setAka242("1");
			if(diagnoseInfoDTO.getAaa027()==null ||diagnoseInfoDTO.getAaa027()==""){
				diagnoseInfoDTO.setAaa027(BizHelper.getAaa027());
			}
			if (StringUtils.isBlank(this.getDiagnoseInfoDTO().getBka020())
					&& StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getAkf001())) {
				this.getDiagnoseInfoDTO().setBka020(this.getDiagnoseInfoDTO().getAkf001());
			}
			if (StringUtils.isBlank(this.getDiagnoseInfoDTO().getBka022())
					&& StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getBka021())) {
				this.getDiagnoseInfoDTO().setBka022(this.getDiagnoseInfoDTO().getBka021());
			}
			String bka006 = this.getDiagnoseInfoDTO().getBka006();
			if (StringUtils.isNotBlank(bka006)) {
				this.getDiagnoseInfoDTO().setBka006_name(CodetableMapping.getDisplayValue("bka006", bka006, bka006));
			}
					
			String jsonFee = URLDecoder.decode(getParameter("feeinfo"), "UTF-8");
			JSONArray jsonArray = JSONArray.fromObject(jsonFee);
			List<Map> listFeeInfoDTORows = JSONArray.toList(jsonArray,new HashMap(), new JsonConfig());
			for (int i = 0; listFeeInfoDTORows != null && i < listFeeInfoDTORows.size(); i++) {
				listFeeInfoDTORows.get(i).put("bka063", BizHelper.getLoginUser());
				listFeeInfoDTORows.get(i).put("bka064", BizHelper.getUserName());
			}
			List payinfoList = this.diagnoseRegisterService.diagnoseCalcEnPay(this.getDiagnoseInfoDTO(), 
					listFeeInfoDTORows);
			this.setJSONReturn(aka130Name+"收费成功！", payinfoList);
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			this.saveJSONError(aka130Name+"收费失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
		}
		return NONE;
	}
	
	
	
	/**
	 * 加载科室
	 * @Title: loadBka019List   
	 * @param: @param bka019List      
	 * @return: void
	 */
	@SuppressWarnings(value = { "unchecked","rawtypes"})
	private void loadBka019List(Map bka019List){
		try {
			List<Map> hospList = this.diagnoseRegisterService.queryHospDept();
			//获取科室信息
			if(hospList != null && hospList.size() > 0){
				for (Map map : hospList) {
					bka019List.put(this.communalService.str(map, "bkc156", ""), 
							this.communalService.str(map, "bkc157", ""));
				}
			}
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			this.saveJSONError(errLogSn+e.getMessage());
		}
		
	}
	
	/**
	 * 加载病区
	 * @Title: loadBka021List   
	 * @param: @return      
	 * @return: String
	 */
	@SuppressWarnings(value = { "unchecked","rawtypes"})
	public String loadBka021List(){
		try {
			Map bka021List= new HashMap();
			if(StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getAkf001())){
				List<Map> hospList = this.diagnoseRegisterService.
						queryHospArea(this.getDiagnoseInfoDTO().getAkf001());
				if(hospList != null && hospList.size() > 0){
					for (Map map : hospList) {
						bka021List.put(this.communalService.str(map, "bkc153", ""), 
								this.communalService.str(map, "bkc154", ""));
					}
				}
			}
			this.setJSONReturn(bka021List);
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			this.saveJSONError(errLogSn+e.getMessage());
		}
		return NONE;
	}
	
	/**
	 * 加载医保医生
	 * @Title: loadBka503List   
	 * @param: @return      
	 * @return: String
	 */
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public String loadBka503List(){
		try {
			Map bka503List = new HashMap();
			if(StringUtils.isNotBlank(this.getDiagnoseInfoDTO().getAkf001())){
				List<Map> hospList = this.diagnoseRegisterService.
						queryHospDoctor(this.getDiagnoseInfoDTO().getAkf001());
				if(hospList != null && hospList.size() > 0){
					for (Map map : hospList) {
						bka503List.put(this.communalService.str(map, "bkc274", ""), 
								this.communalService.str(map, "bkc275", ""));
					}
				}
			}
			this.setJSONReturn(bka503List);
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			this.saveJSONError(errLogSn+e.getMessage());
		}
		return NONE;
	}
	
	public String addErrSNInfo() {
		String errLogSn = this.errLogSnService.getErrSN(ProjectType.WEB);
		errLogSn = "错误号 " + errLogSn + " 信息： ";
		return errLogSn;
	}
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public String addNotBlankParameters() {
		Map allParameters = this.getAllParameters();
		if (allParameters == null || allParameters.size() == 0) {
			return "{}";
		}
		Map parameters = new HashMap();
		String key = "", value = "";
		Object objValue = null;
		Iterator it = allParameters.keySet().iterator();
		while (it.hasNext()) {
			key = it.next().toString();
			objValue = allParameters.get(key);
			if (objValue != null) {
				value = objValue.toString();
				if (StringUtils.isNotBlank(value)) {
					parameters.put(key, value);
				}
			}
		}
		return parameters.toString();
	}
	public DiagnoseInfoDTO getDiagnoseInfoDTO() {
		return diagnoseInfoDTO;
	}

	public void setDiagnoseInfoDTO(DiagnoseInfoDTO diagnoseInfoDTO) {
		this.diagnoseInfoDTO = diagnoseInfoDTO;
	}

	public FeeInfoDTO getFeeInfoDTO() {
		return feeInfoDTO;
	}

	public void setFeeInfoDTO(FeeInfoDTO feeInfoDTO) {
		this.feeInfoDTO = feeInfoDTO;
	}

	public String getAke007() {
		return ake007;
	}

	public void setAke007(String ake007) {
		this.ake007 = ake007;
	}

	/**
	 * 修改概要：NTS20050700380-生育、门特业务省内异地联网结算需求 -- 湘潭
	 * 修改描述：增加异地门特试算
	 * 修改人及修改时间：李嘉伦 2020/5/8
	 */
	@SuppressWarnings({"unchecked", "rawtypes" })
	public String diagnoseCalcSave_remote() {
		try {
			diagnoseInfoDTO.setHospital_id(BizHelper.getAkb020());
			diagnoseInfoDTO.setReg_staff(BizHelper.getLoginUser());
			diagnoseInfoDTO.setReg_man(BizHelper.getUserName());
			if(UtilFunc.isBlank(diagnoseInfoDTO.getCenter_id())){
				diagnoseInfoDTO.setCenter_id(BizHelper.getAaa027());
			}
			String jsonFee = URLDecoder.decode(this.getParameter("feeinfo"), "UTF-8");
			JSONArray jsonArray = JSONArray.fromObject(jsonFee);
			List<Map> listFeeInfoDTORows = JSONArray.toList(jsonArray, new HashMap(), new JsonConfig());
			for (int i = 0; listFeeInfoDTORows != null && i < listFeeInfoDTORows.size(); i++) {
				listFeeInfoDTORows.get(i).put("input_staff", BizHelper.getLoginUser());
				listFeeInfoDTORows.get(i).put("input_man", BizHelper.getUserName());
                listFeeInfoDTORows.get(i).put("fee_date", UtilFunc.getString(listFeeInfoDTORows.get(i),"input_date"));
                //时间格式转换 省直要求 yyyy-mm-dd hh:mi:ss
                String fee_date =  UtilFunc.getString(listFeeInfoDTORows.get(i),"fee_date");
				String fee_date1 = "";
                if (fee_date.length()==8){
                	fee_date1 = fee_date.substring(0,4) + "-" + fee_date.substring(4,6) + "-" + fee_date.substring(6) + " 00:00:01";
				}else{
					fee_date1 = fee_date;
				}
                listFeeInfoDTORows.get(i).put("fee_date", fee_date1);

				//省直药品类别转换 “0”：诊疗项目 “1”：西药 “2”：中成药 “3”：中草药
				String ake003 = UtilFunc.getString(listFeeInfoDTORows.get(i),"ake003");
				String medi_item_type =  UtilFunc.getString(listFeeInfoDTORows.get(i),"medi_item_type");
				if (UtilFunc.isBlank(medi_item_type)){
					if ("2".equals(ake003)){
						listFeeInfoDTORows.get(i).put("medi_item_type","0");
					}else{
						listFeeInfoDTORows.get(i).put("medi_item_type","1");
					}
				}

                //退费数量、金额为负
				if ("1".equals(diagnoseInfoDTO.getQuery_flag())){
					listFeeInfoDTORows.get(i).put("money","-" + UtilFunc.getString(listFeeInfoDTORows.get(i),"money"));
					listFeeInfoDTORows.get(i).put("dosage","-" + UtilFunc.getString(listFeeInfoDTORows.get(i),"dosage"));
				}

				/*//调试代码，固定传特定药品
                listFeeInfoDTORows.get(i).put("his_item_code","N330407008_00");
                listFeeInfoDTORows.get(i).put("item_code","N330407008_00");
                listFeeInfoDTORows.get(i).put("his_item_name","远端通路导管lxd");
                listFeeInfoDTORows.get(i).put("medi_item_type","0");*/
			}
			//处理一下getDiagnose_date()末尾为逗号的问题
			if (this.getDiagnoseInfoDTO().getDiagnose_date().contains(",")){
				String diagnose_date = this.getDiagnoseInfoDTO().getDiagnose_date().split(",")[0];
				this.getDiagnoseInfoDTO().setDiagnose_date(diagnose_date);
			}

			List payinfoList = this.diagnoseRegisterService.diagnoseCalcSave_remote(this.getDiagnoseInfoDTO(),
					listFeeInfoDTORows);

			this.setJSONReturn("异地业务试算成功！", getPayinfoRemote(payinfoList));
		} catch (Exception e) {
			String errLogSn = this.addErrSNInfo();
			this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
					.append(this.addNotBlankParameters()).append(":处理结果:").toString());
			this.saveJSONError("异地业务试算失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
		}
		return NONE;
	}
	/**
	 * 修改概要：NTS20050700380-生育、门特业务省内异地联网结算需求 -- 湘潭
	 * 修改描述：增加异地门特结算
	 * 修改人及修改时间：李嘉伦 2020/5/8
	 */
    //异地门特生育结算
    public String diagnoseCalcEnPay_remote() {
        try {
            diagnoseInfoDTO.setHospital_id(BizHelper.getAkb020());
            diagnoseInfoDTO.setReg_staff(BizHelper.getLoginUser());
            diagnoseInfoDTO.setReg_man(BizHelper.getUserName());
            diagnoseInfoDTO.setReg_man(BizHelper.getUserName());
            if(UtilFunc.isBlank(diagnoseInfoDTO.getCenter_id())){
                diagnoseInfoDTO.setCenter_id(BizHelper.getAaa027());
            }
            String jsonFee = URLDecoder.decode(getParameter("feeinfo"), "UTF-8");
            JSONArray jsonArray = JSONArray.fromObject(jsonFee);
            List<Map> listFeeInfoDTORows = JSONArray.toList(jsonArray,new HashMap(), new JsonConfig());
            for (int i = 0; listFeeInfoDTORows != null && i < listFeeInfoDTORows.size(); i++) {
                listFeeInfoDTORows.get(i).put("input_staff", BizHelper.getLoginUser());
                listFeeInfoDTORows.get(i).put("input_man", BizHelper.getUserName());
                listFeeInfoDTORows.get(i).put("stat_type", "sz");   //文档上允许为空，实际不传回报错
                listFeeInfoDTORows.get(i).put("item_name", UtilFunc.getString(listFeeInfoDTORows.get(i),"his_item_name"));   //文档上允许为空，实际不传回报错
                listFeeInfoDTORows.get(i).put("fee_date", UtilFunc.getString(listFeeInfoDTORows.get(i),"input_date"));
                //时间格式转换 省直要求 yyyy-mm-dd hh:mi:ss
                String fee_date =  UtilFunc.getString(listFeeInfoDTORows.get(i),"fee_date");
				String fee_date1 = "";
				if (fee_date.length()==8){
					fee_date1 = fee_date.substring(0,4) + "-" + fee_date.substring(4,6) + "-" + fee_date.substring(6) + " 00:00:01";
				}else{
					fee_date1 = fee_date;
				}
                listFeeInfoDTORows.get(i).put("fee_date", fee_date1);

                //省直药品类别转换 “0”：诊疗项目 “1”：西药 “2”：中成药 “3”：中草药
                String ake003 = UtilFunc.getString(listFeeInfoDTORows.get(i),"ake003");
                String medi_item_type =  UtilFunc.getString(listFeeInfoDTORows.get(i),"medi_item_type");
                if (UtilFunc.isBlank(medi_item_type)){
					if ("2".equals(ake003)){
						listFeeInfoDTORows.get(i).put("medi_item_type","0");
					}else{
						listFeeInfoDTORows.get(i).put("medi_item_type","1");
					}
				}
				//退费数量、金额为负
				if ("1".equals(diagnoseInfoDTO.getQuery_flag())){
					listFeeInfoDTORows.get(i).put("money","-" + UtilFunc.getString(listFeeInfoDTORows.get(i),"money"));
					listFeeInfoDTORows.get(i).put("dosage","-" + UtilFunc.getString(listFeeInfoDTORows.get(i),"dosage"));
				}
                /*//调试代码，固定传特定药品
                listFeeInfoDTORows.get(i).put("his_item_code","N330407008_00");
                listFeeInfoDTORows.get(i).put("item_code","N330407008_00");
                listFeeInfoDTORows.get(i).put("his_item_name","远端通路导管lxd");
                listFeeInfoDTORows.get(i).put("medi_item_type","0");*/
            }
			//处理一下getDiagnose_date()末尾为逗号的问题
			if (this.getDiagnoseInfoDTO().getDiagnose_date().contains(",")){
				String diagnose_date = this.getDiagnoseInfoDTO().getDiagnose_date().split(",")[0];
				this.getDiagnoseInfoDTO().setDiagnose_date(diagnose_date);
			}
            List payinfoList = this.diagnoseRegisterService.diagnoseCalcEnPay_remote(this.getDiagnoseInfoDTO(),
                    listFeeInfoDTORows);
            this.setJSONReturn("异地业务收费成功！", getPayinfoRemote(payinfoList));
        } catch (Exception e) {
            String errLogSn = this.addErrSNInfo();
            this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
                    .append(this.addNotBlankParameters()).append(":处理结果:").toString());
            this.saveJSONError("异地业务收费失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
        }
        return NONE;
    }
    
    /**
     * 电子凭证效验机具设备
     * @return
     */
    public String checkAkb020() {
        try {
        	HttpServletRequest request = this.getRequest();
        	String organName = request.getParameter("organName");//医院名称
        	String organCode = request.getParameter("organCode");//医院编号
        	String poolareaCode = request.getParameter("poolareaCode");//统筹区编码
        	String toolType = request.getParameter("toolType");//扫码设备类型
        	//NTS20120101270   医保系统新增获取扫码设备SN码校验医保电子凭证设备准入需求(湘潭)
        	String sn_code = request.getParameter("sn_code");//sn序列码
        	if("0".equals(toolType) || "1".equals(toolType)) {
        		toolType = "1";//扫码墩扫码
        	}else if("2".equals(toolType)) {
        		toolType = "2"; //人脸识别
        	}else {
        		toolType = "3";//其他
        	}
        	
        	HashMap<String, Object> map = new HashMap<>();
        	map.put("organName",organName );
        	map.put("organCode",organCode );
        	map.put("poolareaCode",poolareaCode );
        	map.put("toolType",toolType );
        	//NTS20120101270   医保系统新增获取扫码设备SN码校验医保电子凭证设备准入需求(湘潭)
        	map.put("snCode",sn_code);
        	Map<String, Object> resultMap = this.diagnoseRegisterService.checkAkb020(map);
        
        	if(resultMap==null) {
        		this.saveJSONError("电子凭证机具设备验证失败");
        	}else {
        		if("0".equals(resultMap.get("code").toString())) {
        			logger.info("机具设备验证返回消息:"+resultMap.toString());
        			Object object = resultMap.get("data");
        			
        			if(object==null || object.toString() == null || "".equals(object.toString())) {
        				this.saveJSONError("验证失败,未获取到机具设备数据");	
        			}else {
        				List<Map<String, Object>> dataMaplist = (List<Map<String, Object>>) object;
        				Map<String, Object> dataMap = dataMaplist.get(0);
        				String organ_state = UtilFunc.getString(dataMap, "organ_state");//机构状态
        				String tool_state = UtilFunc.getString(dataMap, "tool_state");//机具状态
        				if(StringUtils.isBlank(organ_state) || "2".equals(organ_state)) {
        					//机构状态无效
        					this.saveJSONError("验证失败,该机构状态为无效");
        				}else if(StringUtils.isBlank(tool_state) || "2".equals(tool_state)) {
        					//机具状态无效
        					this.saveJSONError("验证失败,该机具状态为无效");
        				}else {
        					this.setJSONReturn("电子凭证机具设备验证成功！");
        				}
        				
        			}
        			
        		}else {
        			this.saveJSONError(resultMap.get("message").toString());
        		}
        			
        		  
        	}
            
            //this.getRequest().getpa
         
            //List payinfoList = this.diagnoseRegisterService.diagnoseCalcEnPay_remote(this.getDiagnoseInfoDTO(),
            //        listFeeInfoDTORows);
            //this.setJSONReturn("异地业务收费成功！", getPayinfoRemote(payinfoList));
        } catch (Exception e) {
            String errLogSn = this.addErrSNInfo();
            this.communalService.error(this.logger, e, new StringBuilder(errLogSn).append("入参:")
                    .append(this.addNotBlankParameters()).append(":处理结果:").toString());
            this.saveJSONError("电子凭证机具设备验证失败！\r\n" + errLogSn + (e.getMessage() == null ? "" : e.getMessage()));
        }
        return NONE;
    }

	/**
	 * 修改概要：NTS20050700380-生育、门特业务省内异地联网结算需求 -- 湘潭
	 * 修改描述：异地结算结果处理
	 * 修改人及修改时间：李嘉伦 2020/5/8
	 */
    private List getPayinfoRemote(List payinfoList){
        //特殊处理一下异地试算回参
        Double bcfy = 0.0;   //本次费用
        Double grzhzf = 0.0; //个人账户支付
        Double jjzf = 0.0;   //基金支付
        Double xjzf = 0.0;   //现金支付
        for (Object obj:payinfoList){
            Map map = (Map)obj;
            bcfy += Double.parseDouble(UtilFunc.getString(map,"real_pay"));
            if ("fund_pay".equals(UtilFunc.getString(map,"fund_name"))){
                jjzf += Double.parseDouble(UtilFunc.getString(map,"real_pay"));
            }
            if ("cash_pay_com".equals(UtilFunc.getString(map,"fund_name"))||"cash_pay_own".equals(UtilFunc.getString(map,"fund_name"))){
                xjzf += Double.parseDouble(UtilFunc.getString(map,"real_pay"));
            }
            if ("acct_pay_com".equals(UtilFunc.getString(map,"fund_name"))||"acct_pay_own".equals(UtilFunc.getString(map,"fund_name"))){
                grzhzf += Double.parseDouble(UtilFunc.getString(map,"real_pay"));
            }
        }

        List rtnList = new ArrayList();
        Map rtnMap = new HashMap();
        rtnMap.put("bcfy",bcfy);
        rtnMap.put("grzhzf",grzhzf);
        rtnMap.put("jjzf",jjzf);
        rtnMap.put("xjzf",xjzf);
        rtnList.add(rtnMap);
        return rtnList;
    }
    
   
}