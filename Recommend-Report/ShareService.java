package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.stu.RecoRepoVO;
import kr.or.ddit.dto.stu.StudyShareVO;

public interface ShareService {

	//목록
	Map<String,Object> getShareList(Criteria cri) throws SQLException;
	
	Map<String,Object> getShareListByLec(Criteria cri) throws SQLException;
	
	//추천순 10개 리스트
	List<StudyShareVO> getShareOrderByReco()throws SQLException;
	List<StudyShareVO> getShareByLecOrderByReco()throws SQLException;
	
	//목록에서 글상세
	StudyShareVO getShare(int shaBno) throws SQLException;
	
	//수정에서 글상세
	StudyShareVO getShareForModify(int shaBno) throws SQLException;
	
	//등록
	void registShare(StudyShareVO StudyShare) throws SQLException;
	
	//업데이트
	void modifyShare(StudyShareVO StudyShare) throws SQLException;
	
	
	//추천
	String recommendShare(RecoRepoVO recoRepo) throws SQLException;
	
	//신고
	String reportShare(RecoRepoVO recoRepo) throws SQLException;

}
