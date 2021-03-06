package com.powersi.biz.medicare.special.pojo;

import com.powersi.comm.mybatis.Page;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

public class SpecialManagerDTO extends Page implements Serializable {
	
private static final long serialVersionUID = -5018709342451144646L;
	
	private String pageFlag; //在菜单中配置的参数，用于区分调用的页面（值可能是申请类型，也可能是几个申请共用页面产生的标志）
	
	private Long aaz267;//KC41: '医疗申请事件id'
	
	private String aka083;//KC41: '医疗特殊业务申请类型'

	private String aka130;//KC41: '业务类型'

	private String bka006;//KC41: '待遇类型'

	private String bke035;//KC41: '申请原因（身份证特殊情况类型：7:身份证遗失 8:身份证验证信息失效 9:一代身份证10:其他原因）'

	private String bke055;//KC41: '申请方式（就诊类型）：0:中心上传,1:医院上传'

	private Long akc226;//KC41: '限额次数'

	private String aaa027;//KC41: '统筹区编码'

	private String aae140;//KC41: '险种'

	private Long aac001;//KC41: '人员id'

	private String aac002;//KC41: '身份证'

	private String aac003;//KC41: '姓名'

	private String aac004;//KC41: '性别'
	
	private String bka100;// 社会保障卡卡号

	private Integer aac006;//KC41: '出生日期'

	private String bka035;//KC41: '人员类别'

	private String aac066;//KC41: '参保身份'

	private String bke033;//KC41: '联系电话'

	private String bke001;//KC41: '详细地址'

	private Long aab001;//KC41: '单位编码'

	private String aab069;//KC41: '单位名称'

	private String aaz067;//KC41: '家庭id'

	private String baf003;//KC41: '组id'

	private String aaz070;//KC41: '村社区id'

	private String aaf013;//KC41: '乡镇街道编号'

	private Integer aae030;//KC41: '开始日期'

	private Integer aae031;//KC41: '终止日期'

	private String aae011;//KC41: '经办人'

	private Date aae036;//KC41: '经办时间'

	private String akb020;//KC41: '医疗服务机构编码'

	private String akb021;//KC41: '申请医院名称'

	private String aae127;//KC41: '申请日期'

	private String bke021;//KC41: '审批人'

	private String bke022;//KC41: '初审时间'

	private String bke024;//KC41: '初审意见'

	private String aae014;//KC41: '复核人'

	private String aae015;//KC41: '复核时间'

	private String aae016;//KC41: '审核标志'0-未审核、1-复审通过、2-复审不通过、3-初审通过、4-初审不通过

	private String aae189;//KC41: '复审意见'

	private String aae100;//KC41: '有效标志,1有效,0无效'
	
	private Long bkb032;// KC41: '关联申请事件ID（与AAZ267对应）'
	
	private String bkb057;// KC41: 认证状态(1：拍照认证,2:指纹认证,3:指静脉认证,9:书面认证,默认：未拍照)
	
	private String bkb058;// KC41: 认证结果详情
	
    //KCA2（转诊住院，再住院)
	private String aaz286 ;//KCA2 '转出医院编码（转外医院编码）'

	private String bke053 ;//KCA2 '转出医院名称（转外医院名称）'

	private String bke008 ;//KCA2 '转出医院意见'

	private String ake017 ;//KCA2 '转入医院编码（外地医院编码）',KCA4 '转外医院'

	private String akc172 ;//KCA2 '转入医院名称（外地医院名称）',KCA4 '转外医院名称'

	private String bke010 ;//KCA2 '转入医院意见'

	private String bke046 ;//KCA2 '上次住院疾病'

	private String bke051 ;//KCA2 '上次住院疾病名称'

	private String bke007 ;//KCA2 '上次住院病情摘要'

	private String bke038 ;//KCA2 '本次住院疾病（所属疾病）'
	
	private String bke003 ;//KCA2 '本次住院疾病名称（所属疾病名称）'

	private String bke009 ;//KCA2 '本次住院病情摘要'

	private String bke011 ;//KCA2 '转诊理由或转院原因',KCA4 '病情摘要'

	private String ake014 ;//KCA2 '转院日期'

