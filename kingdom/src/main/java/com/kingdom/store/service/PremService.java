package com.kingdom.store.service;

import com.kingdom.store.model.TPrem;
import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.ReturnObject;


public interface PremService {
	public DataGrid datagrid(TPrem online);
	
	public ReturnObject checkPerm(String permCodeList, String resName,String userId);
}
