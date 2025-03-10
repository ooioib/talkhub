package org.codenova.talkhub.model.dao;

import org.codenova.talkhub.model.vo.Post;
import org.codenova.talkhub.model.vo.PostLike;
import org.codenova.talkhub.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PostLikeDAO {

    public boolean create(PostLike one) {

        boolean result = false;

        try {
            Connection conn = ConnectionFactory.open();

            PreparedStatement ps = conn.prepareStatement("insert into post_likes values(null, ?, ?, now())");

            ps.setString(1, one.getUserId());
            ps.setInt(2, one.getPostId());

            int r = ps.executeUpdate();
            result = true;

            conn.close();

        } catch (Exception e) {
            System.out.println("PostLikeDAO.create : " + e.toString());
        }
        return result;
    }


    // 특정 유저가 등록한 데이터 가져오기를 처리할 메서드
    public List<PostLike> findByUserId(String userId) {
        List<PostLike> result = new ArrayList<PostLike>();

        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("select * from post_likes where user_id = ? order by created_at desc");

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PostLike one = new PostLike();
                one.setId(rs.getInt("id"));
                one.setUserId(rs.getString("user_Id"));
                one.setPostId(rs.getInt("post_Id"));
                one.setCreatedAt(rs.getDate("created_At"));

                result.add(one);
            }

            conn.close();

        } catch (Exception e) {
            System.out.println("UserDAO.create : " + e.toString());
        }
        return result;
    }

}
