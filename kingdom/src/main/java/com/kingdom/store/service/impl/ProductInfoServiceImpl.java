package com.kingdom.store.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingdom.store.dao.BaseDao;
import com.kingdom.store.model.TPrem;
import com.kingdom.store.pageModel.UITree;
import com.kingdom.store.service.ProductInfoService;

@Service("productInfoService")
public class ProductInfoServiceImpl implements ProductInfoService {
	private BaseDao<TPrem> dao;

	public BaseDao<TPrem> getDao() {
		return dao;
	}

	@Autowired
	public void setDao(BaseDao<TPrem> dao) {
		this.dao = dao;
	}

	@Override
	public UITree getClassTree(String id) {
		// TODO Auto-generated method stub
		UITree root=new UITree();
		root.setText("未分类");
		root.setState("open");
		root.setId("00000000-0000-0000-0000-000000000000");
		List <UITree> listroot=new ArrayList<UITree>();
		UITree tree2=new UITree();
		tree2.setText("未分类");
		tree2.setState("open");
		tree2.setId("00000000-0000-0000-0000-000000000000");
		tree2.setChildren(new ArrayList<UITree>());
		
		UITree tree=new UITree();
		tree.setText("ttt");
		tree.setId("86c8062f-7163-4559-95b2-355735a5a288");
		List <UITree> listtree=new ArrayList<UITree>();
		
		UITree parent1=new UITree();
		parent1.setText("商品分类ttest");
		parent1.setState("closed");
		parent1.setId("929a2e07-2e88-4ea8-bc4b-e1243d1c95ad");
		List <UITree> listp1=new ArrayList<UITree>();
		
		UITree parent2=new UITree();
		parent2.setText("商品分类ttest");
		parent2.setState("closed");
		parent2.setId("929a2e07-2e88-4ea8-bc4b-e1243d1c95vd");
		parent2.setChildren(new ArrayList<UITree>());

		UITree node=new UITree();
		List <UITree> listn=new ArrayList<UITree>();
		node.setText("商品分类ttest");
		node.setState("closed");
		node.setId("929a2e07-2e88-4ea8-bc4b-e1243d1c95ad");
		
		UITree child=new UITree();
		child.setText("商品分类ttest");
		child.setState("closed");
		child.setId("929a2e07-2e88-4ea8-bc4b-e1243d1c95a3");
		List <UITree> listc=new ArrayList<UITree>();
		
		UITree cc1=new UITree();
		cc1.setText("新建分类1");
		cc1.setState("open");
		cc1.setId("484b5cd2-74dd-4765-8200-0607b291b925");
		UITree cc2=new UITree();
		cc2.setText("新建分类2");
		cc2.setState("open");
		cc2.setId("484b5cd2-74dd-4765-8200-0607b291b915");
		listc.add(cc1);
		listc.add(cc2);
		
		child.setChildren(listc);
		listn.add(child);
		node.setChildren(listn);
		listp1.add(node);
		
		
		parent1.setChildren(listp1);
		listtree.add(parent1);
		listtree.add(parent2);
		tree.setChildren(listtree);
		listroot.add(tree);
		root.setChildren(listroot);
		
		
		return root;
	}

	

}
