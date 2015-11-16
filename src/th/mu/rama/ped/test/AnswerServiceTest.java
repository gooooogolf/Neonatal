/**
 * 
 */
package th.mu.rama.ped.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import th.mu.rama.ped.model.entity.Answer;
import th.mu.rama.ped.model.service.AnswerService;
import th.mu.rama.ped.util.DateTime;

/**
 * @author 006223
 *
 */
public class AnswerServiceTest {

	private static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static AnswerService answerService = (AnswerService) ctx.getBean("answerService");
	
	public static void main(String[] args) {
//		System.out.println(answerService.findByMrnAndWorkgroup("4991551", "IPD"));
//		System.out.println(answerService.findByAnswerVar("RES18"));
		List<Answer> answers = answerService.findBetweenDate(DateTime.stringtoDate("2015-01-01 00:00:00", "yyyy-MM-dd HH:mm:ss"), DateTime.stringtoDate("2015-12-31 00:00:00", "yyyy-MM-dd HH:mm:ss"));
		System.out.println(answers.size());
	}

}
