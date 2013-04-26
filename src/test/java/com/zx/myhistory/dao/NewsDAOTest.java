
package com.zx.myhistory.dao;

import com.zx.myhistory.model.Keyword;
import com.zx.myhistory.model.News;
import com.zx.myhistory.model.User;

import org.apache.commons.dbcp.BasicDataSource;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-test.xml")
public class NewsDAOTest {

    @Autowired
    private NewsTestDAO newsTestDAO;

    @Autowired
    private NewsDAO newsDAO;

    @Autowired
    private UserDAO userDAO;

    @Qualifier("jade.dataSource.com.zx.myhistory.dao")
    @Autowired
    private BasicDataSource dataSource;

    @Before
    public void init() {
        try {
            Connection conn = dataSource.getConnection();
            Statement st = conn.createStatement();
            st.execute("drop all objects;");
            st.execute("runscript from '" + new DefaultResourceLoader().getResource("schema.sql").getURL().toString() + "'");
            st.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testCreateKeyword() {
        long id = newsDAO.getAndIncrId();
        newsTestDAO.insertKeyword(id, "ABC", "abc", "", System.currentTimeMillis());
        Keyword keyword = newsDAO.getKeywordByName("abc");
        Assert.assertEquals("abc", keyword.getKeywordLowercase());
        keyword = newsDAO.getKeywordById(id);
        Assert.assertEquals("abc", keyword.getKeywordLowercase());
    }

    @Test
    public void testCreateNews() {
        long id = newsDAO.getAndIncrId();
        newsDAO.commitNews(id, "title", "some content", "", System.currentTimeMillis(), "", System.currentTimeMillis());
        Set<Long> newsIds = new HashSet<Long>();
        newsIds.add(id);
        List<News> news = newsDAO.getNewsByIds(newsIds);
        Assert.assertEquals(1, news.size());
        Assert.assertEquals("some content", news.get(0).getContent());
    }

    @Test
    public void testNewsKeyword() {
        long time = System.currentTimeMillis();
        /**
         * K1--->N1,N2<br>
         * K2--->N2,N3
         */
        long idK1 = newsDAO.getAndIncrId();
        newsTestDAO.insertKeyword(idK1, "AAA", "aaa", "", time);
        long idK2 = newsDAO.getAndIncrId();
        newsTestDAO.insertKeyword(idK2, "BBB", "bbb", "", time);
        long idN1 = newsDAO.getAndIncrId();
        newsDAO.commitNews(idN1, "news111", "some content", "", time, "", time);
        long idN2 = newsDAO.getAndIncrId();
        newsDAO.commitNews(idN2, "news222", "some content", "", time, "", time);
        long idN3 = newsDAO.getAndIncrId();
        newsDAO.commitNews(idN3, "news333", "some content", "", time, "", time);

        newsTestDAO.insertKeywordNews(idK1, idN1, time);
        newsTestDAO.insertKeywordNews(idK1, idN2, time);
        newsTestDAO.insertKeywordNews(idK2, idN2, time);
        newsTestDAO.insertKeywordNews(idK2, idN3, time);
        newsTestDAO.insertNewsKeyword(idN1, idK1, "AAA", "aaa", time);
        newsTestDAO.insertNewsKeyword(idN2, idK1, "AAA", "aaa", time);
        newsTestDAO.insertNewsKeyword(idN2, idK2, "BBB", "bbb", time);
        newsTestDAO.insertNewsKeyword(idN3, idK2, "BBB", "bbb", time);

        List<Keyword> keywords = newsDAO.getKeywords();
        Assert.assertEquals(2, keywords.size());
        keywords = newsDAO.getKeywordsByNewsId(idN1);
        Assert.assertEquals(1, keywords.size());
        keywords = newsDAO.getKeywordsByNewsId(idN2);
        Assert.assertEquals(2, keywords.size());
        Set<String> keywordSet = new HashSet<String>();
        keywordSet.add("aaa");
        keywordSet.add("bbb");
        keywords = newsDAO.getKeywordByName(keywordSet);
        Assert.assertEquals(2, keywords.size());
        keywordSet = new HashSet<String>();
        keywordSet.add("AAA");
        keywordSet.add("BBB");
        keywords = newsDAO.getKeywordByName(keywordSet);
        Assert.assertEquals(0, keywords.size());

        List<News> news = newsDAO.getNewsIdByKeyword(idK1, Long.MAX_VALUE, 10);
        Assert.assertEquals(2, news.size());

        /**
         * K1 --> K2
         */
        newsDAO.deleteNewsFromNewsKeyword(idN2, idK1);
        newsDAO.updateKeywordForNewsKeyword(idN1, idK1, idK2, "AAA", "aaa");
        newsTestDAO.insertKeywordNews(idK2, idN1, time);
        newsDAO.deleteNewsByKeywordId(idK1);
        newsDAO.aliasKeyword(idK1, idK2);
        newsDAO.redirectAlias(idK1, idK2);
        Keyword keyword = newsDAO.getKeywordById(idK1);
        Assert.assertEquals(idK2, keyword.getAliasId());
        keyword = newsDAO.getKeywordById(idK2);

        news = newsDAO.getNewsIdByKeyword(idK1, Long.MAX_VALUE, 10);
        Assert.assertEquals(0, news.size());
        news = newsDAO.getNewsIdByKeyword(idK2, Long.MAX_VALUE, 10);
        Assert.assertEquals(3, news.size());
        keywords = newsDAO.getKeywordsByNewsId(idN2);
        Assert.assertEquals(1, keywords.size());
    }

    @Test
    public void testTruthFake() {
        long id = newsDAO.getAndIncrId();
        newsDAO.commitNews(id, "title", "some content", "", System.currentTimeMillis(), "", System.currentTimeMillis());
        newsDAO.updateNewsTruth(id, 10);
        newsDAO.updateNewsFake(id, 20);
        News news = newsDAO.getOneNewsById(id);
        Assert.assertEquals(10, news.getTruth());
        Assert.assertEquals(20, news.getFake());
        newsDAO.updateNewsTruth(id, -3);
        newsDAO.updateNewsFake(id, -6);
        news = newsDAO.getOneNewsById(id);
        Assert.assertEquals(7, news.getTruth());
        Assert.assertEquals(14, news.getFake());
    }

    @Test
    public void testUser() {
        long id = userDAO.getUserId();
        userDAO.registerUser(id, "123456", "user1", "", "test@test.com", "zh", System.currentTimeMillis());
        long userId = userDAO.getUserIdByName("user1");
        Assert.assertEquals(id, userId);
        userId = userDAO.getUserIdByNameAndPwd("user1", "123456");
        Assert.assertEquals(id, userId);
        User user = userDAO.getUserById(id);
        Assert.assertEquals("zh", user.getLocale());
    }

}
