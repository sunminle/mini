package mini.spring.mvc.repository;

import java.util.HashMap;
import java.util.List;

import mini.spring.mvc.bean.QnaBoardDTO;
import mini.spring.mvc.bean.QnaBoardFileDTO;



public interface QnaBoardMapper {

	public void insert(QnaBoardDTO dto);
	public List<QnaBoardDTO> list();
	
	public QnaBoardDTO content(int num);
	public int fileInsert(QnaBoardFileDTO dto);
	public List<String> fileName(int num);
	
	public int isFile(int num);
	public QnaBoardDTO view(int num);

}