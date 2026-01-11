package com.foodapp.dao;

import java.util.List;




import com.foodapp.model.Menu;

public interface MenuDAO {
	int insertMenu(Menu m);
	List<Menu> getAllRestMenu(int restId);
	Menu getMenuById(int id);
	int updateMenuAvailById(int id, int avail);
	int deleteMenuById(int id);
}
