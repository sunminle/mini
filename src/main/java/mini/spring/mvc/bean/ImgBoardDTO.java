package mini.spring.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ImgBoardDTO {
	private int num;
	private String writer;
	private String title;
	private String content;
	private Date reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private int isfile;
}
