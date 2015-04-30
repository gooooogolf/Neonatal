/**
 * 
 */
package th.mu.rama.ped.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

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
	
	@RequestMapping(value = "/{questionId}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody 
    public Question show(@PathVariable("questionId") Integer questionId) {
        return this.questionService.find(questionId);
    }
	
	
	@RequestMapping(method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public Question create(@RequestBody Question question) {
		this.questionService.save(question);
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
	        this.questionService.delete(this.questionService.find(questionId));
	}
	
	@ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleWrongContent(Exception ex) {
        log.debug(ex.getMessage());
        return ex.getMessage();
    }
	
}
