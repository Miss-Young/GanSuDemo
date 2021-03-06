package com.powersi.biz.medicare.inhospital.pojo;

import com.powersi.biz.medicare.comm.pojo.RemotingDTO;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 
 * @author 刘勇
 *
 */
public class BizDTO extends RemotingDTO {

	private static final long serialVersionUID = 1L;

	private String kcd1id;
	
	private String kcd7id;
	
	private String kcd8id;

	private String akb020;

	private String aaz217;

	private Long bka001;// 费用批次

	private Long bka009;

	private String aka130;

	private Long bka002;

	private String baa027;

	private Long aac001;

	private String aac003;

	private String aac004;

	private String bka004;

	/**
	 * 公务员级别
	 */
	private String bka005;

	private String aac002;

	private String bka100;

	private String akb021;

	private Integer aac006;

	private String aae005;

	private Long aab001;

	private String bka008;

	private String aab019;

	private String bka006;

	private Long bka010;

	private String bka011;

	private String bka012;

	private String aaz267;

	private Date bka013;

	private String bka014;

	private String bka015;

	private String bka016;

	private Integer aae030;	//开始日期

	private Integer aae031;	//结束日期
	
	private String bka018;

	private String bka019;

	private String bka020;

	private String bka021;

	private String bka022;

	private String ake020;

	private String bka024;

	private String akc190;

	private String akc193;
	
	private String bkz101;

	private BigDecimal bka245;

	private Date bka028;

	private String bka029;

	private Long bka030;

	private String bka031;

	private Date bka032;// 业务结束日期

	private String bka033;// varchar(20) comment '结束人工号',

	private String bka034;// varchar(50) comment '结束人',

	private String bka035;

	private String bka036;

	private String bka037;

	private Date bka038;

	private String bka039;// 完成标志(诊次结束标志)

	private String bka040;

	private String bka041;

	private Long bka042;

	private String ake024;

	private String bka044;

	private String aaa027;

	private String aae140;

	private String bka414;

	private String bka415;

	private String bae009;

	private String baf313;

	private String aae006;

	private String bka501;

	private String bka502;

	private String bka503;

	private Date bka504;

	private Date bka505;

	private Date bka506;

	private Long bka507;

	private Long bka508;

	private Long bka509;

	private String bka510;

	private String bka072;
	
	private String bke301;
	
	private String aka101;
	
	private String aka030;
	
	private String akf001;
	
	private String ake022;
	
	private String bka061;
	
	private String aae004;
	
	private Date aae036;
	
	private String caa027;
	
	private String kcd2id;
	
	private Date akc194;
	
	private String aaa157;
	
	private String bka432;
	
	private String aka002;
	
	private BigDecimal aae019;
	
	private String aac148;
	
	private String bac001;
	
	private String bacu18;//帐户余额
	
	private String aae240;//个账支付
	
	private String bke054;//一站式结算标志
	
	private String ake025;//手术治疗方式
	
	private String bka078;//业务渠道类型
	
	private String akc196;
	
	private String bkz102;
	
	private String bke306;
	
	private String aaf013; //乡镇编码
	
	private String aaz070; //村社区ID
	
	private String baf003; //组ID
	
    private String aaf014; //乡镇编码
	
	private String aaz071; //村社区ID
	
	private String baf005; //组ID
	
	private String aae011;  //就诊登记工号
	
	private String onestep_hosp_district_flag; //县域内县域外标志
	
	private String aaz267_standardize; //转诊申请序列号

	private String aae139;	//报账类型 1-普通报账 2-大类报账 3-汇总报账

	//TS19102100146 - 湘潭县分级诊疗相关政策调整【业务实现】
    //增加一个aka241 用以存储分级诊疗的差别化支付字段 add by 李嘉伦 20191024
    private String aka241;
    
    public String getAka241() {
    	return aka241;
    }

	public String getAae139() {
		return aae139;
	}

	public void setAae139(String aae139) {
		this.aae139 = aae139;
	}

