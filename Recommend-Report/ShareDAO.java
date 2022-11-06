package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.dto.stu.StudyShareVO;

public interface ShareDAO {

	//일반목록
	List<StudyShareVO> selectShareByAll(Criteria cri) throws SQLException;
	List<StudyShareVO> selectShareByLec(Criteria cri) throws SQLException;
	
	//추천순 목록 10개
	List<StudyShareVO> selectShareOrderByReco() throws SQLException;
	List<StudyShareVO> selectShareByLecOrderByReco() throws SQLException;
	
	
	StudyShareVO selectShare(int shaBno) throws SQLException;
	
	void insertShare(StudyShareVO StudyShare) throws SQLException;
	void updateShare(StudyShareVO StudyShare) throws SQLException;
	
	void increaseViewCnt(int shaBno) throws SQLException;
	
	void increaseRecoNum(int shaBno) throws SQLException;
	void increaseReportCnt(int shaBno) throws SQLException;
	int selectReportCnt(int shaBno) throws SQLException;
	void updateAvailable(int shaBno) throws SQLException;
	
	int selectShareSeqNext() throws SQLException;
	
	
	int selectAllTotalCount(Criteria cri) throws SQLException;
	int selectLecTotalCount(Criteria cri) throws SQLException;
	String selectLecCdBySubjName(String keyword) throws SQLException;
}