	private String aab299 ;//KCA2 '转诊城市'

	private String bkm301 ;//KCA2 '转诊类型 (转上一级为：1转下一级为：2)'

	private String bke049 ;//KCA2 '是否是自主转院或者是因病情需要转院'

	private String aae013 ;//KCA2 '备注(医嘱)',KCA3 '备注',KCA4 '备注'
	
	private String aaz217 ;//KCA2 '上次人员医疗就诊事件ID'
	
	//kca3（门特、大病特药）
	private String aka120;// KCA3 '申请疾病编码',KCA4 '申请疾病编码'

	private String aka121;// KCA3 '申请疾病名称',KCA4 '申请疾病名称'

	private Double aae019;// KCA3 '申请限额'，KCA4 '申请限额'

	private String bke005;// KCA3 '申请疾病分型'

	private String bke006;// KCA3 '申请疾病严重等级'

	private String bke060;// KCA3 '初审疾病'

	private String bkz201;// KCA3 '初审疾病名称'

	private Double aee333;// KCA3 '初审限额',KCA4 '初审限额'

	private String bke061;// KCA3 '初审疾病分型'

	private String bke062;// KCA3 '初审疾病严重等级'
	
	private String bke050 ;//KCA3 '复审疾病编码'

	private String bkz202;// KCA3 '复审疾病名称'

	private Double akb081;// KCA3 '复审限额（审批限额）',KCA4 '复审限额（审批限额'

	private String bke031;// KCA3 '复审疾病分型'

	private String bke032;// KCA3 '复审疾病严重等级'

	private String bke025;// KCA3 '专家鉴定疾病（关联aka120）'

	private String bkb023;// KCA3 '专家鉴定疾病名称'

	private String bke027;// KCA3 '专家鉴定疾病分型'

	private String bke028;// KCA3 '专家鉴定疾病严重等级'
	
	private String bke002 ;//KCA3 '诊断依据'
	
	private String bke039;//KCA3申请标志: '1'代表中心特批，'0'表示正常门特,'2'表示已经报销
	
	private String kca3id;//KCA3 KCA3ID

	private String aae010;//KCA3 初审人工号
	
	private String aae012;//KCA3 初审时间
	
	private String aae017;//KCA3 复审人工号

	// kca4（普通住院，家庭病床，单病种）
	private String bke014;// KCA4 '科室电话'

	private String bke015;// KCA4 '就诊科室'

	private String bke017;// KCA4 '申请医师'

	private String bkb024;// KCA4 '申请医师意见'

	private String bke020;// KCA4 '申请医师意见时间'

	private String bke018;// KCA4 '主任医师'

	private String bkb025;// KCA4 '主任医师意见'

	private String bke019;// KCA4 '主任医师意见时间'

	private String bke013;// KCA4 '申请医院意见(医院意见，科室意见，医嘱）'

	private String bke034;// KCA4 '申请医院意见时间'

	private String bkb026;// KCA4 '专家姓名'

	private String bkb027;// KCA4 '专家意见'

	private Date bkb028;// KCA4 '专家意见时间'

	private String bke012;// KCA4 '治疗方案'

	private String aka109;// KCA4 '手术名称'
	
	private String aae127_start;//申请开始时间
	
	private String aae127_end;//申请结束时间
	
	private String audit_status; //审核状态：''-全部、0-未审核、1-复审通过、2-复审不通过、3-初审通过、4-初审不通过、5-初审全部、6复审全部
	
	private String hosplist; //医疗机构（定点）集合，医疗机构ID加逗号分隔
	
	private String diseaselist; //疾病（并发症、副诊断）集合疾病编码加逗号分隔
	
	private String druglist; //药品（特殊药品）的编码加逗号分隔组成的字符串
	
	private String drugarray; //药品（特殊药品）的编码、名称、限额组成的jsonArray字符串

	
	//药品查询 start
	private String ake001; //药品/项目编码
	
	private String ake002; //药品/项目名称
	
	private String ake001_not; //需要排除的药品/项目编码
	
	//药品查询 end
	
	
	//疾病查询 start
	private String aka035; //特殊病种分类 
	
	private String aka020; //疾病中文名拼音助记码
	
