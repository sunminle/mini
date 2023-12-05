package mini.spring.mvc.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mini.spring.mvc.bean.GuestDTO;

public interface GuestMapper {
	
	public int count();
	
	public int maxNum();
	public void writeUpdate(GuestDTO dto);
	public void writeInsert(GuestDTO dto);
	
	public GuestDTO readNum(int num);
	public String readPasswd(int num);
	public int updateNum(GuestDTO dto);
	public int deleteNum(int num);
	public List<GuestDTO> listAll(Map<String, Object> params);

}
