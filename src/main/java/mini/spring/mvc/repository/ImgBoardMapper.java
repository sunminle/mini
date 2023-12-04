package mini.spring.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.bean.ImgBoardFileDTO;
import mini.spring.mvc.bean.ImgBoardReviewDTO;

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
	public void reviewInsert(ImgBoardReviewDTO dto);
	public List<ImgBoardReviewDTO> reviewList(int num);
	public void reviewUp(int num);
	public void deleteReview(int num);
	public void deleteFile(int num);
	public void deleteNum(int num);
	public List<String> findFileName(int num);
	public int isFile(int num);
	public void updateContent(ImgBoardDTO dto);
	public void deleteFileName(ImgBoardFileDTO dto);
	public void updateFirstImg(ImgBoardDTO dto);
	public String firstImg(int num);
	public void deleteReviewNum(int reviewNum);
	public void reviewMinus(int num);
}
