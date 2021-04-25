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
import com.notifier.beans.Notes;
import com.notifier.beans.User;

@RestController
public class NotesDao {
	public static List<Notes> notelist=new ArrayList<Notes>();
	
	Notebook notebook=new Notebook();

	private final JdbcTemplate template;
	@Autowired
	public NotesDao(JdbcTemplate template) {
		this.template = template;
	}
	
	public void generateNoteList() {
		String query = "SELECT * FROM notes WHERE email='"+User.getObj().getEmail()+"'";
		notelist = template.query(query, new NoteMapper());
	}
	
	public String noteCount(String name) {
		String nc="SELECT COUNT(notebookname) FROM notes WHERE notebookname='"+name+"' AND email='"+User.getObj().getEmail()+"'";
		String count = template.queryForObject(nc, String.class);
		return count;
	}
	
	@RequestMapping("/notes")
	public ModelAndView viewNotes() {
		notelist.clear();
		generateNoteList();
		return new ModelAndView("note.jsp","notelist",notelist);
	}
	
	@RequestMapping("/addNote")
	public ModelAndView addNotes(@RequestParam("notename") String notename,@RequestParam("startdate") String startdate,
			@RequestParam("enddate") String enddate,@RequestParam("status") String status,@RequestParam("tag") String tag,
			@RequestParam("notebookname") String notebookname,
			@RequestParam("description") String description) {
		try {
			notelist.clear();
			String query= "INSERT INTO notes (notename, startdate, enddate, nstatus, ntag, ndescription, notebookname, email) VALUES ('"+notename+"','"+startdate+"','"+enddate+"','"+status+"','"
					+tag+"','"+description+"','"+notebookname+"','"+User.getObj().getEmail()+"')";
			template.execute(query);
			generateNoteList();
			notebook.setNoteCount(noteCount(notebookname));
			return new ModelAndView("note.jsp","notelist", notelist);
		}
		catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error.jsp");
		}
	}
	@RequestMapping("/editNote")
	public ModelAndView editNote(@RequestParam("nnotename") String notename,@RequestParam("nstartdate") String startdate,
			@RequestParam("nenddate") String enddate,@RequestParam("nstatus") String status,@RequestParam("ntag") String tag,
			@RequestParam("nnotebookname") String notebookname,
			@RequestParam("ndescription") String description,@RequestParam("prevname") String prevname) {
		try {
			
			String query= "UPDATE notes SET notename='"+notename+"', startdate='"+startdate+"',enddate='"+enddate
														+"', nstatus='"+status+"', ntag='"+tag+"', ndescription='"
														+description+"',notebookname='"+notebookname+"' WHERE notename='"+prevname+"' AND email='"+User.getObj().getEmail()+"'";
			
			template.execute(query);
			notebook.setNoteCount(noteCount(notebookname)); 
			return new ModelAndView("/notes");
		}
		catch(Exception e) {
			return new ModelAndView("error.jsp");
		}
	}
	
	@GetMapping("/deleteNote/{value}")
	public ModelAndView deleteNote(@PathVariable Long value) {
		try {
			String query = "DELETE FROM notes WHERE noteid='"+value.toString()+"'";
			template.execute(query);
			return new ModelAndView("redirect:../notes");
		}
		catch(Exception e) {
			return new ModelAndView("error.jsp");
		}
	}
}
