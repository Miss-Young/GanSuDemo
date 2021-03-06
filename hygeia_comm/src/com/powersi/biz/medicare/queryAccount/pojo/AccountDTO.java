package com.powersi.biz.medicare.queryAccount.pojo;

import com.powersi.comm.mybatis.Page;

public class AccountDTO extends Page {

	private static final long serialVersionUID = 1L;
	private String aac003;//姓名
	private String aac002;//身份证
	private String aac001;//个人编码
	private String aac066_name;//参保类别
	private String bka004_name;
	private String bka008;
	private String aka130_name;
	private String begin_date;
	private String fin_date;
	private String zdmc;
	private String total_fee;
	private String self_pay;
	private String qfx_pay;
	private String jbylf;
	private String fdzfje;
	private String medi_acc_pay;
	private String zdjbbzgfd;
	private String bcbxze;
	private String ecbxze;
	private String sup_acc_pay;
	private String self_sum_pay;
	private String aaz217;
	private String bdyd;
	private String aka120;
	private String akb021;
	private String bkc046;
	private String bkc047;
	private String bkc048;
	private String bkc049;
	private String bkc063;
	private String bkc068;
	private String bkc050;
	private String bkc051;
	private String bkc052;
	private String bkc053;
	private String bkc054;
	private String bkc055;
	private String bkc056;
	private String bkc057;
	private String bkc069;
	private String bkc070;
	private String bkc058;
	private String bkc067;
	private String bkc059;
	private String bkc064;
	private String bkc065;
	private String bkc066;
	private String bkc060;
	private String bkc061;
	private String bkc071;
	private String bkc072;
	private String bkc073;
	private String bkc074;
	private String bkc062;
	private String bka083;
	private String bka084;
	private String bka085;
	private String bka082;
	private String bka003;
	private String bka004;
	private String bka006;
	private String bkb187;
	private String bkb188;
	private String aaa027;
	private String aae041;
	private String aae042;
	private String aae043;
	private String bka109;
	private String bkb019;
	private String aae140;
	private String bkb020;
	private String akb020;
	private String bkb092;
	private String bae010;
	private String bka087;
	private String bka045;
	private String bkb074;
	private String bkb090;
	private String bka509;
	private String v3;
	private String v4;
	private String v5;
	private String v6;
	private String v7;
	private String v8;
	private String v9;
	private String v10;
	private String v11;
	private String v12;
	private String v13;
	private String v14;
	private String v15;
	private String v16;
	private String v17;
	private String v18;
	private String v19;
	private String v20;
	private String v21;
	private String v22;
	private String v23;
	private String v24;
	private String v25;
	private String bka174_a;
	private String bka200;//年终重算大病单议
	private String bkb115;//年终重算上年单价
	private String bka164;//年终重算诊治代码
	private String bka046;//年终重算参考比例
	private String bka199;//年终重算病种分值
	private String bkb097;//年终重算医院系数
	private String bka125;//年终重算icd编码
	private String bka047;//年终重算分值类型 、、年度分值类型  0:零报得分,1:常见病种得分,2:40%以下得分,3:250%以上得分;4:非常见病种得分 
	private String bka174;//年终重算得分
	private String hjrs;
	private String bfje;
	private String yfje;
	private String type;
	private String year;
	private String aaa027_name;
	private String aae140_name;
	private String columns;
	private String filename;
	private String gridId;
	
	public String getAae140_name() {
		return aae140_name;
	}

	public void setAae140_name(String aae140_name) {
		this.aae140_name = aae140_name;
	}

	public String getbka174_a() {
		return bka174_a;
	}

	public void setbka174_a(String bka174_a) {
		this.bka174_a = bka174_a;
	}

	/**
	 * 结算类型 -kce1 pka083
	 * 
	 * @return
	 */
	public String getBka083() {
		return bka083;
	}

	/**
	 * 结算类型 -kce1 pka083
	 * 
	 * @param bka083
	 */
	public void setBka083(String bka083) {
		this.bka083 = bka083;
	}

	/**
	 * 拨付对象类型 -kce1 pka084
	 * 
	 * @return
	 */
	public String getBka084() {
		return bka084;
	}

	/**
	 * 拨付对象类型 -kce1 pka084
	 * 
	 * @param bka084
	 */
	public void setBka084(String bka084) {
		this.bka084 = bka084;
	}

