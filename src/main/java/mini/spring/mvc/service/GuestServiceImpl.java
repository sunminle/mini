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
	public void create(GuestDTO dto) {
		int number = mapper.maxNum()+1;
		dto.setNum(number);
		mapper.writeInsert(dto);
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
	
	@Override
    public GuestDTO readNum(int num) {
        return mapper.readNum(num);
    }

}
