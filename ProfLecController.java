package kr.or.ddit.controller.prof;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dto.LectureNoticeVO;
import kr.or.ddit.service.prof.LectureNoticeService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/prof/lec")
@Slf4j
public class ProfLecController {
	
	public String lecCd = "SYL0001"; //나중에 삭제될 강의코드
	
	@GetMapping("/list")
	public String list() {
		String url="prof/lec/lectureList";
		return url;
	}
	
//	@GetMapping("/main.do")
//	public String main(String lecCode,Model model){
//		String url="prof/lec/lecBoardMain";
//		model.addAttribute("lecCode",lecCode);
//		return url;
//	}
	
	@Autowired
	private LectureNoticeService lectureNoticeService;
	
	@GetMapping("/main")
	public ModelAndView main(String lecCd,Criteria cri,ModelAndView mnv) throws SQLException{
		String url="prof/lec/lecBoardMain";
		
//		log.info(cri.getPerPageNum()+"");
		//공지사항
		Map<String, Object> noticeDataMap = lectureNoticeService.getLectureNoticeList(cri, this.lecCd);
		
		//질문
		
		//일정
		
		//과제
		
		
		mnv.addObject("noticeDataMap",noticeDataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
    
	@GetMapping("/notice/detail")
	public ModelAndView noticeDetail(LectureNoticeVO lecNotice, @RequestParam(defaultValue="") String from,ModelAndView mnv) throws SQLException {
		String url = "prof/lec/noticeDetail";
		
		int lecNoticeNo = lecNotice.getLecNoticeNo();
		lecNotice.setLecCd(this.lecCd); //없어질 코드
//		log.info("lecNoticeNo:"+lecNoticeNo+"");
		
		
		LectureNoticeVO notice = null;
		if(from!=null && from.equals("list")) {
			notice = lectureNoticeService.getLectureNotice(lecNotice);
			url = "redirect:/prof/lec/notice/detail?lecNoticeNo="+lecNoticeNo;
		}else {
			notice = lectureNoticeService.getLectureNoticeForModify(lecNotice);
		}

		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/notice/registForm")
	public String registForm() throws SQLException {
		String url = "mylecture/noticeRegistForm";
		
		return url;
	}
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	//파일첨부 구현용 참고
//	@PostMapping("/notice/regist")
//	public String regist(LectureNoticeCommand registReq, HttpServletRequest request,RedirectAttributes rttr)throws Exception{
//		return null;
//	}
	@PostMapping(value="/notice/regist", produces = "text/plain;charset=utf-8")
	public String regist(LectureNoticeVO lecNotice, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		String url = "redirect:/prof/lec/main";
		
		lecNotice.setLecCd(this.lecCd); //없어질 코드
		log.debug("lecNotice: " + lecNotice);
		
		lecNotice.setTitle(HTMLInputFilter.htmlSpecialChars(lecNotice.getTitle()));
		
		lectureNoticeService.regist(lecNotice);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@GetMapping("/notice/modifyForm")
	public ModelAndView modifyForm(LectureNoticeVO lecNotice,ModelAndView mnv) throws SQLException {
		String url = "mylecture/noticeModifyForm";
		
		int lecNoticeNo = lecNotice.getLecNoticeNo();
		log.info("lecNoticeNo:"+lecNoticeNo);
		
		lecNotice.setLecCd(this.lecCd); //없어질 코드
		
		LectureNoticeVO notice = lectureNoticeService.getLectureNoticeForModify(lecNotice);
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
//	@GetMapping("/lecBoardMainIndex.do") //얘뭐임?
//	public String lecBoardIndex(String lectureCD) {
//		String url = "prof/lec/lecBoardMainIndex";
//		return url;
//	}
	
	@GetMapping("/qna/list")
	public String QnaList() {
		String url = "prof/lec/qnaList";
		return url;
	}
	@GetMapping("/qna/detail")
	public String QnaDetail() {
		String url = "prof/lec/qnaDetail";
		return url;
	}
	
	@GetMapping("/schedule/list")
	public String ScheduleList() {
		String url = "prof/lec/scheduleList";
		return url;
	}
	
	@GetMapping("/assignment/list")
	public String assignmentList() {
		String url = "prof/lec/assignmentList";
		return url;
	}
	@GetMapping("/assignment/detail")
	public String assignmentDetail() {
		String url = "prof/lec/assignmentDetail";
		return url;
	}
	@GetMapping("/assignment/regist")
	public String assignmentRegist() {
		String url = "prof/lec/assignmentRegist";
		return url;
	}
	@GetMapping("/assignment/modifyForm")
	public String assignmentModify() {
		String url = "prof/lec/assignmentModifyForm";
		return url;
	}
	
	@GetMapping("/assignment/eval/list")
	public String assignmentEvalList() {
		String url = "prof/lec/assignmentEvalList";
		return url;
	}
	
	@GetMapping("/attend/list")
	public String attendList() {
		String url = "prof/lec/attendList";
		return url;
	}
	@GetMapping("/marks/list")
	public String marksList() {
		String url = "prof/lec/marksList";
		return url;
	}
	
	@GetMapping("/materials/list")
	public String materialsList() {
		String url = "prof/lec/materialsList";
		return url;
	}
	
	@GetMapping("/review/list")
	public String reviewList() {
		String url = "prof/lec/reviewList";
		return url;
	}
}
