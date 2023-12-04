package mini.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GuestDTO {
	private int num;
	private String id;
	private String passwd;
	private String content;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date reg_date;
}