	/**
	 * 拨付对象编码 -kce1 pka085
	 * 
	 * @return
	 */
	public String getBka085() {
		return bka085;
	}

	/**
	 * 拨付对象编码 -kce1 pka085
	 * 
	 * @param bka085
	 */
	public void setBka085(String bka085) {
		this.bka085 = bka085;
	}

	/**
	 * 受理号
	 * 
	 * @return
	 */
	public String getBka082() {
		return bka082;
	}

	/**
	 * 受理号
	 * 
	 * @param bka082
	 */
	public void setBka082(String bka082) {
		this.bka082 = bka082;
	}

	/**
	 * 分局编码
	 * 
	 * @return
	 */
	public String getBka003() {
		return bka003;
	}

	/**
	 * 分局编码
	 * 
	 * @param bka003
	 */
	public void setBka003(String bka003) {
		this.bka003 = bka003;
	}

	/**
	 * 参保情况 pka004
	 * 
	 * @return
	 */
	public String getBka004() {
		return bka004;
	}

	/**
	 * 参保情况 pka004
	 * 
	 * @param bka004
	 */
	public void setBka004(String bka004) {
		this.bka004 = bka004;
	}

	/**
	 * 业务类型 bka006
	 * 
	 * @return
	 */
	public String getBka006() {
		return bka006;
	}

	/**
	 * 业务类型 bka006
	 * 
	 * @param bka006
	 */
	public void setBka006(String bka006) {
		this.bka006 = bka006;
	}

	/**
	 * 预付汇总批号 pkb187 KE67
	 * 
	 * @return
	 */
	public String getBkb187() {
		return bkb187;
	}

	/**
	 * 预付汇总批号 pkb187 KE67
	 * 
	 * @param bkb187
	 */
	public void setBkb187(String bkb187) {
		this.bkb187 = bkb187;
	}

	/**
	 * 汇总批号 bkb188
	 * 
	 * @return
	 */
	public String getBkb188() {
		return bkb188;
	}

