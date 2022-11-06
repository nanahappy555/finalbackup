package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.stu.RecoRepoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RecoRepoDAOImpl implements RecoRepoDAO {

	@Autowired
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public RecoRepoVO selectRecoRepo(RecoRepoVO recoRepo) throws SQLException {
		RecoRepoVO recorepo = session.selectOne("RecoRepo-Mapper.selectRecoRepo", recoRepo);
		return recorepo;
	}
	
	@Override
	public int selectCountRecoRepo(RecoRepoVO recoRepo) throws SQLException {
		log.debug("recoRepo : "+recoRepo);
		int count = session.selectOne("RecoRepo-Mapper.selectCountRecoRepo", recoRepo);
		log.debug("count : "+count);
		return count;
	}

	@Override
	public void insertRecoRepo(RecoRepoVO recoRepo) throws SQLException {
		session.update("RecoRepo-Mapper.insertRecoRepo",recoRepo);
	}

	@Override
	public void updateReco(RecoRepoVO recoRepo) throws SQLException {
		session.update("RecoRepo-Mapper.updateReco",recoRepo);
	}

	@Override
	public void updateRepo(RecoRepoVO recoRepo) throws SQLException {
		session.update("RecoRepo-Mapper.updateRepo",recoRepo);
	}

}
