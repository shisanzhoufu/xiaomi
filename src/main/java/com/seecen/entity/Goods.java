package com.seecen.entity;

public class Goods {

    private int id;//编号(主键)
    private String type;//类型
    private String title;//名称(商品标题)
    private double price;//价格
    private String imgurl;//图片地址
    private String manufacturer;//厂家
    private int evaluate;//评价数量

    public Goods() {
    }

    public Goods(int id, String type, String title, double price, String imgurl, String manufacturer, int evaluate) {
        this.id = id;
        this.type = type;
        this.title = title;
        this.price = price;
        this.imgurl = imgurl;
        this.manufacturer = manufacturer;
        this.evaluate = evaluate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(int evaluate) {
        this.evaluate = evaluate;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", imgurl='" + imgurl + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", evaluate=" + evaluate +
                '}';
    }
}
