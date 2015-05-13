/**
 * 
 */
package th.mu.rama.ped.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import th.mu.rama.ped.model.entity.GroupQuestion;
import th.mu.rama.ped.model.service.GroupQuestionService;

/**
 * @author Sirimongkol
 *
 */
@Controller
@RequestMapping("/groups")
public class GroupQuestionController {
	
	@Autowired
	private GroupQuestionService groupQuestionService;
	
	@RequestMapping(method = RequestMethod.GET)
    public String groupPage(Model model) {
		
		List<GroupQuestion> groupQuestions = this.groupQuestionService.findAll();
		
		Collections.sort(groupQuestions, new Comparator<GroupQuestion>() {
		    public int compare(GroupQuestion q1, GroupQuestion q2) {
		    	return q1.getSequence() - q2.getSequence();
		    }
		});

		model.addAttribute("groupQuestions", groupQuestions);
		
        return "groups";
    }
	
	@RequestMapping(method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    @ResponseBody
    public GroupQuestion create(@RequestBody GroupQuestion groupQuestion) {
		this.groupQuestionService.save(groupQuestion);
        return this.groupQuestionService.find(groupQuestion.getId());
    }
}
