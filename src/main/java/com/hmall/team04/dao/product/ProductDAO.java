package com.hmall.team04.dao.product;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.category.CategoryDTO;

public interface ProductDAO {
	ArrayList<CategoryDTO> getCategoryList() throws SQLException;

}
