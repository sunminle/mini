package mini.spring.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberDTO {
	private int num;
	private String id;
	private String passwd;
	private String name;
	private String nickname;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date reg_date;
	private String introduce;
	private int status = 1;

}
