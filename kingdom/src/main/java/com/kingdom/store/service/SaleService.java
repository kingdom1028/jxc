package com.kingdom.store.service;

import java.util.List;

import com.kingdom.store.model.TPrem;
import com.kingdom.store.pageModel.ReturnMessage;
import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.ReturnObject;
import com.kingdom.store.pageModel.Sale;


public interface SaleService {
	public DataGrid datagrid(TPrem online);
	
	public ReturnObject checkPerm(String permCodeList, String resName,String userId);

	public List<Sale> getSaleAmt(String userId);

	public ReturnMessage getClientAddress(String strClientId);
}
