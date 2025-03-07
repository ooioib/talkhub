package org.codenova.talkhub.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.codenova.talkhub.model.dao.PostDAO;
import org.codenova.talkhub.model.vo.User;

import java.io.IOException;

@WebServlet("/post/write-proceed")
public class WriteProceedServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login");
            return;
        }

        User currentUser = (User)req.getSession().getAttribute("user");
        String writerId = currentUser.getId();
        String category = req.getParameter("category");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        PostDAO postDao = new PostDAO();
        boolean success = postDao.create(writerId, category, title, content);

        if (success) {
            resp.sendRedirect(req.getContextPath() + "/post/list");

        } else {
            req.setAttribute("error", "글 작성에 실패했습니다.");
            req.getRequestDispatcher("/WEB-INF/views/post/write.jsp").forward(req, resp);
        }
    }
}
