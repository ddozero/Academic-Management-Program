package com.semi2.lecture;

import java.sql.*;

public class ManagerLectureDTO {
   private int classidx;
   private int groupidx;
   private String classname;
   private String tname;
   private int entirescount;
   private int reqscount;
   private String comingdate;
   private String enddate;
   private int entiredate;
   private String chargemname;
   //강좌세부사항테이블
   private String groupname;
   private String classintro;
   //주차테이블
   private int weekidx;
   private int weeknum;
   private String weekname;
   private String weekcon;
   private String weekperiod;
   
   public ManagerLectureDTO() {
      // TODO Auto-generated constructor stub
   }

   public String getGroupname() {
      return groupname;
   }

   public void setGroupname(String groupname) {
      this.groupname = groupname;
   }

   public ManagerLectureDTO(String groupname) {
      super();
      this.groupname = groupname;
   }

   public String getClassintro() {
      return classintro;
   }

   public void setClassintro(String classintro) {
      this.classintro = classintro;
   }

   public ManagerLectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount,
         int reqscount, String comingdate, String enddate, int entiredate, String chargemname, String groupname,
         String classintro) {
      super();
      this.classidx = classidx;
      this.groupidx = groupidx;
      this.classname = classname;
      this.tname = tname;
      this.entirescount = entirescount;
      this.reqscount = reqscount;
      this.comingdate = comingdate;
      this.enddate = enddate;
      this.entiredate = entiredate;
      this.chargemname = chargemname;
      this.groupname = groupname;
      this.classintro = classintro;
   }

   public ManagerLectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount,
         int reqscount, String comingdate, String enddate, int entiredate, String chargemname, String groupname) {
      super();
      this.classidx = classidx;
      this.groupidx = groupidx;
      this.classname = classname;
      this.tname = tname;
      this.entirescount = entirescount;
      this.reqscount = reqscount;
      this.comingdate = comingdate;
      this.enddate = enddate;
      this.entiredate = entiredate;
      this.chargemname = chargemname;
      this.groupname = groupname;
   }
   //주차테이블관련
   public ManagerLectureDTO(int classidx, int weekidx, int weeknum, String weekname, String weekcon, String weekperiod) {
      super();
      this.classidx = classidx;
      this.weekidx = weekidx;
      this.weeknum = weeknum;
      this.weekname = weekname;
      this.weekcon = weekcon;
      this.weekperiod = weekperiod;
   }

   public int getClassidx() {
      return classidx;
   }

   public void setClassidx(int classidx) {
      this.classidx = classidx;
   }

   public int getGroupidx() {
      return groupidx;
   }

   public void setGroupidx(int groupidx) {
      this.groupidx = groupidx;
   }

   public String getClassname() {
      return classname;
   }

   public void setClassname(String classname) {
      this.classname = classname;
   }

   public String getTname() {
      return tname;
   }

   public void setTname(String tname) {
      this.tname = tname;
   }

   public int getEntirescount() {
      return entirescount;
   }

   public void setEntirescount(int entirescount) {
      this.entirescount = entirescount;
   }

   public int getReqscount() {
      return reqscount;
   }

   public void setReqscount(int reqscount) {
      this.reqscount = reqscount;
   }

   public String getComingdate() {
      return comingdate;
   }

   public void setComingdate(String comingdate) {
      this.comingdate = comingdate;
   }

   public String getEnddate() {
      return enddate;
   }

   public void setEnddate(String enddate) {
      this.enddate = enddate;
   }

   public int getEntiredate() {
      return entiredate;
   }

   public void setEntiredate(int entiredate) {
      this.entiredate = entiredate;
   }

   public String getChargemname() {
      return chargemname;
   }

   public void setChargemname(String chargemname) {
      this.chargemname = chargemname;
   }

   public int getWeekidx() {
      return weekidx;
   }

   public void setWeekidx(int weekidx) {
      this.weekidx = weekidx;
   }

   public int getWeeknum() {
      return weeknum;
   }

   public void setWeeknum(int weeknum) {
      this.weeknum = weeknum;
   }

   public String getWeekname() {
      return weekname;
   }

   public void setWeekname(String weekname) {
      this.weekname = weekname;
   }

   public String getWeekcon() {
      return weekcon;
   }

   public void setWeekcon(String weekcon) {
      this.weekcon = weekcon;
   }

   public String getWeekperiod() {
      return weekperiod;
   }

   public void setWeekperiod(String weekperiod) {
      this.weekperiod = weekperiod;
   }

}

