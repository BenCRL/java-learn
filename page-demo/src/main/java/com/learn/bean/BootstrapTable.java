package com.learn.bean;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
@SuppressWarnings("serial")
public class BootstrapTable implements Serializable {
    private Long    total = 0L;              // 数据记录总数
    @SuppressWarnings("rawtypes")
    private List<?> rows  = new ArrayList(); // 数据列表

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }
}
