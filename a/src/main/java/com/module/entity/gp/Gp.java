package com.module.entity.gp;

import java.lang.reflect.Field;

import com.module.util.UuidUtil;

public class Gp {
	private String gpid;
	private String gpmc;
	private float jrkpj;
	private float zrspj;
	private float dqjg;
	private float jrzgj;
	private float jrzdj;
	private float jmj;
	private float jmmj;
	private float cjgps;
	private float cjje;
	private float m1sq;
	private float m1bj;
	private float m2sq;
	private float m2bj;
	private float m3sq;
	private float m3bj;
	private float m4sq;
	private float m4bj;
	private float m5sq;
	private float m5bj;
	private float mm1sq;
	private float mm1bj;
	private float mm2sq;
	private float mm2bj;
	private float mm3sq;
	private float mm3bj;
	private float mm4sq;
	private float mm4bj;
	private float mm5sq;
	private float mm5bj;
	private String rq;
	private String sj;

	public void setGp(String[] strArray){
		Class<? extends Gp> cls = this.getClass();
		Field[] field = cls.getDeclaredFields();
		if(strArray.length > field.length) return;
		this.gpid = UuidUtil.get32UUID();	
		for(int i=1;i<strArray.length;i++){//最后一位未知
			try {
				if(field[i].getType().toString().endsWith("String")){
					field[i].set(this, strArray[i-1]);
				}else{
					field[i].set(this, Float.parseFloat(strArray[i-1]));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public String getGpid() {
		return gpid;
	}

	public void setGpid(String gpid) {
		this.gpid = gpid;
	}

	public String getGpmc() {
		return gpmc;
	}

	public void setGpmc(String gpmc) {
		this.gpmc = gpmc;
	}

	public float getJrkpj() {
		return jrkpj;
	}

	public void setJrkpj(float jrkpj) {
		this.jrkpj = jrkpj;
	}

	public float getZrspj() {
		return zrspj;
	}

	public void setZrspj(float zrspj) {
		this.zrspj = zrspj;
	}

	public float getDqjg() {
		return dqjg;
	}

	public void setDqjg(float dqjg) {
		this.dqjg = dqjg;
	}

	public float getJrzgj() {
		return jrzgj;
	}

	public void setJrzgj(float jrzgj) {
		this.jrzgj = jrzgj;
	}

	public float getJrzdj() {
		return jrzdj;
	}

	public void setJrzdj(float jrzdj) {
		this.jrzdj = jrzdj;
	}

	public float getJmj() {
		return jmj;
	}

	public void setJmj(float jmj) {
		this.jmj = jmj;
	}

	public float getJmmj() {
		return jmmj;
	}

	public void setJmmj(float jmmj) {
		this.jmmj = jmmj;
	}

	public float getCjgps() {
		return cjgps;
	}

	public void setCjgps(float cjgps) {
		this.cjgps = cjgps;
	}

	public float getCjje() {
		return cjje;
	}

	public void setCjje(float cjje) {
		this.cjje = cjje;
	}

	public float getM1sq() {
		return m1sq;
	}

	public void setM1sq(float m1sq) {
		this.m1sq = m1sq;
	}

	public float getM1bj() {
		return m1bj;
	}

	public void setM1bj(float m1bj) {
		this.m1bj = m1bj;
	}

	public float getM2sq() {
		return m2sq;
	}

	public void setM2sq(float m2sq) {
		this.m2sq = m2sq;
	}

	public float getM2bj() {
		return m2bj;
	}

	public void setM2bj(float m2bj) {
		this.m2bj = m2bj;
	}

	public float getM3sq() {
		return m3sq;
	}

	public void setM3sq(float m3sq) {
		this.m3sq = m3sq;
	}

	public float getM3bj() {
		return m3bj;
	}

	public void setM3bj(float m3bj) {
		this.m3bj = m3bj;
	}

	public float getM4sq() {
		return m4sq;
	}

	public void setM4sq(float m4sq) {
		this.m4sq = m4sq;
	}

	public float getM4bj() {
		return m4bj;
	}

	public void setM4bj(float m4bj) {
		this.m4bj = m4bj;
	}

	public float getM5sq() {
		return m5sq;
	}

	public void setM5sq(float m5sq) {
		this.m5sq = m5sq;
	}

	public float getM5bj() {
		return m5bj;
	}

	public void setM5bj(float m5bj) {
		this.m5bj = m5bj;
	}

	public float getMm1sq() {
		return mm1sq;
	}

	public void setMm1sq(float mm1sq) {
		this.mm1sq = mm1sq;
	}

	public float getMm1bj() {
		return mm1bj;
	}

	public void setMm1bj(float mm1bj) {
		this.mm1bj = mm1bj;
	}

	public float getMm2sq() {
		return mm2sq;
	}

	public void setMm2sq(float mm2sq) {
		this.mm2sq = mm2sq;
	}

	public float getMm2bj() {
		return mm2bj;
	}

	public void setMm2bj(float mm2bj) {
		this.mm2bj = mm2bj;
	}

	public float getMm3sq() {
		return mm3sq;
	}

	public void setMm3sq(float mm3sq) {
		this.mm3sq = mm3sq;
	}

	public float getMm3bj() {
		return mm3bj;
	}

	public void setMm3bj(float mm3bj) {
		this.mm3bj = mm3bj;
	}

	public float getMm4sq() {
		return mm4sq;
	}

	public void setMm4sq(float mm4sq) {
		this.mm4sq = mm4sq;
	}

	public float getMm4bj() {
		return mm4bj;
	}

	public void setMm4bj(float mm4bj) {
		this.mm4bj = mm4bj;
	}

	public float getMm5sq() {
		return mm5sq;
	}

	public void setMm5sq(float mm5sq) {
		this.mm5sq = mm5sq;
	}

	public float getMm5bj() {
		return mm5bj;
	}

	public void setMm5bj(float mm5bj) {
		this.mm5bj = mm5bj;
	}

	public String getRq() {
		return rq;
	}

	public void setRq(String rq) {
		this.rq = rq;
	}

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

}