    public void setAka241(String aka241) {
    	this.aka241 = aka241;
    }
	
	/**
	 * @return the aaz267_standardize
	 */
	public String getAaz267_standardize() {
		return aaz267_standardize;
	}

	/**
	 * @param aaz267_standardize the aaz267_standardize to set
	 */
	public void setAaz267_standardize(String aaz267_standardize) {
		this.aaz267_standardize = aaz267_standardize;
	}

	/**
	 * @return the onestep_hosp_district_flag
	 */
	public String getOnestep_hosp_district_flag() {
		return onestep_hosp_district_flag;
	}

	/**
	 * @param onestep_hosp_district_flag the onestep_hosp_district_flag to set
	 */
	public void setOnestep_hosp_district_flag(String onestep_hosp_district_flag) {
		this.onestep_hosp_district_flag = onestep_hosp_district_flag == null ? null : onestep_hosp_district_flag.trim();
	}

	public String getAae011()
	{
		return aae011;
	}

	public void setAae011(String aae011)
	{
		this.aae011 = aae011;
	}

	/**
	 * @return the aaf014
	 */
	public String getAaf014() {
		return aaf014;
	}

	/**
	 * @param aaf014 the aaf014 to set
	 */
	public void setAaf014(String aaf014) {
		this.aaf014 = aaf014;
	}

	/**
	 * @return the aaz071
	 */
	public String getAaz071() {
		return aaz071;
	}

	/**
	 * @param aaz071 the aaz071 to set
	 */
	public void setAaz071(String aaz071) {
		this.aaz071 = aaz071;
	}

	/**
	 * @return the baf005
	 */
	public String getBaf005() {
		return baf005;
	}

	/**
	 * @param baf005 the baf005 to set
	 */
	public void setBaf005(String baf005) {
		this.baf005 = baf005;
	}

	/**
	 * @return the aaf013
	 */
	public String getAaf013() {
		return aaf013;
	}

	/**
	 * @param aaf013 the aaf013 to set
	 */
	public void setAaf013(String aaf013) {
		this.aaf013 = aaf013;
	}

	/**
	 * @return the aaz070
	 */
	public String getAaz070() {
		return aaz070;
	}

	/**
	 * @param aaz070 the aaz070 to set
	 */
	public void setAaz070(String aaz070) {
		this.aaz070 = aaz070;
	}

	/**
	 * @return the baf003
	 */
	public String getBaf003() {
		return baf003;
	}

	/**
	 * @param baf003 the baf003 to set
	 */
	public void setBaf003(String baf003) {
		this.baf003 = baf003;
	}

	public String getBke306() {
		return bke306;
	}

	public void setBke306(String bke306) {
		this.bke306 = bke306;
	}

	public String getAkc196() {
		return akc196;
	}

	public void setAkc196(String akc196) {
		this.akc196 = akc196;
	}

	public String getBkz102() {
		return bkz102;
	}

	public void setBkz102(String bkz102) {
		this.bkz102 = bkz102;
	}

	public String getBka078() {
		return bka078;
	}

	public void setBka078(String bka078) {
		this.bka078 = bka078;
	}

	public String getAke025() {
		return ake025;
	}

	public void setAke025(String ake025) {
		this.ake025 = ake025;
	}

	public String getBke054() {
		return bke054;
	}

	public void setBke054(String bke054) {
		this.bke054 = bke054;
	}

	public String getAae240() {
		return aae240;
	}

	public void setAae240(String aae240) {
		this.aae240 = aae240;
	}

	public String getBacu18() {
		return bacu18;
	}

	public void setBacu18(String bacu18) {
		this.bacu18 = bacu18;
	}

	public String getBac001() {
		return bac001;
	}

	public void setBac001(String bac001) {
		this.bac001 = bac001;
	}

	public String getAac148() {
		return aac148;
	}

	public void setAac148(String aac148) {
		this.aac148 = aac148;
	}

	public String getKcd7id() {
		return kcd7id;
	}