	/**
	 * 汇总批号 bkb188
	 * 
	 * @param bkb188
	 */
	public void setBkb188(String bkb188) {
		this.bkb188 = bkb188;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getAaa027() {
		return aaa027;
	}

	public void setAaa027(String aaa027) {
		this.aaa027 = aaa027;
	}

	/**
	 * 开始时间
	 * 
	 * @return
	 */
	public String getAae041() {
		return aae041;
	}

	/**
	 * 开始时间
	 * 
	 * @param aae041
	 */
	public void setAae041(String aae041) {
		this.aae041 = aae041;
	}

	/**
	 * 结束时间
	 * 
	 * @return
	 */
	public String getAae042() {
		return aae042;
	}

	/**
	 * 结束时间
	 * 
	 * @param aae042
	 */
	public void setAae042(String aae042) {
		this.aae042 = aae042;
	}

	/**
	 * 结束年度
	 * 
	 * @return
	 */
	public String getAae043() {
		return aae043;
	}

	/**
	 * 结束年度
	 * 
	 * @param aae043
	 */
	public void setAae043(String aae043) {
		this.aae043 = aae043;
	}

	/**
	 * 处理阶段 -kce1 pka109
	 * 
	 * @return
	 */
	public String getBka109() {
		return bka109;
	}

	/**
	 * 处理阶段 -kce1 pka109
	 * 
	 * @param bka109
	 */
	public void setBka109(String bka109) {
		this.bka109 = bka109;
	}

	public String getBkb019() {
		return bkb019;
	}

	public void setBkb019(String bkb019) {
		this.bkb019 = bkb019;
	}

	public String getAae140() {
		return aae140;
	}

	public void setAae140(String aae140) {
		this.aae140 = aae140;
	}

	public String getBkb020() {
		return bkb020;
	}

	public void setBkb020(String bkb020) {
		this.bkb020 = bkb020;
	}

	public String getAkb020() {
		return akb020;
	}

	public void setAkb020(String akb020) {
		this.akb020 = akb020;
	}

	/**
	 * 集团编码
	 * 
	 * @return
	 */
	public String getBkb092() {
		return bkb092;
	}

	/**
	 * 集团编码
	 * 
	 * @param bkb092
	 */
	public void setBkb092(String bkb092) {
		this.bkb092 = bkb092;
	}

	public String getBae010() {
		return bae010;
	}

	public void setBae010(String bae010) {
		this.bae010 = bae010;
	}

	public String getBka087() {
		return bka087;
	}

	public void setBka087(String bka087) {
		this.bka087 = bka087;
	}

	public String getBka045() {
		return bka045;
	}

	public void setBka045(String bka045) {
		this.bka045 = bka045;
	}

	public String getBkb074() {
		return bkb074;
	}

	public void setBkb074(String bkb074) {
		this.bkb074 = bkb074;
	}

	public String getBkb090() {
		return bkb090;
	}

	public void setBkb090(String bkb090) {
		this.bkb090 = bkb090;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBka509() {
		return bka509;
	}

	public void setBka509(String bka509) {
		this.bka509 = bka509;
	}

	public String getAaa027_name() {
		return aaa027_name;
	}

	public void setAaa027_name(String aaa027_name) {
		this.aaa027_name = aaa027_name;
	}

	public String getV3() {
		return v3;
	}

	public void setV3(String v3) {
		this.v3 = v3;
	}

	public String getV4() {
		return v4;
	}

	public void setV4(String v4) {
		this.v4 = v4;
	}

	public String getV5() {
		return v5;
	}

	public void setV5(String v5) {
		this.v5 = v5;
	}

	public String getV6() {
		return v6;
	}

	public void setV6(String v6) {
		this.v6 = v6;
	}

	public String getV7() {
		return v7;
	}

	public void setV7(String v7) {
		this.v7 = v7;
	}

	public String getV8() {
		return v8;
	}

	public void setV8(String v8) {
		this.v8 = v8;
	}

	public String getV9() {
		return v9;
	}

	public void setV9(String v9) {
		this.v9 = v9;
	}

	public String getV10() {
		return v10;
	}

	public void setV10(String v10) {
		this.v10 = v10;
	}

	public String getV11() {
		return v11;
	}

	public void setV11(String v11) {
		this.v11 = v11;
	}

	public String getV12() {
		return v12;
	}

	public void setV12(String v12) {
		this.v12 = v12;
	}

	public String getV13() {
		return v13;
	}

	public void setV13(String v13) {
		this.v13 = v13;
	}

	public String getV14() {
		return v14;
	}

	public void setV14(String v14) {
		this.v14 = v14;
	}

	public String getV15() {
		return v15;
	}

	public void setV15(String v15) {
		this.v15 = v15;
	}

	public String getV16() {
		return v16;
	}

	public void setV16(String v16) {
		this.v16 = v16;
	}

	public String getV17() {
		return v17;
	}

	public void setV17(String v17) {
		this.v17 = v17;
	}

	public String getV18() {
		return v18;
	}

	public void setV18(String v18) {
		this.v18 = v18;
	}

	public String getV19() {
		return v19;
	}

	public void setV19(String v19) {
		this.v19 = v19;
	}

	public String getV20() {
		return v20;
	}

	public void setV20(String v20) {
		this.v20 = v20;
	}

	public String getV21() {
		return v21;
	}

	public void setV21(String v21) {
		this.v21 = v21;
	}

	public String getV22() {
		return v22;
	}

	public void setV22(String v22) {
		this.v22 = v22;
	}

	public String getV23() {
		return v23;
	}

	public void setV23(String v23) {
		this.v23 = v23;
	}

	public String getV24() {
		return v24;
	}

	public void setV24(String v24) {
		this.v24 = v24;
	}

	public String getV25() {
		return v25;
	}

	public void setV25(String v25) {
		this.v25 = v25;
	}

	public String getHjrs() {
		return hjrs;
	}

	public void setHjrs(String hjrs) {
		this.hjrs = hjrs;
	}

	public String getBfje() {
		return bfje;
	}

	public void setBfje(String bfje) {
		this.bfje = bfje;
	}

	public String getYfje() {
		return yfje;
	}

	public void setYfje(String yfje) {
		this.yfje = yfje;
	}

	public String getAkb021() {
		return akb021;
	}

	public void setAkb021(String akb021) {
		this.akb021 = akb021;
	}

	public String getBkc046() {
		return bkc046;
	}

	public void setBkc046(String bkc046) {
		this.bkc046 = bkc046;
	}

	public String getBkc047() {
		return bkc047;
	}

	public void setBkc047(String bkc047) {
		this.bkc047 = bkc047;
	}

	public String getBkc048() {
		return bkc048;
	}

	public void setBkc048(String bkc048) {
		this.bkc048 = bkc048;
	}

	public String getBkc049() {
		return bkc049;
	}

	public void setBkc049(String bkc049) {
		this.bkc049 = bkc049;
	}

	public String getBkc063() {
		return bkc063;
	}

	public void setBkc063(String bkc063) {
		this.bkc063 = bkc063;
	}

	public String getBkc068() {
		return bkc068;
	}

	public void setBkc068(String bkc068) {
		this.bkc068 = bkc068;
	}

	public String getBkc050() {
		return bkc050;
	}

	public void setBkc050(String bkc050) {
		this.bkc050 = bkc050;
	}

	public String getBkc051() {
		return bkc051;
	}

	public void setBkc051(String bkc051) {
		this.bkc051 = bkc051;
	}

	public String getBkc052() {
		return bkc052;
	}

	public void setBkc052(String bkc052) {
		this.bkc052 = bkc052;
	}

	public String getBkc053() {
		return bkc053;
	}

	public void setBkc053(String bkc053) {
		this.bkc053 = bkc053;
	}

	public String getBkc054() {
		return bkc054;
	}

	public void setBkc054(String bkc054) {
		this.bkc054 = bkc054;
	}

	public String getBkc055() {
		return bkc055;
	}

	public void setBkc055(String bkc055) {
		this.bkc055 = bkc055;
	}

	public String getBkb097() {
		return bkb097;
	}

	public void setBkb097(String bkb097) {
		this.bkb097 = bkb097;
	}

	public String getBkc056() {
		return bkc056;
	}

	public void setBkc056(String bkc056) {
		this.bkc056 = bkc056;
	}

	public String getBkc057() {
		return bkc057;
	}

	public void setBkc057(String bkc057) {
		this.bkc057 = bkc057;
	}

	public String getBkc069() {
		return bkc069;
	}

	public void setBkc069(String bkc069) {
		this.bkc069 = bkc069;
	}

	public String getBkc070() {
		return bkc070;
	}

	public void setBkc070(String bkc070) {
		this.bkc070 = bkc070;
	}

	public String getBkc058() {
		return bkc058;
	}

	public void setBkc058(String bkc058) {
		this.bkc058 = bkc058;
	}

	public String getBkc067() {
		return bkc067;
	}

	public void setBkc067(String bkc067) {
		this.bkc067 = bkc067;
	}

	public String getBkc059() {
		return bkc059;
	}

	public void setBkc059(String bkc059) {
		this.bkc059 = bkc059;
	}

	public String getBkc064() {
		return bkc064;
	}

	public void setBkc064(String bkc064) {
		this.bkc064 = bkc064;
	}

	public String getBkc065() {
		return bkc065;
	}

	public void setBkc065(String bkc065) {
		this.bkc065 = bkc065;
	}

	public String getBkc066() {
		return bkc066;
	}

	public void setBkc066(String bkc066) {
		this.bkc066 = bkc066;
	}

	public String getBkc060() {
		return bkc060;
	}

	public void setBkc060(String bkc060) {
		this.bkc060 = bkc060;
	}

	public String getBkc061() {
		return bkc061;
	}

	public void setBkc061(String bkc061) {
		this.bkc061 = bkc061;
	}

	public String getBkc071() {
		return bkc071;
	}

	public void setBkc071(String bkc071) {
		this.bkc071 = bkc071;
	}

	public String getBkc072() {
		return bkc072;
	}

	public void setBkc072(String bkc072) {
		this.bkc072 = bkc072;
	}

	public String getBkc073() {
		return bkc073;
	}

	public void setBkc073(String bkc073) {
		this.bkc073 = bkc073;
	}

	public String getBkc074() {
		return bkc074;
	}

	public void setBkc074(String bkc074) {
		this.bkc074 = bkc074;
	}

	public String getBkc062() {
		return bkc062;
	}

	public void setBkc062(String bkc062) {
		this.bkc062 = bkc062;
	}

	public String getAac003() {
		return aac003;
	}

	public void setAac003(String aac003) {
		this.aac003 = aac003;
	}

	public String getAac002() {
		return aac002;
	}

	public void setAac002(String aac002) {
		this.aac002 = aac002;
	}

	public String getAac001() {
		return aac001;
	}

	public void setAac001(String aac001) {
		this.aac001 = aac001;
	}

	public String getAac066_name() {
		return aac066_name;
	}

	public void setAac066_name(String aac066_name) {
		this.aac066_name = aac066_name;
	}

	public String getBka004_name() {
		return bka004_name;
	}

	public void setBka004_name(String bka004_name) {
		this.bka004_name = bka004_name;
	}

	public String getBka008() {
		return bka008;
	}

	public void setBka008(String bka008) {
		this.bka008 = bka008;
	}

	public String getAka130_name() {
		return aka130_name;
	}

	public void setAka130_name(String aka130_name) {
		this.aka130_name = aka130_name;
	}

	public String getBegin_date() {
		return begin_date;
	}

	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}

	public String getFin_date() {
		return fin_date;
	}

	public void setFin_date(String fin_date) {
		this.fin_date = fin_date;
	}

	public String getZdmc() {
		return zdmc;
	}

	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}

