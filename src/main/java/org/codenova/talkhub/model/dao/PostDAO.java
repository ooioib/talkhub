package org.codenova.talkhub.model.dao;

import org.codenova.talkhub.model.vo.Post;
import org.codenova.talkhub.util.ConnectionFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    // ===========================================================================================

    public boolean create(String writerId, String category, String title, String content) {
        boolean result = false;

        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO posts VALUES (NULL, ?, ?, ?, ?, 0, 0, NOW(), NOW())");

            ps.setString(1, writerId);
            ps.setString(2, category);
            ps.setString(3, title);
            ps.setString(4, content);

            int r = ps.executeUpdate();
            result = (r > 0);

            conn.close();

        } catch (Exception e) {
            System.out.println("PostDAO.create : " + e.toString());
        }

        return result;
    }

    // ===========================================================================================

    public List<Post> selectAll() {
        List<Post> list = new ArrayList<>();

        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM posts ORDER BY id DESC");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setWriterId(rs.getString("writer_id"));
                post.setCategory(rs.getString("category"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setViews(rs.getInt("views"));
                post.setLikes(rs.getInt("likes"));
                post.setWritedAt(rs.getTimestamp("writed_at"));
                post.setModifiedAt(rs.getTimestamp("modified_at"));

                list.add(post);
            }

            conn.close();

        } catch (Exception e) {
            System.out.println("PostDAO.selectAll : " + e.toString());
        }

        return list;
    }

    // ===========================================================================================

    public Post findById(int postId) {

        Post post = null;

        try {
            Connection conn = ConnectionFactory.open();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM posts WHERE id = ?");

            ps.setInt(1, postId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                post = new Post();
                post.setId(rs.getInt("id"));
                post.setWriterId(rs.getString("writer_id"));
                post.setCategory(rs.getString("category"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setViews(rs.getInt("views"));
                post.setLikes(rs.getInt("likes"));
                post.setWritedAt(rs.getTimestamp("writed_at"));
                post.setModifiedAt(rs.getTimestamp("modified_at"));
            }
            conn.close();

        } catch (Exception e) {
            System.out.println("PostDAO.findById : " + e.toString());
        }
        return post;
    }
}
