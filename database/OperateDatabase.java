package PAC;

//����������ݿ��õİ�
import java.sql.*;

public class OperateDatabase {
    //����������ݿ��õ�ȫ������
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    public OperateDatabase() {
    }

    //ͨ��̬�������ݿ���
    static {
        String driverClass = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
        try {
            Class.forName(driverClass).newInstance();
        } catch (Exception ex) {
            System.out.println("------�ڼ�����ݿ���ʱ�׳��쳣���������£�");
            ex.printStackTrace();
        }
    }

    //�����ݿ�����
    public void conndb(String dbName, String username, String password) {
        String url =
                "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=" +
                dbName;
        try {
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
        } catch (SQLException ex) {
            System.out.println("------�ڽ�����ݿ�����ʱ�׳��쳣���������£�");
            ex.printStackTrace();
        }
    }

    //�ر���ݿ�����,�ͷ���Դ
    public void closedb() {
        //���ж���رն����Ƿ�Ϊ��,���Ϊ�������
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
                stmt = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    //�����¼
    public void insert(String sql) {
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            System.out.println("------�ڲ����¼ʱ�׳��쳣���������£�");
            ex.printStackTrace();
        }
    }

    //�޸ļ�¼
    public void update(String sql) {
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            System.out.println("------���޸ļ�¼ʱ�׳��쳣���������£�");
            ex.printStackTrace();
        }
    }

    //ɾ���¼
    public void delete(String sql) {
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            System.out.println("------��ɾ���¼ʱ�׳��쳣���������£�");
            ex.printStackTrace();
        }
    }

    //��ѯ��¼�����ؽ��
    public ResultSet select(String sql) {
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            System.out.println("------�ڲ�ѯ��¼ʱ�׳��쳣���������£�");
            ex.printStackTrace();
        }
        return rs;
    }

}
