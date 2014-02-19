package com.kingdom.store.service;

import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.Online;


public interface OnlineService {

	public void saveOrUpdateTonlineByLoginNameAndIp(String loginName, String ip);

	public void deleteTonlineByLoginNameAndIp(String loginName, String ip);

	public DataGrid datagrid(Online online);

}
