
package com.zx.myhistory.dao;

import com.zx.myhistory.model.Keyword;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-test.xml")
public class NewsDAOTest {

    @Autowired
    private NewsTestDAO newsTestDAO;

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
    public void testGetAndIncrItemId() {
        long id = newsTestDAO.getAndIncrId();
        newsTestDAO.insertKeyword(id, "ABC", "abc", System.currentTimeMillis());
        Keyword keyword = newsTestDAO.getKeywordByName("abc");
        Assert.assertEquals("abc", keyword.getKeywordLowercase());
    }

}
