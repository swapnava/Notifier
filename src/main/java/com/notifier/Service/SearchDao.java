package com.notifier.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.notifier.beans.Notes;
import com.notifier.beans.User;

@RestController
public class SearchDao {
	
	private final JdbcTemplate template;
	
	@Autowired
	public SearchDao(JdbcTemplate template){
		this.template = template;
	}
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam("keyword") String keyword) {
		List<Notes> result = new ArrayList<Notes>();
		try {
			String query = "SELECT * from notes WHERE (notename='"+keyword+"' OR notebookname='"+keyword+"') AND (email='"+User.getObj().getEmail()+"')";
			result = template.query(query, new NoteMapper());
			return new ModelAndView("search.jsp","searchresults",result);
		}
		catch(Exception e) {
			return new ModelAndView("error.jsp");
		}
	}
}