	public void setKcd7id(String kcd7id) {
		this.kcd7id = kcd7id;
	}

	public String getKcd8id() {
		return kcd8id;
	}

	public void setKcd8id(String kcd8id) {
		this.kcd8id = kcd8id;
	}

	public String getKcd2id() {
		return kcd2id;
	}

	public void setKcd2id(String kcd2id) {
		this.kcd2id = kcd2id;
	}

	public Date getAkc194() {
		return akc194;
	}

	public void setAkc194(Date akc194) {
		this.akc194 = akc194;
	}

	public String getAaa157() {
		return aaa157;
	}

	public void setAaa157(String aaa157) {
		this.aaa157 = aaa157;
	}

	public String getBka432() {
		return bka432;
	}

	public void setBka432(String bka432) {
		this.bka432 = bka432;
	}

	public String getAka002() {
		return aka002;
	}

	public void setAka002(String aka002) {
		this.aka002 = aka002;
	}

	public BigDecimal getAae019() {
		return aae019;
	}

	public void setAae019(BigDecimal aae019) {
		this.aae019 = aae019;
	}

	public String getCaa027() {
		return caa027;
	}

	public void setCaa027(String caa027) {
		this.caa027 = caa027;
	}

	public Date getAae036() {
		return aae036;
	}

	public void setAae036(Date date) {
		this.aae036 = date;
	}

	public String getAae004() {
		return aae004;
	}

	public void setAae004(String aae004) {
		this.aae004 = aae004;
	}

	public String getBka061() {
		return bka061;
	}

	public void setBka061(String bka061) {
		this.bka061 = bka061;
	}

	public String getAke022() {
		return ake022;
	}

	public void setAke022(String ake022) {
		this.ake022 = ake022;
	}

	public String getAkf001() {
		return akf001;
	}

	public void setAkf001(String akf001) {
		this.akf001 = akf001;
	}

	public String getAka030() {
		return aka030;
	}

	public void setAka030(String aka030) {
		this.aka030 = aka030;
	}

	public String getAka101() {
		return aka101;
	}

	public void setAka101(String aka101) {
		this.aka101 = aka101;
	}

	public String getBke301() {
		return bke301;
	}

	public void setBke301(String bke301) {
		this.bke301 = bke301;
	}

	public String getBka072() {
		return bka072;
	}

	public void setBka072(String bka072) {
		this.bka072 = bka072;
	}

	public String getKcd1id() {
		return kcd1id;
	}

	public void setKcd1id(String kcd1id) {
		this.kcd1id = kcd1id == null ? null : kcd1id.trim();
	}

	public String getAkb020() {
		return akb020;
	}

	public void setAkb020(String akb020) {
		this.akb020 = akb020 == null ? null : akb020.trim();
	}

	public String getAaz217() {
		return aaz217;
	}

	public void setAaz217(String aaz217) {
		this.aaz217 = aaz217 == null ? null : aaz217.trim();
	}

	/**
	 * 
	 * @return 费用批次
	 */
	public Long getBka001() {
		return bka001;
	}

	/**
	 * 
	 * @param bka001
	 *            费用批次
	 */
	public void setBka001(Long bka001) {
		this.bka001 = bka001;
	}

	public Long getBka009() {
		return bka009;
	}

	public void setBka009(Long bka009) {
		this.bka009 = bka009;
	}

	public String getAka130() {
		return aka130;
	}

	public void setAka130(String aka130) {
		this.aka130 = aka130 == null ? null : aka130.trim();
	}

	public Long getBka002() {
		return bka002;
	}

	public void setBka002(Long bka002) {
		this.bka002 = bka002;
	}

	public String getBaa027() {
		return baa027;
	}

	public void setBaa027(String baa027) {
		this.baa027 = baa027 == null ? null : baa027.trim();
	}

	/**
	 * 
	 * @return 个人电脑号
	 */
	public Long getAac001() {
		return aac001;
	}

