package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import services.DBConnector;
 

public class DataSet {
	
	private String title,sts;
	private String path,dt,tm;
	private int dsId;
	private List<DataSet> lstdataset;
	
public String getSts() {
		return sts;
	}

	public void setSts(String sts) {
		this.sts = sts;
	}

public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	 
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getTm() {
		return tm;
	}

	public void setTm(String tm) {
		this.tm = tm;
	}

	public int getDsId() {
		return dsId;
	}

	public void setDsId(int dsId) {
		this.dsId = dsId;
	}

	public List<DataSet> getLstdataset() {
		return lstdataset;
	}

	public void setLstdataset(List<DataSet> lstdataset) {
		this.lstdataset = lstdataset;
	}

public List<DataSet> getTwDataSet(){
	
	DBConnector gc = new DBConnector();
	Connection con;
	ResultSet rs;
	 
	try {
		
		con=gc.connect(); 
		Statement st;
		st=con.createStatement(); 
		rs=st.executeQuery("select * from dataset;");
		lstdataset=new ArrayList<DataSet>();
		while(rs.next()) {
			
			DataSet vs= new DataSet();
			vs.setTitle(rs.getString("title"));
			vs.setDt(rs.getString("dt"));
			vs.setTm(rs.getString("tm"));
			vs.setPath(rs.getString("path"));
			vs.setDsId(rs.getInt("dsId"));
			vs.setSts(rs.getString("sts"));
		    lstdataset.add(vs);
		}
		
	}
	
	catch(Exception ex) {
		ex.printStackTrace();
	}
	
	return(lstdataset);
}
 
}