	private String aka021; //疾病中文名五笔助记码
	
	private String bke401;//疾病分型
	
	private String bke402;//疾病严重等级
	//疾病查询 end
	
	
	//医疗机构查询 start
	private String akb022; //医疗服务机构类型
	private String bke301; //医院级别（1、三级；3、二级；5、一级；9、无）
	private String akb020_not; //需要排除的医疗机构编号集合，逗号分隔
	//医疗机构查询 end
	   
	//市内异地费用上传申请 start
	private String akc191 ;//kca7 :发票号
	private String akc190;//kca7 :住院号
	private String baa027;//kca7:参保地中心编码
	private String aaa129;//kca7：参保地中心名称
	private String aaa027_name;//就医地名称
	private String bkm367;//异地平台异地费用获取申请序列号
	//市内异地费用上传申请 end
	
	//择点修改相关
	private String	bkb051	;	//KCF4	择点申请联系电话
	private String	bkb052	;	//KCF4	择点申请详细地址
	private String	bkb053	;	//KCF4	代办人身份证
	private String	bkb054	;	//KCF4	择点代办人
	private String	bkb050	;	//KCF4,KCF3	标志：0：次年选定，1：首次选定
	private Date bkb056;//KCF4: '经办时间'
	private String bkb055;//KCF4: '经办人'
	
	//通用标志，没有特定用途，根据实际情况传递参数进行判断
	//【一】1：查询申请关联的定点医疗机构；2：查询申请关联的特殊疾病：3：查询申请关联的药品：4查询申请历史信息；5关联的业务；
	//【二】11：批量申请模板；12：离休特殊费用申请模板
	//【三】21：申请综合页面标志
	//【四】31：查找疾病分型，32：查找严重等级
	//【五】101：操作定点医院,102：有业务后的修改操作（直接修改某些特殊的指标项）
	//【七】400:是否要提示信息，只有设置了才会有提示信息（控制某些不需要提示的操作），401:确认信息提示确认，message中有值，402已点击确认
	//【八】查询详细不需要查询的信息，增加速度，00：不修改主表和详表，01：不查询或不修改定点医院，02：不查询或不修改特殊疾病，03：不查询或不修改药品；“01,02”：表示不查询或不修改定点医院和特殊疾病
	private String comFlag;

	private String aaz267LisStr; //逗号分隔的aaz267集合
	
	private String acceptId; //柜员制受理ID
	
	private String aka083LisStr; //逗号分隔的aka083
	
	private String congruentLis; //SQL查询时指定哪些字段条件需要用“=”来匹配，而不是“like”
	
	private String auditType;//审核类型：0：自动审核，1：一步审核，2：两步审核，可以不传
	
	private String updatestatus;//审核后修改状态，0：未修改或已审核，1：已修改，添加到临时表
	
	private String caa027; //
	
	private String message;//返回确认信息
	
	private Map<String,String> bizpolicys;//政策值
	
	private String akb005;//是否可做门特申请的医疗机构(1:可以)
	//TS19081200049 - 【需求开发】湘潭门特择点报错
	private String modify_131;//门特修改进行漏洞校验

	private String kcc6id; //KCC6 门特资料文件主键

	private String kcc601; //KCC6 门特资料文件批次号

	private String kcc602; //KCC6 门特资料文件类型 0：住院记录 1：检查单 2：化验单

	private String kcc603; //KCC6 门特资料文件序号

	private String kcc604; //KCC6 门特资料文件名称

	private String kcc605; //KCC6 门特资料文件存储路径

	private String hosp_audit_status; // 医院门特资料上传审核状态：''-全部、0-未审核、1-审核通过、2-审核不通过

	public String getKcc6id() {
		return kcc6id;
	}

	public void setKcc6id(String kcc6id) {
		this.kcc6id = kcc6id;
	}

	public String getHosp_audit_status() {
		return hosp_audit_status;
	}

	public void setHosp_audit_status(String hosp_audit_status) {
		this.hosp_audit_status = hosp_audit_status;
	}

	/**
	 * @return 门特资料文件存储路径
	 */
	public String getKcc605() {
		return kcc605;
	}

