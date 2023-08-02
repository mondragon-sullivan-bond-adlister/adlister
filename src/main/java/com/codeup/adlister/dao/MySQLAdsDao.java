package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.util.Config;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private final Config config;
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        this.config = config;
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    public MySQLAdsDao(Config config, Config config1) {
        this.config = config1;
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad, ArrayList<Long> cat) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            long ad_id = rs.getLong(1);
            for (long i : cat) {
                    String insertQuery1 = "INSERT INTO catAdd(ad_id, cat_id) VALUES (?, ?)";
                    PreparedStatement stmt1 = connection.prepareStatement(insertQuery1, Statement.RETURN_GENERATED_KEYS);
                    stmt1.setLong(1, ad_id);
                    stmt1.setLong(2, i);
                    stmt1.executeUpdate();
                    ResultSet rs1 = stmt1.getGeneratedKeys();
                    rs1.next();
            }
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }


    @Override
    public List<Ad> search(String search) {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ads WHERE title LIKE ?";
        String searchTermWithWildcards = "%" + search + "%";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, searchTermWithWildcards);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> searchCat(long l) {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ads LEFT JOIN catAdd cA ON ads.id = cA.ad_id WHERE cA.cat_id = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, l);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }


    @Override
    public Ad getAdById(long l) {
        System.out.println("l = " + l);
        String sql = "SELECT * FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, l);
            ResultSet rs = stmt.executeQuery();
            System.out.println("rs = " + rs);
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving the ad.", e);
        }
    }
    // Inside MySQLAdsDao class

    @Override
    public List<Ad> getAdsByUserId(long userId) {
        String sql = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ads by user ID.", e);
        }
    }

    @Override
    public void updateAd(String title, String Description, long id) {

    }


    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getInt("id"),
            rs.getInt("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        System.out.println("ads = " + ads);
        return ads;
    }

    public void updateAd(String title, String description, int id){
        String query = "UPDATE ads SET title = ?, description = ? WHERE (id = ?)";
        try{
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setLong(3, id);
            stmt.executeUpdate();
        } catch(SQLException e){
            throw new RuntimeException("Error updating ad", e);
        }
    }

    public void deleteAd(int id){
        String query = "DELETE FROM ads WHERE id = ?";
                try{
                    PreparedStatement stmt = connection.prepareStatement(query);
                        stmt.setInt(1, id);
//                        stmt.setInt(2, user_id);
                        stmt.executeUpdate();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
    }

}
