/**
 * 
 */
package th.mu.rama.ped.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import th.mu.rama.ped.model.entity.Question;
import th.mu.rama.ped.model.service.QuestionService;

/**
 * @author Sirimongkol
 *
 */
@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	private static Logger log = Logger.getLogger(AnswerController.class);
	
	
	@Autowired
	private QuestionService questionService;

	@RequestMapping(value = "/ipd", method = RequestMethod.GET)
    public String ipdPage(Model model) {
		
		List<Question> questions = this.questionService.findAll();
		
		Collections.sort(questions, new Comparator<Question>() {
		    public int compare(Question q1, Question q2) {
		    	return q1.getQuestionNumber() - q2.getQuestionNumber();
		    }
		});

		model.addAttribute("questions", questions);
        return "answer-ipd";
    }
	
	@RequestMapping(value = "/opd", method = RequestMethod.GET)
    public String opdPage(Model model) {
        return "answer-opd";
    }
	
}
