
package sample.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class TodoDto {
    private long id;
    private List<String> errorList = new ArrayList<String>();
    private String content;
    private String createdDate = new Date().toString();
    private String type;
    private int itemCount;

    public List<String> getErrorList() {
        return errorList;
    }
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getCreatedDate() {
        return createdDate;
    }
    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
}
