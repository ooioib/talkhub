package org.codenova.talkhub.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/user/logout-proceed")
public class LogoutProceedServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

     // session.removeAttribute("user");  // 사용자 세션 값 넣뺐
        session.invalidate();  // 서버에서 파괴되어 세션이 다시 만들어짐

        resp.sendRedirect(req.getContextPath()+"/index");
    }
}