	/**
	 * 
	 * @param aac001
	 *            个人电脑号
	 */
	public void setAac001(Long aac001) {
		this.aac001 = aac001;
	}

	/**
	 * 
	 * @return 姓名
	 */
	public String getAac003() {
		return aac003;
	}

	/**
	 * 
	 * @param aac003
	 *            姓名
	 */
	public void setAac003(String aac003) {
		this.aac003 = aac003 == null ? null : aac003.trim();
	}

	public String getAac004() {
		return aac004;
	}

	public void setAac004(String aac004) {
		this.aac004 = aac004 == null ? null : aac004.trim();
	}

	public String getBka004() {
		return bka004;
	}

	public void setBka004(String bka004) {
		this.bka004 = bka004 == null ? null : bka004.trim();
	}

	/**
	 * 
	 * @return 公务员级别
	 */
	public String getBka005() {
		return bka005;
	}

	/**
	 * 
	 * @param bka005
	 *            公务员级别
	 */
	public void setBka005(String bka005) {
		this.bka005 = bka005 == null ? null : bka005.trim();
	}

	/**
	 * 
	 * @return 社会保障号码
	 */
	public String getAac002() {
		return aac002;
	}

	/**
	 * 
	 * @param aac002
	 *            社会保障号码
	 */
	public void setAac002(String aac002) {
		this.aac002 = aac002 == null ? null : aac002.trim();
	}

	/**
	 * 
	 * @return 社保卡卡号
	 */
	public String getBka100() {
		return bka100;
	}

	/**
	 * 
	 * @param bka100
	 *            社保卡卡号
	 */
	public void setBka100(String bka100) {
		this.bka100 = bka100 == null ? null : bka100.trim();
	}

	public String getAkb021() {
		return akb021;
	}

	public void setAkb021(String akb021) {
		this.akb021 = akb021 == null ? null : akb021.trim();
	}

	public Integer getAac006() {
		return aac006;
	}

	public void setAac006(Integer aac006) {
		this.aac006 = aac006;
	}

	public String getAae005() {
		return aae005;
	}

	public void setAae005(String aae005) {
		this.aae005 = aae005 == null ? null : aae005.trim();
	}

	public Long getAab001() {
		return aab001;
	}

	public void setAab001(Long aab001) {
		this.aab001 = aab001;
	}

	public String getBka008() {
		return bka008;
	}

	public void setBka008(String bka008) {
		this.bka008 = bka008 == null ? null : bka008.trim();
	}

	public String getAab019() {
		return aab019;
	}

	public void setAab019(String aab019) {
		this.aab019 = aab019 == null ? null : aab019.trim();
	}

	public String getBka006() {
		return bka006;
	}

	public void setBka006(String bka006) {
		this.bka006 = bka006 == null ? null : bka006.trim();
	}

	public Long getBka010() {
		return bka010;
	}

	public void setBka010(Long bka010) {
		this.bka010 = bka010;
	}

	public String getBka011() {
		return bka011;
	}

	public void setBka011(String bka011) {
		this.bka011 = bka011 == null ? null : bka011.trim();
	}

	public String getBka012() {
		return bka012;
	}

	public void setBka012(String bka012) {
		this.bka012 = bka012 == null ? null : bka012.trim();
	}

	public String getAaz267() {
		return aaz267;
	}

	public void setAaz267(String aaz267) {
		this.aaz267 = aaz267;
	}

	public Date getBka013() {
		return bka013;
	}

	public void setBka013(Date bka013) {
		this.bka013 = bka013;
	}

	public String getBka014() {
		return bka014;
	}

	public void setBka014(String bka014) {
		this.bka014 = bka014 == null ? null : bka014.trim();
	}

	public String getBka015() {
		return bka015;
	}

	public void setBka015(String bka015) {
		this.bka015 = bka015 == null ? null : bka015.trim();
	}

	public String getBka016() {
		return bka016;
	}

	public void setBka016(String bka016) {
		this.bka016 = bka016 == null ? null : bka016.trim();
	}

