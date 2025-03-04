package org.codenova.talkhub.model.vo.dao;

/*
    user 테이블에 관련된 DB 작업을 처리하게 됨
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import static java.lang.Class.forName;

public class UserDAO {

    // 1. 데이터 생성
    // insert into users values('', '', '', '', , now());

    public boolean create(String id, String password, String nickname, String gender, int birth) {
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://database.cpmkaio4y6nw.ap-northeast-2.rds.amazonaws.com/talkhub", "admin", "1q2w3e4r");

            PreparedStatement ps = conn.prepareStatement("insert into users values(?, ?, ?, ?, ?, now())");
            ps.setString(1, id);
            ps.setString(2, password);
            ps.setString(3, nickname);
            ps.setString(4, gender);
            ps.setInt(5, birth);

            int r =  ps.executeUpdate();
            result = true;

            conn.close();

        } catch (Exception e) {
            System.out.println("UserDAO.create : " + e.toString());
        }
        return result;
    }  // end boolean create(String id, String password, ...)
}
