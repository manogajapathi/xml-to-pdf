package com.neerap.fop;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

public class PDFGenerator {
	
	public static final String RESOURCES_DIR;
	public static final String OUTPUT_DIR;
	
	static {
		RESOURCES_DIR = "src//main//resources//sample//";
		OUTPUT_DIR = "src//main//resources//sample//";
	}
	
	public static void main(String[] args) {
		PDFGenerator pdfGenerator = new PDFGenerator();
		try {
			pdfGenerator.convertToPDF();
		} catch (FOPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Method that will convert the given XML to PDF
	 * 
	 * @throws IOException
	 * @throws FOPException
	 * @throws TransformerException
	 */
	public void convertToPDF() throws IOException, FOPException, TransformerException {
		// the XSL FO file
		File xsltFile = new File(RESOURCES_DIR + "//template.xsl");
		// the XML file which provides the input
		StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//input.xml"));
		// create an instance of FOP factory
		FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
		// a user agent is needed for transformation
		FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
		// Setup output
		OutputStream out;
		out = new java.io.FileOutputStream(OUTPUT_DIR + "//output.pdf");

		try {
			// Construct FOP with desired output format
			Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

			// Resulting SAX events (the generated FO) must be piped through to
			// FOP
			Result res = new SAXResult(fop.getDefaultHandler());

			// Start XSLT transformation and FOP processing
			// That's where the XML is first transformed to XSL-FO and then
			// PDF is created
			transformer.transform(xmlSource, res);
		} finally {
			out.close();
		}
	}

	/**
	 * This method will convert the given XML to XSL-FO
	 * 
	 * @throws IOException
	 * @throws FOPException
	 * @throws TransformerException
	 */
	public void convertToFO() throws IOException, FOPException, TransformerException {
		// the XSL FO file
		File xsltFile = new File(RESOURCES_DIR + "//template.xsl");

		// the XML file which provides the input
		StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//input.xml"));

		// a user agent is needed for transformation
		/* FOUserAgent foUserAgent = fopFactory.newFOUserAgent(); */
		// Setup output
		OutputStream out;

		out = new java.io.FileOutputStream(OUTPUT_DIR + "temp.fo");

		try {
			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

			// Resulting SAX events (the generated FO) must be piped through to
			// FOP
			// Result res = new SAXResult(fop.getDefaultHandler());

			Result res = new StreamResult(out);

			// Start XSLT transformation and FOP processing
			transformer.transform(xmlSource, res);

			// Start XSLT transformation and FOP processing
			// That's where the XML is first transformed to XSL-FO and then
			// PDF is created
			transformer.transform(xmlSource, res);
		} finally {
			out.close();
		}
	}

}
