package com.hmall.team04.dao.product;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.category.CategoryDAO;
import com.hmall.team04.dto.category.CategoryDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private CategoryDAO categoryDAO;
	

	
}
