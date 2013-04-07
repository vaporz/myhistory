
package com.zx.myhistory.model;

public class Keyword {
    private long keywordId;
    private String keyword;
    private String keywordLowercase;
    private String wikiUrl;
    private long aliasId;
    private int hot;
    private long createTime;

    public Keyword() {

    }

    public Keyword(long keywordId, String keyword) {
        this.keywordId = keywordId;
        this.keyword = keyword;
        this.keywordLowercase = keyword.toLowerCase();
        this.createTime = System.currentTimeMillis();
    }

    public long getKeywordId() {
        return keywordId;
    }

    public void setKeywordId(long keywordId) {
        this.keywordId = keywordId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getKeywordLowercase() {
        return keywordLowercase;
    }

    public void setKeywordLowercase(String keywordLowercase) {
        this.keywordLowercase = keywordLowercase;
    }

    public long getAliasId() {
        return aliasId;
    }

    public void setAliasId(long aliasId) {
        this.aliasId = aliasId;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getWikiUrl() {
        return wikiUrl;
    }

    public void setWikiUrl(String wikiUrl) {
        this.wikiUrl = wikiUrl;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

}
