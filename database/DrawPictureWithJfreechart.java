package PAC;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.axis.CategoryAxis3D;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.DefaultCategoryDataset;

public class DrawPictureWithJfreechart {

    private int chartWidth ; 			//ͼƬ���
    private int chartHeight ; 			//ͼƬ�߶�
    private String chartTitle ; 		//ͼ�����
    private String bookTitle[] ; 		//ͼ�����
    private String category[] ; 		//���
    private String xTitle ; 			//x�����
    private String yTitle ; 			//y�����
    double[][] datas; 					//��ͼ���
    // ����ݼ�����ӻ���ͼ����������
    public DefaultCategoryDataset createDataset(){
    	//������ݼ���DefaultCategoryDataset����
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        //ͨ��ѭ��������
        for (int m = 0; m < bookTitle.length; m++) {
            for (int n = 0; n < category.length; n++) {
                dataset.addValue(datas[m][n], bookTitle[m], category[n]);
            }
        }
        return dataset;				//������ݼ��϶���
    }
    
    public DrawPictureWithJfreechart() {
    }

    public DrawPictureWithJfreechart(int chartWidth, int chartHeight,
                                     String chartTitle, String[] bookTitle,
                                     String[] category, String xTitle,
                                     String yTitle, double[][] datas) {
        this.chartWidth = chartWidth;
        this.chartHeight = chartHeight;
        this.chartTitle = chartTitle;
        this.bookTitle = bookTitle;
        this.category = category;
        this.xTitle = xTitle;
        this.yTitle = yTitle;
        this.datas = new double[bookTitle.length][category.length];
        this.datas = datas;
    }


    public String drawHistogram(HttpServletRequest request, HttpSession session) {
        // ������ͼ��������ʽ
	    StandardChartTheme standardChartTheme = new StandardChartTheme("CN");
	    // �������������
	    standardChartTheme.setLargeFont(new Font("����", Font.BOLD, 16));
	    // ����ͼ�������
	    standardChartTheme.setRegularFont(new Font("����", Font.BOLD, 16));
	    // ���ñ�������
	    standardChartTheme.setExtraLargeFont(new Font("����", Font.BOLD, 24));
	    ChartFactory.setChartTheme(standardChartTheme);//������ͼ����ʹ������
        // ����3DЧ��ͼ
        JFreeChart chart = ChartFactory.createBarChart3D(
                                   chartTitle, // ͼ�����
                                   xTitle, // ������
                                   yTitle, // ������
                                   createDataset(), // �������
                                   PlotOrientation.VERTICAL, // ֱ��ͼ�ķ���,����
                                   true, // ����ͼ���Ƿ��ͼ��
                                   true, // ����ͼ���Ƿ����ʾ
                                   false); // ����ͼ���Ƿ��URL
        // ����ͼ����ɫ
        chart.setBackgroundPaint(new Color(168, 219, 219));
        // ���ͼ��������ã��������û�������
        CategoryPlot plot = chart.getCategoryPlot();
        plot.setBackgroundPaint(new Color(219, 219, 127)); // ���û�ͼ���򱳾�ɫ
        plot.setDomainGridlinePaint(Color.BLACK); // ���ô�ֱ�����׼�ߵ���ɫ
        plot.setDomainGridlinesVisible(false); // ���ô�ֱ�����׼���Ƿ���ʾ��falseΪĬ��ֵ
        plot.setRangeGridlinePaint(Color.RED); // ����ˮƽ�����׼�ߵ���ɫ
        plot.setRangeGridlinesVisible(true); // ����ˮƽ�����׼���Ƿ���ʾ��trueΪĬ��ֵ
        // �����Ƿ���ʾ���������trueΪĬ��ֵ
        BarRenderer3D renderer = (BarRenderer3D) plot.getRenderer(); //p404z
        renderer.setDrawBarOutline(true);
        // �Զ��������ɫ�������彥��
        Color color[] = new Color[bookTitle.length];
        color[0] = new Color(28, 255, 66);
        //color[1] = new Color(28, 6, 255);
        for (int i = 0; i < color.length; i++) {
            GradientPaint gradient = new GradientPaint(0, 0, color[i].brighter(),
                    0, chartHeight, color[i].darker());
            renderer.setSeriesPaint(i, gradient);
        }
        // ���ú���������ֵ���ת����
        CategoryAxis3D domainAxis = (CategoryAxis3D) plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(
                CategoryLabelPositions.createDownRotationLabelPositions(Math.PI /  // ����˳ʱ����ת
                16.0) );// ������ת���ȣ�����˫���Ȳ���
        // �����Զ���ͼ����Ƶ��������
        ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
        // ���ָ����ʽ��ͼ�?����ļ���
        String fileName = null;
        try {
            fileName =
                    ServletUtilities.saveChartAsPNG(chart, chartWidth,chartHeight, info,
                    session);
        } catch (IOException ex) {
        	ex.printStackTrace();
        }
        // ����ͼ�����·��
        String graphURL =
                request.getContextPath() + "/servlet/DisplayChart?filename=" +
                fileName;
        return graphURL;
    }


    // ��ͼ���Եĸ�ֵ����
    public void setChartWidth(int chartWidth) {
        this.chartWidth = chartWidth;
    }

    public void setChartHeight(int chartHeight) {
        this.chartHeight = chartHeight;
    }

    public void setChartTitle(String chartTitle) {
        this.chartTitle = chartTitle;
    }

    public void setBookTitle(String[] bookTitle) {
        this.bookTitle = bookTitle;
    }

    public void setCategory(String[] category) {
        this.category = category;
    }

    public void setXTitle(String xTitle) {
        this.xTitle = xTitle;
    }

    public void setYTitle(String yTitle) {
        this.yTitle = yTitle;
    }

    public void setDatas(double[][] datas) {
        this.datas = datas;
    }

}
