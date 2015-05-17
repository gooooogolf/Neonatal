/**
 * 
 */
package th.mu.rama.ped.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import th.mu.rama.ped.model.entity.Answer;
import th.mu.rama.ped.model.entity.Question;
import th.mu.rama.ped.model.service.AnswerService;
import th.mu.rama.ped.model.service.QuestionService;
import th.mu.rama.ped.util.DateTime;

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
	
	@Autowired
	private AnswerService answerService;

	@RequestMapping(value = "/ipd", method = RequestMethod.GET)
    public String ipdPage(Model model) {
		
		List<Question> questions = this.questionService.findAll();
		
		Collections.sort(questions, new Comparator<Question>() {
		    public int compare(Question q1, Question q2) {
		    	return q1.getQuestionNumber() - q2.getQuestionNumber();
		    }
		});

		model.addAttribute("questions", questions);
		model.addAttribute("JSONArray_questions", JSONArray.fromObject(questions));
        return "answer-ipd";
    }
	
	@RequestMapping(value = "/opd", method = RequestMethod.GET)
    public String opdPage(Model model) {
        return "answer-opd";
    }
	
	@RequestMapping(value = "/getAnswers", method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public List<Answer> getAnswers(HttpServletRequest request) {
		String mrn = request.getParameter("mrn");
		String workgroup = request.getParameter("workgroup");
		List<Answer> answers = answerService.findByMrnAndWorkgroup(mrn, workgroup);
		return answers.isEmpty() ? null : answers;
	}
	 
	@RequestMapping(value = "/save", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public List<Answer> saveOrUpdateAnswerWithAjax(@RequestBody String strAnswers) {
		
		JSONArray jsonAnswers = JSONArray.fromObject(strAnswers);
		List<Answer> answers = new ArrayList<Answer>();
		Answer answer = null;
		Date effectiveDate = DateTime.stringtoDate(DateTime.dateNow_ddMMyyyy() + " " + DateTime.timeNow(), "dd/MM/yyyy HH:mm:ss");
		if (!jsonAnswers.isEmpty()) {
			
			JSONObject jsonAnswer = JSONObject.fromObject(jsonAnswers.get(0));
			
			String mrn = jsonAnswer.getString("mrn");
			String workgroup = jsonAnswer.getString("workgroup");
			
			List<Answer> oldAnswers = answerService.findByMrnAndWorkgroup(mrn, workgroup);
			HashMap<String, Answer> answerMap = new HashMap<String, Answer>();
			if (oldAnswers != null) {
				for (Answer oldAnswer: oldAnswers) {
					answerMap.put(oldAnswer.getMrn() + "_" + oldAnswer.getQuestionId() + "_" + oldAnswer.getChoiceId(), oldAnswer);
				}
			}

			String staffId = "";
			String key = "";
			Answer oldAnswer = null;
			for (int i = 0; i < jsonAnswers.size(); i++) {
				jsonAnswer = JSONObject.fromObject(jsonAnswers.get(i));
				key = jsonAnswer.getString("mrn") + "_" + jsonAnswer.getInt("questionId") + "_" + jsonAnswer.getInt("choiceId"); 
				staffId = jsonAnswer.getString("staffId");
				oldAnswer = answerMap.get(key);
				if (oldAnswer != null) {
					if ((!oldAnswer.getAnswerText().equals(jsonAnswer.getString("answerText"))) || (oldAnswer.getStatus().equals("terminated"))) {
						oldAnswer.setEffectiveDate(effectiveDate);
						oldAnswer.setAnswerText(jsonAnswer.getString("answerText"));
						oldAnswer.setQuestionType(jsonAnswer.getString("questionType"));
						oldAnswer.setStatus("active");
						oldAnswer.setStaffId(staffId);
						answerService.saveOrUpdate(oldAnswer);
						answers.add(oldAnswer);
					}	
					answerMap.remove(key);
				}
				else {
					answer = new Answer();
					answer.setAnswerText(jsonAnswer.getString("answerText"));
					answer.setAnswerVar(jsonAnswer.getString("answerVar"));
					answer.setEffectiveDate(effectiveDate);
					answer.setId(0);
					answer.setMrn(jsonAnswer.getString("mrn"));
					answer.setQuestionType(jsonAnswer.getString("questionType"));
					answer.setQuestionId(jsonAnswer.getInt("questionId"));
					answer.setChoiceId(jsonAnswer.getInt("choiceId"));
					answer.setStatus("active");
					answer.setWorkgroup(jsonAnswer.getString("workgroup"));
					answer.setStaffId(staffId);
					answerService.save(answer);
					answers.add(answer);
				}
			}
			
			if (!answerMap.isEmpty()) {
				for (String keySet : answerMap.keySet()) {
					oldAnswer = answerMap.get(keySet);
					oldAnswer.setEffectiveDate(effectiveDate);
					oldAnswer.setStaffId(staffId);
					oldAnswer.setStatus("terminated");
					answerService.saveOrUpdate(oldAnswer);
//					answerService.delete(oldAnswer);
//					answerMap.remove(keySet);
				}
			}
		}

		return answers.isEmpty() ? null : answers;
	}
	
}
