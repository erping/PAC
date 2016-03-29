package PAC;

public class makechecknum {
	private String checknum;
	public makechecknum(){}
	public void makenum(){
		String sourcenum = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String singlenum = "";
		String checknum = "";
		int index = 0;
		int i = 0;
		while(i<4){
			index = (int)(Math.random()*100)%35;
			singlenum = sourcenum.substring(index, index+1);
			checknum+=singlenum;
			i++;
		}
		this.checknum = checknum;
		//System.out.println("checknum:"+checknum);
	}
	public String getChecknum(){
		return this.checknum;
	}
}
