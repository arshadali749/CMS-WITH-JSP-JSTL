package com.aliarshad.cms.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aliarshad.cms.main.dao.CustomerDao;
import com.aliarshad.cms.main.model.Customer;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao dao;

	public List<Customer> getCustomers() {
		return dao.findAll();
	}

	public Customer getCustomer(int id) {
		return dao.getOne(id);
	}

	public void deleteCustomer(int id) {
		dao.deleteById(id);
	}

	public List<Customer> addCustomer(Customer customer) {
		dao.save(customer);
		return dao.findAll();
	}

	public void updateCustomer(Customer updatedcustomer) {
		dao.save(updatedcustomer);
	}
}
