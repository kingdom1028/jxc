package com.kingdom.store.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingdom.store.dao.BaseDao;
import com.kingdom.store.model.TOnline;
import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.Online;
import com.kingdom.store.service.OnlineService;

@Service("onlineService")
public class OnlineServiceImpl implements OnlineService {

	private BaseDao<TOnline> onlineDao;

	public BaseDao<TOnline> getOnlineDao() {
		return onlineDao;
	}

	@Autowired
	public void setOnlineDao(BaseDao<TOnline> onlineDao) {
		this.onlineDao = onlineDao;
	}

	@Override
	public void saveOrUpdateTonlineByLoginNameAndIp(String loginName, String ip) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginName", loginName);
		params.put("ip", ip);
		TOnline t = onlineDao.get("from Tonline t where t.loginname = :loginName and t.ip = :ip", params);
		if (t != null) {
			t.setLoginDatetime(new Date());
		} else {
			TOnline o = new TOnline();
			o.setId(UUID.randomUUID().toString());
			o.setLoginDatetime(new Date());
			o.setLoginName(loginName);
			o.setIp(ip);
			onlineDao.save(o);
		}
	}

	@Override
	public void deleteTonlineByLoginNameAndIp(String loginName, String ip) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginName", loginName);
		params.put("ip", ip);
		TOnline t = onlineDao.get("from Tonline t where t.loginname = :loginName and t.ip = :ip", params);
		if (t != null) {
			onlineDao.delete(t);
		}
	}

	@Override
	public DataGrid datagrid(Online online) {
		DataGrid dg = new DataGrid();
		String hql = "from Tonline t ";
		Map<String, Object> params = new HashMap<String, Object>();
		hql = addWhere(online, hql, params);
		String totalHql = "select count(*) " + hql;
		hql = addOrder(online, hql);
		List<TOnline> l = onlineDao.find(hql, params, online.getPage(), online.getRows());
		List<Online> nl = new ArrayList<Online>();
		changeModel(l, nl);
		dg.setTotal(onlineDao.count(totalHql, params));
		dg.setRows(nl);
		return dg;
	}

	private void changeModel(List<TOnline> l, List<Online> nl) {
		if (l != null && l.size() > 0) {
			for (TOnline t : l) {
				Online o = new Online();
				BeanUtils.copyProperties(t, o);
				nl.add(o);
			}
		}
	}

	private String addWhere(Online online, String hql, Map<String, Object> params) {
		return hql;
	}

	private String addOrder(Online online, String hql) {
		if (online.getSort() != null) {
			hql += " order by " + online.getSort() + " " + online.getOrder();
		}
		return hql;
	}

}
