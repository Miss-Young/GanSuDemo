package com.powersi.biz.medicare.medicalpage.service.api.mccc;

import java.io.Serializable;
import java.util.Map;

public interface MCCCbizxjg000021Service extends Serializable {

	public String serviceid = "BIZXJG000021";
	
	/**
	 * 删除生命体征信息
	 * @param mParas
	 * @return
	 */
	public int deleteVitalSignInfo(Map<String, Object> mParas);
}
