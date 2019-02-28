package com.example.boke_houtai.pojo;

/**
 *文章实体
 */
public class Article {

    private  String ID;
    private  String  title;//标题
    private  String conrent;//内容
    private  String  founder;//创建人
    private  String creationTime;//创建时间
    private  String alterTime;//修改时间
    private  String articleType;//类型
    private  String readNumber;//文章阅读量
    private  String Like;   //文章点赞量
    private  String printUrl; //图片路径

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getConrent() {
        return conrent;
    }

    public void setConrent(String conrent) {
        this.conrent = conrent;
    }

    public String getFounder() {
        return founder;
    }

    public void setFounder(String founder) {
        this.founder = founder;
    }

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public String getAlterTime() {
        return alterTime;
    }

    public void setAlterTime(String alterTime) {
        this.alterTime = alterTime;
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType;
    }

    public String getReadNumber() {
        return readNumber;
    }

    public void setReadNumber(String readNumber) {
        this.readNumber = readNumber;
    }

    public String getLike() {
        return Like;
    }

    public void setLike(String like) {
        Like = like;
    }

    public String getPrintUrl() {
        return printUrl;
    }

    public void setPrintUrl(String printUrl) {
        this.printUrl = printUrl;
    }
}
