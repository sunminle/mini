package mini.spring.mvc.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import mini.spring.mvc.bean.GuestDTO;
import mini.spring.mvc.repository.GuestMapper;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	private GuestMapper mapper;
	
	@Autowired
	private HashMap guestMap;

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return mapper.count();
	}

	@Override
	public void list(int pageNum , Model model) {
		int pageSize = 10;
		//int currentPage = pageNum;
		int startRow = (pageNum -1) * pageSize +1;
		int endRow = pageNum * pageSize; 
		
		int count = mapper.count();
		List<GuestDTO> list = Collections.EMPTY_LIST;
		if(count > 0) {
			guestMap.put("start", startRow);
			guestMap.put("end", endRow);
			list = mapper.list(guestMap);
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageSize", pageSize);
		
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) {
        	endPage = pageCount;
        }
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("pageBlock", pageBlock);
        model.addAttribute("endPage", endPage);
	
	}
	
	@Override
	public void create(GuestDTO dto) {
		int number = mapper.maxNum()+1;
		dto.setNum(number);
		mapper.writeInsert(dto);
	}

	@Override
	public GuestDTO readContent(int num) {
		mapper.updateCountUp(num);
		return mapper.readNum(num);
	}

	@Override
	public GuestDTO update(int num) {
		return mapper.readNum(num);
	}

	@Override
	public String readPasswd(int num) {
		return mapper.readPasswd(num);
	}

	@Override
	public int updateNum(GuestDTO dto) {
		String dbpw = readPasswd(dto.getNum());
		int result = 0;
		if(dbpw.equals(dto.getPasswd())) {
			result = mapper.updateNum(dto);
		}
		return result; 
	}

	@Override
	public int deleteNum(int num , String passwd) {
		String dbpw = readPasswd(num);
		int result = 0;
		if(dbpw.equals(passwd)) {
			result = mapper.deleteNum(num);
		}
		return result; 
	}

	@Override
	public List<GuestDTO> listAll() {
		Map<String, Object> params = new HashMap<>();
		return mapper.listAll(params);
	}

}
