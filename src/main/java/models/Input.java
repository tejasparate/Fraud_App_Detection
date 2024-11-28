package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import services.DBConnector;
import services.JavaFuns;
 

public class Input {
	
	private String title,userid,sts;
	private String path,dt,tm,prediction;
	private int dsId,dataset;
	 

	public String getPrediction() {
		return prediction;
	}

	public void setPrediction(String prediction) {
		this.prediction = prediction;
	}

	private List<Input> lstdataset;
	
public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

public int getDataset() {
		return dataset;
	}

	public void setDataset(int dataset) {
		this.dataset = dataset;
	}

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

	public List<Input> getLstdataset() {
		return lstdataset;
	}

	public void setLstdataset(List<Input> lstdataset) {
		this.lstdataset = lstdataset;
	}

public List<Input> getTwDataSet(){
	
	DBConnector gc = new DBConnector();
	Connection con;
	ResultSet rs;
	 
	try {
		
		con=gc.connect(); 
		Statement st;
		st=con.createStatement(); 
		rs=st.executeQuery("select * from inputcsv where userid='"+userid.trim()+"';");
		lstdataset=new ArrayList<Input>();
		while(rs.next()) {
			
			Input vs= new Input();
			vs.setTitle(rs.getString("title"));
			vs.setDt(rs.getString("dt"));
			vs.setTm(rs.getString("tm"));
			vs.setPath(rs.getString("path"));
			vs.setDsId(rs.getInt("dsId"));
			 
			vs.setDataset(rs.getInt("datasetId"));
			vs.setSts(rs.getString("sts"));
			JavaFuns jf=new JavaFuns();
			try {
			Vector v=jf.getValue("select prediction from reviews where inputid="+rs.getInt("dsId")+" order by id desc limit 1 ", 1);
			String pred=v.elementAt(0).toString().trim();
			vs.setPrediction(pred);
			}
			catch (Exception e) {
				// TODO: handle exception
				vs.setPrediction("NA");
			}
		    lstdataset.add(vs);
		}
		
	}
	
	catch(Exception ex) {
		ex.printStackTrace();
	}
	
	return(lstdataset);
}
 
}