	public Integer getAae030() {
		return aae030;
	}

	public void setAae030(Integer aae030) {
		this.aae030 = aae030;
	}

	public Integer getAae031() {
		return aae031;
	}

	public void setAae031(Integer aae031) {
		this.aae031 = aae031;
	}

	public String getBka018() {
		return bka018;
	}

	public void setBka018(String bka018) {
		this.bka018 = bka018 == null ? null : bka018.trim();
	}

	public String getBka019() {
		return bka019;
	}

	public void setBka019(String bka019) {
		this.bka019 = bka019 == null ? null : bka019.trim();
	}

	public String getBka020() {
		return bka020;
	}

	public void setBka020(String bka020) {
		this.bka020 = bka020 == null ? null : bka020.trim();
	}

	public String getBka021() {
		return bka021;
	}

	public void setBka021(String bka021) {
		this.bka021 = bka021 == null ? null : bka021.trim();
	}

	public String getBka022() {
		return bka022;
	}

	public void setBka022(String bka022) {
		this.bka022 = bka022 == null ? null : bka022.trim();
	}

	public String getAke020() {
		return ake020;
	}

	public void setAke020(String ake020) {
		this.ake020 = ake020 == null ? null : ake020.trim();
	}

	public String getBka024() {
		return bka024;
	}

	public void setBka024(String bka024) {
		this.bka024 = bka024 == null ? null : bka024.trim();
	}

	public String getAkc190() {
		return akc190;
	}

	public void setAkc190(String bka025) {
		this.akc190 = bka025 == null ? null : bka025.trim();
	}

	public String getAkc193() {
		return akc193;
	}

	public void setAkc193(String bka026) {
		this.akc193 = bka026 == null ? null : bka026.trim();
	}

	public BigDecimal getBka245() {
		return bka245;
	}

	public void setBka245(BigDecimal bka245) {
		this.bka245 = bka245;
	}

	public Date getBka028() {
		return bka028;
	}

	public void setBka028(Date bka028) {
		this.bka028 = bka028;
	}

	public String getBka029() {
		return bka029;
	}

	public void setBka029(String bka029) {
		this.bka029 = bka029 == null ? null : bka029.trim();
	}

	public Long getBka030() {
		return bka030;
	}

	public void setBka030(Long bka030) {
		this.bka030 = bka030;
	}

	public String getBka031() {
		return bka031;
	}

	public void setBka031(String bka031) {
		this.bka031 = bka031 == null ? null : bka031.trim();
	}

	/**
	 * 
	 * @return 业务结束日期
	 */
	public Date getBka032() {
		return bka032;
	}

	/**
	 * 
	 * @param bka032
	 *            业务结束日期
	 */
	public void setBka032(Date bka032) {
		this.bka032 = bka032;
	}

	/**
	 * 
	 * @return 结束人工号
	 */
	public String getBka033() {
		return bka033;
	}

	/**
	 * 
	 * @param bka033
	 *            结束人工号
	 */
	public void setBka033(String bka033) {
		this.bka033 = bka033 == null ? null : bka033.trim();
	}

	/**
	 * 
	 * @return 结束人
	 */
	public String getBka034() {
		return bka034;
	}

	/**
	 * 
	 * @param bka034
	 *            结束人
	 */
	public void setBka034(String bka034) {
		this.bka034 = bka034 == null ? null : bka034.trim();
	}

	public String getBka035() {
		return bka035;
	}

	public void setBka035(String bka035) {
		this.bka035 = bka035 == null ? null : bka035.trim();
	}

	public String getBka036() {
		return bka036;
	}

	public void setBka036(String bka036) {
		this.bka036 = bka036 == null ? null : bka036.trim();
	}

	public String getBka037() {
		return bka037;
	}

	public void setBka037(String bka037) {
		this.bka037 = bka037 == null ? null : bka037.trim();
	}

	public Date getBka038() {
		return bka038;
	}

