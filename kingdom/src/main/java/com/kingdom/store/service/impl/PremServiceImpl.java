package com.kingdom.store.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingdom.store.dao.BaseDao;
import com.kingdom.store.model.TPrem;
import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.ReturnObject;
import com.kingdom.store.pageModel.Prem;
import com.kingdom.store.service.PremService;

@Service("premService")
public class PremServiceImpl implements PremService {
	private BaseDao<TPrem> dao;

	public BaseDao<TPrem> getDao() {
		return dao;
	}

	@Autowired
	public void setDao(BaseDao<TPrem> dao) {
		this.dao = dao;
	}

	@Override
	public DataGrid datagrid(TPrem online) {
		DataGrid dg = new DataGrid();

		return dg;
	}

	@Override
	public ReturnObject checkPerm(String permCodeList, String resName,String userId) {
		// TODO Auto-generated method stub
		ReturnObject pp=new ReturnObject();
		pp.setCode("A00005");
		Prem p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_IMP");
		p.setResId(0);
		p.setUserId(userId);
		ArrayList<Prem> list =new ArrayList<Prem>();
		list.add(p);
		p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_REC");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
			
		p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_DELETE");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		
		p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_WB");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		
		 p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_PAY");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		
		 p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_ADD");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		
		 p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_EMP");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		
		 p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_PRINT");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		
		 p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_EDIT");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		p=new Prem();
		p.setParentResId(0);
		p.setPermCode("PERM_VIEW");
		p.setResId(0);
		p.setUserId(userId);
		list.add(p);
		pp.setData(list);
		
		return pp;
	}

}
