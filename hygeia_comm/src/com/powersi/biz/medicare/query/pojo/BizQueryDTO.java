package com.powersi.biz.medicare.query.pojo;

import com.powersi.comm.mybatis.Page;

import java.math.BigDecimal;
import java.util.List;

/**
 * 信息查询DTO
 * 
 * @author ChenXing
 *
 */
public class BizQueryDTO extends Page {

	private static final long serialVersionUID = 1L;
	private String kc21id;
	private String aaz217;
	private String aac003;
	private String aka130;
	private String bka035;
	private String aac001;
	private String aac002;
	private String aac004;
	private String aae030;
	private String aae031;
	private String bka006;
	private String akc193;
	private String akc190;
	private String bkz101;
	private String akc196;
	private String bkz102;
	private String bka008;
	private String akc194;
	private String aae011;  // 就诊登记工号
	private String aae014;
	private String bka034;
	private String aaa027;
	private String baa027;
	private String caa027;
	private String aka030;
	private String aae004;
	private String aae005;
	private String bka021;
	private String bka022;
	private String akf001;
	private String bka020;
	private String ake020;
	private String aae100;
	private String aae016;
	private String akb020;
	private String akb021;
	private String aae140;
	private String bke054;//一站式标识
	private String operate;
	private String userName;
	private String arg_value;
	private String arg_name;
	private String allpay;
	private String fund_pay;
	private String db_pay;
	private String self_pay;
	private String acct_pay;
	private String shengyu_pay;
	private String lixiu_pay;
	private String jiating_pay;
	private String real_pay;
	private String official_pay;
	private String yydf_pay;
	private String thb_pay;
	private String mzjz_pay;
	private String yyjm_pay;
	private String czdd_pay;
	private String zys001;
	private String zys002;
	private String trade_type;
	private String timeType_flag;
	private String Center_flag;
	private String fromdate;
	private String todate;
	private String begin_date;
	private String bkc290;
	private String kc90id;
	private String bkc292;
	private int zrsTotal;
	private BigDecimal zfyTotal;
	private BigDecimal yydfPayTotal;
	private BigDecimal grzhPayTotal;
	private BigDecimal xjPayTotal;
	private BigDecimal syPayTotal;
	private BigDecimal tcPayTotal;
	private List<String> aaz217List;
	private String bka015;
	private String serialApply;
	private String apiFlag;
	private String yd_flag; //异地就医类型 2：省内异地，4：跨省异地
	private String biz_or_fee_or_detail; //使用此标志区分使用Remote_BIZC200301功能号，biz：表示取业务信息，
										 //fee：表示取费用信息，detail:费用明细
	private String settle_or_fund; //使用此标志区分使用Remote_BIZC200101功能号，settle：表示取结算单信息，fund：表示取基金信息
	
	private String aaf014; //乡镇街道
	private String aaz071; //村社区
	private String baf005; //组
	private String aac148;//补助类型
	private String is_medical_uploaded;	//病案是否已上传
	private String drg_fee;	//DRG预支付金额
	private String drg_name;//DRG入组组别

	public String getDrg_fee() {
		return drg_fee;
	}

	public void setDrg_fee(String drg_fee) {
		this.drg_fee = drg_fee;
	}

	public String getDrg_name() {
		return drg_name;
	}

	public void setDrg_name(String drg_name) {
		this.drg_name = drg_name;
	}

	public String getIs_medical_uploaded()
	{
		return is_medical_uploaded;
	}

	public void setIs_medical_uploaded(String is_medical_uploaded)
	{
		this.is_medical_uploaded = is_medical_uploaded;
	}

	/**
	 * @return the aac148
	 */
	public String getAac148() {
		return aac148;
	}

