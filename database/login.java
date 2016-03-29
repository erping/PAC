package PAC;
import java.sql.*;
import PAC.Checkstr;
public class login {
	private String username;
	private String userpassword;
	private String userinputnum;
	private String makechecknum;
	private boolean mark=false;
	public String shuming=" ";
	private Checkstr check = new Checkstr();
	public login(){}
	public void setUsername(String username){
		this.username = check.dostring(username);
	}
	public String getUsername(String username){
		return this.username;
	}
	public void setUserpassword(String userpassword){
		this.userpassword = check.dostring(userpassword);
	}
	public String getUserpassword(){
		return this.userpassword;
	}
	public void setUserchecknum(String userinputnum){
		this.userinputnum = check.dostring(userinputnum);
	}
	public String getUserchecknum(){
		return this.userinputnum;
	}
	public void setMakechecknum(String makechecknum){
		this.makechecknum = makechecknum;
	}
	public String getMakechecknum(){
		return this.makechecknum;
	}
	public String checklogin(){
		String backmess="";
		mark = true;
		if(this.username.equals("")){
			mark = false;
			backmess+="<li>请输入<b>用户名！</b></li><br>";
		}
		if(this.userpassword.equals("")){
			mark = false;
			backmess+="<li>请输入<b>密&nbsp;&nbsp;码！</b></li>";
		}
//		if(this.userinputnum.equals("")){
//			mark = false;
//			backmess+="<li>请输入<b>验证码</b></li>";
//		}
//		if(!mark){
//			return backmess;
//		}
//		if(!(this.userinputnum.equals(this.makechecknum))){
//			mark=false;
//			backmess+="<li>输入的<b>验证码</b>不正确</li>";
//			return backmess;
//		}
		String sql = "select * from doctor where name='"+this.username+"' and password='"+this.userpassword+"'";
		ConnDB db = new ConnDB();
		ResultSet rs = db.executeQuery(sql);
		try{
			if(rs.next()){
				backmess="登陆成功！<br>欢迎:"+this.username+"</br>";
				mark = true;
				shuming = rs.getString("shuming");
			}
			else{
				backmess = "登录失败！用户名或密码不正确！";
				mark = false;
			}
		}catch(Exception e){
			e.printStackTrace();
			backmess = "操作失败！";
		}
		return backmess;		
	}
	public boolean getMark(){
		return this.mark;
	}
	public String getShuming(){
		return this.shuming;
	}
	
	
}
