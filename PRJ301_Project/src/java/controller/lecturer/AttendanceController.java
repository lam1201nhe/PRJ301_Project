/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.BaseAuthenticationController;
import dal.GroupDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attandance;
import model.Group;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author Admin
 */
public class AttendanceController extends BaseAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("Day la trang Attendance");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int sesid = Integer.parseInt(req.getParameter("id"));
            SessionDBContext sesDB = new SessionDBContext();
            int lid = Integer.parseInt(req.getParameter("lid"));
            GroupDBContext groupDB = new GroupDBContext();
            ArrayList<Group> list = groupDB.list(lid);
            Session ses = sesDB.get(sesid);
            req.setAttribute("listGroup", list);
            req.setAttribute("ses", ses);
            req.getRequestDispatcher("../attendance.jsp").forward(req, resp);
        } catch (NumberFormatException ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Session ses = new Session();
            Lecturer lec = new Lecturer();
            int groups = Integer.parseInt(req.getParameter("groups"));
            lec.setId(Integer.parseInt(req.getParameter("lectureid")));
            ses.setId(Integer.parseInt(req.getParameter("sesid")));
            String[] stdids = req.getParameterValues("stdid");
            for (String stdid : stdids) {
                Attandance a = new Attandance();
                Student s = new Student();
                a.setStudent(s);
                a.setDescription(req.getParameter("description" + stdid));
                a.setPresent(req.getParameter("present" + stdid).equals("present"));
                s.setId(Integer.parseInt(stdid));
                ses.getAtts().add(a);
            }
            SessionDBContext db = new SessionDBContext();
            db.update(ses);
            resp.sendRedirect("attendance?id=" + ses.getId() + "&lid=" + lec.getId());
        } catch (NumberFormatException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
