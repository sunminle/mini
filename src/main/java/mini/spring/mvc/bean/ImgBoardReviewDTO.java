package mini.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ImgBoardReviewDTO {
	private int num;
	private String id;
	private String content;
	private Date reg_date;
	private int imgboardnum;
}
