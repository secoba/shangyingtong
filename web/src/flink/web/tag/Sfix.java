package flink.web.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang.StringUtils;

/**
 * @author haichen.ma
 *
 */
public class Sfix extends SimpleTagSupport {
	private static final long serialVersionUID = 1L;
	private String value;
	private String length;
	
	public void setLength(String length) {
		this.length = length;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void doTag() throws JspException, IOException {
		if (value == null) {
			value = "";
		}
		
		if (StringUtils.isNotEmpty(length) && StringUtils.isNumeric(length)) {
			value = StringUtils.abbreviate(value, Integer.parseInt(length));
		}
		
		this.getJspContext().getOut().write(value);
	}
}
