package PAC;

public class Checkstr {
	public Checkstr(){}
	public String dostring(String str){
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("'", "");
		str = str.replaceAll(";", "");
		str = str.replaceAll("_", "");
		str = str.replaceAll("/", "");
		str = str.replaceAll("%", "");
		return str;
	}
}
