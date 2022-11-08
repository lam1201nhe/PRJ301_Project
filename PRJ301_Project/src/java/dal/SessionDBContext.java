/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attandance;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Admin
 */
public class SessionDBContext extends DBContext<Session> {

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Session] SET attanded = 1 WHERE sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getId());
            stm.executeUpdate();

            //remove old attandances
            sql = "DELETE Attandance WHERE sesid = ?";
            PreparedStatement stm_delete = connection.prepareStatement(sql);
            stm_delete.setInt(1, model.getId());
            stm_delete.executeUpdate();

            //insert new attandances
            for (Attandance att : model.getAtts()) {
                sql = "INSERT INTO [Attandance]\n"
                        + "           ([sesid]\n"
                        + "           ,[stdid]\n"
                        + "           ,[present]\n"
                        + "           ,[description]\n"
                        + "           ,[record_time])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE())";
                PreparedStatement stm_insert = connection.prepareStatement(sql);
                stm_insert.setInt(1, model.getId());
                stm_insert.setInt(2, att.getStudent().getId());
                stm_insert.setBoolean(3, att.isPresent());
                stm_insert.setString(4, att.getDescription());
                stm_insert.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void delete(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(int id) {
        try {
            String sql = "SELECT ses.sesid,ses.[index],ses.date,ses.attanded\n"
                    + "	,g.gid,g.gname\n"
                    + "	,r.rid,r.rname\n"
                    + "	,t.tid,t.[description] tdescription\n"
                    + "	,l.lid,l.lname\n"
                    + "	,sub.subid,sub.subname\n"
                    + "	,s.stdid,s.stdname,s.[image]\n"
                    + "	,ISNULL(a.present,0) present, ISNULL(a.[description],'') [description]\n"
                    + "		FROM [Session] ses\n"
                    + "		INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "		INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "		INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "		INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "		INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "		INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "		INNER JOIN [Student] s ON s.stdid = sg.stdid\n"
                    + "		LEFT JOIN Attandance a ON s.stdid = a.stdid AND ses.sesid = a.sesid\n"
                    + "WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Session ses = null;
            while (rs.next()) {
                if (ses == null) {
                    ses = new Session();
                    Room r = new Room();
                    r.setId(rs.getInt("rid"));
                    r.setName(rs.getString("rname"));
                    ses.setRoom(r);

                    TimeSlot t = new TimeSlot();
                    t.setId(rs.getInt("tid"));
                    t.setDescription(rs.getString("tdescription"));
                    ses.setSlot(t);

                    Lecturer l = new Lecturer();
                    l.setId(rs.getInt("lid"));
                    l.setName(rs.getString("lname"));
                    ses.setLecturer(l);

                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setName(rs.getString("gname"));
                    ses.setGroup(g);

                    Subject sub = new Subject();
                    sub.setId(rs.getInt("subid"));
                    sub.setName(rs.getString("subname"));
                    g.setSubject(sub);

                    ses.setDate(rs.getDate("date"));
                    ses.setIndex(rs.getInt("index"));
                    ses.setAttended(rs.getBoolean("attanded"));
                }
                //read student
                Student s = new Student();
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                s.setImage(rs.getString("image"));
                //read attandance
                Attandance a = new Attandance();
                a.setStudent(s);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("description"));
                ses.getAtts().add(a);
            }
            return ses;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Session> filter(int lid, Date from, Date to) {
        ArrayList<Session> list = new ArrayList<>();
        try {
            String sql = "select ses.sesid, ses.[index], ses.[date],ses.attanded\n"
                    + ", g.gid, g.gname\n"
                    + ", r.rid, r.rname\n"
                    + ", t.tid, t.[description]\n"
                    + ", l.lid, l.lname\n"
                    + ", s.subid, s.subname\n"
                    + "from [Session] ses\n"
                    + "inner join Room r on r.rid = ses.rid\n"
                    + "inner join TimeSlot t on t.tid = ses.tid\n"
                    + "inner join Lecturer l on l.lid = ses.lid\n"
                    + "inner join [Group] g on g.gid = ses.gid\n"
                    + "inner join [Subject] s on s.subid = g.subid\n"
                    + "where \n"
                    + "l.lid = ?\n"
                    + "and ses.[date] >= ?\n"
                    + "and ses.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                Lecturer l = new Lecturer();
                Room r = new Room();
                Group g = new Group();
                TimeSlot t = new TimeSlot();
                Subject sub = new Subject();

                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setAttended(rs.getBoolean("attanded"));

                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                session.setLecturer(l);

                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);

                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);

                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                session.setRoom(r);

                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                session.setSlot(t);

                list.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Session> list(int lid) {
        ArrayList<Session> list = new ArrayList<>();
        try {
            String sql = "select ses.[date], ses.sesid, ses.attanded,\n"
                    + "g.gid, g.gname,\n"
                    + "r.rid, r.rname\n"
                    + ",l.lid, l.lname\n"
                    + ",t.tid, t.[description]\n"
                    + "from [Session] ses\n"
                    + "inner join [Group] g on g.gid = ses.gid\n"
                    + "inner join [Room] r on r.rid = ses.rid\n"
                    + "inner join [Lecturer] l on l.lid = ses.lid\n"
                    + "inner join [TimeSlot] t on t.tid = ses.tid\n"
                    + "where ses.lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                Lecturer l = new Lecturer();
                Room r = new Room();
                TimeSlot t = new TimeSlot();
                Group g = new Group();
                
                s.setId(rs.getInt("sesid"));
                s.setDate(rs.getDate("date"));
                s.setAttended(rs.getBoolean("attanded"));
                
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                s.setRoom(r);
                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                s.setLecturer(l);
                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                s.setSlot(t);
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setGroup(g);
                
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
