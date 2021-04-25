package com.notifier.Service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notifier.beans.Notebook;
import com.notifier.beans.User;

public class NotebookMapper implements RowMapper<Notebook>{

	@Override
	public Notebook mapRow(ResultSet rs, int rowNum) throws SQLException {
		Notebook notebook=new Notebook();
		notebook.setEmail(User.getObj().getEmail());
		notebook.setNotebookName(rs.getString("notebookname"));
		notebook.setNoteCount(rs.getString("notecount"));
		notebook.setNotebookId(rs.getString("id"));
		return notebook;
	}

}