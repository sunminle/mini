package mini.spring.mvc;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.bean.ImgBoardFileDTO;
import mini.spring.mvc.bean.ImgBoardReviewDTO;
import mini.spring.mvc.service.ImgBoardService;

@Controller
@RequestMapping("/imgboard/*")
public class ImgBoardController {
	@Autowired
	private ImgBoardService service;
	
	
	@RequestMapping("list")
	public String test(Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		service.list(pageNum,model);

		return "imgboard/list";
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {

		return "imgboard/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(Model model,ImgBoardDTO dto,ArrayList<MultipartFile> files,HttpServletRequest requset) {
		int isfile = 0;
		int result = 0;
		int num = 0;
		String firstImg = "firstimgDefault.jpg";
		for(MultipartFile f : files) {
			if(!f.getOriginalFilename().equals("")) {
				isfile ++;
			}
		}
		dto.setIsfile(isfile);
		if(isfile > 0) {
			String filePath = requset.getServletContext().getRealPath("/resources/file/imgBoard/");
			result = service.fileInsert(files,filePath);
			num = service.maxNum()+1;
			firstImg = service.firstImgSelect(num);
			
		}
		dto.setFirstimg(firstImg);
		service.insert(dto);
		return "imgboard/writePro";
	}
	
	@RequestMapping("content")
	public String content(Model model, int num, int pageNum) {
		List<String> fileNameList = Collections.EMPTY_LIST;
		service.readcountUp(num);
		ImgBoardDTO dto = service.content(num);
		if(dto.getIsfile()!=0) {
			fileNameList = service.fileName(num);
		}
		
		List<ImgBoardReviewDTO> reviewList = Collections.EMPTY_LIST;
		if(dto.getReview()>0) {
		reviewList = service.reviewList(num);
		}
		model.addAttribute("dto",dto);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("fileNameList",fileNameList);
		model.addAttribute("num",num);
		model.addAttribute("reviewList",reviewList);
		return "imgboard/content";
	}
	
	@RequestMapping("reviewPro")
	public String reviewPro( Model model,ImgBoardReviewDTO dto, int pageNum) {
		service.reviewInsert(dto);
		service.reviewUp(dto.getImgboardnum());
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("num",dto.getImgboardnum());
		return "imgboard/reviewPro";
	}
	
	@RequestMapping("deletePro")
	public String deletePro(int num, HttpServletRequest request) {
		
		String filePath = request.getServletContext().getRealPath("/resources/file/imgBoard/");

		service.deleteFile(num, filePath);
		service.deleteNum(num);
		service.deleteReview(num);
		
		return "imgboard/deletePro";
	}
	
	@RequestMapping("updateForm")
	public String updateForm(int num, Model model,int pageNum) {
		ImgBoardDTO dto = service.content(num);
		List<String> fileNameList = Collections.EMPTY_LIST;
		if(dto.getIsfile()!=0) {
			fileNameList = service.fileName(num);
		}
		model.addAttribute("dto",dto);
		model.addAttribute("fileNameList",fileNameList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("num",num);
		return "imgboard/updateForm";
	}
	
	@RequestMapping("updatePro")
	public String updatePro(int num, Model model, ImgBoardDTO dto, int pageNum) {
		dto.setNum(num);
		service.updateContent(dto);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("num",num);
		return "imgboard/updatePro";
	}
	
	@RequestMapping("deleteFile")
	public String deleteFile(Model model, int pageNum,ImgBoardFileDTO dto, HttpServletRequest request) {
		String filePath = request.getServletContext().getRealPath("/resources/file/imgBoard/");
		service.deleteFile(dto, filePath);
		int num = dto.getImgboardnum();
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("num",num);
		return "imgboard/deleteFile";
	}
	
	@RequestMapping("deleteReview")
	public String deleteReview(Model model, int num , int pageNum, int reviewNum) {
		service.deleteReviewNum(reviewNum);
		service.reviewMinus(num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("num",num);
		return "imgboard/deleteReview";
	}
	
}
