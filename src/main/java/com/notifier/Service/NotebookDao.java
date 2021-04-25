package com.notifier.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.notifier.beans.Notebook;
import com.notifier.beans.User;

@RestController
public class NotebookDao {
	private final JdbcTemplate template;
	public static List<Notebook> notebookresult = new ArrayList<>();
	public static List<String> notebooknames = new ArrayList<String>();
	Notebook notebook=new Notebook();
	
	@Autowired
	public NotebookDao(JdbcTemplate template) {
		this.template = template;
	}
	
	public void notebookNames() {
		notebooknames.clear();
		String sql="SELECT notebookname FROM notebook WHERE email='"+User.getObj().getEmail()+"'";
		notebooknames = template.queryForList(sql, String.class);
	}
	
	public void notebookResult() {
		List<Notebook> nb=new ArrayList<>();
		String query = "SELECT * FROM notebook WHERE email='"+User.getObj().getEmail()+"'";
		nb = template.query(query, new NotebookMapper());
		for(Notebook n:nb) {
			String c = noteCount(n.getNotebookName());
			String count="UPDATE notebook SET notecount='"+c+"' WHERE notebookname='"+n.getNotebookName()+"' AND email='"+User.getObj().getEmail()+"'";
			int r=template.update(count);
		}
		String q = "SELECT * FROM notebook WHERE email='"+User.getObj().getEmail()+"'";
		notebookresult = template.query(q, new NotebookMapper());
	}
	
	public String noteCount(String name) {
		String nc="SELECT COUNT(notebookname) FROM notes WHERE notebookname='"+name+"' AND email='"+User.getObj().getEmail()+"'";
		String count = template.queryForObject(nc, String.class);
		return count;
	}
	
	@RequestMapping("/notebook")
	public ModelAndView viewNotebook() {
		notebookresult.clear();
		notebookResult();
		notebookNames();
		return new ModelAndView("notebook.jsp","notebookresult",notebookresult);
	}
	
	@RequestMapping("/addNotebook")
	public ModelAndView addNotebook(@RequestParam("notebookname") String nname) {
		try {
			notebookresult.clear();
			Notebook notebook=new Notebook();
			notebook.setNotebookName(nname);
			notebook.setEmail(User.getObj().getEmail());
			notebook.setNoteCount("0");
			String query= "INSERT INTO notebook (notebookname,notecount,email) VALUES ('"+notebook.getNotebookName()+"','"+notebook.getNoteCount()+"','"+notebook.getEmail()+"')";
			template.execute(query);
			notebookResult();
			notebookNames();
			return new ModelAndView("notebook.jsp","notebookresult",notebookresult);
		}
		catch(Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:error.jsp");
		}
	}
	@GetMapping("/deleteNotebook/{value}")
	public ModelAndView deleteNotebook(@PathVariable Long value) {
		try{
			notebookresult.clear();
			String query = "DELETE FROM notebook WHERE id='"+value.toString()+"' AND email='"+User.getObj().getEmail()+"'";
			template.execute(query);
			notebookResult();
			notebookNames();
			return new ModelAndView("../notebook.jsp", "notebookresult", notebookresult);
		}
		catch(Exception e) {
			return new ModelAndView("redirect:error.jsp");
		}

	}
	@RequestMapping("/updateNotebook")
	public ModelAndView updateNotebook(@RequestParam("notebookoldname") String notebookname,@RequestParam("notebooknewname") String newname){
		try {
			notebookresult.clear();
			String query="UPDATE notebook SET notebookname='"+newname+"' WHERE notebookname='"+notebookname+"' AND email='"+User.getObj().getEmail()+"'";
			template.execute(query);
			notebookResult();
			notebookNames();
			return new ModelAndView("notebook.jsp","notebookresult", notebookresult);
		}
		catch(Exception e) {
			return new ModelAndView("redirect:error.jsp");
		}
	}
}
