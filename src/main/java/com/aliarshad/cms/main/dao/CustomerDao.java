package com.aliarshad.cms.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.aliarshad.cms.main.model.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {

}
