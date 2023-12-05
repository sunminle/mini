package mini.spring.mvc.service;

import java.util.List;

import org.springframework.ui.Model;

import mini.spring.mvc.bean.GuestDTO;

public interface GuestService {
	public int count();
	
	public GuestDTO update(int num);


	
	public String readPasswd(int num);
	public int updateNum(GuestDTO dto);
	
	public int deleteNum(int num, String passwd);
	
	public void create(GuestDTO dto);
	
	public List<GuestDTO> listAll();
	
	public GuestDTO readNum(int num);

}
