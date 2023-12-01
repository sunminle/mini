package mini.spring.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.bean.ImgBoardFileDTO;

public interface ImgBoardMapper {
	
	public void insert(ImgBoardDTO dto);
	public List<ImgBoardDTO> list(HashMap imgBoardMap);
	public int listCount();
	public ImgBoardDTO content(int num);
	public void readcountUp(int num);
	public int fileInsert(ImgBoardFileDTO dto);
	public int maxNum();
	public void firstImg(ImgBoardDTO dto);
	public String firstImgSelect(int num);
	public List<String> fileName(int num);
}
