package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.stu.support.RecoRepoDAO;
import kr.or.ddit.dao.stu.support.ShareDAO;
import kr.or.ddit.dto.stu.RecoRepoVO;
import kr.or.ddit.dto.stu.StudyShareVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShareServiceImpl implements ShareService {
	
	@Autowired
	private ShareDAO shareDAO;
	public void setShareDAO (ShareDAO shareDAO) {
		this.shareDAO = shareDAO;
	}
	 
	
	@Autowired
	private RecoRepoDAO recoRepoDAO;
	public void setRecoRepoDAO(RecoRepoDAO recoRepoDAO) {
		this.recoRepoDAO = recoRepoDAO;
	}

	@Override
	public Map<String,Object> getShareList(Criteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StudyShareVO> shareAllList = shareDAO.selectShareByAll(cri);
		int totalCount = shareDAO.selectAllTotalCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("shareAllList", shareAllList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String,Object> getShareListByLec(Criteria cri) throws SQLException {
		String searchType = cri.getSearchType();
		String keyword = cri.getKeyword();
		
		if(searchType!=null && searchType.equals("l")) {
			String newKeyword = shareDAO.selectLecCdBySubjName(keyword);
			cri.setKeyword(newKeyword);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StudyShareVO> shareLecList = shareDAO.selectShareByLec(cri);
		int totalCount = shareDAO.selectLecTotalCount(cri);
		
		cri.setKeyword(keyword);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("shareLecList", shareLecList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<StudyShareVO> getShareOrderByReco() throws SQLException {
		return shareDAO.selectShareOrderByReco();
	}

	@Override
	public List<StudyShareVO> getShareByLecOrderByReco() throws SQLException {
		return shareDAO.selectShareByLecOrderByReco();
	}
	
	@Override
	public StudyShareVO getShare(int shaBno) throws SQLException{
		StudyShareVO share = shareDAO.selectShare(shaBno);
		shareDAO.increaseViewCnt(shaBno);
		return share;
	}
	@Override
	public StudyShareVO getShareForModify(int shaBno) throws SQLException{
		StudyShareVO share = shareDAO.selectShare(shaBno);
		return share;
	}



	@Override
	public void registShare(StudyShareVO StudyShare) throws SQLException {
		shareDAO.insertShare(StudyShare);
	}
	
	@Override
	public void modifyShare(StudyShareVO StudyShare) throws SQLException {
		shareDAO.updateShare(StudyShare);
	}


	@Override
	public String recommendShare(RecoRepoVO recoRepo) throws SQLException {
		String msg = "";
		//stuCd, shBno??? ??????/?????? null ??????
		int shaBno = recoRepo.getShaBno();
		int count = recoRepoDAO.selectCountRecoRepo(recoRepo);
		
		//null
		if(count == 0) {
			//??????/????????? ?????? ??????
			recoRepoDAO.insertRecoRepo(recoRepo);
			shareDAO.increaseRecoNum(shaBno);
			
			msg = "?????????????????????.";
		
		}else {
			RecoRepoVO resultVO = recoRepoDAO.selectRecoRepo(recoRepo);
			
			if(resultVO.getRecoChk().equals("uchk")) {
				//????????? ?????? ??????(????????? ??????)
				recoRepoDAO.updateReco(recoRepo);
				shareDAO.increaseRecoNum(shaBno);
				
				msg = "?????????????????????.";
				
			}else if(resultVO.getRecoChk().equals("chk")) {
				//????????????
				msg = "?????? ????????? ????????????.";
				
			}
		}
		return msg;
	}


	@Override
	public String reportShare(RecoRepoVO recoRepo) throws SQLException {
		String msg = "";
		//stuCd, shaBno??? ??????/?????? null ??????
		int count = recoRepoDAO.selectCountRecoRepo(recoRepo);
		
		int shaBno = recoRepo.getShaBno();
		
		//null
		if(count == 0) {
			//??????/????????? ?????? ??????
			recoRepoDAO.insertRecoRepo(recoRepo);
			shareDAO.increaseReportCnt(shaBno);
			int repoCnt = shareDAO.selectReportCnt(shaBno);
			if (repoCnt >= 5) {
				shareDAO.updateAvailable(shaBno);
				return msg = "?????????????????????. 5??? ????????? ?????? ???????????? ?????????.";
			}
			
			msg = "?????????????????????.";
		
		}else {
			RecoRepoVO resultVO = recoRepoDAO.selectRecoRepo(recoRepo);
			
			if(resultVO.getRepoChk().equals("uchk")) {
				//????????? ?????? ??????(????????? ??????)
				recoRepoDAO.updateRepo(recoRepo);
				shareDAO.increaseReportCnt(shaBno);
				int repoCnt = shareDAO.selectReportCnt(shaBno);
				if (repoCnt >= 5) {
					shareDAO.updateAvailable(shaBno);
					
					return msg = "?????????????????????. 5??? ????????? ?????? ???????????? ?????????.";
					
				}
				
				msg = "?????????????????????.";
				
			}else if(resultVO.getRepoChk().equals("chk")) {
				//????????????
				msg = "?????? ????????? ????????????.";
				
			}
		}
		return msg;
	}
	
	
	
}
