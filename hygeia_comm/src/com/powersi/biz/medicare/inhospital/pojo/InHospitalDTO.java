package com.powersi.biz.medicare.inhospital.pojo;

import com.powersi.biz.medicare.comm.pojo.MediDTO;

/**
 * 住院管理
 * 
 * @author 刘勇
 *
 */
public class InHospitalDTO extends MediDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String aab301_name;// 参保地地市编码名称（ 例如：440600佛山市）
	private String bka977_name;// 标识(通用)开关、同步与否 1、0
	private String aka070_name;// 医院目录剂型
	private String bke058_name;// 审核状态：(0：未审批；1：审批通过；2：审批不通过)
	private String bka600_name;// 转诊转院类别 ：(1转诊 2转院)
	private String bmc077_name;// 未就业配偶标识
	private String bac032_name;// 困难标志
	private String bka019_hid;// 入院科室
	private String bka021_hid;// 入院病区
	private String ake020_hid;// 床位号
	private String ake022_hid;// 医保医师
	private String bka023_name;// 床位号
	private String ake022_name;// VARCHAR2(20) Y 医保医师编号
	private String aaa027_name;// varchar(6) not null comment 【统筹区名称就医地】
	private String bka006_name;// varchar(6) not null comment '待遇类型',
	private String aka130_name;// varchar(6) not null comment '业务类别编号',
	private String aaz217_hid;// 就医登记号
	private String kcd1id_hid;// kcd1id
	private String bka017_hid;// 入院日期
	private String aka065_name;// 目录等级
	private String ake003_name;// 类别名称
	private String searchType;// py首拼码wb五笔码name名称code编码(queryType)
	private String searchTerm;// (queryValue)
	private String aac004_name;// varchar(1) not null comment '性别',
	private String bka035_name;// varchar(6) not null comment '人员类别',
	private String bac001_name;// varchar(6) not null default '0' comment '级别',
	private String aac013_name;// 人员状态
	private String bka888_name;// 基金冻结状态(0正常、1冻结、9未参保)
	private String bke956_name;// 困难人员类别
	private String aae140_name;// varchar(6) not null comment '险种类型',
	private String aaf013_name;// 乡镇/街道
	private String aab069_name;// 村/社区
	private String baa027_name;// 人员所属中心
	private String aac148_name;// 补助类型
	private String aac008_name;// 人员状态名称
	private String caa027;// 统筹区域
	private String diagnoseinfos;//
	private String healthposts_flag;// 村卫生站标识（1：村卫生站； 0：非村卫生站）
	private String bka445;// 门诊标识
	private String bka446;// 住院号或门诊号
	private String bka447;// 入院登记时间或就诊时间
	private String bka441;// 通用接口_备用字段
	private String bka442;// 通用接口_备用字段
	private String bka443;// 通用接口_备用字段
	private String bka448;// 通用接口_明细_备用字段
	private String bka449;// 通用接口_明细_备用字段
	private String ke22id;// 主键（UUID）
	private String comm_subsys_flag;// 个人化通用接口子系统通道标识 1是，0否
	private String aaa101;
	private String bka820;// 申请理由（申请回退）

	private String bke301; // 医院级别

	private String aka030; // 结算类别（1、中心报账；2、医院上传）

	private String argName;

	private String akc190Update; // 住院修改时，更新住院号，使用此字段，区别于查询条件的akc190

	private String bkl004; // kcd1_log日志表的主键

	private String akc191; // 发票号

	private String bka049; // 最后操作时间

	private String ake021; // 出院诊断医生

	private String ake013; // 报销原因

	private String bkm003; // 生物特征信息id（与智能医审对接）

	private String aac148; // 特殊补助类别（低保、五保、重残、精准扶贫、标准）

	private String aka045; // 取消结算标志（1、取消结算，2：取消出院登记；3：取消就诊登记；4:取消出院结算

	private String ake025; // 化疗费 手术治疗方式

	private String sysparamTips;// 参数,号分开

	private String baf013_name; // 乡镇/街道名称

	private String aaf030_name; // 村/社区

	private String ake105;// 药监局药品编码

	private String aka067;// 药品剂量单位

	private String bkz103;// 限制用药标识

	private int bkh015;// 费用套餐id

	private String bkm001;// 是否在岗医师标识：0，非在岗；1，在岗

	private String bkm002;// 超时标志，0未超时，1超时上传未申诉，2超时上传正在申诉，3超时上传申诉审核同意，4超时上传申诉审核不同意
	private String hospInfoflag;// 通用接口标识
	private String bz3;
	private String bke217;// 离休支付比例
	private String aaz507;// 身份校验密码
	private String aaz508;// 身份校验修改密码
	private String aaz509;// 身份证校验api方式续获取一个标志，无需校验卡鉴权
	private String aae333;// 初审限额
	private String aae030_special;// 特殊业务申请有效开始时间
	private String aae031_special;// 特殊业务申请有效结束时间
	private String bacu18;// 帐户余额
	private String aae240;// 个账支付
	private String bkm100;// 异地就医api保存标识 “3”：出院登记和结算
	private String rollbackflag;// 住院业务回退标识，空或“0”：表示正常流程，“1”：表示由于程序异常导致需要回退业务
	private String biz;
	private String bizid;
	private String bke302;
	private String bkf030;
	private String aaf013; //乡镇编码
	private String aaf014; //乡镇街道名称
	private String aaz070; //村社区ID
	private String aaz071; //村社区名称
	private String baf003; //组ID
	private String baf005; //组名称
	
	private String bkm623;
	private String bkm624;
	private String bkm625;
	private String district; //区/县
	private String fin_disease1; //异地就医第一副诊断编码
	private String fin_disease2; //异地就医第二副诊断编码
	private String fin_disease1_name; //异地就医第一副诊断名称
	private String fin_disease2_name; //异地就医第二副诊断名称
	private String bkz001;//终端机编码
	private String aaz266; //是否106单病种
	private String jac001; 
	private String aac0021;//调跨省异地 身份证号（区别于本地就医和省内aac002）
	private String sex;//性别
	private String idcard;
	private String qrcode;//卡二维码
	private String nocardreminderflag;  //无卡交易标识
	private String kz07info;   			// 社保卡领卡点相关信息
	private String feeinfoflag;			// 费用明细信息标识
    private String bkz300; //密码签名
    private String onestep_hosp_district_flag; //县域内县域外标志
    private String aaz267_standardize; //转诊申请序列号
    private String disease;
	private String checkaka241; //TS20010900098 效验医院是否传aka241标志
	private String aaz510;//电子凭证身份证校验令牌
	private String aaz511;//电子凭证身份证校验证件类型
	//【NTS20051100306】 【医保】通过电子凭证办理的待遇业务需要有相关记录，确保后续能够统计查询  龚喜洋  2020/06/04
	private String aka242; // 是否是电子凭证办理的业务  0：否  1：是
	// NTS20071500412】 【医保】通过电子凭证办理的结算需要发送消息通知，需要传电子凭证，身份证，姓名给后台  方然青  2020/07/20
	private String ecIndexNo; // 电子凭证
	private String idNo; //电子凭证证件号码
	private String idType; //电子凭证证件类别
	private String ecToken; //电子凭证ectoken码
	private String sn_code;//电子凭证sn序列号

	public String getSn_code() {
		return sn_code;
	}

	public void setSn_code(String sn_code) {
		this.sn_code = sn_code;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getEcToken() {
		return ecToken;
	}

	public void setEcToken(String ecToken) {
		this.ecToken = ecToken;
	}

	public String getEcIndexNo() {
		return ecIndexNo;
	}

	public void setEcIndexNo(String ecIndexNo) {
		this.ecIndexNo = ecIndexNo;
	}

	public String getAka242() {
		return aka242;
	}

	public void setAka242(String aka242) {
		this.aka242 = aka242;
	}

	public String getAaz510() {
		return aaz510;
	}

	public void setAaz510(String aaz510) {
		this.aaz510 = aaz510;
	}

	public String getAaz511() {
		return aaz511;
	}

	public void setAaz511(String aaz511) {
		this.aaz511 = aaz511;
	}

	/**
	 * @return the checkaka241
	 */
	public String getCheckaka241() {
		return checkaka241;
	}

	/**
	 * @param checkaka241 the checkaka241 to set
	 */
	public void setCheckaka241(String checkaka241) {
		this.checkaka241 = checkaka241;
	}

	/**
	 * @return the disease
	 */
	public String getDisease() {
		return disease;
	}

	/**
	 * @param disease the disease to set
	 */
	public void setDisease(String disease) {
		this.disease = disease;
	}

	//TS19102100146 - 湘潭县分级诊疗相关政策调整【业务实现】
    //增加一个aka241 用以存储分级诊疗的差别化支付字段 add by 李嘉伦 20191024
    private String aka241;
    
    public String getAka241() {
    	return aka241;
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
	
	/**
	 * @return the bkz300
	 */
	public String getBkz300() {
		return bkz300;
	}
	/**
	 * @param bkz300 the bkz300 to set
	 */
	public void setBkz300(String bkz300) {
		this.bkz300 = bkz300;
	}
	
	public String getFeeinfoflag()
	{
		return feeinfoflag;
	}

	public void setFeeinfoflag(String feeinfoflag)
	{
		this.feeinfoflag = feeinfoflag;
	}

	public String getNocardreminderflag()
	{
		return nocardreminderflag;
	}

	public void setNocardreminderflag(String nocardreminderflag)
	{
		this.nocardreminderflag = nocardreminderflag;
	}

	public String getKz07info()
	{
		return kz07info;
	}

	public void setKz07info(String kz07info)
	{
		this.kz07info = kz07info;
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getAac0021() {
		return aac0021;
	}

	public void setAac0021(String aac0021) {
		this.aac0021 = aac0021;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getJac001() {
		return jac001;
	}

	public void setJac001(String jac001) {
		this.jac001 = jac001;
	}

	/**
	 * @return the aaz266
	 */
	public String getAaz266() {
		return aaz266;
	}

	/**
	 * @param aaz266 the aaz266 to set
	 */
	public void setAaz266(String aaz266) {
		this.aaz266 = aaz266;
	}

	public String getBkz001() {
		return bkz001;
	}

	public void setBkz001(String bkz001) {
		this.bkz001 = bkz001;
	}

	public String getFin_disease1_name() {
		return fin_disease1_name;
	}

	public void setFin_disease1_name(String fin_disease1_name) {
		this.fin_disease1_name = fin_disease1_name;
	}

	public String getFin_disease2_name() {
		return fin_disease2_name;
	}

	public void setFin_disease2_name(String fin_disease2_name) {
		this.fin_disease2_name = fin_disease2_name;
	}

	public String getFin_disease1() {
		return fin_disease1;
	}

	public void setFin_disease1(String fin_disease1) {
		this.fin_disease1 = fin_disease1;
	}

	public String getFin_disease2() {
		return fin_disease2;
	}

	public void setFin_disease2(String fin_disease2) {
		this.fin_disease2 = fin_disease2;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	/**
	 * @return the bkm623
	 */
	public String getBkm623() {
		return bkm623;
	}

	/**
	 * @param bkm623 the bkm623 to set
	 */
	public void setBkm623(String bkm623) {
		this.bkm623 = bkm623;
	}

	/**
	 * @return the bkm624
	 */
	public String getBkm624() {
		return bkm624;
	}

	/**
	 * @param bkm624 the bkm624 to set
	 */
	public void setBkm624(String bkm624) {
		this.bkm624 = bkm624;
	}

	/**
	 * @return the bkm625
	 */
	public String getBkm625() {
		return bkm625;
	}

	/**
	 * @param bkm625 the bkm625 to set
	 */
	public void setBkm625(String bkm625) {
		this.bkm625 = bkm625;
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

	public String getBke302() {
		return bke302;
	}

	public void setBke302(String bke302) {
		this.bke302 = bke302;
	}

	public String getBkf030() {
		return bkf030;
	}

	public void setBkf030(String bkf030) {
		this.bkf030 = bkf030;
	}

	public String getBizid() {
		return bizid;
	}

	public void setBizid(String bizid) {
		this.bizid = bizid;
	}

	public String getBiz() {
		return biz;
	}

	public void setBiz(String biz) {
		this.biz = biz;
	}

	public String getRollbackflag() {
		return rollbackflag;
	}

	public void setRollbackflag(String rollbackflag) {
		this.rollbackflag = rollbackflag;
	}

	public String getBkm100() {
		return bkm100;
	}

	public void setBkm100(String bkm100) {
		this.bkm100 = bkm100;
	}

	public String getAaz509() {
		return aaz509;
	}

	public void setAaz509(String aaz509) {
		this.aaz509 = aaz509;
	}

	public String getAac008_name() {
		return aac008_name;
	}

	public void setAac008_name(String aac008_name) {
		this.aac008_name = aac008_name;
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

	public String getAae030_special() {
		return aae030_special;
	}

	public void setAae030_special(String aae030_special) {
		this.aae030_special = aae030_special;
	}

	public String getAae031_special() {
		return aae031_special;
	}

	public void setAae031_special(String aae031_special) {
		this.aae031_special = aae031_special;
	}

	public String getAae333() {
		return aae333;
	}

	public void setAae333(String aae333) {
		this.aae333 = aae333;
	}

	public String getAaz507() {
		return aaz507;
	}

	public void setAaz507(String aaz507) {
		this.aaz507 = aaz507;
	}

	public String getAaz508() {
		return aaz508;
	}

	public void setAaz508(String aaz508) {
		this.aaz508 = aaz508;
	}

	public String getBke217() {
		return bke217;
	}

	public void setBke217(String bke217) {
		this.bke217 = bke217;
	}

	public String getBz3() {
		return bz3;
	}

	public void setBz3(String bz3) {
		this.bz3 = bz3;
	}

	public String getHospInfoflag() {
		return hospInfoflag;
	}

	public void setHospInfoflag(String hospInfoflag) {
		this.hospInfoflag = hospInfoflag;
	}

	public String getBkm002() {
		return bkm002;
	}

	public void setBkm002(String bkm002) {
		this.bkm002 = bkm002;
	}

	public String getBkm001() {
		return bkm001;
	}

	public void setBkm001(String bkm001) {
		this.bkm001 = bkm001;
	}

	public int getBkh015() {
		return bkh015;
	}

	public void setBkh015(int bkh015) {
		this.bkh015 = bkh015;
	}

	public String getBkz103() {
		return bkz103;
	}

	public void setBkz103(String bkz103) {
		this.bkz103 = bkz103;
	}

	public String getAka067() {
		return aka067;
	}

	public void setAka067(String aka067) {
		this.aka067 = aka067;
	}

	public String getAke105() {
		return ake105;
	}

	public void setAke105(String ake105) {
		this.ake105 = ake105;
	}

	public String getAaf030_name() {
		return aaf030_name;
	}

	public void setAaf030_name(String aaf030_name) {
		this.aaf030_name = aaf030_name;
	}

	public String getBaf013_name() {
		return baf013_name;
	}

	public void setBaf013_name(String baf013_name) {
		this.baf013_name = baf013_name;
	}

	/**
	 * @return the sysparamTips
	 */
	public String getSysparamTips() {
		return sysparamTips;
	}

	/**
	 * @param sysparamTips the sysparamTips to set
	 */
	public void setSysparamTips(String sysparamTips) {
		this.sysparamTips = sysparamTips;
	}

	public String getAae140_name() {
		return aae140_name;
	}

	public String getAke025() {
		return ake025;
	}

	public void setAke025(String ake025) {
		this.ake025 = ake025;
	}

	public String getAka045() {
		return aka045;
	}

	public void setAka045(String aka045) {
		this.aka045 = aka045;
	}

	public String getAac148() {
		return aac148;
	}

	public void setAac148(String aac148) {
		this.aac148 = aac148;
	}

	public String getBkm003() {
		return bkm003;
	}

	public void setBkm003(String bkm003) {
		this.bkm003 = bkm003;
	}

	public String getAke013() {
		return ake013;
	}

	public void setAke013(String ake013) {
		this.ake013 = ake013;
	}

	public String getAke021() {
		return ake021;
	}

	public void setAke021(String ake021) {
		this.ake021 = ake021;
	}

	public String getBka049() {
		return bka049;
	}

	public void setBka049(String bka049) {
		this.bka049 = bka049;
	}

	public String getAkc191() {
		return akc191;
	}

	public void setAkc191(String akc191) {
		this.akc191 = akc191;
	}

	public String getBkl004() {
		return bkl004;
	}

	public void setBkl004(String bkl004) {
		this.bkl004 = bkl004;
	}

	public String getAkc190Update() {
		return akc190Update;
	}

	public void setAkc190Update(String akc190Update) {
		this.akc190Update = akc190Update;
	}

	public String getArgName() {
		return argName;
	}

	public void setArgName(String argName) {
		this.argName = argName;
	}

	public String getAka030() {
		return aka030;
	}

	public void setAka030(String aka030) {
		this.aka030 = aka030;
	}

	public String getBke301() {
		return bke301;
	}

	public void setBke301(String bke301) {
		this.bke301 = bke301;
	}

	public String getAaf013_name() {
		return aaf013_name;
	}

	public void setAaf013_name(String aaf013_name) {
		this.aaf013_name = aaf013_name;
	}

	public String getAab069_name() {
		return aab069_name;
	}

	public void setAab069_name(String aab069_name) {
		this.aab069_name = aab069_name;
	}

	public String getBaa027_name() {
		return baa027_name;
	}

	public void setBaa027_name(String baa027_name) {
		this.baa027_name = baa027_name;
	}

	public String getAac148_name() {
		return aac148_name;
	}

	public void setAac148_name(String aac148_name) {
		this.aac148_name = aac148_name;
	}

	public String getBka820() {
		return bka820;
	}

	private String ykc675;// 省内异地中途结算标识 传3为中途结算
	private String rela_akb020;// 原医院编号
	private String rela_aaz217;// 原就医登记号

	public void setBka820(String bka820) {
		this.bka820 = bka820;
	}

	public String getAaa101() {
		return aaa101;
	}

	public void setAaa101(String aaa101) {
		this.aaa101 = aaa101;
	}

	/**
	 * 
	 * @return 中途结算标识
	 */

	public String getYkc675() {
		return ykc675;
	}

	/**
	 * 
	 * @param ykc675 中途结算标识
	 */
	public void setYkc675(String ykc675) {
		this.ykc675 = ykc675;
	}

	/**
	 * 
	 * @return 原医院编号
	 */
	public String getRela_akb020() {
		return rela_akb020;
	}

	/**
	 * 
	 * @param rela_akb020 原医院编号
	 */
	public void setRela_akb020(String rela_akb020) {
		this.rela_akb020 = rela_akb020;
	}

	/**
	 * 
	 * @return 原就医登记号
	 */
	public String getRela_aaz217() {
		return rela_aaz217;
	}

	/**
	 * 
	 * @param rela_aaz217 原就医登记号
	 */
	public void setRela_aaz217(String rela_aaz217) {
		this.rela_aaz217 = rela_aaz217;
	}

	public String getComm_subsys_flag() {
		return comm_subsys_flag;
	}

	public void setComm_subsys_flag(String comm_subsys_flag) {
		this.comm_subsys_flag = comm_subsys_flag;
	}

	public String getKe22id() {
		return ke22id;
	}

	public void setKe22id(String ke22id) {
		this.ke22id = ke22id;
	}

	/**
	 * 
	 * @return 门诊标识
	 */
	public String getBka445() {
		return bka445;
	}

	/**
	 * 
	 * @param bka445 门诊标识
	 */
	public void setBka445(String bka445) {
		this.bka445 = bka445;
	}

	/**
	 * 
	 * @return 住院号或门诊号
	 */
	public String getBka446() {
		return bka446;
	}

	/**
	 * 
	 * @param bka446 住院号或门诊号
	 */
	public void setBka446(String bka446) {
		this.bka446 = bka446;
	}

	public String getBka447() {
		return bka447;
	}

	public void setBka447(String bka447) {
		this.bka447 = bka447;
	}

	public String getBka441() {
		return bka441;
	}

	public void setBka441(String bka441) {
		this.bka441 = bka441;
	}

	public String getBka442() {
		return bka442;
	}

	public void setBka442(String bka442) {
		this.bka442 = bka442;
	}

	public String getBka443() {
		return bka443;
	}

	public void setBka443(String bka443) {
		this.bka443 = bka443;
	}

	public String getBka448() {
		return bka448;
	}

	public void setBka448(String bka448) {
		this.bka448 = bka448;
	}

	public String getBka449() {
		return bka449;
	}

	public void setBka449(String bka449) {
		this.bka449 = bka449;
	}

	/**
	 * 
	 * @return 参保地地市编码名称（ 例如：440600佛山市）
	 */
	public String getAab301_name() {
		return aab301_name;
	}

	/**
	 * 
	 * @param aab301_name 参保地地市编码名称（ 例如：440600佛山市）
	 */
	public void setAab301_name(String aab301_name) {
		this.aab301_name = aab301_name;
	}

	/**
	 * 
	 * @return 标识(通用)开关、同步与否 1、0
	 */
	public String getBka977_name() {
		return bka977_name;
	}

	/**
	 * 
	 * @param bka977_name 标识(通用)开关、同步与否 1、0
	 */
	public void setBka977_name(String bka977_name) {
		this.bka977_name = bka977_name;
	}

	/**
	 * 
	 * @return 医院目录剂型
	 */
	public String getAka070_name() {
		return aka070_name;
	}

	/**
	 * 
	 * @param bka052_name 医院目录剂型
	 */
	public void setAka070_name(String aka070_name) {
		this.aka070_name = aka070_name;
	}

	public String getDiagnoseinfos() {
		return diagnoseinfos;
	}

	public void setDiagnoseinfos(String diagnoseinfos) {
		this.diagnoseinfos = diagnoseinfos;
	}

	public String getBke058_name() {
		return bke058_name;
	}

	public void setBke058_name(String bke058_name) {
		this.bke058_name = bke058_name;
	}

	public String getBka600_name() {
		return bka600_name;
	}

	public void setBka600_name(String bka600_name) {
		this.bka600_name = bka600_name;
	}

	public String getBmc077_name() {
		return bmc077_name;
	}

	public void setBmc077_name(String bmc077_name) {
		this.bmc077_name = bmc077_name;
	}

	public String getBac032_name() {
		return bac032_name;
	}

	public void setBac032_name(String bac032_name) {
		this.bac032_name = bac032_name;
	}

	public String getBka023_name() {
		return bka023_name;
	}

	public void setBka023_name(String bka023_name) {
		this.bka023_name = bka023_name;
	}

	public String getBka019_hid() {
		return bka019_hid;
	}

	public void setBka019_hid(String bka019_hid) {
		this.bka019_hid = bka019_hid;
	}

	public String getBka021_hid() {
		return bka021_hid;
	}

	public void setBka021_hid(String bka021_hid) {
		this.bka021_hid = bka021_hid;
	}

	public String getAke020_hid() {
		return ake020_hid;
	}

	public void setAke020_hid(String ake020_hid) {
		this.ake020_hid = ake020_hid;
	}

	public String getAke022_hid() {
		return ake022_hid;
	}

	public void setAke022_hid(String bka503_hid) {
		this.ake022_hid = bka503_hid;
	}

	/**
	 * 
	 * @return 医保医师
	 */
	public String getAke022_name() {
		return ake022_name;
	}

	/**
	 * 
	 * @param ake022_name 医保医师
	 */
	public void setAke022_name(String ake022_name) {
		this.ake022_name = ake022_name;
	}

	/**
	 * 
	 * @return 统筹区名称就医地
	 */
	public String getAaa027_name() {
		return aaa027_name;
	}

	/**
	 * 
	 * @param aaa027_name 统筹区名称就医地
	 */
	public void setAaa027_name(String aaa027_name) {
		this.aaa027_name = aaa027_name;
	}

	/**
	 * 
	 * @return 待遇类型
	 */
	public String getBka006_name() {
		return bka006_name;
	}

	/**
	 * 
	 * @param bka006_name 待遇类型
	 */
	public void setBka006_name(String bka006_name) {
		this.bka006_name = bka006_name;
	}

	/**
	 * 
	 * @return 业务类别
	 */
	public String getAka130_name() {
		return aka130_name;
	}

	/**
	 * 
	 * @param aka130_name 业务类别
	 */
	public void setAka130_name(String aka130_name) {
		this.aka130_name = aka130_name;
	}

	/**
	 * 
	 * @return 就医登记号
	 */
	public String getAaz217_hid() {
		return aaz217_hid;
	}

	/**
	 * 
	 * @param aaz217_hid 就医登记号
	 */
	public void setAaz217_hid(String aaz217_hid) {
		this.aaz217_hid = aaz217_hid;
	}

	public String getKcd1id_hid() {
		return kcd1id_hid;
	}

	public void setKcd1id_hid(String kcd1id_hid) {
		this.kcd1id_hid = kcd1id_hid;
	}

	/**
	 * 
	 * @return 入院日期
	 */
	public String getBka017_hid() {
		return bka017_hid;
	}

	/**
	 * 
	 * @param bka017_hid 入院日期
	 */
	public void setBka017_hid(String bka017_hid) {
		this.bka017_hid = bka017_hid;
	}

	/**
	 * 
	 * @return 目录等级
	 */
	public String getAka065_name() {
		return aka065_name;
	}

	/**
	 * 
	 * @param aka065_name 目录等级
	 */
	public void setAka065_name(String aka065_name) {
		this.aka065_name = aka065_name;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchTerm() {
		return searchTerm;
	}

	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

	/**
	 * 
	 * @param aae140_name 险种类型
	 */
	public void setAae140_name(String aae140_name) {
		this.aae140_name = aae140_name;
	}

	/**
	 * 
	 * @return 困难人员类别
	 */
	public String getBke956_name() {
		return bke956_name;
	}

	/**
	 * 
	 * @param bke956_name 困难人员类别
	 */
	public void setBke956_name(String bke956_name) {
		this.bke956_name = bke956_name;
	}

	/**
	 * 
	 * @return 基金冻结状态(0正常、1冻结、9未参保)
	 */
	public String getBka888_name() {
		return bka888_name;
	}

	/**
	 * 
	 * @param bka888_name 基金冻结状态(0正常、1冻结、9未参保)
	 */
	public void setBka888_name(String bka888_name) {
		this.bka888_name = bka888_name;
	}

	/**
	 * 
	 * @return 人员状态
	 */
	public String getAac013_name() {
		return aac013_name;
	}

	/**
	 * 
	 * @param aac013_name 人员状态
	 */
	public void setAac013_name(String aac013_name) {
		this.aac013_name = aac013_name;
	}

	/**
	 * 
	 * @return 级别
	 */
	public String getBac001_name() {
		return bac001_name;
	}

	/**
	 * 
	 * @param bka005_name 级别
	 */
	public void setBac001_name(String bka005_name) {
		this.bac001_name = bka005_name;
	}

	/**
	 * 
	 * @return 性别
	 */
	public String getAac004_name() {
		return aac004_name;
	}

	/**
	 * 
	 * @param aac004_name 性别
	 */
	public void setAac004_name(String aac004_name) {
		this.aac004_name = aac004_name;
	}

	/**
	 * 
	 * @return 人员类别
	 */
	public String getBka035_name() {
		return bka035_name;
	}

	/**
	 * 
	 * @param bka004_name 人员类别
	 */
	public void setBka035_name(String bka035_name) {
		this.bka035_name = bka035_name;
	}

	public String getCaa027() {
		return caa027;
	}

	public void setCaa027(String caa027) {
		this.caa027 = caa027;
	}

	public String getAke003_name() {
		return ake003_name;
	}

	public void setAke003_name(String ake003_name) {
		this.ake003_name = ake003_name;
	}

	public String getHealthposts_flag() {
		return healthposts_flag;
	}

	public void setHealthposts_flag(String healthposts_flag) {
		this.healthposts_flag = healthposts_flag;
	}

}
