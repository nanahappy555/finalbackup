package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.stu.StudyShareVO;

@Repository
public class ShareDAOImpl implements ShareDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<StudyShareVO> selectShareByAll(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<StudyShareVO> shareList = session.selectList("Share-Mapper.selectShareByAll",cri,rowBounds);
		
		return shareList;
	}
	
	@Override
	public List<StudyShareVO> selectShareByLec(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<StudyShareVO> shareListByLec = session.selectList("Share-Mapper.selectShareByLec",cri,rowBounds);
		
		return shareListByLec;
	}

	@Override
	public List<StudyShareVO> selectShareOrderByReco() throws SQLException {
		return session.selectList("Share-Mapper.selectShareOrderByReco");
	}

	@Override
	public List<StudyShareVO> selectShareByLecOrderByReco() throws SQLException {
		return session.selectList("Share-Mapper.selectShareByLecOrderByReco");
	}
	
	@Override
	public StudyShareVO selectShare(int shaBno) throws SQLException{
		return session.selectOne("Share-Mapper.selectShare",shaBno);
	}

	
	@Override
	public void insertShare(StudyShareVO StudyShare) throws SQLException {
		session.update("Share-Mapper.insertShare",StudyShare);
	}
	@Override
	public void updateShare(StudyShareVO StudyShare) throws SQLException {
		session.update("Share-Mapper.updateShare",StudyShare);
	}

	
	@Override
	public void increaseViewCnt(int shaBno) throws SQLException {
		session.update("Share-Mapper.increaseViewCnt",shaBno);
	}
	@Override
	public void increaseRecoNum(int shaBno) throws SQLException {
		session.update("Share-Mapper.increaseRecoNum",shaBno);
	}
	
	@Override
	public void increaseReportCnt(int shaBno) throws SQLException {
		session.update("Share-Mapper.increaseReportCnt",shaBno);
	}

	@Override
	public int selectReportCnt(int shaBno) throws SQLException {
		int cnt = session.selectOne("Share-Mapper.selectReportCnt",shaBno);
		return cnt;
	}

	@Override
	public void updateAvailable(int shaBno) throws SQLException {
		session.selectOne("Share-Mapper.updateAvailable",shaBno);
	}
	
	@Override
	public int selectShareSeqNext() throws SQLException {
		int count = session.update("Share-Mapper.selectShareSeqNext");
		return count;
	}
	
	
	@Override
	public int selectAllTotalCount(Criteria cri) throws SQLException {
		return session.selectOne("Share-Mapper.selectAllTotalCount", cri);
	}
	
	@Override
	public int selectLecTotalCount(Criteria cri) throws SQLException {
		return session.selectOne("Share-Mapper.selectLecTotalCount", cri);
	}

	@Override
	public String selectLecCdBySubjName(String keyword) throws SQLException {
		String newKeyword = session.selectOne("Share-Mapper.selectLecCdBySubjName",keyword);
		return newKeyword;
	}

	
}
