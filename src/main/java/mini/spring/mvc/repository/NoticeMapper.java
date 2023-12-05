package mini.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import mini.spring.mvc.bean.NoticeDTO;

public interface NoticeMapper {
	
	public List<NoticeDTO> getAllList();
	public NoticeDTO getOne(int num);
	public int deleteNotice(int num);
	public int addNotice(@Param("title") String title,
						@Param("content") String content,
						@Param("img") String img);
}
