package com.powersi.ssm.biz.medicare.special.action;

import com.powersi.biz.medicare.comm.pojo.ListResult;
import com.powersi.biz.medicare.special.pojo.SpecialManagerDTO;
import com.powersi.biz.medicare.special.service.SpecialManagerService;
import com.powersi.comm.service.memory.MemoryDB;
import com.powersi.hygeia.comm.service.HygeiaServiceManager;
import com.powersi.hygeia.framework.exception.HygeiaException;
import com.powersi.hygeia.framework.util.Base64;
import com.powersi.hygeia.framework.util.CodetableHelper;
import com.powersi.hygeia.web.BaseAction;
import com.powersi.hygeia.web.util.DataGridHelper;
import com.powersi.pcloud.dict.service.DictService;
import com.powersi.ssm.biz.medicare.common.util.BizHelper;
import com.powersi.ssm.biz.medicare.common.util.SFTPUtils;
import com.powersi.ssm.biz.medicare.special.service.SpecialManagerLocalService;
import com.powersi.sys.util.PagerHelper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Action(value = "specialManager", results = {
		@Result(name = "applyListPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/applyListPage_${dto.pageFlag}.jsp"),     //新增申请分页查询页面
		@Result(name = "applyAddPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/applyAddPage_${dto.pageFlag}.jsp"),       //新增申请页面
		@Result(name = "applyModifyPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/applyModifyPage_${dto.pageFlag}.jsp"), //申请修改页面
		@Result(name = "queryListPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/queryListPage_${dto.pageFlag}.jsp"),     //申请分页查询页面
		@Result(name = "queryListPageNew", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/queryListPage_new.jsp"),     //申请分页查询页面
		@Result(name = "queryDetailPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/queryDetailPage_${dto.pageFlag}.jsp"), //申请查询详情页面
		@Result(name = "queryDetailPageNew", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/queryDetailPage_new.jsp"), //申请查询详情页面
		@Result(name = "applyBatchAddPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/applyBatchAddPage_${dto.pageFlag}.jsp"), //批量申请页面
		@Result(name = "choosePersonPage", location = "/pages/biz/medicare/special/choosePersonForSpecial.jsp"), //人员选择窗口
		@Result(name = "applyModifyDDPage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/applyModifyDDPage_${dto.pageFlag}.jsp"), //申请修改页面
		@Result(name = "applyModifyDiseasePage", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/applyModifyDiseasePage_${dto.pageFlag}.jsp"), //并发症修改页面
		@Result(name = "specialPrint", location = "/pages/biz/medicare/special/SpecialPrint.jsp"), //申请修改页面
		@Result(name = "openBiz", location = "/pages/biz/medicare/special/applytype${dto.pageFlag}/openBiz_${dto.pageFlag}.jsp"), //查询结算业务页面
		@Result(name = "getPersonList", location = "/pages/biz/medicare/special/applytype13/specialChoosePerson.jsp"), //选择人员页面
		@Result(name = "applyUploadPage", location = "/pages/biz/medicare/special/applytype13/applyUploadPage.jsp"), //资料上传页面
		@Result(name = "error_13", location = "/pages/biz/medicare/special/Error.jsp") //错误提示页面
		})


public class SpecialManagerAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private HygeiaServiceManager hygeiaServiceManager;
	private SpecialManagerDTO dto;
	@Autowired
	private SpecialManagerLocalService specialManagerLocalService;

	@Autowired
	private MemoryDB memoryDB;

	@Autowired
	private DictService dictService;

	private File imgFile;// 上传文件
	protected List<File> filename;

	private static final int FILE_CACHE_TIMEOUT = 60 * 30; //文件上传时保存缓存的超时时间，单位秒

	public List<File> getFilename() {
		return filename;
	}

	public void setFilename(List<File> filename) {
		this.filename = filename;
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	//******返回页面 begin***************************

	/**
	 *
	 * @Description 查询结算业务界面
	 * @Date 2018年11月27日下午3:10:26
	 * @return
	 */
	public String openBiz(){
		return "openBiz";
	}

	public String getApplyListPage() {
		pageFlagCost(dto);
		//对医院权限进行校验，门特和大病特药
		if(dto.getPageFlag().matches("13|180")){
			dto.setAkb005("1");
			dto.setAaa027(BizHelper.getAaa027());
			dto.setPageSize(10000000);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			ListResult result = specialManagerService.getHospInfList(dto);
			List hospList = result.getList();
			String akb020 = BizHelper.getAkb020();
			boolean flag = true;
			for(Map m:(List<Map>)hospList){
				if(akb020.equals(m.get("akb020"))){
					flag = false;
					break;
				}
			}
			if(flag){
				return "error_13";
			}
		}

		return "applyListPage";
	}

	public String getApplyAddPage() {
		initParam(dto);
		pageFlagCost(dto);
		//得到政策值
		SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
		dto.setBizpolicys(specialManagerService.getPolicys(dto));
		return "applyAddPage";
	}

	public String getApplyModifyPage() {
		//TS19072500081 - 【需求开发】核三系统安全测评相关漏洞修复  zhuli 2019/7/25
		dto.setAkb020(BizHelper.getAkb020());

		initParam(dto);
		pageFlagCost(dto);
		SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
		dto = specialManagerService.getSpeAppInfDetail(dto);
		//得到政策值
		dto.setBizpolicys(specialManagerService.getPolicys(dto));
		if("101".equals(dto.getComFlag())){
			return "applyModifyDDPage";
		}else if("102".equals(dto.getComFlag())){
			return "applyModifyDiseasePage";
		}else{
			return "applyModifyPage";
		}
	}

	public String getQueryListPage() {
		pageFlagCost(dto);
		//对医院权限进行校验，门特和大病特药
		if(dto.getPageFlag().matches("13|180")){
			if("13".equals(dto.getPageFlag()) && "101".equals(dto.getComFlag())){
				dto.setAka130("13");
			}else{
				dto.setAkb005("1");
			}
			dto.setAaa027(BizHelper.getAaa027());
			dto.setPageSize(10000000);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			ListResult result = specialManagerService.getHospInfList(dto);
			List hospList = result.getList();
			String akb020 = BizHelper.getAkb020();
			boolean flag = true;
			for(Map m:(List<Map>)hospList){
				if(akb020.equals(m.get("akb020"))){
					flag = false;
					break;
				}
			}
			if(flag){
				return "error_13";
			}
		}
		if("131A".equals(dto.getAka083LisStr())){
			initParam(dto);
			dto.setAka083LisStr("131");
			return "queryListPageNew";
		}
		return "queryListPage";
	}

	public String getQueryDetailPage() {
		try {
			//修改概要：TS19080600119 - 【问题修复】转诊转院申请查询--点击详细报错，申请详情查询出错
			//修改描述：点击 详情 如果没有akb020的值会抛空指针异常，这里加一个取akb020
			//修改人及修改时间：李嘉伦 20190809
			dto.setAkb020(BizHelper.getAkb020());
			pageFlagCost(dto);
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			dto = specialManagerService.getSpeAppInfDetail(dto);
			if("1".equals(dto.getKcc601())){
				return "queryDetailPageNew";
			}
			return "queryDetailPage";
		} catch (Exception e) {
			return renderError("申请详情查询出错", e);
		}
	}


	public String getApplyBatchAddPage() {
		return "applyBatchAddPage";
	}

	public String getChoosePersonPage() {
		return "choosePersonPage";
	}
	//******返回页面 end***************************

	//获取主页面信息
	public void getSpeAppInfList() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			PagerHelper.initPagination(getRequest());
			ListResult result = specialManagerService.getSpeAppInfList(dto);
			PagerHelper.renderDataGrid(getRequest(), getResponse(), result);
		} catch (Exception e) {
			saveJSONError("申请信息查询出错！", e);
		}
	}


	/**
	 * <p>Title: addSpeAppInf</p>
	 * <p>Description: 新增特殊业务申请</p>
	 * @author lb
	 * @date 2018年7月10日
	 * @return 申请修改页面
	 */
	@SuppressWarnings("unchecked")
	public String addSpeAppInf() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			dto.setAae011(BizHelper.getUserName());	//经办人
			// 保存门特申请资料文件
			String kcc601 = dto.getKcc601();
			if ("131".equals(dto.getBka006()) && StringUtils.isNotBlank(kcc601)) {
				String akb020 = BizHelper.getAkb020();
				Long aac001 = dto.getAac001();
				Map<String, String> imgMap = new HashMap<>();
				for (int i = 0; i < 3; i++) {
					String cacheKey = kcc601 + "_" + i;
					Map<String, String> cachedImgMap = (Map<String, String>) memoryDB.get(cacheKey);
					if (MapUtils.isNotEmpty(cachedImgMap)) {
						cachedImgMap.forEach((String k, String v) ->
								imgMap.put(akb020 + "_" + aac001 + "_" + cacheKey + "_" + k, v.substring(v.indexOf(",")+1))
						);
					}
				}
				if(MapUtils.isEmpty(imgMap)){
					throw new HygeiaException("请至少上传一种资料！");
				}
				// key组成 akb020_aac001_kcc601_kcc602_kcc603|kcc604
				Map<String, String> imgFileSavedMap = SFTPUtils.uploadImageForBase64(imgMap);
				if (MapUtils.isNotEmpty(imgFileSavedMap)) {
				  	StringBuilder kcc605 = new StringBuilder();
					for (Map.Entry<String, String> entry : imgFileSavedMap.entrySet()) {
						kcc605.append(entry.getKey()).append("*").append(entry.getValue()).append(":");
					}
					dto.setKcc605(kcc605.substring(0, kcc605.length() - 1));
				}
			}
			SpecialManagerDTO specialManagerDTO = specialManagerService.addSpeAppInf(dto);
			setJSONReturn(specialManagerDTO);
		} catch (Exception e) {
			saveJSONError("保存申请信息出错：" + e.getMessage(), e);
		}
		return NONE;
	}

	/**
	 * TS19082800090 - 【需求开发】结算云在A医院做了普通住院申请，没有在A医院登记住院，想在B医院住院时做申请提示申请时间重叠，无法再次申请。  zhuli 2019.08.28
	 * @Description 普通住院申请新增前校验
	 * @author Zhu Li
	 * @Date 2019年8月28日下午2:45:03
	 * @return
	 */
	public String verifyRepeat_120(){
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			dto.setAae011(BizHelper.getUserName());	//经办人
			setJSONReturn(specialManagerService.verifyRepeat(dto));
		} catch (Exception e) {
			saveJSONError("检验申请信息出错：" + e.getMessage(), e);
		}
		return NONE;
	}

	//修改申请
	public String modifySpeAppInf() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			setJSONReturn(specialManagerService.modifySpeAppInf(dto));
		} catch (Exception e) {
			saveJSONError("修改申请信息出错：" + e.getMessage(), e);
		}
		return NONE;
	}


	/**
	 * <p>Title: deleteSpeAppInf</p>
	 * <p>Description: 删除申请</p>
	 * @author lb
	 * @date 2018年7月11日
	 * @param dto
	 * @return String success / 错误信息
	 */
	public String deleteSpeAppInf() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			specialManagerService.deleteSpeAppInf(dto);
			setJSONReturn("删除申请信息成功！");
		} catch (Exception e) {
			saveJSONError("删除申请信息出错：" + e.getMessage());
			return NONE;
		}
		return NONE;
	}


	/**
	 * <p>Title: getOtherAppInfList</p>
	 * <p>Description: 获取申请关联的定点医疗机构、药品/项目、疾病信息。用comFlag区分</p>
	 * @author lb
	 * @date 2018年7月12日
	 * @return
	 */
	public void getOtherAppInfList() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			PagerHelper.initPagination(getRequest());
			ListResult result = specialManagerService.getOtherAppInfList(dto);
			PagerHelper.renderDataGrid(getRequest(), getResponse(), result);
		} catch (Exception e) {
			saveJSONError("获取申请关联的信息查询出错：" + e.getMessage());
		}
	}


	/**
	 * <p>Title: getdrugInfList</p>
	 * <p>Description: 获取药品项目信息</p>
	 * @author lb
	 * @date 2018年7月12日
	 * @return
	 */
	public void getdrugInfList() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			PagerHelper.initPagination(getRequest());
			ListResult result = specialManagerService.getdrugInfList(dto);
			PagerHelper.renderDataGrid(getRequest(), getResponse(), result);
		} catch (Exception e) {
			saveJSONError("药品信息查询出错：" + e.getMessage());
		}
	}


	/**
	 * <p>Title: getDiseaseInfList</p>
	 * <p>Description: 获取疾病信息</p>
	 * @author lb
	 * @date 2018年7月13日
	 * @return
	 */
	public void getDiseaseInfList() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			PagerHelper.initPagination(getRequest());
			ListResult result = specialManagerService.getDiseaseInfList(dto);
			PagerHelper.renderDataGrid(getRequest(), getResponse(), result);
		} catch (Exception e) {
			saveJSONError("疾病信息查询出错：" + e.getMessage());
		}
	}

	/**
	 *
	 * <p>code:TS18092600064 - 【需求开发】湖南城乡一体化医保项目系统研发</p>
	 * <p>Title:getDiseaseLimit  </p>
	 * <p>Description:查询疾病分型限额相关</p>
	 * @author tjb
	 * @date 2018年9月26日
	 * @return
	 * String
	 */
	public String getDiseaseLimit() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			return renderGrid(specialManagerService.getDiseaseLimit(dto));
		} catch (Exception e) {
			saveJSONError("疾病信息查询出错：" + e.getMessage());
		}
		return NONE;
	}


	/**
	 * <p>Title: getHospInfList</p>
	 * <p>Description: 医疗机构信息查询</p>
	 * @author lb
	 * @date 2018年7月14日
	 * @return
	 */
	public void getHospInfList() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			PagerHelper.initPagination(getRequest());
			ListResult result = specialManagerService.getHospInfList(dto);
			PagerHelper.renderDataGrid(getRequest(), getResponse(), result);
		} catch (Exception e) {
			saveJSONError("医疗机构信息查询出错：" + e.getMessage());
		}
	}


	/**
	 * <p>Title: creatApplyPrintInfo</p>
	 * <p>Description: 申请打印页面</p>
	 * @author lb
	 * @date 2018年7月25日
	 * @return
	 */
	/*public String creatApplyPrintInfo(){
		try{
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());		
			String str=specialManagerService.loadJsdModule(dto);
			setJSONReturn(str);
			//responseClient(specialManagerService.loadJsdModule(dto), getResponse());
		}catch (Exception e) {
			saveJSONError("生成申请打印信息出错："+ e.getMessage());
			return NONE;
	    }
		return NONE;
	}*/
	public String creatApplyPrintInfo(){
		try{
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			getRequest().setAttribute("reportIDfirst", specialManagerLocalService.loadJsdModule(specialManagerService.getPrintData(dto), dto));
		}catch (Exception e) {
			saveJSONError("生成申请打印信息出错："+ e.getMessage());
			return ERROR;
	    }
		return "specialPrint";
	}

	/**
	 * <p>Title: verifyAfterQuery</p>
	 * <p>Description: 在查询人员之后校验信息，并返回数据</p>
	 * @author tjb
	 * @date 2018年8月01日
	 * @return
	 */
	public String verifyAfterQuery() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			setJSONReturn(specialManagerService.verifyAfterQuery(dto));
		} catch (Exception e) {
			saveJSONError("校验不通过：" + e.getMessage());
			return NONE;
		}
		return NONE;
	}
	/**
	 *
	 * @code:TS18102300165 - 【需求开发】湖南城乡一体化医保项目系统研发
	 * @Title:getPersonInfo
	 * @Description:结算云获取人员信息，包括校验verifyAfterQuery
	 * @author tjb
	 * @date 2018年10月23日
	 * @return
	 * String
	 */
	@SuppressWarnings("rawtypes")
	public String getPersonInfo() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			List<Map> personList = specialManagerService.getPersonInfo(dto);

            String comFlag = dto.getComFlag();
			if (CollectionUtils.isNotEmpty(personList) && personList.size() == 1 &&
					StringUtils.isNotBlank(comFlag) && comFlag.matches("131|131A")) {
				String districtList = dictService.getValue("SPECIAL_BIZ_PARAM", "INCLUDED_DISTRICT_LIST", "430399");
				String baa027 = (String) personList.get(0).get("baa027");
				boolean flag = Arrays.asList(districtList.split(",")).contains(baa027);
				if (flag && !"131A".equals(comFlag)) {
					throw new HygeiaException("该参保人所在统筹区门特业务申请必须上传资料！");
				}
				if (!flag && "131A".equals(comFlag)) {
					throw new HygeiaException("该参保人所在统筹区门特业务申请不需要上传资料！");
				}
			}
			setJSONReturn(personList);
		} catch (Exception e) {
			saveJSONError("校验不通过：" + e.getMessage());
			return NONE;
		}
		return NONE;
	}

	public String getChoosePersonInfo() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			List<Map> result = specialManagerService.getPersonInfo(dto);
			PagerHelper.initPagination(getRequest());
			PagerHelper.getPaginationObj().setCount(result.size());
			DataGridHelper.render(this.getRequest(), this.getResponse(),
					PagerHelper.getPaginatedList(result));
		} catch (Exception e) {
			saveJSONError("人员信息查询出错：" + e.getMessage());
		}
		return NONE;
	}

	/**
	 * <p>Title: getTemplatePath</p>
	 * <p>Description: 获取模板路径</p>
	 * @author lb
	 * @date 2018年7月30日
	 * @return
	 */
	public String getTemplatePath() {
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			setJSONReturn(specialManagerService.getTemplatePath(dto));
		} catch (Exception e) {
			saveJSONError("获取模板路径出错：" + e.getMessage(), e);
		}
		return NONE;
	}
	/**
	 * 应答客户端
	 * @param parameter
	 * void
	 */
	private void responseClient(String parameter,HttpServletResponse response) {
		//通过response传参,填充response
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {
		    out = response.getWriter();
		    out.write(parameter);
		} catch (IOException e) {
			// LogHelper.getLogger().error("DownloadReportHtmlServlet类填充response出错!", e);
		} finally {
		    if (out != null) {
		        out.close();
		    }
		}
	}


	/**
	 * <p>Title: pageFlagCost</p>
	 * <p>Description: </p>
	 * @author lb
	 * @date 2018年8月16日
	 * @param dto
	 */
	public void pageFlagCost(SpecialManagerDTO dto) {
		if(null != dto.getPageFlag() && !"".equals(dto.getPageFlag())) {
			if (null == dto.getAka083()&&",131,132,133,120,180,".indexOf(","+dto.getPageFlag()+",") != -1) {//增加或审核页面增加政策值
				dto.setAka083(dto.getPageFlag());
			}
			if("131,132,133".indexOf(dto.getPageFlag()) != -1) {
				dto.setPageFlag("13");
			}

			// 门特申请增加资料上传、审核
			if("131A".equalsIgnoreCase(dto.getPageFlag())){
				dto.setComFlag(dto.getPageFlag());
				dto.setPageFlag("13");
				dto.setAka083("131");
				dto.setKcc601(UUID.randomUUID().toString());
			}
		}
	}
	/**
	 *
	 * @code:TS18102300165 - 【需求开发】湖南城乡一体化医保项目系统研发
	 * @Title:initParam
	 * @Description:初审化参数：caa027
	 * @author tjb
	 * @date 2018年10月24日
	 * @param dto
	 * void
	 */
	private void initParam(SpecialManagerDTO dto) {
		Map<String, Object> caa027 = CodetableHelper.get("caa027");
		if (caa027 != null && caa027.keySet().size() == 1) {
			dto.setCaa027(caa027.keySet().toArray(new String[caa027.keySet().size()])[0]);
		}
		if(dto.getAaa027()==null||"".equals(dto.getAaa027())){
			dto.setAaa027(BizHelper.getAaa027());
		}
	}


	public SpecialManagerDTO getDto() {
		return dto;
	}

	public void setDto(SpecialManagerDTO dto) {
		this.dto = dto;
	}

	/**
	 *
	 * @Description 查询结算业务信息
	 * @Date 2018年11月27日下午3:26:32
	 * @return
	 */
	public void queryBizFin(){

		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			//分页处理
			PagerHelper.initPagination(getRequest());
			ListResult result = specialManagerService.queryBizFin(dto);
			PagerHelper.renderDataGrid(getRequest(), getResponse(), result);
		} catch (Exception e) {
			saveJSONError("查询结算业务信息出错：" + e.getMessage());
		}

	}

	/**
	 * @Description: 查询人员信息集合
	 * @author: xiexiao
	 * @date: 2019年1月16日
	 * @return
	 */
	public String getPersonList() {
		Map param = getAllParameters();
		param.put("aaa027", BizHelper.getAaa027());
		SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
		List rsPersonList = specialManagerService.getPersonInfo(param);
		setAttribute("rsPersonList", rsPersonList);
		return "getPersonList";
	}

	/**
	 * @Description: 查询人员信息集合
	 * @author: xiexiao
	 * @date: 2019年1月16日
	 * @return
	 */
	public String getPersonSize() {
		Map<String, Object> retMsg = new HashMap<String, Object>();

		Map param = getAllParameters();
		param.put("aaa027", BizHelper.getAaa027());
		SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());

		List rsPersonList = specialManagerService.getPersonInfo(param);
		retMsg.put("rowsize",rsPersonList == null ? "0":rsPersonList.size());
		if(rsPersonList != null && rsPersonList.size() == 1){
			retMsg.put("persinfo", rsPersonList.get(0));
		}

		try {
			setJSONReturn(retMsg);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return NONE;
	}

	/**
	 * 上传文件
	 *
	 * @return NONE/applyUploadPage
	 */
	@SuppressWarnings("unchecked")
	public String uploadFile() {
		if (isPostRequest()) {
			try {
				String kcc601 = dto.getKcc601();
				Map<String, List<String>> imgMap = new HashMap<>();
				// 1、加载缓存中的图像
				for (int i = 0; i < 3; i++) {
					Map<String, String> imgTempMap = (Map<String, String>) memoryDB.get(kcc601 + "_" + i);
					if (MapUtils.isNotEmpty(imgTempMap)) {
						List<String> imgList = new ArrayList<>();
						imgTempMap.forEach((String key, String value) -> imgList.add(value));
						imgMap.put("imgList_" + i, imgList);
					}
				}
				// 2、加载已保存的图像
				initParam(dto);
				SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
				List<Map> kcc6List = specialManagerService.getKcc6Info(dto);
				for (Map kcc6 : kcc6List) {
					String kcc6id = (String) kcc6.get("kcc6id"); //文件存储路径
					String kcc605 = (String) kcc6.get("kcc605"); //文件存储路径
					String kcc604 = (String) kcc6.get("kcc604"); //文件名称
					String kcc602 = (String) kcc6.get("kcc602"); //文件类型
					String imgFileStr = SFTPUtils.downloadImageForBase64(kcc605);
					String imgBase64Str = kcc605 + "+" +kcc6id + "|data:image/" + kcc604.substring(kcc604.indexOf(".") + 1) + ";base64," + imgFileStr;
					String imgListKey = "imgList_" + kcc602;
					if(imgMap.containsKey(imgListKey)) {
						imgMap.get(imgListKey).add(imgBase64Str);
					}else{
						List<String> imgList = new ArrayList<>();
						imgList.add(imgBase64Str);
						imgMap.put(imgListKey, imgList);
					}
				}
				setJSONReturn(imgMap);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return NONE;
		} else {
			return "applyUploadPage";
		}
	}

	/**
	 * 删除保存的图像
	 *
	 * @return NONE
	 */
	@SuppressWarnings("unchecked")
	public String deleteFile() {
		try {
			String kcc605 = dto.getKcc605();
			String kcc6id = dto.getKcc6id();
			if(StringUtils.isNotBlank(kcc605)&& StringUtils.isNotBlank(kcc6id)){
				initParam(dto);
				SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
				dto.setAae100("0");
				specialManagerService.updateKcc6(dto);
				SFTPUtils.deleteFile(kcc605);
			}else {
				String kcc601 = dto.getKcc601();
				String kcc602 = dto.getKcc602();
				String kcc603 = dto.getKcc603();
				Map<String, String> imgMap = (Map<String, String>) memoryDB.get(kcc601 + "_" + kcc602);
				if (MapUtils.isNotEmpty(imgMap)) {
					imgMap.remove(kcc603);
					memoryDB.set(kcc601 + "_" + kcc602, FILE_CACHE_TIMEOUT, imgMap);
				}
			}
			setJSONReturn(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}

	/**
	 * 保存文件
	 *
	 * @return NONE
	 */
	@SuppressWarnings("unchecked")
	public String saveFile() {
		try {
				String kcc601 = dto.getKcc601();
				String kcc602 = dto.getKcc602();
				String kcc604 = dto.getKcc604();

				if ("1".equals(dto.getComFlag()) && CollectionUtils.isNotEmpty(filename)) {
					imgFile = filename.get(0);
				}

				if (imgFile != null) {
					FileInputStream is = new FileInputStream(imgFile);
					String suffix = "";

					byte[] bkc292 = FileCopyUtils.copyToByteArray(is);
					if (bkc292 == null || bkc292.length == 0) {
						setJSONReturn("文件不能为空！");
						return NONE;
					}
					if (StringUtils.isNotBlank(kcc604)) {
						suffix = kcc604.substring(kcc604.indexOf(".") + 1);
						if (!suffix.matches("bmp|jpg|png|tif|gif")) {
							throw new HygeiaException("请上传正确的图片，格式为（bmp|jpg|png|tif|gif）！");
						}
					}
					String imgBase64Str = new String(Base64.encodeBase64(bkc292));

					String imgSaveKey = kcc601 + "_" + kcc602;
					Map<String, String> cachedImgMap = (Map<String, String>) memoryDB.get(imgSaveKey);
					if (MapUtils.isEmpty(cachedImgMap)) {
						cachedImgMap = new HashMap<>();
					}
					String imgIndex = getImgIndex(cachedImgMap);
					String imgCache = imgIndex + "|data:image/" + suffix + ";base64," + imgBase64Str;
					cachedImgMap.put(imgIndex + "|" + kcc604, imgCache);
					memoryDB.set(imgSaveKey, FILE_CACHE_TIMEOUT, cachedImgMap);

					Map<String, Object> map = new HashMap<>();

					map.put("imgFile", imgCache);
					map.put("imgType", kcc602);
					setJSONReturn(map);
			}
		} catch (Exception e) {
			saveJSONError("保存失败:" + e);
		}
		return NONE;
	}

	/**
	 * 门特资料上传审核时，获取全部图像
	 *
	 * @return NONE
	 */
	@SuppressWarnings("rawtypes")
	public String queryAllImg() {
		initParam(dto);
		SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
		List<Map> kcc6List = specialManagerService.getKcc6Info(dto);

		Map<String, List<String>> imgMap = new HashMap<>();

		List<String> imgList0 = new ArrayList<>();
		List<String> imgList1 = new ArrayList<>();
		List<String> imgList2 = new ArrayList<>();
		try {
			for (Map kcc6 : kcc6List) {
				String kcc605 = (String) kcc6.get("kcc605"); //文件存储路径
				String kcc604 = (String) kcc6.get("kcc604"); //文件名称
				String kcc603 = (String) kcc6.get("kcc603"); //文件序号
				String kcc602 = (String) kcc6.get("kcc602"); //文件类型
				String imgFileStr = SFTPUtils.downloadImageForBase64(kcc605);
				String imgBase64Str = kcc603 + "|data:image/" + kcc604.substring(kcc604.indexOf(".") + 1) + ";base64," + imgFileStr;
				switch (kcc602) {
					case "0":
						imgList0.add(imgBase64Str);
						break;
					case "1":
						imgList1.add(imgBase64Str);
						break;
					case "2":
						imgList2.add(imgBase64Str);
						break;
					default:
						break;
				}
			}
			if (CollectionUtils.isNotEmpty(imgList0)) {
				imgMap.put("imgList_0", imgList0);
			}
			if (CollectionUtils.isNotEmpty(imgList0)) {
				imgMap.put("imgList_1", imgList1);
			}
			if (CollectionUtils.isNotEmpty(imgList0)) {
				imgMap.put("imgList_2", imgList2);
			}
			setJSONReturn(imgMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}

	public String updateKcc6(){
		try {
			initParam(dto);
			SpecialManagerService specialManagerService = hygeiaServiceManager.getBeanByClass(SpecialManagerService.class, BizHelper.getAkb020());
			specialManagerService.updateKcc6(dto);
			setJSONReturn(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	/**
	 * 设置单个缓存中图像的key值，方便存储
	 *
	 * @param cachedImgMap 图像缓存
	 * @return 新key值
	 */
	private String getImgIndex(Map<String, String> cachedImgMap) {
		int addKey = 1;
		if (MapUtils.isNotEmpty(cachedImgMap)) {
			addKey = cachedImgMap.size() + 1;
			while (cachedImgMap.containsKey(String.valueOf(addKey))) {
				addKey++;
			}
		}
		return String.valueOf(addKey);
	}
}
