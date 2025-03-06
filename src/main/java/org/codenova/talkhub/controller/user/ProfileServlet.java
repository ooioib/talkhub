package org.codenova.talkhub.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.codenova.talkhub.model.dao.UserDAO;
import org.codenova.talkhub.model.vo.User;

import java.io.IOException;

@WebServlet("/user/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /*
            인증을 안 받은 사용자는 접근을 불허하는 게 좋을 것 같다.
        */

        if (req.getSession().getAttribute("user") == null) {
            req.getSession().setAttribute("callback", req.getContextPath() + "/user/profile");
            resp.sendRedirect("/user/login");
            return;
        }

        /*
            이 아래 부분은 인증을 받은 사용자에게만 작동하는 코드
            인증 받은 사용자의 User 객체가 필요
         */

        // 1. 이미 로그인 성공했을 때 유저 객체를 넣어뒀기 때문에 뽑아서 바로 세팅

        User user = (User) req.getSession().getAttribute("user");

        // 바로 세팅해서 출력에 활용해도 되고
        req.setAttribute("user", user);

        // 2. 세팅해둔 유저 객체의 id를 활용해서 다시 재조회 하는 방법도 가능할 듯
        String userId = user.getId();
        UserDAO userDao = new UserDAO();
        User found = userDao.findById(userId);

        req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(req, resp);

    }
}
