package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;

import kr.or.ddit.dto.stu.RecoRepoVO;

public interface RecoRepoDAO {
	
	//추천신고 조회
	RecoRepoVO selectRecoRepo(RecoRepoVO recoRepo) throws SQLException;
	
	//추천신고횟수조회
	int selectCountRecoRepo(RecoRepoVO recoRepo) throws SQLException;
	
	//새 추천 신고
	void insertRecoRepo(RecoRepoVO recoRepo) throws SQLException;
	
	//추천 업데이트
	void updateReco(RecoRepoVO recoRepo) throws SQLException;
	
	//신고 업데이트
	void updateRepo(RecoRepoVO recoRepo) throws SQLException;
	
}
