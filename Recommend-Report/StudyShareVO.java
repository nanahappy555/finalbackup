package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudyShareVO {

	private int shaBno;
	private String stuCd;
	private String lecCd = "SYL0000";
	private String title;
	private Date cdate;
	private int recoNum = 0;
	private int viewCnt = 0;
	private String boardDivCd;
	private String content;
	private int reportCnt = 0;
	private String available = "1";
	
	private String subjName;
}