	/**
	 * @param aac148 the aac148 to set
	 */
	public void setAac148(String aac148) {
		this.aac148 = aac148;
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

	public String getAae011()
	{
		return aae011;
	}

	public void setAae011(String aae011)
	{
		this.aae011 = aae011;
	}

	public String getThb_pay() {
		return thb_pay;
	}

	public void setThb_pay(String thb_pay) {
		this.thb_pay = thb_pay;
	}

	public String getMzjz_pay() {
		return mzjz_pay;
	}

	public void setMzjz_pay(String mzjz_pay) {
		this.mzjz_pay = mzjz_pay;
	}

	public String getYyjm_pay() {
		return yyjm_pay;
	}

	public void setYyjm_pay(String yyjm_pay) {
		this.yyjm_pay = yyjm_pay;
	}

	public String getCzdd_pay() {
		return czdd_pay;
	}

	public void setCzdd_pay(String czdd_pay) {
		this.czdd_pay = czdd_pay;
	}

	public String getBke054() {
		return bke054;
	}

	public void setBke054(String bke054) {
		this.bke054 = bke054;
	}

	public String getBkc292() {
		return bkc292;
	}

	public void setBkc292(String bkc292) {
		this.bkc292 = bkc292;
	}

	public String getSettle_or_fund() {
		return settle_or_fund;
	}

	public void setSettle_or_fund(String settle_or_fund) {
		this.settle_or_fund = settle_or_fund;
	}

	public String getBiz_or_fee_or_detail() {
		return biz_or_fee_or_detail;
	}

	public String getKc90id() {
		return kc90id;
	}

	public void setKc90id(String kc90id) {
		this.kc90id = kc90id;
	}

	public void setBiz_or_fee_or_detail(String bizOrFeeOrDetail) {
		this.biz_or_fee_or_detail = bizOrFeeOrDetail;
	}

	public String getYd_flag() {
		return yd_flag;
	}

	public void setYd_flag(String remoteFlag) {
		this.yd_flag = remoteFlag;
	}

	public String getApiFlag() {
		return apiFlag;
	}

	public void setApiFlag(String apiFlag) {
		this.apiFlag = apiFlag;
	}

	public String getSerialApply() {
		return serialApply;
	}

	public void setSerialApply(String serialApply) {
		this.serialApply = serialApply;
	}

	public String getAae016() {
		return aae016;
	}

	public void setAae016(String aae016) {
		this.aae016 = aae016;
	}

	public String getBka015() {
		return bka015;
	}

	public void setBka015(String bka015) {
		this.bka015 = bka015;
	}

	public String getBkc290() {
		return bkc290;
	}

	public void setBkc290(String bkc290) {
		this.bkc290 = bkc290;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAkc190() {
		return akc190;
	}

	public void setAkc190(String akc190) {
		this.akc190 = akc190;
	}

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public String getKc21id() {
		return kc21id;
	}

	public void setKc21id(String kc21id) {
		this.kc21id = kc21id;
	}

	public String getAae140() {
		return aae140;
	}

	public void setAae140(String aae140) {
		this.aae140 = aae140;
	}

	public String getArg_value() {
		return arg_value;
	}

	public void setArg_value(String arg_value) {
		this.arg_value = arg_value;
	}

	public String getArg_name() {
		return arg_name;
	}

	public void setArg_name(String arg_name) {
		this.arg_name = arg_name;
	}

	public String getAac003() {
		return aac003;
	}

	public void setAac003(String aac003) {
		this.aac003 = aac003;
	}

	public String getAka130() {
		return aka130;
	}

	public void setAka130(String aka130) {
		this.aka130 = aka130;
	}

	public String getBka035() {
		return bka035;
	}

	public void setBka035(String bka035) {
		this.bka035 = bka035;
	}

	public String getAaz217() {
		return aaz217;
	}

	public void setAaz217(String aaz217) {
		this.aaz217 = aaz217;
	}

	public String getAac001() {
		return aac001;
	}

	public void setAac001(String aac001) {
		this.aac001 = aac001;
	}

	public String getAac002() {
		return aac002;
	}

	public void setAac002(String aac002) {
		this.aac002 = aac002;
	}

	public String getAac004() {
		return aac004;
	}

	public void setAac004(String aac004) {
		this.aac004 = aac004;
	}

	public String getAae030() {
		return aae030;
	}

	public void setAae030(String aae030) {
		this.aae030 = aae030;
	}

	public String getBka006() {
		return bka006;
	}

	public void setBka006(String bka006) {
		this.bka006 = bka006;
	}

	public String getAkc193() {
		return akc193;
	}

	public void setAkc193(String akc193) {
		this.akc193 = akc193;
	}

	public String getBkz101() {
		return bkz101;
	}

	public void setBkz101(String bkz101) {
		this.bkz101 = bkz101;
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

	public String getBka008() {
		return bka008;
	}

	public void setBka008(String bka008) {
		this.bka008 = bka008;
	}

	public String getAkc194() {
		return akc194;
	}

	public void setAkc194(String akc194) {
		this.akc194 = akc194;
	}

	public String getAae014() {
		return aae014;
	}

	public void setAae014(String aae014) {
		this.aae014 = aae014;
	}

	public String getBka034() {
		return bka034;
	}

	public void setBka034(String bka034) {
		this.bka034 = bka034;
	}

	public String getCaa027() {
		return caa027;
	}

	public void setCaa027(String caa027) {
		this.caa027 = caa027;
	}

	public String getBaa027() {
		return baa027;
	}

	public void setBaa027(String baa027) {
		this.baa027 = baa027;
	}

	public String getAaa027() {
		return aaa027;
	}

	public void setAaa027(String aaa027) {
		this.aaa027 = aaa027;
	}

	public String getAka030() {
		return aka030;
	}

	public void setAka030(String aka030) {
		this.aka030 = aka030;
	}

	public String getAae031() {
		return aae031;
	}

	public void setAae031(String aae031) {
		this.aae031 = aae031;
	}

	public String getAae004() {
		return aae004;
	}

	public void setAae004(String aae004) {
		this.aae004 = aae004;
	}

	public String getAae005() {
		return aae005;
	}

	public void setAae005(String aae005) {
		this.aae005 = aae005;
	}

	public String getBka021() {
		return bka021;
	}

	public void setBka021(String bka021) {
		this.bka021 = bka021;
	}

	public String getBka022() {
		return bka022;
	}

	public void setBka022(String bka022) {
		this.bka022 = bka022;
	}

	public String getAkf001() {
		return akf001;
	}

	public void setAkf001(String akf001) {
		this.akf001 = akf001;
	}

	public String getBka020() {
		return bka020;
	}

	public void setBka020(String bka020) {
		this.bka020 = bka020;
	}

	public String getAke020() {
		return ake020;
	}

	public void setAke020(String ake020) {
		this.ake020 = ake020;
	}

	public String getAae100() {
		return aae100;
	}

	public void setAae100(String aae100) {
		this.aae100 = aae100;
	}

	public String getAkb021() {
		return akb021;
	}

	public void setAkb021(String akb021) {
		this.akb021 = akb021;
	}

	public String getAkb020() {
		return akb020;
	}

	public void setAkb020(String akb020) {
		this.akb020 = akb020;
	}

	public String getAllpay() {
		return allpay;
	}

	public void setAllpay(String allpay) {
		this.allpay = allpay;
	}

	public String getFund_pay() {
		return fund_pay;
	}

	public void setFund_pay(String fund_pay) {
		this.fund_pay = fund_pay;
	}

	public String getDb_pay() {
		return db_pay;
	}

	public void setDb_pay(String db_pay) {
		this.db_pay = db_pay;
	}

	public String getSelf_pay() {
		return self_pay;
	}

	public void setSelf_pay(String self_pay) {
		this.self_pay = self_pay;
	}

	public String getAcct_pay() {
		return acct_pay;
	}

	public void setAcct_pay(String acct_pay) {
		this.acct_pay = acct_pay;
	}

	public String getShengyu_pay() {
		return shengyu_pay;
	}

	public void setShengyu_pay(String shengyu_pay) {
		this.shengyu_pay = shengyu_pay;
	}

	public String getLixiu_pay() {
		return lixiu_pay;
	}

	public void setLixiu_pay(String lixiu_pay) {
		this.lixiu_pay = lixiu_pay;
	}

	public String getJiating_pay() {
		return jiating_pay;
	}

	public void setJiating_pay(String jiating_pay) {
		this.jiating_pay = jiating_pay;
	}

	public String getReal_pay() {
		return real_pay;
	}

	public void setReal_pay(String real_pay) {
		this.real_pay = real_pay;
	}

	public String getOfficial_pay() {
		return official_pay;
	}

	public void setOfficial_pay(String official_pay) {
		this.official_pay = official_pay;
	}

	public String getYydf_pay() {
		return yydf_pay;
	}

	public void setYydf_pay(String yydf_pay) {
		this.yydf_pay = yydf_pay;
	}

	public String getZys001() {
		return zys001;
	}

	public void setZys001(String zys001) {
		this.zys001 = zys001;
	}

	public String getZys002() {
		return zys002;
	}

	public void setZys002(String zys002) {
		this.zys002 = zys002;
	}

	public String getTrade_type() {
		return trade_type;
	}

	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	public String getTimeType_flag() {
		return timeType_flag;
	}

	public void setTimeType_flag(String timeType_flag) {
		this.timeType_flag = timeType_flag;
	}

	public String getCenter_flag() {
		return Center_flag;
	}

	public void setCenter_flag(String center_flag) {
		Center_flag = center_flag;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public String getBegin_date() {
		return begin_date;
	}

	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}

	public int getZrsTotal() {
		return zrsTotal;
	}

	public void setZrsTotal(int zrsTotal) {
		this.zrsTotal = zrsTotal;
	}

	public BigDecimal getZfyTotal() {
		return zfyTotal;
	}

	public void setZfyTotal(BigDecimal zfyTotal) {
		this.zfyTotal = zfyTotal;
	}

	public BigDecimal getYydfPayTotal() {
		return yydfPayTotal;
	}

	public void setYydfPayTotal(BigDecimal yydfPayTotal) {
		this.yydfPayTotal = yydfPayTotal;
	}

	public BigDecimal getGrzhPayTotal() {
		return grzhPayTotal;
	}

	public void setGrzhPayTotal(BigDecimal grzhPayTotal) {
		this.grzhPayTotal = grzhPayTotal;
	}

	public BigDecimal getXjPayTotal() {
		return xjPayTotal;
	}

	public void setXjPayTotal(BigDecimal xjPayTotal) {
		this.xjPayTotal = xjPayTotal;
	}

	public BigDecimal getSyPayTotal() {
		return syPayTotal;
	}

	public void setSyPayTotal(BigDecimal syPayTotal) {
		this.syPayTotal = syPayTotal;
	}

	public BigDecimal getTcPayTotal() {
		return tcPayTotal;
	}

	public void setTcPayTotal(BigDecimal tcPayTotal) {
		this.tcPayTotal = tcPayTotal;
	}

	public List<String> getAaz217List() {
		return aaz217List;
	}

	public void setAaz217List(List<String> aaz217List) {
		this.aaz217List = aaz217List;
	}
}
