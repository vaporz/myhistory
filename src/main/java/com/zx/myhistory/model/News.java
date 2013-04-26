
package com.zx.myhistory.model;

public class News {
    private long newsId;
    private String title;
    private String content;
    private String url;
    private long newsTime;
    private String newsTimeDesc;
    private int truth;
    private int fake;
    private long createTime;

    public long getNewsId() {
        return newsId;
    }

    public void setNewsId(long newsId) {
        this.newsId = newsId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getNewsTime() {
        return newsTime;
    }

    public void setNewsTime(long newsTime) {
        this.newsTime = newsTime;
    }

    public String getNewsTimeDesc() {
        return newsTimeDesc;
    }

    public void setNewsTimeDesc(String newsTimeDesc) {
        this.newsTimeDesc = newsTimeDesc;
    }

    public int getTruth() {
        return truth;
    }

    public void setTruth(int truth) {
        this.truth = truth;
    }

    public int getFake() {
        return fake;
    }

    public void setFake(int fake) {
        this.fake = fake;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

}