	public void setBka038(Date bka038) {
		this.bka038 = bka038;
	}

	/**
	 * 
	 * @return 完成标志(诊次结束标志)
	 */
	public String getBka039() {
		return bka039;
	}

	/**
	 * 
	 * @param bka039
	 *            完成标志(诊次结束标志)
	 */
	public void setBka039(String bka039) {
		this.bka039 = bka039 == null ? null : bka039.trim();
	}

	public String getBka040() {
		return bka040;
	}

	public void setBka040(String bka040) {
		this.bka040 = bka040 == null ? null : bka040.trim();
	}

	public String getBka041() {
		return bka041;
	}

	public void setBka041(String bka041) {
		this.bka041 = bka041 == null ? null : bka041.trim();
	}

	public Long getBka042() {
		return bka042;
	}

	public void setBka042(Long bka042) {
		this.bka042 = bka042;
	}

	public String getAke024() {
		return ake024;
	}

	public void setAke024(String ake024) {
		this.ake024 = ake024 == null ? null : ake024.trim();
	}

	public String getBka044() {
		return bka044;
	}

	public void setBka044(String bka044) {
		this.bka044 = bka044 == null ? null : bka044.trim();
	}

	public String getAaa027() {
		return aaa027;
	}

	public void setAaa027(String aaa027) {
		this.aaa027 = aaa027 == null ? null : aaa027.trim();
	}

	public String getAae140() {
		return aae140;
	}

	public void setAae140(String aae140) {
		this.aae140 = aae140 == null ? null : aae140.trim();
	}

	public String getBka414() {
		return bka414;
	}

	public void setBka414(String bka414) {
		this.bka414 = bka414 == null ? null : bka414.trim();
	}

	public String getBka415() {
		return bka415;
	}

	public void setBka415(String bka415) {
		this.bka415 = bka415 == null ? null : bka415.trim();
	}

	public String getBae009() {
		return bae009;
	}

	public void setBae009(String bae009) {
		this.bae009 = bae009 == null ? null : bae009.trim();
	}

	public String getBaf313() {
		return baf313;
	}

	public void setBaf313(String baf313) {
		this.baf313 = baf313 == null ? null : baf313.trim();
	}

	public String getAae006() {
		return aae006;
	}

	public void setAae006(String aae006) {
		this.aae006 = aae006 == null ? null : aae006.trim();
	}

	public String getBka501() {
		return bka501;
	}

	public void setBka501(String bka501) {
		this.bka501 = bka501 == null ? null : bka501.trim();
	}

	public String getBka502() {
		return bka502;
	}

	public void setBka502(String bka502) {
		this.bka502 = bka502 == null ? null : bka502.trim();
	}

	public String getBka503() {
		return bka503;
	}

	public void setBka503(String bka503) {
		this.bka503 = bka503 == null ? null : bka503.trim();
	}

	public Date getBka504() {
		return bka504;
	}

	public void setBka504(Date bka504) {
		this.bka504 = bka504;
	}

	public Date getBka505() {
		return bka505;
	}

	public void setBka505(Date bka505) {
		this.bka505 = bka505;
	}

	public Date getBka506() {
		return bka506;
	}

	public void setBka506(Date bka506) {
		this.bka506 = bka506;
	}

	public Long getBka507() {
		return bka507;
	}

	public void setBka507(Long bka507) {
		this.bka507 = bka507;
	}

	public Long getBka508() {
		return bka508;
	}

	public void setBka508(Long bka508) {
		this.bka508 = bka508;
	}

	public Long getBka509() {
		return bka509;
	}

	public void setBka509(Long bka509) {
		this.bka509 = bka509;
	}

	public String getBka510() {
		return bka510;
	}

	public void setBka510(String bka510) {
		this.bka510 = bka510 == null ? null : bka510.trim();
	}

	public String getBkz101() {
		return bkz101;
	}

	public void setBkz101(String bkz101) {
		this.bkz101 = bkz101;
	}

}
