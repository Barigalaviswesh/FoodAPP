package com.foodapp.dao;

import com.foodapp.model.Admin;

public interface AdminDao {
	Admin  getAdminByEmail(String Email);
}
