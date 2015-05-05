/**
 * 
 */
package th.mu.rama.ped.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import th.mu.rama.ped.model.entity.Choice;
import th.mu.rama.ped.model.entity.Question;
import th.mu.rama.ped.model.service.QuestionService;

/**
 * @author Sirimongkol
 *
 */
@Controller
@RequestMapping("/questions")
public class QuestionController {
	
	private static Logger log = Logger.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(method = RequestMethod.GET)
    public String findAll(Model model) {
		List<Question> questions = this.questionService.findAll();
		
		Collections.sort(questions, new Comparator<Question>() {
		    public int compare(Question q1, Question q2) {
		    	return q1.getQuestionNumber() - q2.getQuestionNumber();
		    }
		});
		
		model.addAttribute("questions", questions);
        return "question-list";
    }
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
    public String create(Model model) {
		model.addAttribute("questions", this.questionService.findAll());
        return "question-create";
    }
	
	@RequestMapping(value = "/{questionId}", method = RequestMethod.GET)
    public String find(@PathVariable("questionId") Integer questionId, Model model) {
		Question question = this.questionService.find(questionId);
		model.addAttribute("question", question);
		model.addAttribute("questionType", question.getQuestionType());
		model.addAttribute("choices", JSONArray.fromObject(question.getChoices()));
        return "question-view";
    }
	
	@RequestMapping(value = "/{questionId}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody 
    public Question find(@PathVariable("questionId") Integer questionId) {
        return this.questionService.find(questionId);
    }
	
	
	@RequestMapping(method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public Question create(@RequestBody Question question) {
		this.questionService.save(question);
        return this.questionService.find(question.getId());
    }
	
	@RequestMapping(value = "/save", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public Question saveQuestionWithAjax(@RequestBody String questionJSON) {
		Question question = new Question();
//		System.out.println(questionJSON);
		JSONObject qjson = JSONObject.fromObject(questionJSON);
		question.setWorkgroup(qjson.getString("workgroup"));
		question.setQuestionNumber(qjson.getInt("questionNumber"));
		question.setQuestionTitle(qjson.getString("questionTitle"));
		question.setHelpText(qjson.getString("helpText"));
		question.setQuestionType(qjson.getString("questionType"));
		question.setStatus("active");
		JSONArray cjarray = JSONArray.fromObject(qjson.getString("choices"));
		if (cjarray.isArray()) {
			List<Choice> choices = new ArrayList<Choice>();
			Choice choice = null;
			JSONObject cjson = null;
			for (int i = 0; i < cjarray.size(); i++) {
				choice = new Choice();
				cjson = JSONObject.fromObject(cjarray.get(i));
				choice.setChoiceNumber(cjson.getInt("choiceNumber"));
				choice.setChoiceText(cjson.getBoolean("isChoiceText"));
				choice.setChoiceTitle(cjson.getString("choiceTitle"));
				choice.setChoiceVar(cjson.getString("choiceVar"));
//				choice.setStatus(cjson.getString("status"));
				choice.setStatus("active");
				choices.add(choice);
			}
			question.setChoices(choices);
		}
		this.questionService.save(question);
        return this.questionService.find(question.getId());
//		return question;
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public Question updateQuestionWithAjax(@RequestBody String questionJSON) {
		Question question = new Question();
		System.out.println(questionJSON);
		JSONObject qjson = JSONObject.fromObject(questionJSON);
		question.setId(qjson.getInt("id"));
		question.setWorkgroup(qjson.getString("workgroup"));
		question.setQuestionNumber(qjson.getInt("questionNumber"));
		question.setQuestionTitle(qjson.getString("questionTitle"));
		question.setHelpText(qjson.getString("helpText"));
		question.setQuestionType(qjson.getString("questionType"));
		question.setStatus("active");
		JSONArray cjarray = JSONArray.fromObject(qjson.getString("choices"));
		if (cjarray.isArray()) {
			List<Choice> choices = new ArrayList<Choice>();
			Choice choice = null;
			JSONObject cjson = null;
			for (int i = 0; i < cjarray.size(); i++) {
				choice = new Choice();
				cjson = JSONObject.fromObject(cjarray.get(i));
				choice.setId(cjson.getInt("id"));
				choice.setChoiceNumber(cjson.getInt("choiceNumber"));
				choice.setChoiceText(cjson.getBoolean("isChoiceText"));
				choice.setChoiceTitle(cjson.getString("choiceTitle"));
				choice.setChoiceVar(cjson.getString("choiceVar"));
				choice.setStatus(cjson.getString("status"));
				choices.add(choice);
			}
			question.setChoices(choices);
		}
		this.questionService.saveOrUpdate(question);
        return this.questionService.find(question.getId());
    }
	
	@RequestMapping(value = "/{questionId}", method = RequestMethod.PUT)
	@ResponseBody 
    public Question update(@PathVariable("questionId") Integer questionId, @RequestBody Question question) {
		this.questionService.update(question);
        return this.questionService.find(questionId);
    }
	
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@RequestMapping(value = "/{questionId}", method = RequestMethod.DELETE)
	public void delete(@PathVariable("questionId") Integer questionId) {
//	        this.questionService.delete(this.questionService.find(questionId));
		Question question = this.questionService.find(questionId);
		question.setStatus("terminated");
		this.questionService.saveOrUpdate(question);
	}
	
	@ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleWrongContent(Exception ex) {
        log.debug(ex.getMessage());
        return ex.getMessage();
    }
	
}
