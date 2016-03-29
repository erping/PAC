package PAC;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date; 
import java.util.Calendar;  

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class ConnDB {
	
	public Connection conn=null;
	public Statement stmt=null;
	public ResultSet rs=null;
	public String sql;
	public String shuming;
	//advise
	public String name;
	public String date;
	public String tel;
	public String num;
	public String age;
	public String hun;
	public String huji;
	public String zhiye;
	
	public String yuanyin="0";
	public String tingjing="0";
	public String Bchao="0";
	public String niliuchan="0";
	public String liudate="0";
	public String yuntime="0";
	public String chantime="0";
	public String birth="0";
	public String chanlater="0";
	public String chantonow="0";
	public String liutime="0";
	public String poutime="0";
	public String moci="0";
	public String liulater="0";
	public String liutonow="0";
	public String buru="0";
	public String zhiru="0";
	public String liu2="0";
	public String zigong="0";
	public String zhanlian="0";
	public String lieshang="0";
	public String qitagaowei="0";
	public String history="0";
	public String otherhistory="0";
	
	public String gaowei="0";
	
	public String pinlv="0";
	public String plan="0";
	public String renshen="0";
	public String biyun="0";
	public String otherbiyun="0";
	public String nibiyun="0";
	public String othernibiyun="0";
	public String COCshijian="0";
	public String COCzhonglei="0";
	public String IUDfangzhi="0";
	public String weiliji="0";
	public String COCchufang="0";
	public String other="0";
	public String buliang="0";
	public String zhidao="0";
	public String otherzixun="0";
	public String person="0";
	public String yisheng="0";
	public String shijibiyun="0";
	public String COCshijishijian="0";
	public String IUDshijifangzhi="0";
	public String COCjianyichufang="0";
	public String luoshi="0";
	//suifang
	public String canliu="0";
	public String neimo="0";
	public String fangshi="0";
	public String chuxuetianshu="0";
	public String youwubingfa="0";
	public String bingfa="0";
	public String qitabingfa="0";
	public String chuxue="0";
	public String youwubushi="0";
	public String bushi="0";
	public String qitabushi="0";
	public String yuejinghuifu="0";
	public String huifushijian="0";
	public String yuejingxueliang="0";
	public String xinghuifu="0";
	public String liuchanbiyun="0";
	public String COCjianchi="0";
	public String COCjixu="0";
	public String COCyuanyin="0";
	public String qitaCOCyuanyin="0";
	public String COCjixuchufang="0";
	public String COCchufangshu="0";
	public String IUDjianchi="0";
	public String IUDfangzhi2="0";
	public String riqi="0";
	public String IUDyuanyin="0";
	public String qitaIUDyuanyin="0";
	public String huanyongbiyun="0";
	public String huanyongCOC="0";
	public String huanyongIUD="0";
	public String huanyongCOCchufang="0";
	public String yuanyigaoxiao="0";
	public String gaoxiaobiyun="0";
	public String gaoxiaoshijian="0";
	public String gaoxiaochufang="0";
	public String gaoxiaofangzhi="0";
	public String gaoxiaozhonglei="0";
	public String feigaoxiao="0";
	public String qitafeigaoxiao="0";
	

	//zhongyuan
	public String huifu="0";
	public String xiangbi="0";
	public String riqi2="0";
	
	public String shijian="0";
	public String bingfazheng="0";
	public String order="0";
	public String COCqudao="0";
	public String huanjie="0";
	public String yiwai="0";
	public String zhongzhi="0";
	public String yiyuanrenshen="0";
	
	//setting tixing
	public String firstbegin="0";
	public String firstend="0";
	public String threebegin="0";
	public String threeend="0";
	public String sixbegin="0";
	public String sixend="0";
	public String twelvebegin="0";
	public String twelveend="0";
	public String time="0";
	public String begin="0";
	public String end="0";
	
	//setting password
	public String password="0";
	public String newpassword="0";
	public String newpassword2="0";
	
	//setting doctor
	public String doctor="0";
	
	//setting time
	public String systemtime="0";
	public String dateBegin="1971-01-01";
	public String dateEnd="2099-12-31";
	public ConnDB(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(java.lang.ClassNotFoundException e){
			System.err.println(e.getMessage());
		}
	}
	
	public boolean Connection(){
		try{
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospital?user=admin&password=123456&useUnicode=true&characterEncoding=UTF-8");
		}catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println("create SQL connection error!");
		}
		return true;
	}
	
	public void closeConnection(){
		if(conn!=null&&stmt!=null&&rs!=null){
			try{
				rs.close();
				stmt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("Failed ro close connection");
			}finally{
				conn = null;
			}
		}
	}

	
	public ResultSet executeQuery(String sql){
		
		if(conn==null){
			Connection();
		}
		try{
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
		}catch(SQLException ex){
			System.err.println(ex.getMessage());
		}finally{}

		return rs;
	}
	
	
	public String getShuming(String name) throws SQLException{
		String shuming;
		String sql = "select * from doctor where name='"+name+"'";
		ResultSet rs = this.executeQuery(sql);
		rs.next();
		shuming = rs.getString("shuming");
		closeConnection();
		return shuming;
	}
	
	public boolean do_single(){
			if(conn==null){
				Connection();
			}
			try{
				//System.out.println("date");
				System.out.println("name:"+this.name);
				String sql = "insert patient_info (name,date,tel,num,age,hun,huji,zhiye)"
				+"value('"+this.name+"','"+this.date+"','"+this.tel+"','"+this.num+"','"+this.age+"','"
						+this.hun+"','"+this.huji+"','"+this.zhiye+"')";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				if(stmt.executeUpdate(sql)==0){
					System.out.println("update false!");
					return false;
				}
				System.out.println("insert success!");
			}catch(SQLException e){
				System.out.println(e.getMessage());
				return false;
			}
		closeConnection();
		return true;
	}
	
	public boolean update_single(){
		if(conn==null){
			Connection();
		}
		try{
			//System.out.println("date");
			System.out.println("name:"+this.name);
			String sql = "update patient_info set age='"+this.age+"', hun='"+this.hun+"', huji='"+this.huji+"', zhiye='"+this.zhiye+"'," +
					" tel='"+this.tel+"', date='"+this.date+"', name='"+this.name+"' where num='"+this.num+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("insert success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
		closeConnection();
		return true;
	}
	
	public boolean update_daisuifang(){
		if(conn==null){
			Connection();
		}
		try{
			//System.out.println("date");
			System.out.println("name:"+this.name);
			String sql = "update daisuifang set luoshi='"+this.luoshi+"' " +
					" where num='"+this.num+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("update success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
		closeConnection();
		return true;
	}
	
	public boolean do_advise(){
		if(conn==null){
			Connection();
		}
		try{
			//System.out.println("date");
			String sql = "update patient_info set plan='"+this.plan+"', yisheng='"+this.yisheng+"', shijibiyun='"+this.shijibiyun+"'," +
				" biyun='"+this.biyun+"', otherbiyun='"+this.otherbiyun+"', nibiyun='"+this.nibiyun+"', COCshijishijian='"+this.COCshijishijian+"'," +
				" othernibiyun='"+this.othernibiyun+"', COCshijian='"+this.COCshijian+"',COCzhonglei='"+this.COCzhonglei+"', IUDfangzhi='"+this.IUDfangzhi+"'," +
				" weiliji='"+this.weiliji+"', COCchufang='"+this.COCchufang+"', other='"+this.other+"', COCjianyichufang='"+this.COCjianyichufang+"'," +
				" buliang='"+this.buliang+"', zhidao='"+this.zhidao+"', otherzixun='"+this.otherzixun+"', IUDshijifangzhi='"+this.IUDshijifangzhi+"'," +
				" person='"+this.person+"', gaowei='"+this.gaowei+"', pinlv='"+this.pinlv+"', renshen='"+this.renshen+"', luoshi='"+this.luoshi+"' where num='"+this.num+"'";
			stmt = conn.createStatement();
			System.out.println(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("update2 success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
}
	public boolean do_normal(){
		if(conn==null){
			Connection();
		}
		try{
			//System.out.println("date");
			System.out.println("name:"+this.name);
			String sql = "update patient_info set yuanyin='"+this.yuanyin+"',tingjing='"+this.tingjing+"',Bchao='"+this.Bchao+"'," +
					" niliuchan='"+this.niliuchan+"', liudate='"+this.liudate+"', poutime='"+this.poutime+"', moci='"+this.moci+"'," +
					" yuntime='"+this.yuntime+"', chantime='"+this.chantime+"', chanlater='"+this.chanlater+"'," +
					" chantonow='"+this.chantonow+"', birth='"+this.birth+"', buru='"+this.buru+"'," +
					" zhiru='"+this.zhiru+"', liutime='"+this.liutime+"', liulater='"+this.liulater+"'," +
					" liutonow='"+this.liutonow+"', liu2='"+this.liu2+"', zigong='"+this.zigong+"'," +
					" zhanlian='"+this.zhanlian+"', lieshang='"+this.lieshang+"', qitagaowei='"+this.qitagaowei+"'," +
					" history='"+this.history+"', otherhistory='"+this.otherhistory
					+"'  where num='"+this.num+"'";
			stmt = conn.createStatement();
			System.out.println(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("update1 success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
}
	
	public boolean insert_suifang(){
		if(conn==null){
			Connection();
		}
		try{
			String sql1 = "select * from setting where only='1'";
			ResultSet rs = this.executeQuery(sql1);
			if(rs.next()){
				firstbegin = rs.getString("firstbegin");
				firstend = rs.getString("firstend");
				threebegin = rs.getString("threebegin");
				threeend = rs.getString("threeend");
				sixbegin = rs.getString("sixbegin");
				sixend = rs.getString("sixend");
				twelvebegin = rs.getString("twelvebegin");
				twelveend = rs.getString("twelveend");
			}
			System.out.println("firstbegin:"+firstbegin);
			SimpleDateFormat new_date = new SimpleDateFormat("yyyy-MM-dd");
			Date d=new_date.parse(liudate);
			System.out.println("date:"+d);
			Date begin_date = new Date();
			Date end_date = new Date();
			Calendar ca = Calendar.getInstance();
			ca.setTime(d);
			System.out.println("ca:"+ca.getTime().toString());
			ca.add(Calendar.DATE, Integer.valueOf(firstbegin).intValue());
			begin_date = ca.getTime();  
			begin = new_date.format(begin_date);
			System.out.println("begin:"+begin);
			ca.add(Calendar.DATE, Integer.valueOf(firstend).intValue()-Integer.valueOf(firstbegin).intValue());
			end_date = ca.getTime();
			end = new_date.format(end_date);
			System.out.println("end:"+end);
			stmt = conn.createStatement();
			String sql = "insert daisuifang (num,name,tel,time,complete,begin,end,gaowei,liudate,shuming,luoshi)"
			+"value('"+this.num+"','"+this.name+"','"+this.tel+"','"+1+"','"+0+"','"+this.begin+"','"+this.end+"','"+this.gaowei+"','"+this.liudate+"','"+this.person+"','"+this.luoshi+"')";
			stmt.executeUpdate(sql);
			System.out.println("insert1 success!");
			
			ca.setTime(d);
			System.out.println("ca:"+ca.getTime());
			ca.add(Calendar.DATE, Integer.valueOf(threebegin).intValue());
			begin_date = ca.getTime();  
			begin = new_date.format(begin_date);
			ca.add(Calendar.DATE, Integer.valueOf(threeend).intValue()-Integer.valueOf(threebegin).intValue());
			end_date = ca.getTime();
			end = new_date.format(end_date);
			sql = sql = "insert daisuifang (num,name,tel,time,complete,begin,end,gaowei,liudate,shuming)"
			+"value('"+this.num+"','"+this.name+"','"+this.tel+"','"+3+"','"+0+"','"+this.begin+"','"+this.end+"','"+this.gaowei+"','"+this.liudate+"','"+this.person+"')";
			stmt.executeUpdate(sql);
			System.out.println("insert2 success!");
			
			ca.setTime(d);
			System.out.println("ca:"+ca.getTime());
			ca.add(Calendar.DATE, Integer.valueOf(sixbegin).intValue());
			begin_date = ca.getTime();  
			begin = new_date.format(begin_date);
			ca.add(Calendar.DATE, Integer.valueOf(sixend).intValue()-Integer.valueOf(sixbegin).intValue());
			end_date = ca.getTime();
			end = new_date.format(end_date);
			sql = sql = "insert daisuifang (num,name,tel,time,complete,begin,end,gaowei,liudate,shuming)"
			+"value('"+this.num+"','"+this.name+"','"+this.tel+"','"+6+"','"+0+"','"+this.begin+"','"+this.end+"','"+this.gaowei+"','"+this.liudate+"','"+this.person+"')";
			stmt.executeUpdate(sql);
			System.out.println("insert3 success!");
			
			ca.setTime(d);
			System.out.println("ca:"+ca.getTime());
			ca.add(Calendar.DATE, Integer.valueOf(twelvebegin).intValue());// 30为增加的天数，可以改变的  
			begin_date = ca.getTime();  
			begin = new_date.format(begin_date);
			ca.add(Calendar.DATE, Integer.valueOf(twelveend).intValue()-Integer.valueOf(twelvebegin).intValue());
			end_date = ca.getTime();
			end = new_date.format(end_date);
			stmt = conn.createStatement();
			sql = sql = "insert daisuifang (num,name,tel,time,complete,begin,end,gaowei,liudate,shuming)"
					+"value('"+this.num+"','"+this.name+"','"+this.tel+"','"+12+"','"+0+"','"+this.begin+"','"+this.end+"','"+this.gaowei+"','"+this.liudate+"','"+this.person+"')";
			stmt.executeUpdate(sql);
			
			System.out.println("insert4 success!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	
	public boolean executeInsert_suifang(){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "insert first_suifang (date, name, num, tel, fangshi, Bchao, canliu, neimo, " +
					" chuxuetianshu, youwubingfa, bingfa, qitabingfa, chuxue, youwubushi," +
					" bushi, qitabushi, yuejinghuifu, huifushijian, yuejingxueliang, xinghuifu," +
					" liuchanbiyun, COCshijian, COCchufang, COCzhonglei, COCjianchi, COCyuanyin, qitaCOCyuanyin," +
					" COCjixuchufang, COCchufangshu, IUDfangzhi, IUDjianchi, IUDfangzhi2, riqi, IUDyuanyin, qitaIUDyuanyin," +
					" huanyongbiyun, huanyongCOC, huanyongIUD, huanyongCOCchufang, yuanyigaoxiao, gaoxiaobiyun, gaoxiaozhonglei, gaoxiaoshijian, gaoxiaochufang, gaoxiaofangzhi, feigaoxiao," +
					" qitafeigaoxiao,other, person)"+"value('"+this.date+"','"+this.name+"','"+this.num+"','"
					+this.tel+"','"+this.fangshi+"','"+this.Bchao+"','"+this.canliu+"','"+this.neimo+"','"+this.chuxuetianshu+"','"+this.youwubingfa+"','"+this.bingfa
					+"','"+this.qitabingfa+"','"+this.chuxue+"','"+this.youwubushi+"','"+this.bushi
					+"','"+this.qitabushi+"','"+this.yuejinghuifu+"','"+this.huifushijian+"','"+this.yuejingxueliang
					+"','"+this.xinghuifu+"','"+this.liuchanbiyun+"','"+this.COCshijian+"','"+this.COCchufang+"','"+this.COCzhonglei
					+"','"+this.COCjianchi+"','"+this.COCyuanyin+"','"+this.qitaCOCyuanyin
					+"','"+this.COCjixuchufang+"','"+this.COCchufangshu+"','"+this.IUDfangzhi+"','"+this.IUDjianchi+"','"+this.IUDfangzhi2+"','"+this.riqi
					+"','"+this.IUDyuanyin+"','"+this.qitaIUDyuanyin+"','"+this.huanyongbiyun+"','"+this.huanyongCOC+"','"+this.huanyongIUD+"','"+this.huanyongCOCchufang+"','"+this.yuanyigaoxiao+"','"+this.gaoxiaobiyun
					+"','"+this.gaoxiaozhonglei+"','"+this.gaoxiaoshijian+"','"+this.gaoxiaochufang+"','"+this.gaoxiaofangzhi+"','"+this.feigaoxiao
					+"','"+this.qitafeigaoxiao+"','"+this.other+"','"+this.person+"')";
			stmt = conn.createStatement();
			System.out.println(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("insert success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean executeInsert_zhongyuan12(){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "insert zhongyuan12 (date, name, num, tel, fangshi, " +
					" liuchanbiyun, COCshijian, COCchufang, COCjianchi, COCjixu, COCqudao, COCyuanyin, qitaCOCyuanyin," +
					" IUDfangzhi, IUDjianchi, IUDyuanyin, qitaIUDyuanyin," +
					" yuanyigaoxiao, gaoxiaobiyun, gaoxiaoshijian, gaoxiaochufang, gaoxiaofangzhi, feigaoxiao," +
					" qitafeigaoxiao, yiwai, renshen, yiyuanrenshen, zhongzhi, person)"+"value('"+this.date+"','"
					+this.name+"','"+this.num+"','"+this.tel+"','"+this.fangshi+"','"+this.liuchanbiyun+"','"
					+this.COCshijian+"','"+this.COCchufang+"','"+this.COCjianchi+"','"+this.COCjixu+"','"
					+this.COCqudao+"','"+this.COCyuanyin+"','"+this.qitaCOCyuanyin
					+"','"+this.IUDfangzhi+"','"+this.IUDjianchi
					+"','"+this.IUDyuanyin+"','"+this.qitaIUDyuanyin+"','"+this.yuanyigaoxiao+"','"+this.gaoxiaobiyun
					+"','"+this.gaoxiaoshijian+"','"+this.gaoxiaochufang+"','"+this.gaoxiaofangzhi+"','"+this.feigaoxiao
					+"','"+this.qitafeigaoxiao+"','"+this.yiwai+"','"+this.renshen+"','"+this.yiyuanrenshen+"','"+this.zhongzhi+"','"+this.person+"')";
			stmt = conn.createStatement();
			System.out.println(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("insert success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean executeInsert_zhongyuan6(){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "insert zhongyuan6 (date, name, num, tel, fangshi, " +
					" liuchanbiyun, COCshijian, COCchufang, COCjianchi, COCqudao, COCjixu, COCyuanyin, qitaCOCyuanyin," +
					" IUDfangzhi, IUDjianchi, IUDyuanyin, qitaIUDyuanyin, huanyongbiyun, huanyongCOC, huanyongIUD, huanyongCOCchufang, " +
					" yuanyigaoxiao, gaoxiaobiyun, gaoxiaozhonglei, gaoxiaoshijian, gaoxiaochufang, gaoxiaofangzhi, feigaoxiao," +
					" qitafeigaoxiao, yiwai, renshen, yiyuanrenshen, zhongzhi, person)"+"value('"+this.date+"','"
					+this.name+"','"+this.num+"','"+this.tel+"','"+this.fangshi+"','"+this.liuchanbiyun+"','"
					+this.COCshijian+"','"+this.COCchufang+"','"+this.COCjianchi+"','"+this.COCqudao+"','"
					+this.COCjixu+"','"+this.COCyuanyin+"','"+this.qitaCOCyuanyin
					+"','"+this.IUDfangzhi+"','"+this.IUDjianchi+"','"+this.IUDyuanyin+"','"+this.qitaIUDyuanyin
					+"','"+this.huanyongbiyun+"','"+this.huanyongCOC+"','"+this.huanyongIUD+"','"+this.huanyongCOCchufang+"','"+this.yuanyigaoxiao+"','"+this.gaoxiaobiyun
					+"','"+this.gaoxiaozhonglei+"','"+this.gaoxiaoshijian+"','"+this.gaoxiaochufang+"','"+this.gaoxiaofangzhi+"','"+this.feigaoxiao
					+"','"+this.qitafeigaoxiao+"','"+this.yiwai+"','"+this.renshen+"','"+this.yiyuanrenshen+"','"+this.zhongzhi+"','"+this.person+"')";
			stmt = conn.createStatement();
			System.out.println(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("insert success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean executeInsert_zhongyuan(){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "insert zhongyuan (date, name, num, tel, fangshi," +
					" chuxuetianshu, youwubingfa, bingfa, qitabingfa, chuxue, youwubushi," +
					" bushi, qitabushi, huifu, huifushijian, xiangbi, xinghuifu," +
					" liuchanbiyun, COCshijian, COCchufang, COCjianchi, COCjixu, COCyuanyin, qitaCOCyuanyin," +
					" COCjixuchufang, COCchufangshu, IUDfangzhi, IUDjianchi, IUDfangzhi2, riqi, riqi2, IUDyuanyin, qitaIUDyuanyin, " +
					" huanyongbiyun, huanyongCOC, huanyongIUD, huanyongCOCchufang, yuanyigaoxiao, gaoxiaobiyun, gaoxiaoshijian, gaoxiaochufang, gaoxiaofangzhi, feigaoxiao," +
					" qitafeigaoxiao, huanjie, yiwai, renshen, zhongzhi, person)"+"value('"+this.date+"','"
					+this.name+"','"+this.num+"','"+this.tel+"','"+this.fangshi+"','"+this.chuxuetianshu+"','"+this.youwubingfa
					+"','"+this.bingfa+"','"+this.qitabingfa+"','"+this.chuxue+"','"+this.youwubushi
					+"','"+this.bushi+"','"+this.qitabushi+"','"+this.huifu+"','"+this.huifushijian+"','"+this.xiangbi
					+"','"+this.xinghuifu+"','"+this.liuchanbiyun+"','"+this.COCshijian+"','"+this.COCchufang
					+"','"+this.COCjianchi+"','"+this.COCjixu+"','"+this.COCyuanyin+"','"+this.qitaCOCyuanyin
					+"','"+this.COCjixuchufang+"','"+this.COCchufangshu+"','"+this.IUDfangzhi+"','"+this.IUDjianchi+"','"+this.IUDfangzhi2+"','"+this.riqi+"','"+this.riqi2
					+"','"+this.IUDyuanyin+"','"+this.qitaIUDyuanyin+"','"+this.huanyongbiyun+"','"+this.huanyongCOC+"','"+this.huanyongIUD+"','"+this.huanyongCOCchufang+"','"+this.yuanyigaoxiao+"','"+this.gaoxiaobiyun
					+"','"+this.gaoxiaoshijian+"','"+this.gaoxiaochufang+"','"+this.gaoxiaofangzhi+"','"+this.feigaoxiao
					+"','"+this.qitafeigaoxiao+"','"+this.huanjie+"','"+this.yiwai+"','"+this.renshen+"','"+this.zhongzhi+"','"+this.person+"')";
			System.out.println(sql);
			stmt = conn.createStatement();
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("insert success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean set_complete(String time){
		if(conn==null){
			Connection();
		}
		try{
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    	java.util.Date currTime = new java.util.Date();
	    	String curTime = formatter.format(currTime);
			String sql = "update daisuifang set complete='"+curTime+"' where num='"+this.num+"' and time='"+time+"'" ;
			stmt = conn.createStatement();
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("update success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean set_unconnect(String time){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "update daisuifang set complete='1' where num='"+this.num+"' and time='"+time+"'" ;
			stmt = conn.createStatement();
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
			System.out.println("update success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean set_date(){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "update setting set firstbegin='"+this.firstbegin+"', firstend='"
					+this.firstend+"', threebegin='"+this.threebegin+"', threeend='"+this.threeend+"', sixbegin='"
					+this.sixbegin+"', sixend='"+this.sixend+"', twelvebegin='"+this.twelvebegin+"', twelveend='"
					+this.twelveend+"'where only='1'" ;
			stmt = conn.createStatement();
			System.out.println(sql);
			if(stmt.executeUpdate(sql)==0){
				System.out.println("update false!");
				return false;
			}
				
			System.out.println("update success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean set_doctor(){
		if(conn==null){
			Connection();
		}
		try{
			String sql = "insert doctor_name (name) value ('"+this.doctor+"')" ;
			System.out.println(sql);
			stmt = conn.createStatement();
			if(stmt.executeUpdate(sql)==0){
				return false;
				}
			System.out.println("update success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
	closeConnection();
	return true;
	}
	
	public boolean set_time(){
		String osName = System.getProperty("os.name");  
		String cmd = null;
		try{
			// 格式：yyyy-MM-dd  
			cmd = " cmd /c date "+this.systemtime;  
			Runtime.getRuntime().exec(cmd);   
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excuteInsert_doctor(String name, String password, String num){
		if(conn==null){
			Connection();
		}
		try{
			sql = "insert doctor (name, shuming, password)"+"value ('"+name+"','"+num+"','"+password+"')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			System.out.println(sql);
			System.out.println("insert success!");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}
		closeConnection();
		return true;
	}
	
	public String changePassword(){
		String result = null;
		if(conn==null){
			Connection();
		}
		try{
			
			String searchSQL = "select * from doctor where name='"+this.shuming+"'";
			ResultSet Rs;
			Rs = executeQuery(searchSQL);
			Rs.next();
			String password2 = Rs.getString("password");
			if(password2.equals(this.password)&&this.newpassword.equals(this.newpassword2)){
				String SQL = "update doctor set password='"+this.newpassword+"' where name='"+this.shuming+"'";
				System.out.println(SQL);
				stmt = conn.createStatement();
				stmt.executeUpdate(SQL);
				result="success";
			}
			else{
				result="error";
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return "false";
		}
		closeConnection();
		return result;
	}
	
	public boolean excuteUpdate(String sql){
		if(conn==null){
			Connection();
		}
		try{
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException ex){
			System.err.println(ex.getMessage());
			return false;
		}
		closeConnection();
		return true;		
	}
	
	
	public String checkUsername(String username){
		String sql = "select name from patient_info where name='"+username+"'";
		String res = "";
		if(conn==null){
			Connection();
		}
		try{
			stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				res = "Exist";
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return res;
		}
		closeConnection();
		return res;
	}
	
	public String doRegister(String username, String password, String num){
		String res = "";
		res = checkUsername(username);
		if(res.equals("Exist")){
			return res;
		}
		boolean res_b;
		res_b = excuteInsert_doctor(username, password, num);
		if(res_b){
			res =  "success";
		}
		else
			res = "false";
		return res;
	}
	
	WritableWorkbook book=null;

	public void OutputExcel() throws SQLException{
	   try{
		   
		   String className = ConnDB.class.getName();
	        String classNamePath = className.replace(".", "/") + ".class";
	        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
	        String path = is.getFile();
	       path = path.substring(0, path.length()-32);
	       System.out.println("path:"+path);
	        book = Workbook.createWorkbook(new File(path+"output/output1.xls"));
	//设置表名
	WritableSheet sheet = book.createSheet("患者信息表",0);
	//生成表格题头
	Label labe1 = new Label(0, 0, "姓名" );
	Label labe2 = new Label(1, 0, "咨询日期");
	Label labe3 = new Label(2, 0, "病历号");
	Label labe4 = new Label(3, 0, "电话");
	Label labe5 = new Label(4, 0, "年龄");
	Label labe6 = new Label(5, 0, "婚否");
	Label labe7 = new Label(6, 0, "户籍");
	Label labe8 = new Label(7, 0, "职业");
	Label labe9 = new Label(8, 0, "停经天数");
	Label labe10 = new Label(9, 0, "B超显示孕周");
	Label labe11 = new Label(10, 0, "稽留流产");
	Label labe12 = new Label(11, 0, "拟选择流产方式");
	Label labe13 = new Label(12, 0, "预约流产日期");
	Label labe14 = new Label(13, 0, "孕次");
	Label labe15 = new Label(14, 0, "产次");
	Label labe16 = new Label(15, 0, "上次生产时间");
	Label labe17 = new Label(16, 0, "生产距现在");
	Label labe18 = new Label(17, 0, "上次生产方式");
	Label labe19 = new Label(18, 0, "是否在哺乳期");
	Label labe20 = new Label(19, 0, "是否有胎盘植入史");
	Label labe21 = new Label(20, 0, "人工流产次数");
	Label labe22 = new Label(21, 0, "上次流产时间");
	Label labe23 = new Label(22, 0, "流产距现在");
	Label labe24 = new Label(23, 0, "是否在一年内>=2次流产");
	Label labe25 = new Label(24, 0, "是否曾有子宫穿孔");
	Label labe26 = new Label(25, 0, "是否曾有宫腔粘连");
	Label labe27 = new Label(26, 0, "是否曾有宫颈裂伤");
	Label labe28 = new Label(27, 0, "其他高危情况");
	Label labe29 = new Label(28, 0, "自然流产次数");
	Label labe30 = new Label(29, 0, "现病史");
	Label labe31 = new Label(30, 0, "其他病史");
	Label labe32 = new Label(31, 0, "未来生育计划");
	Label labe33 = new Label(32, 0, "本次妊娠原因");
	Label labe34 = new Label(33, 0, "以往避孕方式");
	Label labe35 = new Label(34, 0, "其他避孕方式");
	Label labe36 = new Label(35, 0, "拟选择避孕方式");
	Label labe37 = new Label(36, 0, "其他 拟避孕方式");
	Label labe38 = new Label(37, 0, "COC开始使用时间");
	Label labe39 = new Label(38, 0, "COC种类");
	Label labe40 = new Label(39, 0, "IUD放置时间");
	Label labe41 = new Label(40, 0, "未立即使用原因");
	Label labe42 = new Label(41, 0, "COC处方数");
	Label labe43 = new Label(42, 0, "相关合并情况");
	Label labe44 = new Label(43, 0, "说明不良反应");
	Label labe45 = new Label(44, 0, "性生活频率");
	Label labe46 = new Label(45, 0, "指导患者使用");
	Label labe47 = new Label(46, 0, "其他咨询内容");
	Label labe48 = new Label(47, 0, "咨询员");
	Label labe49 = new Label(48,0, "高危");
	Label  labe50=new  Label(49,0,"随访方式");
	Label  labe51=new  Label(50,0,"出血天数");
	Label  labe52=new  Label(51,0,"有无并发");
	Label  labe53=new  Label(52,0,"并发症种类");
	Label  labe54=new  Label(53,0,"其他并发");
	Label  labe55=new  Label(54,0,"出血量");
	Label  labe56=new  Label(55,0,"有无不适");
	Label  labe57=new  Label(56,0,"不适症状");
	Label  labe58=new  Label(57,0,"其他不适");
	Label  labe59=new  Label(58,0,"月经恢复");
	Label  labe60=new  Label(59,0,"恢复时间");
	Label  labe61=new  Label(60,0,"月经血量");
	Label  labe62=new  Label(61,0,"性恢复");
	Label  labe63=new  Label(62,0,"COC继续使用");
	Label  labe64=new  Label(63,0,"COC未坚持原因");
	Label  labe65=new  Label(64,0,"其他原因");
	Label  labe66=new  Label(65,0,"COC是否继续处方");
	Label  labe67=new  Label(66,0,"继续处方数");
	Label  labe68=new  Label(67,0,"IUD是否坚持");
	Label  labe69=new  Label(68,0,"IUD未坚持原因");
	Label  labe70=new  Label(69,0,"其他IUD原因");
	Label  labe71=new  Label(70,0,"是否愿意高效");
	Label  labe72=new  Label(71,0,"高效避孕方式");
	Label  labe73=new  Label(72,0,"高效时间");
	Label  labe74=new  Label(73,0,"高效处方");
	Label  labe75=new  Label(74,0,"高效放置时间");
	Label  labe76=new  Label(75,0,"非高效避孕方式");
	Label  labe77=new  Label(76,0,"其他非高效");
	Label  labe78=new  Label(77,0,"其他咨询内容");
	Label  labe79=new  Label(78,0,"咨询员");
	Label  labe80=new  Label(79,0,"B超复查");
	Label  labe81=new  Label(80,0,"内膜厚度");
	
	Label  labe82=new  Label(81,0,"随访时间");
	Label  labe83=new  Label(82,0,"随访次数");
	Label  labe84=new  Label(83,0,"随访方式");
	Label  labe85=new  Label(84,0,"出血天数");
	Label  labe86=new  Label(85,0,"有无并发");
	Label  labe87=new  Label(86,0,"并发症");
	Label  labe88=new  Label(87,0,"其他并发症");
	Label  labe89=new  Label(88,0,"出血量");
	Label  labe90=new  Label(89,0,"有无不适");
	Label  labe91=new  Label(90,0,"不适症状");
	Label  labe92=new  Label(91,0,"其他不适症状");
	Label  labe93=new  Label(92,0,"月经是否恢复");
	Label  labe94=new  Label(93,0,"月经恢复时间");
	Label  labe95=new  Label(94,0,"血量相比");
	Label  labe96=new  Label(95,0,"性恢复");
	Label  labe97=new  Label(96,0,"COC坚持");
	Label  labe98=new  Label(97,0,"COC继续");
	Label  labe99=new  Label(98,0,"COC未坚持原因");
	Label  labe100=new  Label(99,0,"其他原因");
	Label  labe101=new  Label(100,0,"COC是否继续处方");
	Label  labe102=new  Label(101,0,"继续处方数");
	Label  labe103=new  Label(102,0,"IUD是否坚持");
	Label  labe104=new  Label(103,0,"IUD未坚持原因");
	Label  labe105=new  Label(104,0,"其他IUD原因");
	Label  labe106=new  Label(105,0,"是否愿意高效");
	Label  labe107=new  Label(106,0,"高效避孕方式");
	Label  labe108=new  Label(107,0,"高效时间");
	Label  labe109=new  Label(108,0,"高效处方数");
	Label  labe110=new  Label(109,0,"高效放置时间");
	Label  labe111=new  Label(110,0,"非高效避孕方式");
	Label  labe112=new  Label(111,0,"其他非高效");
	Label  labe113=new  Label(112,0,"意外妊娠");
	Label  labe114=new  Label(113,0,"意愿妊娠");
	Label  labe115=new  Label(114,0,"是否终止");
	
	Label  labe116=new  Label(115,0,"随访时间");
	Label  labe117=new  Label(116,0,"随访次数");
	Label  labe118=new  Label(117,0,"随访方式");
	Label  labe119=new  Label(118,0,"COC继续");
	Label  labe120=new  Label(119,0,"COC坚持");
	Label  labe121=new  Label(120,0,"COC渠道");
	Label  labe122=new  Label(121,0,"COC未坚持原因");
	Label  labe123=new  Label(122,0,"其他原因");
	Label  labe124=new  Label(123,0,"IUD是否坚持");
	Label  labe125=new  Label(124,0,"IUD未坚持原因");
	Label  labe126=new  Label(125,0,"其他IUD原因");
	Label  labe127=new  Label(126,0,"是否愿意高效");
	Label  labe128=new  Label(127,0,"高效避孕方式");
	Label  labe129=new  Label(128,0,"高效时间");
	Label  labe130=new  Label(129,0,"高效处方数");
	Label  labe131=new  Label(130,0,"高效放置时间");
	Label  labe132=new  Label(131,0,"非高效避孕方式");
	Label  labe133=new  Label(132,0,"其他非高效");
	Label  labe134=new  Label(133,0,"意外妊娠");
	Label  labe135=new  Label(134,0,"意愿妊娠");
	Label  labe136=new  Label(135,0,"是否终止");
	Label  labe137=new  Label(136,0,"随访时间");
	Label  labe138=new  Label(137,0,"随访次数");
	Label  labe139=new  Label(138,0,"随访方式");
	Label  labe140=new  Label(139,0,"COC继续");
	Label  labe141=new  Label(140,0,"COC坚持");
	Label  labe142=new  Label(141,0,"COC渠道");
	Label  labe143=new  Label(142,0,"COC未坚持原因");
	Label  labe144=new  Label(143,0,"其他原因");
	Label  labe145=new  Label(144,0,"IUD是否坚持");
	Label  labe146=new  Label(145,0,"IUD未坚持原因");
	Label  labe147=new  Label(146,0,"其他IUD原因");
	Label  labe148=new  Label(147,0,"是否愿意高效");
	Label  labe149=new  Label(148,0,"高效避孕方式");
	Label  labe150=new  Label(149,0,"高效时间");
	Label  labe151=new  Label(150,0,"高效处方数");
	Label  labe152=new  Label(151,0,"高效放置时间");
	Label  labe153=new  Label(152,0,"非高效避孕方式");
	Label  labe154=new  Label(153,0,"其他非高效");
	Label  labe155=new  Label(154,0,"意外妊娠");
	Label  labe156=new  Label(155,0,"意愿妊娠");
	Label  labe157=new  Label(156,0,"是否终止");
	
	             //将生成的单元格添加到工作表中    
	sheet.addCell(labe1);
	sheet.addCell(labe2);
	sheet.addCell(labe3);
	sheet.addCell(labe4);
	sheet.addCell(labe5);
	sheet.addCell(labe6);
	sheet.addCell(labe7);
	sheet.addCell(labe8);
	sheet.addCell(labe9);
	sheet.addCell(labe10);
	sheet.addCell(labe11);
	sheet.addCell(labe12);
	sheet.addCell(labe13);
	sheet.addCell(labe14);
	sheet.addCell(labe15);
	sheet.addCell(labe16);
	sheet.addCell(labe17);
	sheet.addCell(labe18);
	sheet.addCell(labe19);
	sheet.addCell(labe20);
	sheet.addCell(labe21);
	sheet.addCell(labe22);
	sheet.addCell(labe23);
	sheet.addCell(labe24);
	sheet.addCell(labe25);
	sheet.addCell(labe26);
	sheet.addCell(labe27);
	sheet.addCell(labe28);
	sheet.addCell(labe29);
	sheet.addCell(labe30);
	sheet.addCell(labe31);
	sheet.addCell(labe32);
	sheet.addCell(labe33);
	sheet.addCell(labe34);
	sheet.addCell(labe35);
	sheet.addCell(labe36);
	sheet.addCell(labe37);
	sheet.addCell(labe38);
	sheet.addCell(labe39);
	sheet.addCell(labe40);
	sheet.addCell(labe41);
	sheet.addCell(labe42);
	sheet.addCell(labe43);
	sheet.addCell(labe44);
	sheet.addCell(labe45);
	sheet.addCell(labe46);
	sheet.addCell(labe47);
	sheet.addCell(labe48);
	sheet.addCell(labe49);
	sheet.addCell(labe50);
	sheet.addCell(labe51);
	sheet.addCell(labe52);
	sheet.addCell(labe53);
	sheet.addCell(labe54);
	sheet.addCell(labe55);
	sheet.addCell(labe56);
	sheet.addCell(labe57);
	sheet.addCell(labe58);
	sheet.addCell(labe59);
	sheet.addCell(labe60);
	sheet.addCell(labe61);
	sheet.addCell(labe62);
	sheet.addCell(labe63);
	sheet.addCell(labe64);
	sheet.addCell(labe65);
	sheet.addCell(labe66);
	sheet.addCell(labe67);
	sheet.addCell(labe68);
	sheet.addCell(labe69);
	sheet.addCell(labe70);
	sheet.addCell(labe71);
	sheet.addCell(labe72);
	sheet.addCell(labe73);
	sheet.addCell(labe74);
	sheet.addCell(labe75);
	sheet.addCell(labe76);
	sheet.addCell(labe77);
	sheet.addCell(labe78);
	sheet.addCell(labe79);
	sheet.addCell(labe80);
	sheet.addCell(labe81);
	sheet.addCell(labe82);
	sheet.addCell(labe83);
	sheet.addCell(labe84);
	sheet.addCell(labe85);
	sheet.addCell(labe86);
	sheet.addCell(labe87);
	sheet.addCell(labe88);
	sheet.addCell(labe89);
	sheet.addCell(labe90);
	sheet.addCell(labe91);
	sheet.addCell(labe92);
	sheet.addCell(labe93);
	sheet.addCell(labe94);
	sheet.addCell(labe95);
	sheet.addCell(labe96);
	sheet.addCell(labe97);
	sheet.addCell(labe98);
	sheet.addCell(labe99);
	sheet.addCell(labe100);
	sheet.addCell(labe101);
	sheet.addCell(labe102);
	sheet.addCell(labe103);
	sheet.addCell(labe104);
	sheet.addCell(labe105);
	sheet.addCell(labe106);
	sheet.addCell(labe107);
	sheet.addCell(labe108);
	sheet.addCell(labe109);
	sheet.addCell(labe110);
	sheet.addCell(labe111);
	sheet.addCell(labe112);
	sheet.addCell(labe113);
	sheet.addCell(labe114);
	sheet.addCell(labe115);
	sheet.addCell(labe116);
	sheet.addCell(labe117);
	sheet.addCell(labe118);
	sheet.addCell(labe119);
	sheet.addCell(labe120);
	sheet.addCell(labe121);
	sheet.addCell(labe122);
	sheet.addCell(labe123);
	sheet.addCell(labe124);
	sheet.addCell(labe125);
	sheet.addCell(labe126);
	sheet.addCell(labe127);
	sheet.addCell(labe128);
	sheet.addCell(labe129);
	sheet.addCell(labe130);
	sheet.addCell(labe131);
	sheet.addCell(labe132);
	sheet.addCell(labe133);
	sheet.addCell(labe134);
	sheet.addCell(labe135);
	sheet.addCell(labe136);
	sheet.addCell(labe137);
	sheet.addCell(labe138);
	sheet.addCell(labe139);
	sheet.addCell(labe140);
	sheet.addCell(labe141);
	sheet.addCell(labe142);
	sheet.addCell(labe143);
	sheet.addCell(labe144);

	sheet.addCell(labe145);
	sheet.addCell(labe146);
	sheet.addCell(labe147);
	sheet.addCell(labe148);
	sheet.addCell(labe149);
	sheet.addCell(labe150);
	sheet.addCell(labe151);
	sheet.addCell(labe152);
	sheet.addCell(labe153);
	sheet.addCell(labe154);
	sheet.addCell(labe155);
	sheet.addCell(labe156);
	sheet.addCell(labe157);
	String SQL = "select * from patient_info";
	if(!dateBegin.equals("")&&!dateEnd.equals("")){
		
		SQL = "select * from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'";
	}
	ResultSet Rs;
	Rs = executeQuery(SQL);
	
	int i = 1;

	while(Rs.next()){

	//取得数据生成单元格
	Label  label1=new  Label(0,i,Rs.getString("name"));
	Label  label2=new  Label(1,i,Rs.getString("date"));
	Label  label3=new  Label(2,i,Rs.getString("num"));
	Label  label4=new  Label(3,i,Rs.getString("tel"));
	Label  label5=new  Label(4,i,Rs.getString("age"));
	Label  label6=new  Label(5,i,Rs.getString("hun"));
	Label  label7=new  Label(6,i,Rs.getString("huji"));
	Label  label8=new  Label(7,i,Rs.getString("zhiye"));
	Label  label9=new  Label(8,i,Rs.getString("tingjing"));
	Label  label10=new  Label(9,i,Rs.getString("Bchao"));
	Label  label11=new  Label(10,i,Rs.getString("moci"));
	Label  label12=new  Label(11,i,Rs.getString("niliuchan"));
	Label  label13=new  Label(12,i,Rs.getString("liudate"));
	Label  label14=new  Label(13,i,Rs.getString("yuntime"));
	Label  label15=new  Label(14,i,Rs.getString("chantime"));
	Label  label16=new  Label(15,i,Rs.getString("chanlater"));
	Label  label17=new  Label(16,i,Rs.getString("chantonow"));
	Label  label18=new  Label(17,i,Rs.getString("birth"));
	Label  label19=new  Label(18,i,Rs.getString("buru"));
	Label  label20=new  Label(19,i,Rs.getString("zhiru"));
	Label  label21=new  Label(20,i,Rs.getString("liutime"));
	Label  label22=new  Label(21,i,Rs.getString("liulater"));
	Label  label23=new  Label(22,i,Rs.getString("liutonow"));
	Label  label24=new  Label(23,i,Rs.getString("liu2"));
	Label  label25=new  Label(24,i,Rs.getString("zigong"));
	Label  label26=new  Label(25,i,Rs.getString("zhanlian"));
	Label  label27=new  Label(26,i,Rs.getString("lieshang"));
	Label  label28=new  Label(27,i,Rs.getString("qitagaowei"));
	Label  label29=new  Label(28,i,"");
	Label  label30=new  Label(29,i,Rs.getString("history"));
	Label  label31=new  Label(30,i,Rs.getString("otherhistory"));
	Label  label32=new  Label(31,i,Rs.getString("plan"));
	Label  label33=new  Label(32,i,Rs.getString("renshen"));
	Label  label34=new  Label(33,i,Rs.getString("biyun"));
	Label  label35=new  Label(34,i,Rs.getString("otherbiyun"));
	Label  label36=new  Label(35,i,Rs.getString("nibiyun"));
	Label  label37=new  Label(36,i,Rs.getString("othernibiyun"));
	Label  label38=new  Label(37,i,Rs.getString("COCshijian"));
	Label  label39=new  Label(38,i,Rs.getString("COCzhonglei"));
	Label  label40=new  Label(39,i,Rs.getString("IUDfangzhi"));
	Label  label41=new  Label(40,i,Rs.getString("weiliji"));
	Label  label42=new  Label(41,i,Rs.getString("COCchufang"));
	Label  label43=new  Label(42,i,Rs.getString("other"));
	Label  label44=new  Label(43,i,Rs.getString("buliang"));
	Label  label45=new  Label(44,i,Rs.getString("pinlv"));
	Label  label46=new  Label(45,i,Rs.getString("zhidao"));
	Label  label47=new  Label(46,i,Rs.getString("otherzixun"));
	Label  label48=new  Label(47,i,Rs.getString("person"));
	Label  label49=new  Label(48,i,Rs.getString("gaowei"));
	
	
	         //将生成的单元格添加到工作表中    
	sheet.addCell(label1);
	sheet.addCell(label2);
	sheet.addCell(label3);
	sheet.addCell(label4);
	sheet.addCell(label5);
	sheet.addCell(label6);
	sheet.addCell(label7);    
	sheet.addCell(label8);
	sheet.addCell(label9);
	sheet.addCell(label10);
	sheet.addCell(label11);
	sheet.addCell(label12);
	sheet.addCell(label13);
	sheet.addCell(label14);
	sheet.addCell(label15);
	sheet.addCell(label16);
	sheet.addCell(label17);
	sheet.addCell(label18);
	sheet.addCell(label19);
	sheet.addCell(label20);
	sheet.addCell(label21);
	sheet.addCell(label22);
	sheet.addCell(label23);
	sheet.addCell(label24);
	sheet.addCell(label25);
	sheet.addCell(label26);
	sheet.addCell(label27);
	sheet.addCell(label28);
	sheet.addCell(label29);
	sheet.addCell(label30);
	sheet.addCell(label31);
	sheet.addCell(label32);
	sheet.addCell(label33);
	sheet.addCell(label34);
	sheet.addCell(label35);
	sheet.addCell(label36);
	sheet.addCell(label37);
	sheet.addCell(label38);
	sheet.addCell(label39);
	sheet.addCell(label40);
	sheet.addCell(label41);
	sheet.addCell(label42);
	sheet.addCell(label43);
	sheet.addCell(label44);
	sheet.addCell(label45);
	sheet.addCell(label46);
	sheet.addCell(label47);
	sheet.addCell(label48);
	sheet.addCell(label49);
	
	String SQL1 = "select * from first_suifang where num='"+Rs.getString("num")+"'";
	ResultSet Rs1;
	Rs1 = executeQuery(SQL1);
	if(Rs1.next()){
		Label  label50=new  Label(49,i,Rs1.getString("fangshi"));
		Label  label51=new  Label(50,i,Rs1.getString("chuxuetianshu"));
		Label  label52=new  Label(51,i,Rs1.getString("youwubingfa"));
		Label  label53=new  Label(52,i,Rs1.getString("bingfa"));
		Label  label54=new  Label(53,i,Rs1.getString("qitabingfa"));
		Label  label55=new  Label(54,i,Rs1.getString("chuxue"));
		Label  label56=new  Label(55,i,Rs1.getString("youwubushi"));
		Label  label57=new  Label(56,i,Rs1.getString("bushi"));
		Label  label58=new  Label(57,i,Rs1.getString("qitabushi"));
		Label  label59=new  Label(58,i,Rs1.getString("yuejinghuifu"));
		Label  label60=new  Label(59,i,Rs1.getString("huifushijian"));
		Label  label61=new  Label(60,i,Rs1.getString("yuejingxueliang"));
		Label  label62=new  Label(61,i,Rs1.getString("xinghuifu"));
		Label  label63=new  Label(62,i,"");
		Label  label64=new  Label(63,i,Rs1.getString("COCyuanyin"));
		Label  label65=new  Label(64,i,Rs1.getString("qitaCOCyuanyin"));
		Label  label66=new  Label(65,i,Rs1.getString("COCjixuchufang"));
		Label  label67=new  Label(66,i,Rs1.getString("COCchufangshu"));
		Label  label68=new  Label(67,i,Rs1.getString("IUDjianchi"));
		Label  label69=new  Label(68,i,Rs1.getString("IUDyuanyin"));
		Label  label70=new  Label(69,i,Rs1.getString("qitaIUDyuanyin"));
		Label  label71=new  Label(70,i,Rs1.getString("yuanyigaoxiao"));
		Label  label72=new  Label(71,i,Rs1.getString("gaoxiaobiyun"));
		Label  label73=new  Label(72,i,Rs1.getString("gaoxiaoshijian"));
		Label  label74=new  Label(73,i,Rs1.getString("gaoxiaochufang"));
		Label  label75=new  Label(74,i,Rs1.getString("gaoxiaofangzhi"));
		Label  label76=new  Label(75,i,Rs1.getString("feigaoxiao"));
		Label  label77=new  Label(76,i,Rs1.getString("qitafeigaoxiao"));
		Label  label78=new  Label(77,i,Rs1.getString("other"));
		Label  label79=new  Label(78,i,Rs1.getString("person"));
		Label  label80=new  Label(79,i,Rs1.getString("Bchao"));
		Label  label81=new  Label(80,i,Rs1.getString("neimo"));
		
		sheet.addCell(label50);
		sheet.addCell(label51);
		sheet.addCell(label52);
		sheet.addCell(label53);
		sheet.addCell(label54);
		sheet.addCell(label55);
		sheet.addCell(label56);
		sheet.addCell(label57);
		sheet.addCell(label58);
		sheet.addCell(label59);
		sheet.addCell(label60);
		sheet.addCell(label61);
		sheet.addCell(label62);
		sheet.addCell(label63);
		sheet.addCell(label64);
		sheet.addCell(label65);
		sheet.addCell(label66);
		sheet.addCell(label67);
		sheet.addCell(label68);
		sheet.addCell(label69);
		sheet.addCell(label70);
		sheet.addCell(label71);
		sheet.addCell(label72);
		sheet.addCell(label73);
		sheet.addCell(label74);
		sheet.addCell(label75);
		sheet.addCell(label76);
		sheet.addCell(label77);
		sheet.addCell(label78);
		sheet.addCell(label79);
		sheet.addCell(label80);
		sheet.addCell(label81);
	}
	String SQL2 = "select * from zhongyuan where num='"+Rs.getString("num")+"'";
	ResultSet Rs2;
	Rs2 = executeQuery(SQL2);
	if(Rs2.next()){

		Label  label82=new  Label(81,i,Rs2.getString("date"));
		Label  label83=new  Label(82,i,Rs2.getString("name"));
		Label  label84=new  Label(83,i,Rs2.getString("fangshi"));
		Label  label85=new  Label(84,i,Rs2.getString("chuxuetianshu"));
		Label  label86=new  Label(85,i,Rs2.getString("youwubingfa"));
		Label  label87=new  Label(86,i,Rs2.getString("bingfa"));
		Label  label88=new  Label(87,i,Rs2.getString("qitabingfa"));
		Label  label89=new  Label(88,i,Rs2.getString("chuxue"));
		Label  label90=new  Label(89,i,Rs2.getString("youwubushi"));
		Label  label91=new  Label(90,i,Rs2.getString("bushi"));
		Label  label92=new  Label(91,i,Rs2.getString("qitabushi"));
		Label  label93=new  Label(92,i,Rs2.getString("huifu"));
		Label  label94=new  Label(93,i,Rs2.getString("huifushijian"));
		Label  label95=new  Label(94,i,Rs2.getString("xiangbi"));
		Label  label96=new  Label(95,i,Rs2.getString("xinghuifu"));
		Label  label97=new  Label(96,i,Rs2.getString("COCjixu"));
		Label  label98=new  Label(97,i,Rs2.getString("COCjianchi"));
		Label  label99=new  Label(98,i,Rs2.getString("COCyuanyin"));
		Label  label100=new  Label(99,i,Rs2.getString("qitaCOCyuanyin"));
		Label  label101=new  Label(100,i,Rs2.getString("COCjixuchufang"));
		Label  label102=new  Label(101,i,Rs2.getString("COCchufangshu"));
		Label  label103=new  Label(102,i,Rs2.getString("IUDjianchi"));
		Label  label104=new  Label(103,i,Rs2.getString("IUDyuanyin"));
		Label  label105=new  Label(104,i,Rs2.getString("qitaIUDyuanyin"));
		Label  label106=new  Label(105,i,Rs2.getString("yuanyigaoxiao"));
		Label  label107=new  Label(106,i,Rs2.getString("gaoxiaobiyun"));
		Label  label108=new  Label(107,i,Rs2.getString("gaoxiaoshijian"));
		Label  label109=new  Label(108,i,Rs2.getString("gaoxiaochufang"));
		Label  label110=new  Label(109,i,Rs2.getString("gaoxiaofangzhi"));
		Label  label111=new  Label(110,i,Rs2.getString("feigaoxiao"));
		Label  label112=new  Label(111,i,Rs2.getString("qitafeigaoxiao"));
		Label  label113=new  Label(112,i,Rs2.getString("yiwai"));
		Label  label114=new  Label(113,i,Rs2.getString("renshen"));
		Label  label115=new  Label(114,i,Rs2.getString("zhongzhi"));
		
		sheet.addCell(label82);
		sheet.addCell(label83);
		sheet.addCell(label84);
		sheet.addCell(label85);
		sheet.addCell(label86);
		sheet.addCell(label87);
		sheet.addCell(label88);
		sheet.addCell(label89);
		sheet.addCell(label90);
		sheet.addCell(label91);
		sheet.addCell(label92);
		sheet.addCell(label93);
		sheet.addCell(label94);
		sheet.addCell(label95);
		sheet.addCell(label96);
		sheet.addCell(label97);
		sheet.addCell(label98);
		sheet.addCell(label99);
		sheet.addCell(label100);
		sheet.addCell(label101);
		sheet.addCell(label102);
		sheet.addCell(label103);
		sheet.addCell(label104);
		sheet.addCell(label105);
		sheet.addCell(label106);
		sheet.addCell(label107);
		sheet.addCell(label108);
		sheet.addCell(label109);
		sheet.addCell(label110);
		sheet.addCell(label111);
		sheet.addCell(label112);
		sheet.addCell(label113);
		sheet.addCell(label114);
		sheet.addCell(label115);
	}
	
	String SQL3 = "select * from zhongyuan6 where num='"+Rs.getString("num")+"'";
	ResultSet Rs3;
	Rs3 = executeQuery(SQL3);
	if(Rs3.next()){

		Label  label116=new  Label(115,i,Rs3.getString("date"));
		Label  label117=new  Label(116,i,Rs3.getString("name"));
		Label  label118=new  Label(117,i,Rs3.getString("fangshi"));
		Label  label119=new  Label(118,i,Rs3.getString("COCjixu"));
		Label  label120=new  Label(119,i,Rs3.getString("COCjianchi"));
		Label  label121=new  Label(120,i,Rs3.getString("COCqudao"));
		Label  label122=new  Label(121,i,Rs3.getString("COCyuanyin"));
		Label  label123=new  Label(122,i,Rs3.getString("qitaCOCyuanyin"));
		Label  label124=new  Label(123,i,Rs3.getString("IUDjianchi"));
		Label  label125=new  Label(124,i,Rs3.getString("IUDyuanyin"));
		Label  label126=new  Label(125,i,Rs3.getString("qitaIUDyuanyin"));
		Label  label127=new  Label(126,i,Rs3.getString("yuanyigaoxiao"));
		Label  label128=new  Label(127,i,Rs3.getString("gaoxiaobiyun"));
		Label  label129=new  Label(128,i,Rs3.getString("gaoxiaoshijian"));
		Label  label130=new  Label(129,i,Rs3.getString("gaoxiaochufang"));
		Label  label131=new  Label(130,i,Rs3.getString("gaoxiaofangzhi"));
		Label  label132=new  Label(131,i,Rs3.getString("feigaoxiao"));
		Label  label133=new  Label(132,i,Rs3.getString("qitafeigaoxiao"));
		Label  label134=new  Label(133,i,Rs3.getString("yiwai"));
		Label  label135=new  Label(134,i,Rs3.getString("yiyuanrenshen"));
		Label  label136=new  Label(135,i,Rs3.getString("zhongzhi"));
		
		sheet.addCell(label116);
		sheet.addCell(label117);
		sheet.addCell(label118);
		sheet.addCell(label119);
		sheet.addCell(label120);
		sheet.addCell(label121);
		sheet.addCell(label122);
		sheet.addCell(label123);
		sheet.addCell(label124);
		sheet.addCell(label125);
		sheet.addCell(label126);
		sheet.addCell(label127);
		sheet.addCell(label128);
		sheet.addCell(label129);
		sheet.addCell(label130);
		sheet.addCell(label131);
		sheet.addCell(label132);
		sheet.addCell(label133);
		sheet.addCell(label134);
		sheet.addCell(label135);
		sheet.addCell(label136);
	}
	
	String SQL4 = "select * from zhongyuan12 where num='"+Rs.getString("num")+"'";
	ResultSet Rs4;
	Rs4 = executeQuery(SQL4);
	if(Rs4.next()){

		Label  label137=new  Label(136,i,Rs4.getString("date"));
		Label  label138=new  Label(137,i,Rs4.getString("name"));
		Label  label139=new  Label(138,i,Rs4.getString("fangshi"));
		Label  label140=new  Label(139,i,Rs4.getString("COCjixu"));
		Label  label141=new  Label(140,i,Rs4.getString("COCjianchi"));
		Label  label142=new  Label(141,i,Rs4.getString("COCqudao"));
		Label  label143=new  Label(142,i,Rs4.getString("COCyuanyin"));
		Label  label144=new  Label(143,i,Rs4.getString("qitaCOCyuanyin"));
		Label  label145=new  Label(144,i,Rs4.getString("IUDjianchi"));
		Label  label146=new  Label(145,i,Rs4.getString("IUDyuanyin"));
		Label  label147=new  Label(146,i,Rs4.getString("qitaIUDyuanyin"));
		Label  label148=new  Label(147,i,Rs4.getString("yuanyigaoxiao"));
		Label  label149=new  Label(148,i,Rs4.getString("gaoxiaobiyun"));
		Label  label150=new  Label(149,i,Rs4.getString("gaoxiaoshijian"));
		Label  label151=new  Label(150,i,Rs4.getString("gaoxiaochufang"));
		Label  label152=new  Label(151,i,Rs4.getString("gaoxiaofangzhi"));
		Label  label153=new  Label(152,i,Rs4.getString("feigaoxiao"));
		Label  label154=new  Label(153,i,Rs4.getString("qitafeigaoxiao"));
		Label  label155=new  Label(154,i,Rs4.getString("yiwai"));
		Label  label156=new  Label(155,i,Rs4.getString("yiyuanrenshen"));
		Label  label157=new  Label(156,i,Rs4.getString("zhongzhi"));
	
		sheet.addCell(label137);
		sheet.addCell(label138);
		sheet.addCell(label139);
		sheet.addCell(label140);
		sheet.addCell(label141);
		sheet.addCell(label142);
		sheet.addCell(label143);
		sheet.addCell(label144);
		sheet.addCell(label145);
		sheet.addCell(label146);
		sheet.addCell(label147);
		sheet.addCell(label148);
		sheet.addCell(label149);
		sheet.addCell(label150);
		sheet.addCell(label151);
		sheet.addCell(label152);
		sheet.addCell(label153);
		sheet.addCell(label154);
		sheet.addCell(label155);
		sheet.addCell(label156);
		sheet.addCell(label157);
	}
	i++;
	   }	
	       book.write(); 
	       book.close();	
	         } catch (RowsExceededException e) {    
	            e.printStackTrace();    
	        } catch (WriteException e) {    
	            e.printStackTrace();    
	        } catch (IOException e) {    
	            e.printStackTrace();    
	        } finally{
	try{
	     book.close();
		    //关闭只读的Excel对象
	}catch(Exception e){
	  System.out.println("exception when closing Connection in finally");
	  System.out.println(e.getMessage().toString());
	}
	}	
	}
	
	
	public void suifangExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E://hospital/work/hospital/WebRoot/output/";
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		   //打开要修改的xls文件 
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/suifang.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/suifang1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(1,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(3,0,dateEnd);
		    ws.addCell(labelend);
		    
		    String SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;

		    ResultSet Rs;
		    Label label1,label2,label3,label4;
		    int total=1,gaowei=1;
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(1,1,String.valueOf(total));
		    ws.addCell(label1);
		    label2=new Label(2,5,String.valueOf(total));
		    ws.addCell(label2);
		    label3=new Label(2,7,String.valueOf(total));
		    ws.addCell(label3);
		    label4=new Label(2,9,String.valueOf(total));
		    ws.addCell(label4);
			}
			
			
			SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"' and gaowei!='0' and gaowei!='1'" ;
			
			Rs = executeQuery(SQL);
			if(Rs.next()){
				gaowei = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,2,String.valueOf(gaowei));
			    ws.addCell(label1);
			    label2=new Label(2,6,String.valueOf(gaowei));
			    ws.addCell(label2);
			    label3=new Label(2,8,String.valueOf(gaowei));
			    ws.addCell(label3);
			    label4=new Label(2,10,String.valueOf(gaowei));
			    ws.addCell(label4);
			}
			
			ws.addCell(new Label(3,5,String.valueOf("100")));
			ws.addCell(new Label(3,6,String.valueOf("100")));
			ws.addCell(new Label(3,7,String.valueOf("100")));
			ws.addCell(new Label(3,8,String.valueOf("100")));
			ws.addCell(new Label(3,9,String.valueOf("100")));
			ws.addCell(new Label(3,10,String.valueOf("100")));
			
			float total1,total3,total6,gaowei1,gaowei4,gaowei6;
			
			SQL = "select count(num) from daisuifang where time='1' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,5,String.valueOf(total1));
				ws.addCell(label1);
				label2=new Label(5,5,String.valueOf(total1/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where time='1' and gaowei!='0' and gaowei!='1' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				gaowei1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,6,String.valueOf(gaowei1));
				ws.addCell(label1);
				label2=new Label(5,6,String.valueOf(gaowei1/gaowei*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where time='3' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,7,String.valueOf(total1));
				ws.addCell(label1);
				label2=new Label(5,7,String.valueOf(total1/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where time='3' and gaowei!='0' and gaowei!='1' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				gaowei1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,8,String.valueOf(gaowei1));
				ws.addCell(label1);
				label2=new Label(5,8,String.valueOf(gaowei1/gaowei*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where time='6' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,9,String.valueOf(total1));
				ws.addCell(label1);
				label2=new Label(5,9,String.valueOf(total1/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where time='6' and gaowei!='0' and gaowei!='1' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				gaowei1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,10,String.valueOf(gaowei1));
				ws.addCell(label1);
				label2=new Label(5,10,String.valueOf(gaowei1/gaowei*100));
				ws.addCell(label2);
			}
			
			wwb.write();
			   
		    //关闭可写入的Excel对象
		    wwb.close();
		   
		    //关闭只读的Excel对象
		    rw.close();
		
	}
	
	
	public void singleExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E://hospital/work/hospital/WebRoot/output/";
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		   //打开要修改的xls文件 
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/single.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/single1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 0);
		     //修改第6行6列的数据   
		    
		    
		    Label labelbegin=new Label(2,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(4,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    ResultSet Rs;
		    String SQL;
		    
		     SQL = "select count(num) from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
		     System.out.println(SQL);
		    
		    
		    float total=1;
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,1,String.valueOf(total));
		    label2=new Label(2,14,String.valueOf(total));
		    label3=new Label(5,14,String.valueOf(total));
		    label4=new Label(8,14,String.valueOf(total));
		    ws.addCell(label1);
		    ws.addCell(label2);
		    ws.addCell(label3);
		    ws.addCell(label4);
			}
			
			String avg1="0",std1="0";
			SQL = "select avg(age) from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				avg1 = Rs.getString("avg(age)");
			}
			SQL = "select std(age) from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				std1 = Rs.getString("std(age)");
			}
			label1=new Label(1,3,avg1+"±"+std1);
		    ws.addCell(label1);
		   
			SQL = "select (avg(yuntime)-1) as avg_yun from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				avg1 = Rs.getString("avg_yun");
			}
			SQL = "select std(yuntime) from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				std1 = Rs.getString("std(yuntime)");
			}
			label1=new Label(4,3,avg1+"±"+std1);
		    ws.addCell(label1);
		    
		    SQL = "select avg(chantime) as avg_chan from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				avg1 = Rs.getString("avg_chan");
			}
			SQL = "select std(chantime) from patient_info where liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				std1 = Rs.getString("std(chantime)");
			}
			label1=new Label(7,3,avg1+"±"+std1);
		    ws.addCell(label1);
		    
			SQL = "select count(num) from patient_info where age<=19 and liudate>='"+this.dateBegin+"' and liudate<='"+this.dateEnd+"'" ;
			float age1=0,age1l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,6,String.valueOf(age1));
		    ws.addCell(label1);
		    age1l=age1/total*100;
		    label1=new Label(3,6,String.valueOf(age1l));
		    ws.addCell(label1);
			}	
			
			SQL = "select count(num) from patient_info where age>19 and age<=24 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age2=0,age2l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,7,String.valueOf(age2));
		    ws.addCell(label1);
		    age2l=age2/total*100;
		    label1=new Label(3,7,String.valueOf(age2l));
		    ws.addCell(label1);
			}	
			
			SQL = "select count(num) from patient_info where age>24 and age<=29 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age3=0,age3l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,8,String.valueOf(age3));
		    ws.addCell(label1);
		    age3l=age3/total*100;
		    label1=new Label(3,8,String.valueOf(age3l));
		    ws.addCell(label1);
			}	
			
			SQL = "select count(num) from patient_info where age>29 and age<=34 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age4=0,age4l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age4 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,9,String.valueOf(age4));
		    ws.addCell(label1);
		    age4l=age4/total*100;
		    label1=new Label(3,9,String.valueOf(age4l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where age>34 and age<=39 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age5=0,age5l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,10,String.valueOf(age5));
		    ws.addCell(label1);
		    age5l=age5/total*100;
		    label1=new Label(3,10,String.valueOf(age5l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where age>39 and age<=44 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age6=0,age6l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,11,String.valueOf(age6));
		    ws.addCell(label1);
		    age6l=age6/total*100;
		    label1=new Label(3,11,String.valueOf(age6l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where age>44 and age<=49 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age7=0,age7l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age7 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,12,String.valueOf(age7));
		    ws.addCell(label1);
		    age7l=age7/total*100;
		    label1=new Label(3,12,String.valueOf(age7l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where age>49 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float age8=0,age8l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				age8 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,13,String.valueOf(age8));
		    ws.addCell(label1);
		    age8l=age8/total*100;
		    label1=new Label(3,13,String.valueOf(age8l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuntime=1 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float yun1=0,yun1l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				yun1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,6,String.valueOf(yun1));
		    ws.addCell(label1);
		    yun1l=yun1/total*100;
		    label1=new Label(6,6,String.valueOf(yun1l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuntime=2 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float yun2=0,yun2l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				yun2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,7,String.valueOf(yun2));
		    ws.addCell(label1);
		    yun2l=yun2/total*100;
		    label1=new Label(6,7,String.valueOf(yun2l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuntime=3 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float yun3=0,yun3l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				yun3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,8,String.valueOf(yun3));
		    ws.addCell(label1);
		    yun3l=yun3/total*100;
		    label1=new Label(6,8,String.valueOf(yun3l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuntime=4 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float yun4=0,yun4l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				yun4 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,9,String.valueOf(yun4));
		    ws.addCell(label1);
		    yun4l=yun4/total*100;
		    label1=new Label(6,9,String.valueOf(yun4l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuntime=5 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float yun5=0,yun5l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				yun5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,10,String.valueOf(yun5));
		    ws.addCell(label1);
		    yun5l=yun5/total*100;
		    label1=new Label(6,10,String.valueOf(yun5l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuntime>5 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float yun6=0,yun6l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				yun6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,11,String.valueOf(yun6));
		    ws.addCell(label1);
		    yun6l=yun6/total*100;
		    label1=new Label(6,11,String.valueOf(yun6l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where chantime=0 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float chan1=0,chan1l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				chan1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(8,6,String.valueOf(chan1));
		    ws.addCell(label1);
		    chan1l=chan1/total*100;
		    label1=new Label(9,6,String.valueOf(chan1l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where chantime=1 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float chan2=0,chan2l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				chan2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(8,7,String.valueOf(chan2));
		    ws.addCell(label1);
		    chan2l=chan2/total*100;
		    label1=new Label(9,7,String.valueOf(chan2l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where chantime=2 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float chan3=0,chan3l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				chan3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(8,8,String.valueOf(chan3));
		    ws.addCell(label1);
		    chan3l=chan3/total*100;
		    label1=new Label(9,8,String.valueOf(chan3l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where chantime=3 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float chan4=0,chan4l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				chan4 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(8,9,String.valueOf(chan4));
		    ws.addCell(label1);
		    chan4l=chan4/total*100;
		    label1=new Label(9,9,String.valueOf(chan4l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where chantime=4 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float chan5=0,chan5l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				chan5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(8,10,String.valueOf(chan5));
		    ws.addCell(label1);
		    chan5l=chan5/total*100;
		    label1=new Label(9,10,String.valueOf(chan5l));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where chantime>4 and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			float chan6=0,chan6l=0;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				chan6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(8,11,String.valueOf(chan6));
		    ws.addCell(label1);
		    chan6l=chan6/total*100;
		    label1=new Label(9,11,String.valueOf(chan6l));
		    ws.addCell(label1);
			}
			
			
			
			String avghun="0",stdhun="0";
			SQL = "select avg(hun) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				avghun = Rs.getString("avg(hun)");
			}
			SQL = "select std(hun) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				stdhun = Rs.getString("std(hun)");
			}
			label1=new Label(10,3,avghun+"±"+stdhun);
		    ws.addCell(label1);
			
		    float hun1,hun0,hunlv1,hunlv0;
		    SQL = "select count(num) from patient_info where hun='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			//Label label2,label3,label4;
			if(Rs.next()){
				hun1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(11,6,String.valueOf(hun1));
				ws.addCell(label1);
				label2=new Label(12,6,String.valueOf(hun1/total*100));
				ws.addCell(label2);
				hun0 = total-hun1;
				label3=new Label(11,7,String.valueOf(hun0));
				ws.addCell(label3);
				label4=new Label(12,7,String.valueOf(hun0/total*100));
				ws.addCell(label4);
			}
			
			float huji1,huji2,huji3,huji4;
		    SQL = "select count(num) from patient_info where huji='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				huji1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(14,6,String.valueOf(huji1));
				ws.addCell(label1);
				label2=new Label(15,6,String.valueOf(huji1/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where huji='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				huji2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(14,7,String.valueOf(huji2));
				ws.addCell(label1);
				label2=new Label(15,7,String.valueOf(huji2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where huji='2' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				huji2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(14,8,String.valueOf(huji2));
				ws.addCell(label1);
				label2=new Label(15,8,String.valueOf(huji2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where huji='3' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				huji2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(14,9,String.valueOf(huji2));
				ws.addCell(label1);
				label2=new Label(15,9,String.valueOf(huji2/total*100));
				ws.addCell(label2);
			}



			///////////////////////////////////////////////
			SQL = "select count(num) from patient_info where huji='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				huji2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(14,10,String.valueOf(huji2));
				ws.addCell(label1);
				label2=new Label(15,10,String.valueOf(huji2/total*100));
				ws.addCell(label2);
			}
			//////////////////////////////////////////////////////////
			
			float zhiye;
			SQL = "select count(num) from patient_info where zhiye='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,6,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,6,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,7,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,7,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='2' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,8,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,8,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='3' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,9,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,9,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,10,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,10,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='5' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,11,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,11,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='6' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,12,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,12,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,13,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,13,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,14,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,14,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='9' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,15,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,15,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where zhiye='10' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,16,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,16,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			/////////////////////////////////////////////////////////////////////
			SQL = "select count(num) from patient_info where zhiye='11' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				zhiye = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,17,String.valueOf(zhiye));
				ws.addCell(label1);
				label2=new Label(18,17,String.valueOf(zhiye/total*100));
				ws.addCell(label2);
			}
			
			///////////////////////////////////////////////////////////////////////
			wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();
		
	}
	
	public void renshenyuanyinExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E:/hospital/work/hospital/WebRoot/output/";
		   //打开要修改的xls文件 
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/renshenyuanyin.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/renshenyuanyin1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(2,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(4,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    int total=1;
		    float total2=1,coach2;
		    String SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
		    ResultSet Rs;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(2,1,String.valueOf(total));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where yuanyin='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(2,5,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(3,5,String.valueOf(total2/total*100));
				ws.addCell(label2);
				coach2 = total-total2;
				label1=new Label(2,6,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(3,6,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where renshen='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(2,10,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(3,10,String.valueOf(coach2/total2*100));
				ws.addCell(label2);
				label1=new Label(2,11,String.valueOf(total2-coach2));
				ws.addCell(label1);
				label2=new Label(3,11,String.valueOf((total2-coach2)/total*100));
				ws.addCell(label2);
			}
			
			
			wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();
		
	}	
	
	
	public void gongzuoliangExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E:/hospital/work/hospital/WebRoot/output/";
		   //打开要修改的xls文件 
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/gongzuoliang.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/gongzuoliang1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(5,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(7,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    int total=1;
		    float total2=1,coach2;
		    String SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
		    ResultSet Rs;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,1,String.valueOf(total));
		    ws.addCell(label1);
		    label2=new Label(3,2,String.valueOf(total*4));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where person='admin' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(2,6,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(3,6,String.valueOf(total2/total*100));
				ws.addCell(label2);
				coach2 = total-total2;
				label1=new Label(2,7,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(3,7,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			
			
			SQL = "select count(num) from patient_info where person='admin' and (COCshijian='1' or IUDfangzhi='1') and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				//label1=new Label(4,6,String.valueOf(coach2));
				//ws.addCell(label1);
				label2=new Label(4,6,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where person='test' and (COCshijian='1' or IUDfangzhi='1') and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				//label1=new Label(4,6,String.valueOf(coach2));
				//ws.addCell(label1);
				label2=new Label(4,7,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where shuming='admin' and complete!='0' and time='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,6,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(6,6,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from daisuifang where shuming='test' and complete!='0' and time='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,7,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(6,7,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where shuming='admin' and complete!='0' and time='3' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,6,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(8,6,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from daisuifang where shuming='test' and complete!='0' and time='3' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,7,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(8,7,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where shuming='admin' and complete!='0' and time='6' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,6,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(10,6,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from daisuifang where shuming='test' and complete!='0' and time='6' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,7,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(10,7,String.valueOf(coach2/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from daisuifang where shuming='admin' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(11,6,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(12,6,String.valueOf(coach2/total/4*100));
				ws.addCell(label2);
				label3=new Label(13,6,String.valueOf(coach2/total/4*100));
				ws.addCell(label3);
			}
			SQL = "select count(num) from daisuifang where shuming='test' and complete!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(11,7,String.valueOf(coach2));
				ws.addCell(label1);
				label2=new Label(12,7,String.valueOf(coach2/total/4*100));
				ws.addCell(label2);
				label3=new Label(13,7,String.valueOf(coach2/total/4*100));
				ws.addCell(label3);
			}
			wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();
		
	}	
	
	
	public void liukindExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E:/hospital/work/hospital/WebRoot/output/";
		   //打开要修改的xls文件 
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/liukind.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/liukind1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(2,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(4,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    int total=1;
		    /////////////////////////////////////
		    int a_total = 0;
		    ////////////////////
		    float total2=1,coach2;
		    String SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
		    ResultSet Rs;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,1,String.valueOf(total));
		    ws.addCell(label1);
		    label3=new Label(1,16,String.valueOf(total));
		    ws.addCell(label3);
			}
			//高危判断加上不等于1
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				a_total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(4,5,String.valueOf(a_total));
		    ws.addCell(label1);
			}
			String avg1 = null;
			String std1 = null;
			 SQL = "select avg(liutime) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
				Rs = executeQuery(SQL);
				if(Rs.next()){
					avg1 = Rs.getString("avg(liutime)");
				}
				SQL = "select std(liutime) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
				Rs = executeQuery(SQL);
				if(Rs.next()){
					std1 = Rs.getString("std(liutime)");
				}
				label1=new Label(1,4,avg1+"±"+std1);
			    ws.addCell(label1);
			
			
			
			SQL = "select count(num) from patient_info where liutime='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,9,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,9,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,10,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,10,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime='2' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,11,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,11,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime='3' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,12,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,12,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,13,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,13,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime='5' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,14,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,14,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime>'5' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(1,15,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(2,15,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where liutonow<'7' and liutonow>'0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,7,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,7,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liu2='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,8,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,8,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where liutime>'2' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,9,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,9,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where birth='1' and chantonow<'4' and chantonow>'0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,11,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,11,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where birth='2' and chantonow<'7' and chantonow>'0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,10,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,10,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where buru='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,12,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,12,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where qitagaowei='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(4,13,String.valueOf(total2));
				ws.addCell(label1);
				label2=new Label(5,13,String.valueOf(total2/total*100));
				ws.addCell(label2);
			}
			wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();
		
	}	
	public void lijiluoshiExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E:/hospital/work/hospital/WebRoot/output/";
		   //打开要修改的xls文件 
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/lijiluoshi.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/lijiluoshi1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(3,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(5,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    int total=1,total2=1,total3=1,total4=1;
		    float coach,coach2,coach3,coach4;
		    float COC=0,IUD=0,IUS=0,pimai=0,jueyu=0,biyun=0,qita=0,weixuanze=0;
		    String SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
		    ResultSet Rs;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,1,String.valueOf(total));
		    ws.addCell(label1);
			}
			SQL = "select count(num) from patient_info where chantime='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,2,String.valueOf(total2));
		    ws.addCell(label1);
			}
			SQL = "select count(num) from patient_info where chantime!='0' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,3,String.valueOf(total3));
		    ws.addCell(label1);
			}
			//添加高危不等于1
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total4 = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,4,String.valueOf(total4));
		    ws.addCell(label1);
			}
			
			
			SQL = "select count(num) from patient_info where nibiyun='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				COC = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,10,String.valueOf(COC));
		    ws.addCell(label1);
		    label2=new Label(4,10,String.valueOf(COC/total*100));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,11,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,11,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang='2' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,12,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,12,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang='3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,13,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,13,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang>'3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,14,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,14,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='2' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
		    label1=new Label(3,15,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUD = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(4,15,String.valueOf(IUD/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='3' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
		    label1=new Label(3,16,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUS = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(4,16,String.valueOf(IUS/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='5' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimai = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,17,String.valueOf(pimai));
				ws.addCell(label1);
				label2=new Label(4,17,String.valueOf(pimai/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='6' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				jueyu = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,18,String.valueOf(jueyu));
				ws.addCell(label1);
				label2=new Label(4,18,String.valueOf(jueyu/total*100));
				ws.addCell(label2);
			}
			label1=new Label(3,19,String.valueOf(COC+IUD+IUS+pimai+jueyu));
			ws.addCell(label1);
			label2=new Label(4,19,String.valueOf((COC+IUD+IUS+pimai+jueyu)/total*100));
			ws.addCell(label2);
			//删除避孕套显示
			/*
			SQL = "select count(num) from patient_info where nibiyun='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyun = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,20,String.valueOf(biyun));
				ws.addCell(label1);
				label2=new Label(4,20,String.valueOf(biyun/total*100));
				ws.addCell(label2);
			}
			*/
			SQL = "select count(num) from patient_info where nibiyun='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				qita = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,20,String.valueOf(qita));
				ws.addCell(label1);
				label2=new Label(4,20,String.valueOf(qita/total*100));
				ws.addCell(label2);
			}
			//添加未选择的统计数据
			SQL = "select count(num) from patient_info where nibiyun='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				weixuanze = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,21,String.valueOf(weixuanze));
				ws.addCell(label1);
				label2=new Label(4,21,String.valueOf(weixuanze/total*100));
				ws.addCell(label2);
			}
			
			
			//未育
			SQL = "select count(num) from patient_info where chantime='0' and nibiyun='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				COC = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,10,String.valueOf(COC));
		    ws.addCell(label1);
		    label2=new Label(6,10,String.valueOf(COC/total2*100));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where chantime='0' and nibiyun='1' and COCchufang='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,11,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(6,11,String.valueOf(coach/total2*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='1' and COCchufang='2' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,12,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(6,12,String.valueOf(coach/total2*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='1' and COCchufang='3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,13,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(6,13,String.valueOf(coach/total2*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='1' and COCchufang>'3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(5,14,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(6,14,String.valueOf(coach/total2*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='2' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
		    label1=new Label(5,15,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUD = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(6,15,String.valueOf(IUD/total2*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='3' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
		    label1=new Label(5,16,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUS = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(6,16,String.valueOf(IUS/total2*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='5' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimai = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,17,String.valueOf(pimai));
				ws.addCell(label1);
				label2=new Label(6,17,String.valueOf(pimai/total2*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='6' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				jueyu = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,18,String.valueOf(jueyu));
				ws.addCell(label1);
				label2=new Label(6,18,String.valueOf(jueyu/total2*100));
				ws.addCell(label2);
			}
			label1=new Label(5,19,String.valueOf(COC+IUD+IUS+pimai+jueyu));
			ws.addCell(label1);
			label2=new Label(6,19,String.valueOf((COC+IUD+IUS+pimai+jueyu)/total2*100));
			ws.addCell(label2);
			/*
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyun = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,20,String.valueOf(biyun));
				ws.addCell(label1);
				label2=new Label(6,20,String.valueOf(biyun/total2*100));
				ws.addCell(label2);
			}
			*/
			SQL = "select count(num) from patient_info where  chantime='0' and nibiyun='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				qita = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,20,String.valueOf(qita));
				ws.addCell(label1);
				label2=new Label(6,20,String.valueOf(qita/total2*100));
				ws.addCell(label2);
			}

			///添加未决定的
			SQL = "select count(num) from patient_info where chantime='0' and nibiyun='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				weixuanze = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,21,String.valueOf(weixuanze));
				ws.addCell(label1);
				label2=new Label(6,21,String.valueOf(weixuanze/total*100));
				ws.addCell(label2);
			}
			
			
			//已育
			SQL = "select count(num) from patient_info where chantime!='0' and nibiyun='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				COC = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(7,10,String.valueOf(COC));
		    ws.addCell(label1);
		    label2=new Label(8,10,String.valueOf(COC/total3*100));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where chantime!='0' and  nibiyun='1' and COCchufang='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(7,11,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(8,11,String.valueOf(coach/total3*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='1' and COCchufang='2' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(7,12,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(8,12,String.valueOf(coach/total3*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='1' and COCchufang='3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(7,13,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(8,13,String.valueOf(coach/total3*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where chantime!='0' and  nibiyun='1' and COCchufang>'3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(7,14,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(8,14,String.valueOf(coach/total3*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='2' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
		    label1=new Label(7,15,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUD = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(8,15,String.valueOf(IUD/total3*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='3' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
		    label1=new Label(7,16,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUS = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(8,16,String.valueOf(IUS/total3*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='5' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimai = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,17,String.valueOf(pimai));
				ws.addCell(label1);
				label2=new Label(8,17,String.valueOf(pimai/total3*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='6' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				jueyu = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,18,String.valueOf(jueyu));
				ws.addCell(label1);
				label2=new Label(8,18,String.valueOf(jueyu/total3*100));
				ws.addCell(label2);
			}
			label1=new Label(7,19,String.valueOf(COC+IUD+IUS+pimai+jueyu));
			ws.addCell(label1);
			label2=new Label(8,19,String.valueOf((COC+IUD+IUS+pimai+jueyu)/total3*100));
			ws.addCell(label2);
			/*
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyun = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,20,String.valueOf(biyun));
				ws.addCell(label1);
				label2=new Label(8,20,String.valueOf(biyun/total3*100));
				ws.addCell(label2);
			}
			*/
			SQL = "select count(num) from patient_info where  chantime!='0' and nibiyun='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				qita = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,20,String.valueOf(qita));
				ws.addCell(label1);
				label2=new Label(8,20,String.valueOf(qita/total3*100));
				ws.addCell(label2);
			}
			///添加未决定
			SQL = "select count(num) from patient_info where chantime!='0' and nibiyun='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				weixuanze = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,21,String.valueOf(weixuanze));
				ws.addCell(label1);
				label2=new Label(8,21,String.valueOf(weixuanze/total*100));
				ws.addCell(label2);
			}
			
			//高危
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and nibiyun='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				COC = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(9,10,String.valueOf(COC));
		    ws.addCell(label1);
		    label2=new Label(10,10,String.valueOf(COC/total4*100));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(9,11,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(10,11,String.valueOf(coach/total4*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang='2' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(9,12,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(10,12,String.valueOf(coach/total4*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang='3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(9,13,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(10,13,String.valueOf(coach/total4*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang>'3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(9,14,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(10,14,String.valueOf(coach/total4*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='2' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
		    label1=new Label(9,15,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUD = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(10,15,String.valueOf(IUD/total4*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='3' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
		    label1=new Label(9,16,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUS = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(10,16,String.valueOf(IUS/total4*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='5' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimai = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,17,String.valueOf(pimai));
				ws.addCell(label1);
				label2=new Label(10,17,String.valueOf(pimai/total4*100));
				ws.addCell(label2);
			}
			//绝育的最后高危情况加上
			//修改了10,19那个原来total3改为4
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='6' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				jueyu = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,18,String.valueOf(jueyu));
				ws.addCell(label1);
				label2=new Label(10,18,String.valueOf(jueyu/total4*100));
				ws.addCell(label2);
			}
			label1=new Label(9,19,String.valueOf(COC+IUD+IUS+pimai+jueyu));
			ws.addCell(label1);
			label2=new Label(10,19,String.valueOf((COC+IUD+IUS+pimai+jueyu)/total4*100));
			ws.addCell(label2);
			/*
			SQL = "select count(num) from patient_info where gaowei!='0' and  nibiyun='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyun = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,20,String.valueOf(biyun));
				ws.addCell(label1);
				label2=new Label(10,20,String.valueOf(biyun/total4*100));
				ws.addCell(label2);
			}
			*/


			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				qita = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,20,String.valueOf(qita));
				ws.addCell(label1);
				label2=new Label(10,20,String.valueOf(qita/total4*100));
				ws.addCell(label2);
			}
			//添加未决定

			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and nibiyun='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				weixuanze = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,21,String.valueOf(weixuanze));
				ws.addCell(label1);
				label2=new Label(10,21,String.valueOf(weixuanze/total*100));
				ws.addCell(label2);
			}
			wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();
		
	}	
	
	public void bannianExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E:/hospital/work/hospital/WebRoot/output/";
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		   //打开要修改的xls文件 
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/bannian.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/bannian1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(3,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(5,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    int total=1,total2=1,total3=1,total4=1;
		    float coach,coach2,coach3,coach4;
		    float COC=0,IUD=0,IUS=0,pimai=0,jueyu=0,biyun=0,qita=0,weixuanze=0;
		    String SQL = "select count(num) from patient_info where liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
		    ResultSet Rs;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,1,String.valueOf(total));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where nibiyun='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				COC = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,6,String.valueOf(COC));
		    ws.addCell(label1);
		    label2=new Label(4,6,String.valueOf(COC/total*100));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,7,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,7,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang='2' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,8,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,8,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang='3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,9,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,9,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='1' and COCchufang>'3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,10,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,10,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='2' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
		    label1=new Label(3,11,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUD = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(4,11,String.valueOf(IUD/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='3' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
		    label1=new Label(3,12,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUS = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(4,12,String.valueOf(IUS/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='5' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimai = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,13,String.valueOf(pimai));
				ws.addCell(label1);
				label2=new Label(4,13,String.valueOf(pimai/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where nibiyun='6' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				jueyu = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,14,String.valueOf(jueyu));
				ws.addCell(label1);
				label2=new Label(4,14,String.valueOf(jueyu/total*100));
				ws.addCell(label2);
			}
			label1=new Label(3,15,String.valueOf(COC+IUD+IUS+pimai+jueyu));
			ws.addCell(label1);
			label2=new Label(4,15,String.valueOf((COC+IUD+IUS+pimai+jueyu)/total*100));
			ws.addCell(label2);
			
			
			SQL = "select count(num) from patient_info where nibiyun='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyun = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,16,String.valueOf(biyun));
				ws.addCell(label1);
				label2=new Label(4,16,String.valueOf(biyun/total*100));
				ws.addCell(label2);
			}
			
			//修改位置
			SQL = "select count(num) from patient_info where nibiyun='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				qita = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,17,String.valueOf(qita));
				ws.addCell(label1);
				label2=new Label(4,17,String.valueOf(qita/total*100));
				ws.addCell(label2);
			} 

			SQL = "select count(num) from patient_info where nibiyun='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				weixuanze = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,18,String.valueOf(weixuanze));
				ws.addCell(label1);
				label2=new Label(4,18,String.valueOf(weixuanze/total*100));
				ws.addCell(label2);
			} 
		    
		    
		    //首次随访
		    
			float first=1;
		    SQL = "select count(num) from first_suifang where date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				first = Integer.valueOf(Rs.getString("count(num)")).intValue();
			}
			
			float first1=1,first2=1,first3=1,first4=1,first5=1,first6=1;
		    SQL = "select count(num) from first_suifang where liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,6,String.valueOf(first1));
				ws.addCell(label1);
				label2=new Label(6,6,String.valueOf(first1/COC*100));
				ws.addCell(label2);
			}
		    
		    SQL = "select count(num) from first_suifang where liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,11,String.valueOf(first2));
				ws.addCell(label1);
				label2=new Label(6,11,String.valueOf(first2/IUD*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from first_suifang where liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,12,String.valueOf(first3));
				ws.addCell(label1);
				label2=new Label(6,12,String.valueOf(first3/IUS*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from first_suifang where liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,13,String.valueOf(first5));
				ws.addCell(label1);
				label2=new Label(6,13,String.valueOf(first5/pimai*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from first_suifang where liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,14,String.valueOf(first6));
				ws.addCell(label1);
				label2=new Label(6,14,String.valueOf(first6/jueyu*100));
				ws.addCell(label2);
			}
			
			float cocjianchi=0;
		    SQL = "select count(num) from first_suifang where COCjianchi='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,6,String.valueOf(cocjianchi));
				ws.addCell(label1);
				label2=new Label(8,6,String.valueOf(cocjianchi/first*100));
				ws.addCell(label2);
			}
			float cocxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,6,String.valueOf(cocxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(cocjianchi+cocxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((cocjianchi+cocxin)/first*100));
				//ws.addCell(label1);
			}
			
			float cocchufang=0;
		    SQL = "select count(num) from first_suifang where COCjianchi='1' and COCchufangshu!='0'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocchufang = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,6,String.valueOf(cocchufang));
				ws.addCell(label1);
			}
			
			float iudjianchi=0;
		    SQL = "select count(num) from first_suifang where IUDjianchi='1' and liuchanbiyun='IUD' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,11,String.valueOf(iudjianchi));
				ws.addCell(label1);
				label2=new Label(8,11,String.valueOf(iudjianchi/first*100));
				ws.addCell(label2);
			}
			float iudxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='2'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,11,String.valueOf(iudxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(iudjianchi+iudxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((iudjianchi+iudxin)/first*100));
				//ws.addCell(label1);
			}
			
			float iusjianchi=0;
		    SQL = "select count(num) from first_suifang where IUDjianchi='1' and liuchanbiyun='IUS' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,12,String.valueOf(iusjianchi));
				ws.addCell(label1);
				label1=new Label(8,12,String.valueOf(iusjianchi/first*100));
				ws.addCell(label1);
			}
			float iusxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='3'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,12,String.valueOf(iusxin));
				ws.addCell(label1);
				//label1=new Label(7,9,String.valueOf(iusjianchi+iusxin));
				//ws.addCell(label1);
				//label1=new Label(8,9,String.valueOf((iusjianchi+iusxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			float pimaijianchi=0;
		    SQL = "select count(num) from first_suifang where IUDjianchi='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaijianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,13,String.valueOf(pimaijianchi));
				ws.addCell(label1);
				label1=new Label(8,13,String.valueOf(pimaijianchi/first*100));
				ws.addCell(label1);
			}
			float pimaixin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='4' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,13,String.valueOf(pimaixin));
				ws.addCell(label1);
				//label1=new Label(7,10,String.valueOf(pimaijianchi+pimaixin));
				//ws.addCell(label1);
				//label1=new Label(8,10,String.valueOf((pimaijianchi+pimaixin)/first*100));
				//ws.addCell(label1);
			}
			
			
			float jueyuxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='5' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,14,String.valueOf(jueyuxin));
				ws.addCell(label1);
				label2=new Label(8,14,String.valueOf(jueyuxin/first*100));
				ws.addCell(label2);
			}

			
			float biyuntaojianchi=0;
		    SQL = "select count(num) from first_suifang where liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaojianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,16,String.valueOf(biyuntaojianchi));
				ws.addCell(label1);
				label1=new Label(8,16,String.valueOf(biyuntaojianchi/first*100));
				ws.addCell(label1);
			}
			
			float biyuntaoxin=0;
		    SQL = "select count(num) from first_suifang where yuanyigaoxiao='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaoxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,16,String.valueOf(biyuntaoxin));
				ws.addCell(label1);
			}
			
		    
		    
		    
		    
		    
		    //三个月随访
		    
			first=1;
		    SQL = "select count(num) from zhongyuan where date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				first = Integer.valueOf(Rs.getString("count(num)")).intValue();
			}
			
			first1=1;
			first2=1;
			first3=1;
			first4=1;
			first5=1;
			first6=1;
		    SQL = "select count(num) from zhongyuan where liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,6,String.valueOf(first1));
				ws.addCell(label1);
				label2=new Label(14,6,String.valueOf(first1/COC*100));
				ws.addCell(label2);
			}
		    
		    SQL = "select count(num) from zhongyuan where liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,11,String.valueOf(first2));
				ws.addCell(label1);
				label2=new Label(14,11,String.valueOf(first2/IUD*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan where liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,12,String.valueOf(first3));
				ws.addCell(label1);
				label2=new Label(14,12,String.valueOf(first3/IUS*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan where liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,13,String.valueOf(first5));
				ws.addCell(label1);
				label2=new Label(14,13,String.valueOf(first5/pimai*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan where liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,14,String.valueOf(first6));
				ws.addCell(label1);
				label2=new Label(14,14,String.valueOf(first6/jueyu*100));
				ws.addCell(label2);
			}
			
			cocjianchi=0;
		    SQL = "select count(num) from zhongyuan where COCjianchi='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,6,String.valueOf(cocjianchi));
				ws.addCell(label1);
				label2=new Label(16,6,String.valueOf(cocjianchi/first*100));
				ws.addCell(label2);
			}
			cocxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,6,String.valueOf(cocxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(cocjianchi+cocxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((cocjianchi+cocxin)/first*100));
				//ws.addCell(label1);
			}
			
			cocchufang=0;
		    SQL = "select count(num) from zhongyuan where COCjianchi='1' and COCchufangshu!='0'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocchufang = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,6,String.valueOf(cocchufang));
				ws.addCell(label1);
			}
			
			iudjianchi=0;
		    SQL = "select count(num) from zhongyuan where IUDjianchi='1' and liuchanbiyun='IUD' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,11,String.valueOf(iudjianchi));
				ws.addCell(label1);
				label2=new Label(16,11,String.valueOf(iudjianchi/first*100));
				ws.addCell(label2);
			}
			iudxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='2'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,11,String.valueOf(iudxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(iudjianchi+iudxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((iudjianchi+iudxin)/first*100));
				//ws.addCell(label1);
			}
			
			iusjianchi=0;
		    SQL = "select count(num) from zhongyuan where IUDjianchi='1' and liuchanbiyun='IUS' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,12,String.valueOf(iusjianchi));
				ws.addCell(label1);
				label1=new Label(16,12,String.valueOf(iusjianchi/first*100));
				ws.addCell(label1);
			}
			iusxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='3'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,12,String.valueOf(iusxin));
				ws.addCell(label1);
				//label1=new Label(7,9,String.valueOf(iusjianchi+iusxin));
				//ws.addCell(label1);
				//label1=new Label(8,9,String.valueOf((iusjianchi+iusxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			pimaijianchi=0;
		    SQL = "select count(num) from zhongyuan where IUDjianchi='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaijianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,13,String.valueOf(pimaijianchi));
				ws.addCell(label1);
				label1=new Label(16,13,String.valueOf(pimaijianchi/first*100));
				ws.addCell(label1);
			}
			pimaixin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='4' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,13,String.valueOf(pimaixin));
				ws.addCell(label1);
				//label1=new Label(7,10,String.valueOf(pimaijianchi+pimaixin));
				//ws.addCell(label1);
				//label1=new Label(8,10,String.valueOf((pimaijianchi+pimaixin)/first*100));
				//ws.addCell(label1);
			}
			
			
			jueyuxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='5' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,14,String.valueOf(jueyuxin));
				ws.addCell(label1);
				label2=new Label(16,14,String.valueOf(jueyuxin/first*100));
				ws.addCell(label2);
			}
			biyuntaojianchi=0;
		    SQL = "select count(num) from zhongyuan where liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaojianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,16,String.valueOf(biyuntaojianchi));
				ws.addCell(label1);
				label1=new Label(16,16,String.valueOf(biyuntaojianchi/first*100));
				ws.addCell(label1);
			}
			biyuntaoxin=0;
		    SQL = "select count(num) from zhongyuan where yuanyigaoxiao='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaoxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,16,String.valueOf(biyuntaoxin));
				ws.addCell(label1);
			}
		    
		    
		    //六个月随访
		    
			first=1;
		    SQL = "select count(num) from zhongyuan6 where date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				first = Integer.valueOf(Rs.getString("count(num)")).intValue();
			}
			
			first1=1;
			first2=1;
			first3=1;
			first4=1;
			first5=1;
			first6=1;
		    SQL = "select count(num) from zhongyuan6 where liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,6,String.valueOf(first1));
				ws.addCell(label1);
				label2=new Label(21,6,String.valueOf(first1/COC*100));
				ws.addCell(label2);
			}
		    
		    SQL = "select count(num) from zhongyuan6 where liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,11,String.valueOf(first2));
				ws.addCell(label1);
				label2=new Label(21,11,String.valueOf(first2/IUD*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan6 where liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,12,String.valueOf(first3));
				ws.addCell(label1);
				label2=new Label(21,12,String.valueOf(first3/IUS*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan6 where liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,13,String.valueOf(first5));
				ws.addCell(label1);
				label2=new Label(21,13,String.valueOf(first5/pimai*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan6 where liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,14,String.valueOf(first6));
				ws.addCell(label1);
				label2=new Label(21,14,String.valueOf(first6/jueyu*100));
				ws.addCell(label2);
			}
			
			cocjianchi=0;
		    SQL = "select count(num) from zhongyuan6 where COCjianchi='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,6,String.valueOf(cocjianchi));
				ws.addCell(label1);
				label2=new Label(23,6,String.valueOf(cocjianchi/first*100));
				ws.addCell(label2);
			}
			cocxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,6,String.valueOf(cocxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(cocjianchi+cocxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((cocjianchi+cocxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			iudjianchi=0;
		    SQL = "select count(num) from zhongyuan6 where IUDjianchi='1' and liuchanbiyun='IUD' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,11,String.valueOf(iudjianchi));
				ws.addCell(label1);
				label2=new Label(23,11,String.valueOf(iudjianchi/first*100));
				ws.addCell(label2);
			}
			iudxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='2'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,11,String.valueOf(iudxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(iudjianchi+iudxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((iudjianchi+iudxin)/first*100));
				//ws.addCell(label1);
			}
			
			iusjianchi=0;
		    SQL = "select count(num) from zhongyuan6 where IUDjianchi='1' and liuchanbiyun='IUS' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,12,String.valueOf(iusjianchi));
				ws.addCell(label1);
				label1=new Label(23,12,String.valueOf(iusjianchi/first*100));
				ws.addCell(label1);
			}
			iusxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='3'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,12,String.valueOf(iusxin));
				ws.addCell(label1);
				//label1=new Label(7,9,String.valueOf(iusjianchi+iusxin));
				//ws.addCell(label1);
				//label1=new Label(8,9,String.valueOf((iusjianchi+iusxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			pimaijianchi=0;
		    SQL = "select count(num) from zhongyuan6 where IUDjianchi='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaijianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,13,String.valueOf(pimaijianchi));
				ws.addCell(label1);
				label1=new Label(23,13,String.valueOf(pimaijianchi/first*100));
				ws.addCell(label1);
			}
			pimaixin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='4' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,13,String.valueOf(pimaixin));
				ws.addCell(label1);
				//label1=new Label(7,10,String.valueOf(pimaijianchi+pimaixin));
				//ws.addCell(label1);
				//label1=new Label(8,10,String.valueOf((pimaijianchi+pimaixin)/first*100));
				//ws.addCell(label1);
			}
			
			
			jueyuxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='5' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,14,String.valueOf(jueyuxin));
				ws.addCell(label1);
				//label2=new Label(23,14,String.valueOf(jueyuxin/first*100));
				//ws.addCell(label2);
			}
			biyuntaojianchi=0;
		    SQL = "select count(num) from zhongyuan6 where liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaojianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,16,String.valueOf(biyuntaojianchi));
				ws.addCell(label1);
				label1=new Label(23,16,String.valueOf(biyuntaojianchi/first*100));
				ws.addCell(label1);
			}
			biyuntaoxin=0;
		    SQL = "select count(num) from zhongyuan6 where yuanyigaoxiao='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaoxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,16,String.valueOf(biyuntaoxin));
				ws.addCell(label1);
			}
			
			float renshen1=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,6,String.valueOf(renshen1));
				ws.addCell(label1);
				label1=new Label(28,6,String.valueOf(renshen1/first*100));
				ws.addCell(label1);
			}
			float renshen2=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,11,String.valueOf(renshen2));
				ws.addCell(label1);
				label1=new Label(28,11,String.valueOf(renshen2/first*100));
				ws.addCell(label1);
			}
			float renshen3=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,12,String.valueOf(renshen3));
				ws.addCell(label1);
				label1=new Label(28,12,String.valueOf(renshen3/first*100));
				ws.addCell(label1);
			}
			float renshen4=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen4 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,13,String.valueOf(renshen4));
				ws.addCell(label1);
				label1=new Label(28,13,String.valueOf(renshen4/first*100));
				ws.addCell(label1);
			}
			float renshen5=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,14,String.valueOf(renshen5));
				ws.addCell(label1);
				label1=new Label(28,14,String.valueOf(renshen5/first*100));
				ws.addCell(label1);
			}
			float renshen6=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,15,String.valueOf(renshen6));
				ws.addCell(label1);
				label1=new Label(28,15,String.valueOf(renshen6/first*100));
				ws.addCell(label1);
			}
		    wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();  
		    
	}
	
	public void banniangaoweiExcel() throws SQLException, BiffException, IOException, RowsExceededException, WriteException{
		String rootPath="E:/hospital/work/hospital/WebRoot/output/";
		String className = ConnDB.class.getName();
        String classNamePath = className.replace(".", "/") + ".class";
        URL is = ConnDB.class.getClassLoader().getResource(classNamePath);
        String path = is.getFile();
       path = path.substring(0, path.length()-32);
       System.out.println("path:"+path);
		   //打开要修改的xls文件 
		 jxl.Workbook rw = jxl.Workbook.getWorkbook(new File(path+"output/banniangaowei.xls"));
		      Sheet  rs = rw.getSheet(0);
		     
		   
		 // 创建可写入的Excel工作薄对象(生成新文件)
		  jxl.write.WritableWorkbook  wwb = Workbook.createWorkbook(new File(path+"output/banniangaowei1.xls"), rw);
		              
		    //读取第一张工作表
		    jxl.write.WritableSheet ws = wwb.getSheet(0);
		   
		    jxl.write.WritableCell wc = ws.getWritableCell(0, 2);
		     //修改第6行6列的数据   
		    
		    Label labelbegin=new Label(3,0,dateBegin);
		    ws.addCell(labelbegin);
		    Label labelend=new Label(5,0,dateEnd);
		    ws.addCell(labelend);
		    
		    Label label1,label2,label3,label4;
		    int total=1,total2=1,total3=1,total4=1;
		    float coach,coach2,coach3,coach4;
		    float COC=0,IUD=0,IUS=0,pimai=0,jueyu=0,biyun=0,qita=0,weixuanze=0;
		    //修改total 原来是高危的  修改高危加上不等于1
		    String SQL = "select count(num) from patient_info where  liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
		    ResultSet Rs;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				total = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,1,String.valueOf(total));
		    ws.addCell(label1);
			}
			
			int gaowei=0;
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				gaowei = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(6,1,String.valueOf(gaowei));
		    ws.addCell(label1);
			}
			
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				COC = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,6,String.valueOf(COC));
		    ws.addCell(label1);
		    label2=new Label(4,6,String.valueOf(COC/total*100));
		    ws.addCell(label2);
			}
			
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang='1' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,7,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,7,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang='2' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,8,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,8,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang='3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,9,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,9,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='1' and COCchufang>'3' and COCshijian='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				coach = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label1=new Label(3,10,String.valueOf(coach));
		    ws.addCell(label1);
		    label2=new Label(4,10,String.valueOf(coach/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1'  and  nibiyun='2' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
		    label1=new Label(3,11,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUD = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(4,11,String.valueOf(IUD/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='3' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
		    label1=new Label(3,12,Rs.getString("count(num)"));
		    ws.addCell(label1);
		    IUS = Integer.valueOf(Rs.getString("count(num)")).intValue();
		    label2=new Label(4,12,String.valueOf(IUS/total*100));
		    ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='5' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimai = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,13,String.valueOf(pimai));
				ws.addCell(label1);
				label2=new Label(4,13,String.valueOf(pimai/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='6' and IUDfangzhi='1' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				jueyu = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,14,String.valueOf(jueyu));
				ws.addCell(label1);
				label2=new Label(4,14,String.valueOf(jueyu/total*100));
				ws.addCell(label2);
			}
			label1=new Label(3,15,String.valueOf(COC+IUD+IUS+pimai+jueyu));
			ws.addCell(label1);
			label2=new Label(4,15,String.valueOf((COC+IUD+IUS+pimai+jueyu)/total*100));
			ws.addCell(label2);
			
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='4' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyun = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,16,String.valueOf(biyun));
				ws.addCell(label1);
				label2=new Label(4,16,String.valueOf(biyun/total*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='7' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				qita = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,17,String.valueOf(qita));
				ws.addCell(label1);
				label2=new Label(4,17,String.valueOf(qita/total*100));
				ws.addCell(label2);
			} 
			SQL = "select count(num) from patient_info where gaowei!='0' and gaowei!='1' and  nibiyun='8' and liudate>='"+dateBegin+"' and liudate<='"+dateEnd+"'";
			Rs = executeQuery(SQL);
			if(Rs.next()){
				weixuanze = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(3,18,String.valueOf(weixuanze));
				ws.addCell(label1);
				label2=new Label(4,18,String.valueOf(weixuanze/total*100));
				ws.addCell(label2);
			} 
		    
		    
		    //首次随访
		    
			float first=1;
		    SQL = "select count(num) from first_suifang where date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				first = Integer.valueOf(Rs.getString("count(num)")).intValue();
			}
			
			float first1=1,first2=1,first3=1,first4=1,first5=1,first6=1;
		    SQL = "select count(num) from first_suifang where liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,6,String.valueOf(first1));
				ws.addCell(label1);
				label2=new Label(6,6,String.valueOf(first1/COC*100));
				ws.addCell(label2);
			}
		    
		    SQL = "select count(num) from first_suifang where liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,11,String.valueOf(first2));
				ws.addCell(label1);
				label2=new Label(6,11,String.valueOf(first2/IUD*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from first_suifang where liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,12,String.valueOf(first3));
				ws.addCell(label1);
				label2=new Label(6,12,String.valueOf(first3/IUS*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from first_suifang where liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,13,String.valueOf(first5));
				ws.addCell(label1);
				label2=new Label(6,13,String.valueOf(first5/pimai*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from first_suifang where liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(5,14,String.valueOf(first6));
				ws.addCell(label1);
				label2=new Label(6,14,String.valueOf(first6/jueyu*100));
				ws.addCell(label2);
			}
			
			float cocjianchi=0;
		    SQL = "select count(num) from first_suifang where COCjianchi='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,6,String.valueOf(cocjianchi));
				ws.addCell(label1);
				label2=new Label(8,6,String.valueOf(cocjianchi/first*100));
				ws.addCell(label2);
			}
			float cocxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,6,String.valueOf(cocxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(cocjianchi+cocxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((cocjianchi+cocxin)/first*100));
				//ws.addCell(label1);
			}
			
			float cocchufang=0;
		    SQL = "select count(num) from first_suifang where COCjianchi='1' and COCchufangshu!='0'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocchufang = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(9,6,String.valueOf(cocchufang));
				ws.addCell(label1);
			}
			
			float iudjianchi=0;
		    SQL = "select count(num) from first_suifang where IUDjianchi='1' and liuchanbiyun='IUD' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,11,String.valueOf(iudjianchi));
				ws.addCell(label1);
				label2=new Label(8,11,String.valueOf(iudjianchi/first*100));
				ws.addCell(label2);
			}
			float iudxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='2'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,11,String.valueOf(iudxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(iudjianchi+iudxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((iudjianchi+iudxin)/first*100));
				//ws.addCell(label1);
			}
			
			float iusjianchi=0;
		    SQL = "select count(num) from first_suifang where IUDjianchi='1' and liuchanbiyun='IUS' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,12,String.valueOf(iusjianchi));
				ws.addCell(label1);
				label1=new Label(8,12,String.valueOf(iusjianchi/first*100));
				ws.addCell(label1);
			}
			float iusxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='3'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,12,String.valueOf(iusxin));
				ws.addCell(label1);
				//label1=new Label(7,9,String.valueOf(iusjianchi+iusxin));
				//ws.addCell(label1);
				//label1=new Label(8,9,String.valueOf((iusjianchi+iusxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			float pimaijianchi=0;
		    SQL = "select count(num) from first_suifang where IUDjianchi='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaijianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,13,String.valueOf(pimaijianchi));
				ws.addCell(label1);
				label1=new Label(8,13,String.valueOf(pimaijianchi/first*100));
				ws.addCell(label1);
			}
			float pimaixin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='4' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,13,String.valueOf(pimaixin));
				ws.addCell(label1);
				//label1=new Label(7,10,String.valueOf(pimaijianchi+pimaixin));
				//ws.addCell(label1);
				//label1=new Label(8,10,String.valueOf((pimaijianchi+pimaixin)/first*100));
				//ws.addCell(label1);
			}
			
			
			float jueyuxin=0;
		    SQL = "select count(num) from first_suifang where gaoxiaobiyun='5' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,14,String.valueOf(jueyuxin));
				ws.addCell(label1);
				label2=new Label(8,14,String.valueOf(jueyuxin/first*100));
				ws.addCell(label2);
			}
			float biyuntaojianchi=0;
		    SQL = "select count(num) from first_suifang where liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaojianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(7,16,String.valueOf(biyuntaojianchi));
				ws.addCell(label1);
				label1=new Label(8,16,String.valueOf(biyuntaojianchi/first*100));
				ws.addCell(label1);
			}
			float biyuntaoxin=0;
		    SQL = "select count(num) from first_suifang where yuanyigaoxiao='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaoxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(12,16,String.valueOf(biyuntaoxin));
				ws.addCell(label1);
			}
			
		    
		    
		    
		    
		    
		    //三个月随访
		    
			first=1;
		    SQL = "select count(num) from zhongyuan where date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				first = Integer.valueOf(Rs.getString("count(num)")).intValue();
			}
			
			first1=1;
			first2=1;
			first3=1;
			first4=1;
			first5=1;
			first6=1;
		    SQL = "select count(num) from zhongyuan where liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,6,String.valueOf(first1));
				ws.addCell(label1);
				label2=new Label(14,6,String.valueOf(first1/COC*100));
				ws.addCell(label2);
			}
		    
		    SQL = "select count(num) from zhongyuan where liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,11,String.valueOf(first2));
				ws.addCell(label1);
				label2=new Label(14,11,String.valueOf(first2/IUD*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan where liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,12,String.valueOf(first3));
				ws.addCell(label1);
				label2=new Label(14,12,String.valueOf(first3/IUS*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan where liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,13,String.valueOf(first5));
				ws.addCell(label1);
				label2=new Label(14,13,String.valueOf(first5/pimai*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan where liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(13,14,String.valueOf(first6));
				ws.addCell(label1);
				label2=new Label(14,14,String.valueOf(first6/jueyu*100));
				ws.addCell(label2);
			}
			
			cocjianchi=0;
		    SQL = "select count(num) from zhongyuan where COCjianchi='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,6,String.valueOf(cocjianchi));
				ws.addCell(label1);
				label2=new Label(16,6,String.valueOf(cocjianchi/first*100));
				ws.addCell(label2);
			}
			cocxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,6,String.valueOf(cocxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(cocjianchi+cocxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((cocjianchi+cocxin)/first*100));
				//ws.addCell(label1);
			}
			
			cocchufang=0;
		    SQL = "select count(num) from zhongyuan where COCjianchi='1' and COCchufangshu!='0'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocchufang = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(17,6,String.valueOf(cocchufang));
				ws.addCell(label1);
			}
			
			iudjianchi=0;
		    SQL = "select count(num) from zhongyuan where IUDjianchi='1' and liuchanbiyun='IUD' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,11,String.valueOf(iudjianchi));
				ws.addCell(label1);
				label2=new Label(16,11,String.valueOf(iudjianchi/first*100));
				ws.addCell(label2);
			}
			iudxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='2'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,11,String.valueOf(iudxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(iudjianchi+iudxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((iudjianchi+iudxin)/first*100));
				//ws.addCell(label1);
			}
			
			iusjianchi=0;
		    SQL = "select count(num) from zhongyuan where IUDjianchi='1' and liuchanbiyun='IUS' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,12,String.valueOf(iusjianchi));
				ws.addCell(label1);
				label1=new Label(16,12,String.valueOf(iusjianchi/first*100));
				ws.addCell(label1);
			}
			iusxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='3'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,12,String.valueOf(iusxin));
				ws.addCell(label1);
				//label1=new Label(7,9,String.valueOf(iusjianchi+iusxin));
				//ws.addCell(label1);
				//label1=new Label(8,9,String.valueOf((iusjianchi+iusxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			pimaijianchi=0;
		    SQL = "select count(num) from zhongyuan where IUDjianchi='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaijianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,13,String.valueOf(pimaijianchi));
				ws.addCell(label1);
				label1=new Label(16,13,String.valueOf(pimaijianchi/first*100));
				ws.addCell(label1);
			}
			pimaixin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='4' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,13,String.valueOf(pimaixin));
				ws.addCell(label1);
				//label1=new Label(7,10,String.valueOf(pimaijianchi+pimaixin));
				//ws.addCell(label1);
				//label1=new Label(8,10,String.valueOf((pimaijianchi+pimaixin)/first*100));
				//ws.addCell(label1);
			}
			
			
			jueyuxin=0;
		    SQL = "select count(num) from zhongyuan where gaoxiaobiyun='5' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,14,String.valueOf(jueyuxin));
				ws.addCell(label1);
				label2=new Label(16,14,String.valueOf(jueyuxin/first*100));
				ws.addCell(label2);
			}
			biyuntaojianchi=0;
		    SQL = "select count(num) from zhongyuan where liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaojianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(15,16,String.valueOf(biyuntaojianchi));
				ws.addCell(label1);
				label1=new Label(16,16,String.valueOf(biyuntaojianchi/first*100));
				ws.addCell(label1);
			}
			biyuntaoxin=0;
		    SQL = "select count(num) from zhongyuan where yuanyigaoxiao='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaoxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(19,16,String.valueOf(biyuntaoxin));
				ws.addCell(label1);
			}
		    
		    
		    //六个月随访
		    
			first=1;
		    SQL = "select count(num) from zhongyuan6 where date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			
			if(Rs.next()){
				first = Integer.valueOf(Rs.getString("count(num)")).intValue();
			}
			
			first1=1;
			first2=1;
			first3=1;
			first4=1;
			first5=1;
			first6=1;
		    SQL = "select count(num) from zhongyuan6 where liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,6,String.valueOf(first1));
				ws.addCell(label1);
				label2=new Label(21,6,String.valueOf(first1/COC*100));
				ws.addCell(label2);
			}
		    
		    SQL = "select count(num) from zhongyuan6 where liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,11,String.valueOf(first2));
				ws.addCell(label1);
				label2=new Label(21,11,String.valueOf(first2/IUD*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan6 where liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,12,String.valueOf(first3));
				ws.addCell(label1);
				label2=new Label(21,12,String.valueOf(first3/IUS*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan6 where liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,13,String.valueOf(first5));
				ws.addCell(label1);
				label2=new Label(21,13,String.valueOf(first5/pimai*100));
				ws.addCell(label2);
			}
			SQL = "select count(num) from zhongyuan6 where liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				first6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(20,14,String.valueOf(first6));
				ws.addCell(label1);
				label2=new Label(21,14,String.valueOf(first6/jueyu*100));
				ws.addCell(label2);
			}
			
			cocjianchi=0;
		    SQL = "select count(num) from zhongyuan6 where COCjianchi='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,6,String.valueOf(cocjianchi));
				ws.addCell(label1);
				label2=new Label(23,6,String.valueOf(cocjianchi/first*100));
				ws.addCell(label2);
			}
			cocxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				cocxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,6,String.valueOf(cocxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(cocjianchi+cocxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((cocjianchi+cocxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			iudjianchi=0;
		    SQL = "select count(num) from zhongyuan6 where IUDjianchi='1' and liuchanbiyun='IUD' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,11,String.valueOf(iudjianchi));
				ws.addCell(label1);
				label2=new Label(23,11,String.valueOf(iudjianchi/first*100));
				ws.addCell(label2);
			}
			iudxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='2'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iudxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,11,String.valueOf(iudxin));
				ws.addCell(label1);
				//label1=new Label(7,8,String.valueOf(iudjianchi+iudxin));
				//ws.addCell(label1);
				//label1=new Label(8,8,String.valueOf((iudjianchi+iudxin)/first*100));
				//ws.addCell(label1);
			}
			
			iusjianchi=0;
		    SQL = "select count(num) from zhongyuan6 where IUDjianchi='1' and liuchanbiyun='IUS' and  date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusjianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,12,String.valueOf(iusjianchi));
				ws.addCell(label1);
				label1=new Label(23,12,String.valueOf(iusjianchi/first*100));
				ws.addCell(label1);
			}
			iusxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='3'  and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				iusxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,12,String.valueOf(iusxin));
				ws.addCell(label1);
				//label1=new Label(7,9,String.valueOf(iusjianchi+iusxin));
				//ws.addCell(label1);
				//label1=new Label(8,9,String.valueOf((iusjianchi+iusxin)/first*100));
				//ws.addCell(label1);
			}
			
			
			pimaijianchi=0;
		    SQL = "select count(num) from zhongyuan6 where IUDjianchi='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaijianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,13,String.valueOf(pimaijianchi));
				ws.addCell(label1);
				label1=new Label(23,13,String.valueOf(pimaijianchi/first*100));
				ws.addCell(label1);
			}
			pimaixin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='4' and date>='"+dateBegin+"' and date<='"+dateEnd+"'";
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,13,String.valueOf(pimaixin));
				ws.addCell(label1);
				//label1=new Label(7,10,String.valueOf(pimaijianchi+pimaixin));
				//ws.addCell(label1);
				//label1=new Label(8,10,String.valueOf((pimaijianchi+pimaixin)/first*100));
				//ws.addCell(label1);
			}
			
			
			jueyuxin=0;
		    SQL = "select count(num) from zhongyuan6 where gaoxiaobiyun='5' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				pimaixin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,14,String.valueOf(jueyuxin));
				ws.addCell(label1);
				//label2=new Label(23,14,String.valueOf(jueyuxin/first*100));
				//ws.addCell(label2);
			}
			biyuntaojianchi=0;
		    SQL = "select count(num) from zhongyuan6 where liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaojianchi = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(22,16,String.valueOf(biyuntaojianchi));
				ws.addCell(label1);
				label1=new Label(23,16,String.valueOf(biyuntaojianchi/first*100));
				ws.addCell(label1);
			}
			biyuntaoxin=0;
		    SQL = "select count(num) from zhongyuan6 where yuanyigaoxiao='1' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				biyuntaoxin = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(26,16,String.valueOf(biyuntaoxin));
				ws.addCell(label1);
			}
			
			float renshen1=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='COC' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen1 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,6,String.valueOf(renshen1));
				ws.addCell(label1);
				label1=new Label(28,6,String.valueOf(renshen1/first*100));
				ws.addCell(label1);
			}
			float renshen2=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='IUD' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen2 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,11,String.valueOf(renshen2));
				ws.addCell(label1);
				label1=new Label(28,11,String.valueOf(renshen2/first*100));
				ws.addCell(label1);
			}
			float renshen3=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='IUS' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen3 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,12,String.valueOf(renshen3));
				ws.addCell(label1);
				label1=new Label(28,12,String.valueOf(renshen3/first*100));
				ws.addCell(label1);
			}
			float renshen4=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='皮埋' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen4 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,13,String.valueOf(renshen4));
				ws.addCell(label1);
				label1=new Label(28,13,String.valueOf(renshen4/first*100));
				ws.addCell(label1);
			}
			float renshen5=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='绝育' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen5 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,14,String.valueOf(renshen5));
				ws.addCell(label1);
				label1=new Label(28,14,String.valueOf(renshen5/first*100));
				ws.addCell(label1);
			}
			float renshen6=0;
		    SQL = "select count(num) from zhongyuan6 where yiwai='1' and liuchanbiyun='避孕套' and date>='"+dateBegin+"' and date<='"+dateEnd+"'" ;
		    System.out.println(SQL);
			Rs = executeQuery(SQL);
			if(Rs.next()){
				renshen6 = Integer.valueOf(Rs.getString("count(num)")).intValue();
				label1=new Label(27,15,String.valueOf(renshen6));
				ws.addCell(label1);
				label1=new Label(28,15,String.valueOf(renshen6/first*100));
				ws.addCell(label1);
			}
		    wwb.write();
		    //关闭可写入的Excel对象
		    wwb.close();
		    //关闭只读的Excel对象
		    rw.close();  
		    
	}
	
}
