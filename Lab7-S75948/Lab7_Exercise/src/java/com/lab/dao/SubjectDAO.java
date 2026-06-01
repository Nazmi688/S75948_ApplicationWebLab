package com.lab.dao;

import com.lab.bean.SubjectBean;
import java.sql.*;
import java.util.ArrayList;

public class SubjectDAO {

    private Connection getConnection() throws Exception {

        Class.forName("com.mysql.jdbc.Driver");

        Connection con =
                DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/lab_7exercise",
                        "root",
                        "admin"
                );

        return con;
    }

    // ADD

    public void addSubject(SubjectBean subject) {

        try {

            Connection con = getConnection();

            String sql =
                    "INSERT INTO registered_subjects "
                    + "(matric_no, subject_code, subject_name) "
                    + "VALUES (?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, subject.getMatricNo());
            ps.setString(2, subject.getSubjectCode());
            ps.setString(3, subject.getSubjectName());

            ps.executeUpdate();

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    // VIEW

    public ArrayList<SubjectBean> getSubjects(String matricNo) {

        ArrayList<SubjectBean> list =
                new ArrayList<>();

        try {

            Connection con = getConnection();

            String sql =
                    "SELECT * FROM registered_subjects "
                    + "WHERE matric_no=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, matricNo);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                SubjectBean sb =
                        new SubjectBean();

                sb.setId(rs.getInt("id"));
                sb.setMatricNo(rs.getString("matric_no"));
                sb.setSubjectCode(rs.getString("subject_code"));
                sb.setSubjectName(rs.getString("subject_name"));

                list.add(sb);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // GET SUBJECT

    public SubjectBean getSubjectById(int id) {

        SubjectBean sb =
                new SubjectBean();

        try {

            Connection con = getConnection();

            String sql =
                    "SELECT * FROM registered_subjects "
                    + "WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                sb.setId(rs.getInt("id"));
                sb.setMatricNo(rs.getString("matric_no"));
                sb.setSubjectCode(rs.getString("subject_code"));
                sb.setSubjectName(rs.getString("subject_name"));
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return sb;
    }

    // UPDATE

    public void updateSubject(SubjectBean subject) {

        try {

            Connection con = getConnection();

            String sql =
                    "UPDATE registered_subjects "
                    + "SET subject_code=?, subject_name=? "
                    + "WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, subject.getSubjectCode());
            ps.setString(2, subject.getSubjectName());
            ps.setInt(3, subject.getId());

            ps.executeUpdate();

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    // DELETE

    public void deleteSubject(int id) {

        try {

            Connection con = getConnection();

            String sql =
                    "DELETE FROM registered_subjects "
                    + "WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}