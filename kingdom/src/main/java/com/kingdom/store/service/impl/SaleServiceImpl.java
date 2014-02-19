package com.kingdom.store.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingdom.store.dao.BaseDao;
import com.kingdom.store.model.TPrem;
import com.kingdom.store.pageModel.ReturnMessage;
import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.ReturnObject;
import com.kingdom.store.pageModel.Prem;
import com.kingdom.store.pageModel.Sale;
import com.kingdom.store.service.SaleService;

@Service("saleService")
public class SaleServiceImpl implements SaleService {
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

	@Override
	public List<Sale> getSaleAmt(String userId) {
		// TODO Auto-generated method stub
		//SaleAmt: 0
//		SaleDate: "/Date(1392048000000)/"
//			StrSaleAmt: "0.00"
//			StrSaleDate: "2014-02-11"
//			UserId: "18cb32bc-f5dd-4704-870b-26bbad60006e"
		List list=new ArrayList<Sale>();
		Sale sale =new Sale();
		sale.setSaleAmt(0);
		sale.setSaleDate(new Date());
		sale.setUserId(userId);
		sale.setStrSaleAmt("0.00");
		sale.setStrSaleDate("2014-02-11");
		list.add(sale);
		sale =new Sale();
		sale.setSaleAmt(0);
		sale.setSaleDate(new Date());
		sale.setUserId(userId);
		sale.setStrSaleAmt("0.00");
		sale.setStrSaleDate("2014-02-13");
		list.add(sale);
		sale =new Sale();
		sale.setSaleAmt(0);
		sale.setSaleDate(new Date());
		sale.setUserId(userId);
		sale.setStrSaleAmt("0.00");
		sale.setStrSaleDate("2014-02-14");
		list.add(sale);
		return list;
	}

	@Override
	public ReturnMessage getClientAddress(String strClientId) {
		// TODO Auto-generated method stub
		ReturnMessage c=new ReturnMessage();
		c.setCode("A00006");
		c.setData("||");
		return c;
	}
	

}
