package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.ArrayList;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad, ArrayList<Long> cat);

    List<Ad> search(String s);

    List<Ad> searchCat(long l);

    Ad getAdById(long l);

    List<Ad> getAdsByUserId(long userId);

    void updateAd(String title, String Description, long id);

    void deleteAd(int id);
}

