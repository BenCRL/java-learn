package com.learn.bean;
import java.util.List;
/**
 * 分页相关信息
 * @author Ben.
 *
 */
public class Pager {
    /**
     * 排序方式
     *
     */
    public enum OrderType {
        asc, desc
    }
    /** 当前页码 */
    private Integer   pageNumber = 1;
    /** 每页记录数 */
    private Integer   pageSize   = 10;
    /** 总记录数 */
    private Integer   totalCount = 0;
    /** 总页数 */
    private Integer   pageCount  = 0;
    /** 排序字段 */
    private String    orderBy;
    /** 排序方式 */
    private OrderType orderType  = OrderType.desc;
    /** 数据List */
    private List<?>   list;

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public OrderType getOrderType() {
        return orderType;
    }

    public void setOrderType(OrderType orderType) {
        this.orderType = orderType;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }
}
