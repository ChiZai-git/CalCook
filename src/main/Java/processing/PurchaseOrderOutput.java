package processing;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class PurchaseOrderOutput {
	public int PurchaseOrder() {
		// ワークブック
		Workbook workBook = null;
		// シート
		Sheet sheet = null;
		// 出力ファイル
		FileOutputStream outPutFile = null;
		// 出力ファイルパス
		String outPutFilePath = null;
		// 出力ファイル名
		String outPutFileName = null;
		// 拡張子
		final String EXTENSION = ".xlsx";

		int resultCode = 99;

		// エクセルファイルの作成
		try {

			// ワークブックの作成
			workBook = new XSSFWorkbook();

			// シートの設定
			sheet = workBook.createSheet();
			workBook.setSheetName(0, "発注書");
			sheet = workBook.getSheet("発注書");

			// ****** 書式操作 ****** //
			// 通常フォント指定
			Font font = workBook.createFont();
			font.setFontName("ＭＳ Ｐゴシック");
			font.setFontHeightInPoints((short) 11);

			// タイトルフォント指定
			Font titleFont = workBook.createFont();
			titleFont.setFontName("ＭＳ Ｐゴシック");
			titleFont.setFontHeightInPoints((short) 16);

			// 全体書式
			CellStyle style_Normal = workBook.createCellStyle();
			style_Normal.setFont(font);

			// タイトル書式
			CellStyle style_Title = workBook.createCellStyle();
			style_Title.setFont(titleFont);

			// TBLヘッダー書式
			CellStyle style_TblHeader = workBook.createCellStyle();
			style_TblHeader.setFont(font);
			style_TblHeader.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_TURQUOISE.getIndex());
			style_TblHeader.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			style_TblHeader.setBorderTop(BorderStyle.THIN);
			style_TblHeader.setBorderBottom(BorderStyle.THIN);
			style_TblHeader.setBorderLeft(BorderStyle.THIN);
			style_TblHeader.setBorderRight(BorderStyle.THIN);

			// TBLボディ書式
			CellStyle style_TblBody = workBook.createCellStyle();
			style_TblBody.setFont(font);
			style_TblBody.setBorderTop(BorderStyle.THIN);
			style_TblBody.setBorderBottom(BorderStyle.THIN);
			style_TblBody.setBorderLeft(BorderStyle.THIN);
			style_TblBody.setBorderRight(BorderStyle.THIN);

			// ****** シート操作 ****** //

			// 行指定
			Row row;
			int rowNum = 0;

			// セル指定
			Cell cell;

			// 列幅指定
			sheet.setColumnWidth(0, 853);
			sheet.setColumnWidth(1, 2389);
			sheet.setColumnWidth(2, 6826);
			sheet.setColumnWidth(3, 3669);
			sheet.setColumnWidth(4, 8576);

			// （空き行） [1行目]
			row = sheet.createRow(rowNum++);

			// タイトル [2行目 D列]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(3);
			cell.setCellStyle(style_Title);
			cell.setCellValue("発注書");

			// 日付 [3行目 C列]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(2);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("日付 YYYY年MM月DD日");

			// 御中 [4行目 C列]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(2);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("[店 名] 御中");

			// 国際ボランティア学生協会 [4行目 E列]
			cell = row.createCell(4);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("国際ボランティア学生協会");

			// 担当者 [5行目 E列]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(4);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("担当： [氏 名] （Tel xxxx-xxxx-xxxx）");

			// （空き行） [6行目]
			row = sheet.createRow(rowNum++);

			// 受け取り日 ヘッダー [7行目 B列]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(1);
			cell.setCellStyle(style_TblHeader);
			cell.setCellValue("受取日");

			// 食材 ヘッダー [7行目 C列]
			cell = row.createCell(2);
			cell.setCellStyle(style_TblHeader);
			cell.setCellValue("食材");

			// 個数 ヘッダー [7行目 D列]
			cell = row.createCell(3);
			cell.setCellStyle(style_TblHeader);
			cell.setCellValue("個数");

			// 備考 ヘッダー [7行目 E列]
			cell = row.createCell(4);
			cell.setCellStyle(style_TblHeader);
			cell.setCellValue("備考");

			// ボディ部 [8〜X行]
			for (int i = 0; i < 15; i++) {
				row = sheet.createRow(rowNum++);
				cell = row.createCell(1);
				cell.setCellStyle(style_TblBody);

				cell = row.createCell(2);
				cell.setCellStyle(style_TblBody);
				cell.setCellValue("a");

				cell = row.createCell(3);
				cell.setCellStyle(style_TblBody);
				cell.setCellValue("b");

				cell = row.createCell(4);
				cell.setCellStyle(style_TblBody);
			}

			// （空き行） [X + 1行目]
			row = sheet.createRow(rowNum++);

			// 末尾 [X + 2行目]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(2);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("国際ボランティア学生協会の　[氏 名]　　　　　　　と申します。");

			// 末尾 [X + 3行目]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(2);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("食品の発注につきましては　[店 名]　　　　　　　 にお願いしようと思います。");

			// 末尾 [X + 4行目]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(2);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("また、食材やその量に変更が出る可能性があり、その際はすぐに連絡させていただきます。");

			// 末尾 [X + 5行目]
			row = sheet.createRow(rowNum++);
			cell = row.createCell(2);
			cell.setCellStyle(style_Normal);
			cell.setCellValue("お忙しいところお手数ですが、商品のご確認を宜しくお願い致します。");

			// エクセルファイルを出力
			try {
				// 現在の日付を取得
				Date date = new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

				//ファイルパス・ファイル名の指定
				outPutFilePath = System.getProperty("user.home") + "/Desktop/";
				outPutFileName = dateFormat.format(date).toString() + "_発注書";

				outPutFile = new FileOutputStream(outPutFilePath + outPutFileName + EXTENSION);
				workBook.write(outPutFile);
				workBook.close();

				System.out.println("「" + outPutFilePath + outPutFileName + "」を出力しました。");
				resultCode = 0;

			} catch (IOException e) {
				System.out.println(e.toString());
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return(resultCode);
	}
}
