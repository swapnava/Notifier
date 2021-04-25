package com.notifier.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.notifier.beans.User;
@RestController
public class UserDao {

	private final JdbcTemplate template;

	@Autowired
	public UserDao(JdbcTemplate  template) {
		this.template=template;
	}
	
	@RequestMapping("/")
	public ModelAndView home() {
		return new ModelAndView("login.jsp");
	}
	
	@RequestMapping("/signup")
	public ModelAndView newUser(@RequestParam("username") String username,@RequestParam("mobile") String mobile, @RequestParam("email") String email, @RequestParam("password") String password) {
		try {
		
		String query = "INSERT INTO users VALUES (?,?,?,?)";
		template.update(query,new Object[] {username, mobile, email, password});
		return new ModelAndView("login.jsp","newuser","New User Created!");
		}
		catch(Exception e) {
			return new ModelAndView("signup.jsp","error","Email already exists!");
		}
		
	}
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password) {
		String query = "SELECT * FROM users WHERE email='"+email+"'AND pass='"+password+"'";
		try {
			Map<String,Object> result = template.queryForMap(query);
			User.getObj().setEmail(result.get("email").toString());
			User.getObj().setUsername(result.get("username").toString());
			new NotebookDao(template).notebookResult();
			return new ModelAndView("notebook","notebookresult", NotebookDao.notebookresult);
		}
		catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("login.jsp","error","Invalid username or password");
		}
	}
	
	@RequestMapping("/updateUser")
	public ModelAndView editProfile(@RequestParam("username") String username, @RequestParam("mobile") String mobile, @RequestParam("oldpassword") String oldpassword, @RequestParam("newpassword") String newpassword) {
		try {
			if(oldpassword.equals("")||oldpassword.equals(null)||newpassword.equals("")||newpassword.equals(null)) {
				return new ModelAndView("editProfile.jsp","nullpassword","Password fields cannot be left blank!");
			}
			else {
				String query="UPDATE users SET username='"+username+"', mobile='"+mobile+"', pass='"+newpassword+"' WHERE email='"+User.getObj().getEmail()+"' AND pass='"+oldpassword+"'";
				template.execute(query);
				User.getObj().setUsername(username);
				return new ModelAndView("editProfile.jsp","updated","Profile Updated Successfully!");
			}
		}
		catch(DataAccessException sql) {
			sql.printStackTrace();
			return new ModelAndView("editProfile.jsp","invalidpassword","Invalid Password");
		} catch(Exception e) {
			return new ModelAndView("error.jsp");
		}
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout() {
		User.getObj().setEmail(null);
		return new ModelAndView("redirect:login.jsp");
	}
}
