package com.simpreserv.util;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.simpreserv.model.User;
import java.awt.Color;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class UserPDFExporter {

  private List<User> userList;

  public UserPDFExporter(List<User> userList) {
    this.userList = userList;
  }

  private void writeTableHeader(PdfPTable table) {
    PdfPCell pdfPCell = new PdfPCell();
    pdfPCell.setBackgroundColor(Color.DARK_GRAY);
    pdfPCell.setPadding(5);
    Font font = FontFactory.getFont(FontFactory.HELVETICA);
    font.setColor(Color.WHITE);
    pdfPCell.setPhrase(new Phrase("User ID", font));
    table.addCell(pdfPCell);

    pdfPCell.setPhrase(new Phrase("E-mail", font));
    table.addCell(pdfPCell);

    pdfPCell.setPhrase(new Phrase("Enabled", font));
    table.addCell(pdfPCell);

    pdfPCell.setPhrase(new Phrase("Type", font));
    table.addCell(pdfPCell);
  }

  private void writeTableData(PdfPTable table) {
    for (User user : userList) {
      table.addCell(String.valueOf(user.getUserId()));
      table.addCell(user.getEmail());
      table.addCell(String.valueOf(user.isEnabled()));
      table.addCell(String.valueOf(user.getUserTypeId()));
    }
  }

  public void export(HttpServletResponse response) throws IOException {
    Document document = new Document(PageSize.A4);
    PdfWriter.getInstance(document, response.getOutputStream());
    document.open();
    Font font = FontFactory.getFont(FontFactory.HELVETICA);
    font.setColor(Color.BLACK);
    font.setSize(18);
    Paragraph title = new Paragraph("List of all users", font);
    title.setAlignment(Paragraph.ALIGN_CENTER);
    document.add(title);
    PdfPTable table = new PdfPTable(4);
    table.setWidthPercentage(100);
    table.setSpacingBefore(15);
    table.setWidths(new float[] {1.5f, 3.5f, 3.0f, 1.5f});
    writeTableHeader(table);
    writeTableData(table);
    document.add(table);

    document.close();
  }
}
