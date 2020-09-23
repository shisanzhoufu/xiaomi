package com.seecen.entity;

import java.util.ArrayList;

public class Page {
    int page;//当前页数
    int pa;//每一页显示的商品数量
    int totalPage;//总页数
    int countPa;//商品数量的总数
    ArrayList<Goods> list;//当前页数所有商品对象的集合

    public Page() {
    }

    public Page(int page, int pa, int totalPage, int countPa, ArrayList<Goods> list) {
        this.page = page;
        this.pa = pa;
        this.totalPage = totalPage;
        this.countPa = countPa;
        this.list = list;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPa() {
        return pa;
    }

    public void setPa(int pa) {
        this.pa = pa;
    }

    public int getTotalPage() {
        return this.countPa%this.pa==0?(this.countPa/this.pa):(this.countPa/this.pa+1);
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCountPa() {
        return countPa;
    }

    public void setCountPa(int countPa) {
        this.countPa = countPa;
    }

    public ArrayList<Goods> getList() {
        return list;
    }

    public void setList(ArrayList<Goods> list) {
        this.list = list;
    }
}
