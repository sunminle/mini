package mini.spring.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.bean.ImgBoardFileDTO;
import mini.spring.mvc.bean.ImgBoardReviewDTO;

public interface ImgBoardService {
	public void insert(ImgBoardDTO dto);
	public void list(int pageNum, Model model);
	public int listCount();
	public ImgBoardDTO content(int num);
	public void readcountUp(int num);
	public int fileInsert(ArrayList<MultipartFile> files, String path);
	public int maxNum();
	public String firstImgSelect(int num);
	public List<String> fileName(int num);
	public void reviewInsert(ImgBoardReviewDTO dto);
	public List<ImgBoardReviewDTO> reviewList(int num);
	public void reviewUp(int num);
	public void deleteReview(int num);
	public void deleteFile(int num,String filePath);
	public void deleteNum(int num);
	public List<String> findFileName(int num);
	public int isFile(int num);
}
