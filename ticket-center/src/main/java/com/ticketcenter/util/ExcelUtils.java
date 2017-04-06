package com.ticketcenter.util;

import jxl.Workbook;
import jxl.biff.DisplayFormat;
import jxl.write.*;
import jxl.write.biff.CellValue;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Class ExcelUtils
 * Description:
 * Group:SAP B1
 * Date: 2016/8/2 0002
 *
 * @author huan
 * @version 1.0
 */

public class ExcelUtils {

	/**
	 * 根据实体类生成EXCEL并写入硬盘
	 * @param list 实体类列表
	 * @param titles  xsl标题列名称
	 * @param contents xsl内容对应的变量名
	 * @param titleSize 表头长度
	 * @param isSequenced 是否有序列栏
	 * @param fileName 文件生成路径
	 * @return result 文件是否生成成功
	 */
	public static boolean creatExcel(List list,String[] titles,String[] contents,int[] titleSize,boolean isSequenced,String fileName) {
		//在excel文件夹中 ，以日期为文件夹生成储放下载excel
		//文件夹路径
		boolean result;
		if (list.size()==0)
			return false;
		WritableWorkbook book = null;
		try {
			Resource resource = new FileSystemResource(fileName);
			if (!resource.exists()) {
				resource.getFile().mkdirs();
			}
			//文件路径

			//若存在该文件，删除文件
			File file = new File(fileName);
			if (file.exists())
				file.delete();
			//创建一个excel文件
			book = Workbook.createWorkbook(new File(fileName));
			//创建一个工作簿
			WritableSheet sheet = book.createSheet("sheet1", 0);
			DisplayFormat displayFormat = NumberFormats.THOUSANDS_FLOAT; //显示成千分位
			WritableFont wf = new jxl.write.WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD, false);
			//设置单元格的样式

			WritableCellFormat cellFormat1 = new WritableCellFormat(wf, displayFormat);
			cellFormat1.setBackground(jxl.format.Colour.WHITE);
			cellFormat1.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);

			WritableCellFormat cellFormat2 = new WritableCellFormat(wf, displayFormat);
			cellFormat2.setBackground(jxl.format.Colour.GRAY_25);
			cellFormat2.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);

			//标题设置设置字体为ARIAL12号字,加粗,颜色为黑色
			WritableFont title_font = new jxl.write.WritableFont(WritableFont.ARIAL, 28, WritableFont.BOLD);
			title_font.setColour(jxl.format.Colour.BLACK);
			jxl.write.WritableCellFormat title_format = new WritableCellFormat(title_font);
			title_format.setAlignment(jxl.format.Alignment.CENTRE);
			title_format.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			title_format.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);

			//栏目设置    字体为宋体,12号字,加粗,颜色为黑色
			WritableFont colum_font = new WritableFont(WritableFont.createFont("宋体"), 12, WritableFont.BOLD);
			colum_font.setColour(jxl.format.Colour.BLACK);
			WritableCellFormat colum_format = new WritableCellFormat(colum_font);
			colum_format.setAlignment(jxl.format.Alignment.CENTRE);
			colum_format.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			colum_format.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);
			colum_format.setWrap(true);


			WritableFont ftfont = new WritableFont(WritableFont.ARIAL, 12, WritableFont.NO_BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
			WritableCellFormat fileterFormat1 = new WritableCellFormat(ftfont);
			fileterFormat1.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			fileterFormat1.setAlignment(jxl.format.Alignment.CENTRE);
			fileterFormat1.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);
			fileterFormat1.setWrap(true);


			//数字格式样式
			NumberFormat nf = new NumberFormat("0.00");
			WritableCellFormat fivedpsFormat = new WritableCellFormat(ftfont, nf);
			fivedpsFormat.setVerticalAlignment(jxl.format.VerticalAlignment.BOTTOM);
			fivedpsFormat.setAlignment(jxl.format.Alignment.LEFT);
			fivedpsFormat.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);
			fivedpsFormat.setWrap(true);

			//设置表头
			Method method;
			String[] titlesConcat;
			int[] titleSizeConcat;
			//设置序号列表头和宽度
			String[] sequenceTitle ={"序号"};
			int[] sequenceSize ={9};
			//header
			if (isSequenced) {
				titlesConcat = (String[]) ArrayUtils.addAll(sequenceTitle, titles);
				titleSizeConcat =  ArrayUtils.addAll(sequenceSize, titleSize);
			}
			else {
				titlesConcat = titles;
				titleSizeConcat = titleSize;
			}
			for (int i = 0; i < titlesConcat.length; i++) {
				sheet.addCell(new Label(i, 0, titlesConcat[i], colum_format));
				sheet.setColumnView(i, titleSizeConcat[i]);
			}
			//body
			for (int i = 0; i < list.size(); i++) {
				int index = 0;
				List<CellValue> values = new ArrayList<>();
				if (isSequenced)
					values.add(new Label(index++, i + 1, "" + (i + 1), fileterFormat1));
				for (String content : contents) {
					method = list.get(0).getClass().getMethod("get" + content.replaceFirst(content.substring(0, 1), content.substring(0, 1).toUpperCase()));
					values.add(new Label(index++, i + 1, ""+(method.invoke(list.get(i))==null ? "":method.invoke(list.get(i))), fileterFormat1));
				}
				//添加到工作簿中
				for (CellValue value : values) {
					sheet.addCell(value);
				}
			}
			//write footer
			/*for (int i = 0; i < footer.length; i++) {
				sheet.addCell(new Label(i, list.size()+1, footer[i], colum_format));
			}*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//写入数据并关闭excel
				if (book != null) {
					book.write();
					book.close();
				}
				result = true;
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
		}
		return result;
	}
}
