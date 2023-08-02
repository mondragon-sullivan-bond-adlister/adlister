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

    // connects to the DB
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

    // gets all the adds in db
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

    // adds an ad to the db
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

    // lists all ads that are in the search
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
    
    // lists all the ads that match the category
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

    // gets ad by id
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
    
    // gets ads based on the user id
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

    // creates and individual ad based on other methods
    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getInt("id"),
            rs.getInt("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    // creates an array list of the ads based on above methods
    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        System.out.println("ads = " + ads);
        return ads;
    }

    // updates an ad and submits to db
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

    // deletes ad and removed from db
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
