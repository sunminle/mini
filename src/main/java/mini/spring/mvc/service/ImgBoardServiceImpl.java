package mini.spring.mvc.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.bean.ImgBoardFileDTO;
import mini.spring.mvc.bean.ImgBoardReviewDTO;
import mini.spring.mvc.repository.ImgBoardMapper;

@Service
public class ImgBoardServiceImpl implements ImgBoardService{
	
	@Autowired
	private HashMap imgBoardMap;
	
	@Autowired
	private ImgBoardFileDTO imgBoardFileDTO;
	
	
	@Autowired
	private ImgBoardMapper mapper;


	@Override
	public void insert(ImgBoardDTO dto) {
		mapper.insert(dto);
		
	}

	@Override
	public void list(int pageNum, Model model) {
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = listCount();
		
		List<ImgBoardDTO> list = Collections.EMPTY_LIST;
		if(count > 0) {
			imgBoardMap.put("start",startRow);
			imgBoardMap.put("end",endRow);
			list = mapper.list(imgBoardMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);
		
	}

	@Override
	public int listCount() {
		
		return mapper.listCount();
	}

	@Override
	public ImgBoardDTO content(int num) {
		return mapper.content(num);
	}

	@Override
	public void readcountUp(int num) {
		mapper.readcountUp(num);
		
	}

	@Override
	public int fileInsert(ArrayList<MultipartFile> files, String path) {
		int imgboardNum = mapper.maxNum()+1;
		int result = 0;
		for(int i = 0 ; i < files.size(); i++) {
			MultipartFile f = files.get(i);
			String fileName = f.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				fileName = "img_"+imgboardNum+"_"+(i+1)+ext;
				File copy = new File(path+fileName);
				try {
					f.transferTo(copy);
				}catch(Exception e) {
					e.printStackTrace();
				}
				imgBoardFileDTO.setFilename(fileName);
				imgBoardFileDTO.setImgboardnum(imgboardNum);
				imgBoardFileDTO.setNum(i);
				result+=mapper.fileInsert(imgBoardFileDTO);
			}
		}
		
		return result;
	}

	@Override
	public int maxNum() {
		return mapper.maxNum();
	}

	@Override
	public String firstImgSelect(int num) {
		
		return mapper.firstImgSelect(num);
	}

	@Override
	public List<String> fileName(int num) {
		
		return mapper.fileName(num);
	}

	@Override
	public void reviewInsert(ImgBoardReviewDTO dto) {
		mapper.reviewInsert(dto);
		
	}

	@Override
	public List<ImgBoardReviewDTO> reviewList(int num) {
		return mapper.reviewList(num);
	}

	@Override
	public void reviewUp(int num) {
		mapper.reviewUp(num);
	}

	@Override
	public void deleteReview(int num) {
		mapper.deleteReview(num);
		
	}
	
	@Override
	public void deleteFile(int num,String filePath) {
		List<String> fileName = Collections.EMPTY_LIST;
		int isfile = isFile(num);
		if(isfile > 0) {
			fileName = mapper.findFileName(num);
			for(String fn : fileName) {
				String realPath = filePath+fn;
				Path path = Paths.get(realPath);
				try {
					Files.delete(path);
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		mapper.deleteFile(num);
		
	}

	@Override
	public void deleteNum(int num) {
		mapper.deleteNum(num);
		
	}

	@Override
	public List<String> findFileName(int num) {
		return mapper.findFileName(num);
	}

	@Override
	public int isFile(int num) {
		return mapper.isFile(num);
	}







}
