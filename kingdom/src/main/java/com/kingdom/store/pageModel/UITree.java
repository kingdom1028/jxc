package com.kingdom.store.pageModel;

import java.util.List;

public class UITree {
	private String id;//节点的 id，它对于加载远程数据很重要。
	private String text;//显示的节点文字。
	private String state="open";//节点状态， 'open' 或 'closed'，默认是 'open'。当设为 'closed' 时，此节点有子节点，并且将从远程站点加载它们。
	private Boolean checked;//指示节点是否被选中。 Indicate whether the node is checked selected.
	private List attributes;//给一个节点追加的自定义属性。
	private List<UITree> children;//定义了一些子节点的节点数组。
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public List getAttributes() {
		return attributes;
	}
	public void setAttributes(List attributes) {
		this.attributes = attributes;
	}
	public List<UITree> getChildren() {
		return children;
	}
	public void setChildren(List<UITree> children) {
		this.children = children;
	}
	
}
