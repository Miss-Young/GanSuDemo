package com.powersi.ssm.biz.medicare.diagnose.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.powersi.biz.medicare.diagnose.pojo.DiagnoseInfoDTO;

public interface DiagnoseRegisterService {

	/**
	 * 门诊 试算、收费、退费接口
	 */
	public static final String bizh110104 = "bizh110104";
	
	/**
	 * 获取科室信息接口
	 */
	public static final String bizh200001 = "bizh200001";
	
	/**
	 * 门诊试算
	 * @param diagnoseInfoDTO
	 * @param listFeeDTO
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List diagnoseCalcSave(DiagnoseInfoDTO diagnoseInfoDTO, List<Map> listFeeDTO);
	
	/**
	 * 门诊收费或退费
	 * @param diagnoseInfoDTO
	 * @param listFeeDTO
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List diagnoseCalcEnPay(DiagnoseInfoDTO diagnoseInfoDTO, List<Map> listFeeDTO);
	
	/**
	 * 加载科室信息
	 * @param hospInfoDto
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> queryHospDept();
	
	/**
	 * 加载病区信息
	 * @param hospInfoDto
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> queryHospArea(String akf001);
	
	/**
	 * 加载医生信息
	 * @param hospInfoDto
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> queryHospDoctor(String akf001);
	
	/**
	 * 支付宝渠道结算
	 * @param akf001
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List diagnoseCalcSaveAli(DiagnoseInfoDTO diagnoseInfoDTO, List<Map> listFeeDTO);

	/**
	 * 修改概要：NTS20050700380-生育、门特业务省内异地联网结算需求 -- 湘潭
	 * 修改描述：增加异地门特试算
	 * 修改人及修改时间：李嘉伦 2020/5/8
	 */
	public List diagnoseCalcSave_remote(DiagnoseInfoDTO diagnoseInfoDTO, List<Map> listFeeDTO);
	/**
	 * 修改概要：NTS20050700380-生育、门特业务省内异地联网结算需求 -- 湘潭
	 * 修改描述：增加异地门特结算
	 * 修改人及修改时间：李嘉伦 2020/5/8
	 */
	public List diagnoseCalcEnPay_remote(DiagnoseInfoDTO diagnoseInfoDTO, List<Map> listFeeDTO);

	/**
	 * 修改概要：NTS20050700380-生育、门特业务省内异地联网结算需求 -- 湘潭
	 * 修改描述：增加异地门特结算
	 * 修改人及修改时间：李嘉伦 2020/6/8
	 */
	public List chooseDisease_remote();
	
	/**
	 * 电子凭证查询器具设备 陈诗豪
	 * @param map
	 * @return
	 */
	public Map<String, Object> checkAkb020(HashMap<String, Object> map);
	
}
