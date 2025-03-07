package org.codenova.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/post/write")
public class WriteServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getSession().getAttribute("user") == null) {
            req.getSession().setAttribute("callback", "/post/write");
            resp.sendRedirect(req.getContextPath() + "/user/login");
            return;

        } else {
            req.getRequestDispatcher("/WEB-INF/views/post/write.jsp").forward(req, resp);
        }
    }
}
