package mini.spring.mvc.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mini.spring.mvc.bean.GuestDTO;

public interface GuestMapper {
	
	public int count();
	public List<GuestDTO> list(HashMap map);
	public int maxNum();
	public void writeUpdate(GuestDTO dto);
	public void writeInsert(GuestDTO dto);
	public void updateCountUp(int num);
	public GuestDTO readNum(int num);
	public String readPasswd(int num);
	public int updateNum(GuestDTO dto);
	public int deleteNum(int num);
	public List<GuestDTO> listAll(Map<String, Object> params);

}
