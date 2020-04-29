package com.aliarshad.cms.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliarshad.cms.main.model.Customer;
import com.aliarshad.cms.main.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;

	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("action", "view");
		model.addAttribute("customers", service.getCustomers());
		return "index";
	}

	@RequestMapping(value = "/add")
	public String addCustomer(Customer customer, Model model) {
		service.addCustomer(customer);
		return "redirect:/";
	}

	@RequestMapping(value = "/edit/{id}")
	@ResponseBody
	public Customer editCustomer(@PathVariable int id) {
		System.out.println("Edit Request Receviced:" + id);
		System.out.println("CUSTOMER:" + service.getCustomer(id));
		return service.getCustomer(id);
	}

	@RequestMapping(value = "/update")
	public String updateCustomer(Customer customer) {
		Customer c = service.getCustomer(customer.getCid());
		c.setCfname(customer.getCfname());
		c.setClname(customer.getClname());
		c.setCemail(customer.getCemail());

		service.addCustomer(customer);

		return "redirect:/";
	}

	@RequestMapping(value = "/delete/{id}")
	public String deleteCustomer(@PathVariable int id, Model model) {
		System.out.println("DELETE REQ RECEVIED for Id:");
		service.deleteCustomer(id);
		// model.addAttribute("customer", service.getCustomer(id));
		return "redirect:/";

	}

}
