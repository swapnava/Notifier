package com.notifier.Service;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notifier.beans.Notes;

public class NoteMapper implements RowMapper<Notes> {

	@Override
	public Notes mapRow(ResultSet rs, int rowNum) throws SQLException {
		Notes note=new Notes();
		note.setNoteName(rs.getString("notename"));
		note.setStartDate(rs.getString("startdate"));
		note.setEndDate(rs.getString("enddate"));
		note.setStatus(rs.getString("nstatus"));
		note.setTag(rs.getString("ntag"));
		note.setDescription(rs.getString("ndescription"));
		note.setEmail(rs.getString("email"));
		note.setNotebookName(rs.getString("notebookname"));
		note.setNoteId(rs.getString("noteid"));
		return note;
	}

}
