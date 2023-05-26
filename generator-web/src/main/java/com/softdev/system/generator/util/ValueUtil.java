package com.softdev.system.generator.util;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Get Value From Application.yml
 * @author zhengkai.blog.csdn.net
 */
@Data
@Component
public class ValueUtil {
    @Value("${OEM.title}")
    public String title;

    @Value("${OEM.header}")
    public String header;

    @Value("${OEM.version}")
    public String version;

    @Value("${OEM.author}")
    public String author;

    @Value("${OEM.keywords}")
    public String keywords;

    @Value("${OEM.slogan}")
    public String slogan;

    @Value("${OEM.copyright}")
    public String copyright;

    @Value("${OEM.description}")
    public String description;

    @Value("${OEM.packageName}")
    public String packageName;

    @Value("${OEM.returnUtilSuccess}")
    public String returnUtilSuccess;

    @Value("${OEM.returnUtilFailure}")
    public String returnUtilFailure;

    @Value("${OEM.outputStr}")
    public String outputStr;

    @Value("${OEM.mode}")
    public String mode;
    
     /**
     * 浏览器导出数据 支持多sheet
     *
     * @param dataList 数据集合
     */
    public static <T> void browserExport(List<SheetDataPo<T>> dataList, HttpServletResponse response, String fileName) throws IOException {
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        //attachment为以附件方式下载
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(
                fileName + ".xls","utf-8"));
        response.setHeader("Cache-Control", "No-cache");
        response.flushBuffer();
        exportData(dataList, response.getOutputStream());
    }

    /**
     * 导出数据 支持多sheet
     * @param dataList 数据集合
     * @param outputStream 输出流
     */
    public static <T> void exportData(List<SheetDataPo<T>> dataList, OutputStream outputStream) {
        try (HSSFWorkbook wb = new HSSFWorkbook()) {
            // 样式
            HSSFCellStyle titleStyle = getTitleStyle(wb);
            HSSFCellStyle dataStyle = getDataStyle(wb);
            for (SheetDataPo<T> data : dataList) {
                String sheetName = data.getSheet();
                List<String> titles = data.getTitles();
                int row = 0;
                // 创建sheet
                HSSFSheet sheet = wb.createSheet(sheetName);
                HSSFRow titleRow = sheet.createRow(row++);
                titleRow.setHeightInPoints(40f);
                // 创建标题栏
                for (int i = 0; i < titles.size(); i++) {
                    HSSFCell cell = titleRow.createCell(i);
                    cell.setCellValue(titles.get(i));
                    cell.setCellStyle(titleStyle);
                }
                setData(titles.size(), data.getData(), row, sheet, dataStyle);
                setColumnWidth(sheet);
            }
            wb.write(outputStream);
        } catch (Exception e) {
            LoggerFactory.getLogger(ExcelUtil.class.getName()).info("ExcelUtil exportData error", e);
        }
    }

    private static HSSFCellStyle getTitleStyle(HSSFWorkbook wb) {
        HSSFCellStyle titleStyle = getDataStyle(wb);
        // 字体
        HSSFFont font = wb.createFont();
        // 设置加粗
        font.setBold(true);
        titleStyle.setFont(font);
        // 设置背景色
        titleStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
        titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return titleStyle;
    }

    private static HSSFCellStyle getDataStyle(HSSFWorkbook wb) {
        // 数据内容样式
        HSSFCellStyle dataStyle = wb.createCellStyle();
        // 设置居中对其
        dataStyle.setAlignment(HorizontalAlignment.CENTER);
        dataStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        //下边框
        dataStyle.setBorderBottom(BorderStyle.THIN);
        //左边框
        dataStyle.setBorderLeft(BorderStyle.THIN);
        //上边框
        dataStyle.setBorderTop(BorderStyle.THIN);
        //右边框
        dataStyle.setBorderRight(BorderStyle.THIN);
        return dataStyle;
    }

    private static <T> void setData(int length, List<T> list, int row, HSSFSheet sheet, HSSFCellStyle cellStyle) throws IllegalAccessException {
        // 写数据
        Field[] fields;
        for (T t : list) {
            HSSFRow dataRow = sheet.createRow(row++);
            dataRow.setHeightInPoints(20);
            fields = t.getClass().getDeclaredFields();
            for (int i = 0; i < length; i++) {
                Field field = fields[i];
                field.setAccessible(true);
                Object val = field.get(t);
                HSSFCell cell = dataRow.createCell(i);
                cell.setCellValue(String.valueOf(val));
                cell.setCellStyle(cellStyle);
            }
        }
    }

    public static void setColumnWidth(HSSFSheet sheet) {
        //sheet的索引从0开始,获取sheet列数
        int maxColumn = sheet.getRow(0).getPhysicalNumberOfCells();

        for (int columnNum = 0; columnNum <= maxColumn; columnNum++) {
            int columnWidth = sheet.getColumnWidth(columnNum) / 256;
            // 遍历列的数据，获取这一列的最长字符串
            for (int rowNum = 0; rowNum <= sheet.getLastRowNum(); rowNum++) {
                HSSFRow currentRow;
                if (sheet.getRow(rowNum) == null) {
                    currentRow = sheet.createRow(rowNum);
                } else {
                    currentRow = sheet.getRow(rowNum);
                }
                if (currentRow.getCell(columnNum) != null) {
                    HSSFCell currentCell = currentRow.getCell(columnNum);
                    if (currentCell.getCellType() == CellType.STRING) {
                        int byteLength = currentCell.getStringCellValue().getBytes(StandardCharsets.UTF_8).length;
                        int toStringLength = currentCell.toString().length();
                        int length = (byteLength + toStringLength) / 2;
                        if (columnWidth < length) {
                            columnWidth = length;
                        }
                    }
                }
            }
            //将最长的length*256设为列宽
            sheet.setColumnWidth(columnNum, columnWidth * 256 + 500);
        }
    }
}