	public void setKcc605(String kcc605) {
		this.kcc605 = kcc605;
	}

	/**
	 * @return KCC6 门特资料文件名称
	 */
	public String getKcc604() {
		return kcc604;
	}

	public void setKcc604(String kcc604) {
		this.kcc604 = kcc604;
	}

	/**
	 * @return KCC6 门特资料文件序号
	 */
	public String getKcc603() {
		return kcc603;
	}

	public void setKcc603(String kcc603) {
		this.kcc603 = kcc603;
	}

	/**
	 * @return KCC6 门特资料文件类型 0：住院记录 1：检查单 2：化验单
	 */
	public String getKcc602() {
		return kcc602;
	}

	public void setKcc602(String kcc602) {
		this.kcc602 = kcc602;
	}

	/**
	 * @return KCC6 门特资料文件批次号
	 */
	public String getKcc601() {
		return kcc601;
	}

	public void setKcc601(String kcc601) {
		this.kcc601 = kcc601;
	}

	public String getBkm367() {
		return bkm367;
	}

	public void setBkm367(String bkm367) {
		this.bkm367 = bkm367;
	}

	public String getAkc191() {
		return akc191;
	}

	public void setAkc191(String akc191) {
		this.akc191 = akc191;
	}

	public String getAaa027_name() {
		return aaa027_name;
	}

	public void setAaa027_name(String aaa027_name) {
		this.aaa027_name = aaa027_name;
	}

	public String getBaa027() {
		return baa027;
	}

	public void setBaa027(String baa027) {
		this.baa027 = baa027;
	}

	public String getAaa129() {
		return aaa129;
	}

	public void setAaa129(String aaa129) {
		this.aaa129 = aaa129;
	}

	public String getAkc190() {
		return akc190;
	}

	public void setAkc190(String akc190) {
		this.akc190 = akc190;
	}

	public String getPageFlag() {
		return pageFlag;
	}

	public void setPageFlag(String pageFlag) {
		this.pageFlag = pageFlag;
	}
	
	public Long getAaz267() {
		return aaz267;
	}

	public void setAaz267(Long aaz267) {
		this.aaz267 = aaz267;
	}

	public String getAka083() {
		return aka083;
	}

	public void setAka083(String aka083) {
		this.aka083 = aka083;
	}

	public String getAka130() {
		return aka130;
	}

	public void setAka130(String aka130) {
		this.aka130 = aka130;
	}

	public String getBka006() {
		return bka006;
	}

	public void setBka006(String bka006) {
		this.bka006 = bka006;
	}

	public String getBke035() {
		return bke035;
	}

	public void setBke035(String bke035) {
		this.bke035 = bke035;
	}

	public String getBke055() {
		return bke055;
	}

	public void setBke055(String bke055) {
		this.bke055 = bke055;
	}

	public Long getAkc226() {
		return akc226;
	}

	public void setAkc226(Long akc226) {
		this.akc226 = akc226;
	}

	public String getAaa027() {
		return aaa027;
	}

	public String getAuditType() {
		return auditType;
	}

	public void setAuditType(String auditType) {
		this.auditType = auditType;
	}

	public void setAaa027(String aaa027) {
		this.aaa027 = aaa027;
	}

	public String getAae140() {
		return aae140;
	}

	public void setAae140(String aae140) {
		this.aae140 = aae140;
	}

	public Long getAac001() {
		return aac001;
	}

	public void setAac001(Long aac001) {
		this.aac001 = aac001;
	}

	public String getAac002() {
		if (aac002 != null) {
			aac002 = aac002.trim().toUpperCase();
		}
		return aac002;
	}

	public void setAac002(String aac002) {
		if (aac002 != null) {
			aac002 = aac002.trim().toUpperCase();
		}
		this.aac002 = aac002;
	}

	public String getAac003() {
		return aac003;
	}

	public void setAac003(String aac003) {
		this.aac003 = aac003;
	}

	public String getAac004() {
		return aac004;
	}

	public void setAac004(String aac004) {
		this.aac004 = aac004;
	}

	public Integer getAac006() {
		return aac006;
	}

	public void setAac006(Integer aac006) {
		this.aac006 = aac006;
	}

