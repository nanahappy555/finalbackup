package kr.or.ddit.controller.stu;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.RecoRepoVO;
import kr.or.ddit.dto.stu.StudyShareVO;
import kr.or.ddit.dto.stu.SurveyVO;
import kr.or.ddit.service.stu.support.AiInterviewService;
import kr.or.ddit.service.stu.support.ShareService;
import kr.or.ddit.service.stu.support.SurveyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu/support")
public class StuSupportController {
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private ShareService shareService;

	@RequestMapping("/mbtiPage.do")
	public String mbtiPage() {
		String url = "stu/support/mbtiPage";
		return url;
	}

	@RequestMapping("/aiRecommend/main.do")
	public String aiRecommend(Model model) throws Exception{
		String url = "stu/support/aiRecommendMain";
		List<SurveyVO> surveyList = surveyService.getSurvey();
		model.addAttribute("surveyList",surveyList);
		return url;
	}

	@RequestMapping("/share")
	public String share() throws Exception {
		String url = "stu/support/share";
		
//		log.debug("================================크리테리아=======================================" + cri);
//		
//		//우수성적 (shareAllList,pageMaker)
//		Map<String,Object> shareAllMap = shareService.getShareList(cri);
//		//과목(shareLecList,pageMaker)
//		Map<String,Object> shareLecMap = shareService.getShareListByLec(cri);
//		
//		//성적추천순
//		List<StudyShareVO> recoAllList = shareService.getShareOrderByReco();
//		//과목추천순
//		List<StudyShareVO> recoLecList = shareService.getShareByLecOrderByReco();
//		
//		
//		mnv.addObject("shareAllMap", shareAllMap);
//		mnv.addObject("shareLecMap", shareLecMap);
//		mnv.addObject("recoAllList", recoAllList);
//		mnv.addObject("recoLecList", recoLecList);
//		mnv.setViewName(url);

		return url;
	}
	
	@GetMapping(value="/share/allList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> allList(Criteria cri) throws Exception {
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		log.debug("===============겟페이지==============="+cri);
//		Criteria cri = new Criteria();
//		cri.setPage(allPage);
		//우수성적 (shareAllList,pageMaker)
		Map<String,Object> shareAllMap = shareService.getShareList(cri);
		//성적추천순
		List<StudyShareVO> recoAllList = shareService.getShareOrderByReco();
		
		listMap.put("shareAllMap", shareAllMap);
		listMap.put("recoAllList", recoAllList);
		
		return listMap;
	}
	
	@GetMapping(value="/share/lecList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> lecList(Criteria cri) throws Exception {
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		//과목(shareLecList,pageMaker)
		Map<String,Object> shareLecMap = shareService.getShareListByLec(cri);
		//과목추천순
		List<StudyShareVO> recoLecList = shareService.getShareByLecOrderByReco();
		
		listMap.put("shareLecMap", shareLecMap);
		listMap.put("recoLecList", recoLecList);
		
		return listMap;
	}

	@GetMapping("/share/detail")
	public ModelAndView shareDetail(int shaBno, @RequestParam(defaultValue="") String from, ModelAndView mnv) throws Exception{
		String url = "stu/support/shareDetail";
		
		StudyShareVO share = null;
		if(from != null && from.equals("list")) {
			share = shareService.getShare(shaBno);
			url = "redirect:/stu/support/share/detail?shaBno="+shaBno;
		}else {
			share = shareService.getShareForModify(shaBno);
		}
		
		mnv.addObject("share",share);
		mnv.setViewName(url);

		return mnv;
	}

	@GetMapping("/share/registForm")
	public String shareRegistForm() {
		String url = "stu/support/shareRegistForm";
		return url;
	}
	
	@PostMapping(value="/share/regist", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String shareRegist() {
		String success = "성공";
		
		return success;
	}
	
	@GetMapping("/share/modifyForm")
	public ModelAndView shareModifyForm(ModelAndView mnv, int shaBno) throws SQLException {
		String url = "stu/support/shareModifyForm";
		
		StudyShareVO share = shareService.getShareForModify(shaBno);
		
		mnv.addObject("share", share);
		mnv.setViewName(url);
		
		return mnv;
	}
	@PostMapping("/share/modify")
	public ModelAndView shareModify(StudyShareVO share, ModelAndView mnv) throws SQLException {
		String url = "redirect:/stu/support/share/detail?from=modify&shaBno="+share.getShaBno();
		
		share.setTitle(HTMLInputFilter.htmlSpecialChars(share.getTitle()));
		
		shareService.modifyShare(share);
		
		mnv.addObject("shaBno", share.getShaBno());
		mnv.addObject("from", "modify");
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PutMapping(value="/share/recommend",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String shareRecommend(RecoRepoVO recoRepo, HttpServletRequest request)throws SQLException{
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		recoRepo.setStuCd(stuCd);
		recoRepo.setRecoChk("chk");
		recoRepo.setRepoChk("uchk");
		
//		log.debug("컨트롤러"+recoRepo);
		String msg = shareService.recommendShare(recoRepo);
		
		return msg;
   }
	@PutMapping(value="/share/report",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String shareReport(RecoRepoVO recoRepo, HttpServletRequest request)throws SQLException{
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		recoRepo.setStuCd(stuCd);
		recoRepo.setRecoChk("uchk");
		recoRepo.setRepoChk("chk");
		
//		log.debug("컨트롤러"+recoRepo);
		String msg = shareService.reportShare(recoRepo);
		
		return msg;
	}
	

	@RequestMapping("/employ/main.do")
	public String employMain() {
		String url = "stu/support/employMain";
		return url;
	}
	@Autowired
	private AiInterviewService aiInterviewService;
	
	
	@GetMapping(value = "/employ/script",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String employScript(HttpServletResponse res) throws Exception{
		res.setCharacterEncoding("utf-8");
		String scriptContent = aiInterviewService.selectScript();
		log.info("scriptContent : "+scriptContent);
		return scriptContent;
	}
	
	
	/*
	@RequestMapping("/recordDownload")
	@ResponseBody
	public String recordDownload(MultipartFile file) throws Exception {
		System.out.println("파일 넘어옴.");
		System.out.println(file.getSize());
		File target = new File("C:" + File.separator + "test", "확인.avi");
		file.transferTo(target);
		//이부분은 수정이 필요하다.
		String abc = "성공";
		return abc;
	}
	*/


}
