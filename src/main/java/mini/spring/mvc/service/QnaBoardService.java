package mini.spring.mvc.service;

import java.util.List;

import mini.spring.mvc.bean.QnaBoardDTO;

public interface QnaBoardService {
	public int maxNum();
	public void insert(QnaBoardDTO dto) throws Exception;
	public List<QnaBoardDTO> list();
	public QnaBoardDTO view(int num);
}