	public String getBka035() {
		return bka035;
	}

	public void setBka035(String bka035) {
		this.bka035 = bka035;
	}

	public String getAac066() {
		return aac066;
	}

	public void setAac066(String aac066) {
		this.aac066 = aac066;
	}

	public String getBke033() {
		return bke033;
	}

	public void setBke033(String bke033) {
		this.bke033 = bke033;
	}

	public String getBke001() {
		return bke001;
	}

	public void setBke001(String bke001) {
		this.bke001 = bke001;
	}

	public Long getAab001() {
		return aab001;
	}

	public void setAab001(Long aab001) {
		this.aab001 = aab001;
	}

	public String getAab069() {
		return aab069;
	}

	public void setAab069(String aab069) {
		this.aab069 = aab069;
	}

	public String getAaz067() {
		return aaz067;
	}

	public void setAaz067(String aaz067) {
		this.aaz067 = aaz067;
	}

	public String getBaf003() {
		return baf003;
	}

	public void setBaf003(String baf003) {
		this.baf003 = baf003;
	}

	public String getAaz070() {
		return aaz070;
	}

	public void setAaz070(String aaz070) {
		this.aaz070 = aaz070;
	}

	public String getAaf013() {
		return aaf013;
	}

	public void setAaf013(String aaf013) {
		this.aaf013 = aaf013;
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

	public String getAae011() {
		return aae011;
	}

	public void setAae011(String aae011) {
		this.aae011 = aae011;
	}

	public Date getAae036() {
		return aae036;
	}

	public void setAae036(Date aae036) {
		this.aae036 = aae036;
	}

	public String getAkb020() {
		return akb020;
	}

	public void setAkb020(String akb020) {
		this.akb020 = akb020;
	}

	public String getAkb021() {
		return akb021;
	}

	public void setAkb021(String akb021) {
		this.akb021 = akb021;
	}

	public String getAae127() {
		return aae127;
	}

	public void setAae127(String aae127) {
		this.aae127 = aae127;
	}

	public String getBke021() {
		return bke021;
	}

	public void setBke021(String bke021) {
		this.bke021 = bke021;
	}

	public String getBke022() {
		return bke022;
	}

	public void setBke022(String bke022) {
		this.bke022 = bke022;
	}

	public String getBke024() {
		return bke024;
	}

	public void setBke024(String bke024) {
		this.bke024 = bke024;
	}

	public String getAae014() {
		return aae014;
	}

	public void setAae014(String aae014) {
		this.aae014 = aae014;
	}

	public String getAae015() {
		return aae015;
	}

	public void setAae015(String aae015) {
		this.aae015 = aae015;
	}

	public String getAae016() {
		return aae016;
	}

	public void setAae016(String aae016) {
		this.aae016 = aae016;
	}

	public String getAae189() {
		return aae189;
	}

	public void setAae189(String aae189) {
		this.aae189 = aae189;
	}

	public String getAae100() {
		return aae100;
	}

	public void setAae100(String aae100) {
		this.aae100 = aae100;
	}

	public String getAaz286() {
		return aaz286;
	}

	public void setAaz286(String aaz286) {
		this.aaz286 = aaz286;
	}

	public String getBke053() {
		return bke053;
	}

	public void setBke053(String bke053) {
		this.bke053 = bke053;
	}

	public String getBke008() {
		return bke008;
	}

	public void setBke008(String bke008) {
		this.bke008 = bke008;
	}

	public String getAke017() {
		return ake017;
	}

	public void setAke017(String ake017) {
		this.ake017 = ake017;
	}

	public String getAkc172() {
		return akc172;
	}

	public void setAkc172(String akc172) {
		this.akc172 = akc172;
	}

	public String getBke010() {
		return bke010;
	}

	public void setBke010(String bke010) {
		this.bke010 = bke010;
	}

	public String getBke046() {
		return bke046;
	}

	public void setBke046(String bke046) {
		this.bke046 = bke046;
	}

	public String getBke051() {
		return bke051;
	}

	public void setBke051(String bke051) {
		this.bke051 = bke051;
	}

	public String getBke007() {
		return bke007;
	}

	public void setBke007(String bke007) {
		this.bke007 = bke007;
	}

	public String getBke038() {
		return bke038;
	}

	public void setBke038(String bke038) {
		this.bke038 = bke038;
	}

	public String getBke003() {
		return bke003;
	}

	public void setBke003(String bke003) {
		this.bke003 = bke003;
	}

	public String getBke009() {
		return bke009;
	}

	public void setBke009(String bke009) {
		this.bke009 = bke009;
	}

	public String getBke011() {
		return bke011;
	}

	public void setBke011(String bke011) {
		this.bke011 = bke011;
	}

	public String getAke014() {
		return ake014;
	}

	public void setAke014(String ake014) {
		this.ake014 = ake014;
	}

	public String getAab299() {
		return aab299;
	}

	public void setAab299(String aab299) {
		this.aab299 = aab299;
	}

	public String getBkm301() {
		return bkm301;
	}

	public void setBkm301(String bkm301) {
		this.bkm301 = bkm301;
	}

	public String getBke049() {
		return bke049;
	}

	public void setBke049(String bke049) {
		this.bke049 = bke049;
	}

	public String getAka120() {
		return aka120;
	}

	public void setAka120(String aka120) {
		this.aka120 = aka120;
	}

	public String getAka121() {
		return aka121;
	}

	public void setAka121(String aka121) {
		this.aka121 = aka121;
	}

	public Double getAae019() {
		return aae019;
	}

	public void setAae019(Double aae019) {
		this.aae019 = aae019;
	}

	public String getBke005() {
		return bke005;
	}

	public void setBke005(String bke005) {
		this.bke005 = bke005;
	}

	public String getBke006() {
		return bke006;
	}

	public void setBke006(String bke006) {
		this.bke006 = bke006;
	}

	public String getBke060() {
		return bke060;
	}

	public void setBke060(String bke060) {
		this.bke060 = bke060;
	}

	public String getBkz201() {
		return bkz201;
	}

	public void setBkz201(String bkz201) {
		this.bkz201 = bkz201;
	}

	public Double getAee333() {
		return aee333;
	}

	public void setAee333(Double aee333) {
		this.aee333 = aee333;
	}

	public String getBke061() {
		return bke061;
	}

	public void setBke061(String bke061) {
		this.bke061 = bke061;
	}

	public String getBke062() {
		return bke062;
	}

	public void setBke062(String bke062) {
		this.bke062 = bke062;
	}

	public String getBke050() {
		return bke050;
	}

	public void setBke050(String bke050) {
		this.bke050 = bke050;
	}

	public String getBkz202() {
		return bkz202;
	}

	public void setBkz202(String bkz202) {
		this.bkz202 = bkz202;
	}

	public Double getAkb081() {
		return akb081;
	}

	public void setAkb081(Double akb081) {
		this.akb081 = akb081;
	}

	public String getBke031() {
		return bke031;
	}

	public void setBke031(String bke031) {
		this.bke031 = bke031;
	}

	public String getBke032() {
		return bke032;
	}

	public void setBke032(String bke032) {
		this.bke032 = bke032;
	}

	public String getBke025() {
		return bke025;
	}

	public void setBke025(String bke025) {
		this.bke025 = bke025;
	}

	public String getBkb023() {
		return bkb023;
	}

	public void setBkb023(String bkb023) {
		this.bkb023 = bkb023;
	}

	public String getBke027() {
		return bke027;
	}

	public void setBke027(String bke027) {
		this.bke027 = bke027;
	}

	public String getBke028() {
		return bke028;
	}

	public void setBke028(String bke028) {
		this.bke028 = bke028;
	}



	public String getBke014() {
		return bke014;
	}

	public void setBke014(String bke014) {
		this.bke014 = bke014;
	}

	public String getBke015() {
		return bke015;
	}

	public void setBke015(String bke015) {
		this.bke015 = bke015;
	}

	public String getBke017() {
		return bke017;
	}

	public void setBke017(String bke017) {
		this.bke017 = bke017;
	}

	public String getBkb024() {
		return bkb024;
	}

	public void setBkb024(String bkb024) {
		this.bkb024 = bkb024;
	}

	public String getBke020() {
		return bke020;
	}

	public void setBke020(String bke020) {
		this.bke020 = bke020;
	}

	public String getBke018() {
		return bke018;
	}

	public void setBke018(String bke018) {
		this.bke018 = bke018;
	}

	public String getBkb025() {
		return bkb025;
	}

	public void setBkb025(String bkb025) {
		this.bkb025 = bkb025;
	}

	public String getBke019() {
		return bke019;
	}

	public void setBke019(String bke019) {
		this.bke019 = bke019;
	}

	public String getBke013() {
		return bke013;
	}

	public void setBke013(String bke013) {
		this.bke013 = bke013;
	}

	public String getBke034() {
		return bke034;
	}

	public void setBke034(String bke034) {
		this.bke034 = bke034;
	}

	public String getBkb026() {
		return bkb026;
	}

	public void setBkb026(String bkb026) {
		this.bkb026 = bkb026;
	}

	public String getBkb027() {
		return bkb027;
	}

	public void setBkb027(String bkb027) {
		this.bkb027 = bkb027;
	}

	public Date getBkb028() {
		return bkb028;
	}

	public void setBkb028(Date bkb028) {
		this.bkb028 = bkb028;
	}

	public String getBke012() {
		return bke012;
	}

	public void setBke012(String bke012) {
		this.bke012 = bke012;
	}

	public String getAka109() {
		return aka109;
	}

	public void setAka109(String aka109) {
		this.aka109 = aka109;
	}

	public String getBke002() {
		return bke002;
	}

	public void setBke002(String bke002) {
		this.bke002 = bke002;
	}

	public String getAae127_start() {
		return aae127_start;
	}

	public void setAae127_start(String aae127_start) {
		this.aae127_start = aae127_start;
	}

	public String getAae127_end() {
		return aae127_end;
	}

	public void setAae127_end(String aae127_end) {
		this.aae127_end = aae127_end;
	}
	
	public String getAudit_status() {
		return audit_status;
	}

	public void setAudit_status(String audit_status) {
		this.audit_status = audit_status;
	}
	
	public String getHosplist() {
		return hosplist;
	}

	public void setHosplist(String hosplist) {
		this.hosplist = hosplist;
	}

	public String getDiseaselist() {
		return diseaselist;
	}

	public void setDiseaselist(String diseaselist) {
		this.diseaselist = diseaselist;
	}

	public String getAke001() {
		return ake001;
	}

	public void setAke001(String ake001) {
		this.ake001 = ake001;
	}

	public String getAke002() {
		return ake002;
	}

	public void setAke002(String ake002) {
		this.ake002 = ake002;
	}

	public String getAka035() {
		return aka035;
	}

	public void setAka035(String aka035) {
		this.aka035 = aka035;
	}

	public String getAka020() {
		return aka020;
	}

	public void setAka020(String aka020) {
		this.aka020 = aka020;
	}

	public String getAka021() {
		return aka021;
	}

	public void setAka021(String aka021) {
		this.aka021 = aka021;
	}

	public String getDruglist() {
		return druglist;
	}

	public void setDruglist(String druglist) {
		this.druglist = druglist;
	}

	public String getDrugarray() {
		return drugarray;
	}

	public void setDrugarray(String drugarray) {
		this.drugarray = drugarray;
	}

	public String getAkb022() {
		return akb022;
	}

	public void setAkb022(String akb022) {
		this.akb022 = akb022;
	}

	public String getBke301() {
		return bke301;
	}

	public void setBke301(String bke301) {
		this.bke301 = bke301;
	}

	public String getAkb020_not() {
		return akb020_not;
	}

	public void setAkb020_not(String akb020_not) {
		this.akb020_not = akb020_not;
	}

	public String getComFlag() {
		return comFlag;
	}

	public void setComFlag(String comFlag) {
		this.comFlag = comFlag;
	}

	public String getAaz267LisStr() {
		return aaz267LisStr;
	}

	public void setAaz267LisStr(String aaz267LisStr) {
		this.aaz267LisStr = aaz267LisStr;
	}

	public Long getBkb032() {
		return bkb032;
	}

	public void setBkb032(Long bkb032) {
		this.bkb032 = bkb032;
	}

	public String getAaz217() {
		return aaz217;
	}

	public void setAaz217(String aaz217) {
		this.aaz217 = aaz217;
	}

	public String getBke039() {
		return bke039;
	}

	public void setBke039(String bke039) {
		this.bke039 = bke039;
	}

	public String getAcceptId() {
		return acceptId;
	}

	public void setAcceptId(String acceptId) {
		this.acceptId = acceptId;
	}

	public String getAae013() {
		return aae013;
	}

	public void setAae013(String aae013) {
		this.aae013 = aae013;
	}

	public String getAka083LisStr() {
		return aka083LisStr;
	}

	public void setAka083LisStr(String aka083LisStr) {
		this.aka083LisStr = aka083LisStr;
	}

	public String getCongruentLis() {
		return congruentLis;
	}

	public void setCongruentLis(String congruentLis) {
		this.congruentLis = congruentLis;
	}

	public String getUpdatestatus() {
		return updatestatus;
	}

	public void setUpdatestatus(String updatestatus) {
		this.updatestatus = updatestatus;
	}

	public String getCaa027() {
		return caa027;
	}

	public void setCaa027(String caa027) {
		this.caa027 = caa027;
	}

	public String getBke401() {
		return bke401;
	}

	public void setBke401(String bke401) {
		this.bke401 = bke401;
	}

	public String getBke402() {
		return bke402;
	}

	public void setBke402(String bke402) {
		this.bke402 = bke402;
	}

	public String getBkb051() {
		return bkb051;
	}

	public void setBkb051(String bkb051) {
		this.bkb051 = bkb051;
	}

	public String getBkb052() {
		return bkb052;
	}

	public void setBkb052(String bkb052) {
		this.bkb052 = bkb052;
	}

	public String getBkb053() {
		return bkb053;
	}

	public void setBkb053(String bkb053) {
		this.bkb053 = bkb053;
	}

	public String getBkb054() {
		return bkb054;
	}

	public void setBkb054(String bkb054) {
		this.bkb054 = bkb054;
	}

	public String getBkb050() {
		return bkb050;
	}

	public void setBkb050(String bkb050) {
		this.bkb050 = bkb050;
	}

	public Date getBkb056() {
		return bkb056;
	}

	public void setBkb056(Date bkb056) {
		this.bkb056 = bkb056;
	}

	public String getBkb055() {
		return bkb055;
	}

	public void setBkb055(String bkb055) {
		this.bkb055 = bkb055;
	}

	public String getBkb057() {
		return bkb057;
	}

	public void setBkb057(String bkb057) {
		this.bkb057 = bkb057;
	}

	public String getBkb058() {
		return bkb058;
	}

	public void setBkb058(String bkb058) {
		this.bkb058 = bkb058;
	}

	public String getAke001_not() {
		return ake001_not;
	}

	public void setAke001_not(String ake001_not) {
		this.ake001_not = ake001_not;
	}

	public Map<String, String> getBizpolicys() {
		return bizpolicys;
	}

	public void setBizpolicys(Map<String, String> bizpolicys) {
		this.bizpolicys = bizpolicys;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getKca3id() {
		return kca3id;
	}

	public void setKca3id(String kca3id) {
		this.kca3id = kca3id;
	}

	public String getAae010() {
		return aae010;
	}

	public void setAae010(String aae010) {
		this.aae010 = aae010;
	}

	public String getAae012() {
		return aae012;
	}

	public void setAae012(String aae012) {
		this.aae012 = aae012;
	}

	public String getAae017() {
		return aae017;
	}

	public void setAae017(String aae017) {
		this.aae017 = aae017;
	}

	public String getBka100() {
		return bka100;
	}

	public void setBka100(String bka100) {
		this.bka100 = bka100;
	}

	public String getAkb005() {
		return akb005;
	}

	public void setAkb005(String akb005) {
		this.akb005 = akb005;
	}
	//TS19081200049 - 【需求开发】湘潭门特择点报错
	public String getModify_131() {
		return modify_131;
	}

	public void setModify_131(String modify_131) {
		this.modify_131 = modify_131;
	}
	
}
