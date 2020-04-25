package com.aliarshad.cms.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aliarshad.cms.main.model.Customer;

public interface  CustomerDao extends JpaRepository<Customer, Integer> {

}