	public String getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}

	public String getSelf_pay() {
		return self_pay;
	}

	public void setSelf_pay(String self_pay) {
		this.self_pay = self_pay;
	}

	public String getQfx_pay() {
		return qfx_pay;
	}

	public void setQfx_pay(String qfx_pay) {
		this.qfx_pay = qfx_pay;
	}

	public String getJbylf() {
		return jbylf;
	}

	public void setJbylf(String jbylf) {
		this.jbylf = jbylf;
	}

	public String getFdzfje() {
		return fdzfje;
	}

	public void setFdzfje(String fdzfje) {
		this.fdzfje = fdzfje;
	}

	public String getMedi_acc_pay() {
		return medi_acc_pay;
	}

	public void setMedi_acc_pay(String medi_acc_pay) {
		this.medi_acc_pay = medi_acc_pay;
	}

	public String getZdjbbzgfd() {
		return zdjbbzgfd;
	}

	public void setZdjbbzgfd(String zdjbbzgfd) {
		this.zdjbbzgfd = zdjbbzgfd;
	}

	public String getBcbxze() {
		return bcbxze;
	}

	public void setBcbxze(String bcbxze) {
		this.bcbxze = bcbxze;
	}

	public String getEcbxze() {
		return ecbxze;
	}

	public void setEcbxze(String ecbxze) {
		this.ecbxze = ecbxze;
	}

	public String getSup_acc_pay() {
		return sup_acc_pay;
	}

	public void setSup_acc_pay(String sup_acc_pay) {
		this.sup_acc_pay = sup_acc_pay;
	}

	public String getSelf_sum_pay() {
		return self_sum_pay;
	}

	public void setSelf_sum_pay(String self_sum_pay) {
		this.self_sum_pay = self_sum_pay;
	}

	public String getAaz217() {
		return aaz217;
	}

	public void setAaz217(String aaz217) {
		this.aaz217 = aaz217;
	}

	public String getBdyd() {
		return bdyd;
	}

	public void setBdyd(String bdyd) {
		this.bdyd = bdyd;
	}

	public String getAka120() {
		return aka120;
	}

	public void setAka120(String aka120) {
		this.aka120 = aka120;
	}

	public String getBka200() {
		return bka200;
	}

	public void setBka200(String bka200) {
		this.bka200 = bka200;
	}

	public String getBkb115() {
		return bkb115;
	}

	public void setBkb115(String bkb115) {
		this.bkb115 = bkb115;
	}

	public String getBka164() {
		return bka164;
	}

	public void setBka164(String bka164) {
		this.bka164 = bka164;
	}

	public String getBka046() {
		return bka046;
	}

	public void setBka046(String bka046) {
		this.bka046 = bka046;
	}

	public String getBka199() {
		return bka199;
	}

	public void setBka199(String bka199) {
		this.bka199 = bka199;
	}

	public String getBka125() {
		return bka125;
	}

	public void setBka125(String bka125) {
		this.bka125 = bka125;
	}

	public String getBka047() {
		return bka047;
	}

	public void setBka047(String bka047) {
		this.bka047 = bka047;
	}

	public String getBka174() {
		return bka174;
	}

	public void setBka174(String bka174) {
		this.bka174 = bka174;
	}

	public String getColumns() {
		return columns;
	}

	public void setColumns(String columns) {
		this.columns = columns;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getBka174_a() {
		return bka174_a;
	}

	public void setBka174_a(String bka174_a) {
		this.bka174_a = bka174_a;
	}

	public String getGridId() {
		return gridId;
	}

	public void setGridId(String gridId) {
		this.gridId = gridId;
	}

	
	
}
