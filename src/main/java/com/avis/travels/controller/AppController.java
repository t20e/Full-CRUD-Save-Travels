package com.avis.travels.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avis.travels.models.Expense;
import com.avis.travels.services.ExpenseService;


@Controller
public class AppController {
	private final ExpenseService expenseService;
	
	public AppController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	//needs this constructor so it can interacte with the expense service or else errors occur
	}
	
	
	@RequestMapping("/expense")
	public String home(Model model) {
		//passing in the obj to the form to bind IMportants!!!
		model.addAttribute( "expense", new Expense() );
		model.addAttribute("allExpense", this.expenseService.getAllExpenses());
		return "index.jsp";
	}
	
//	adding expense
	@PostMapping("/expense/adding")
	public String createExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}else {
			this.expenseService.createExpense(expense);
			return "redirect:/expense";
		}
		
	}
	
	
	
	
//	update expense
	@RequestMapping("/expense/edit/{id}")
	public String editPage( @PathVariable("id") long id, Model model) {
		//passing in the obj to the form to bind IMportants!!!
		model.addAttribute( "expense", new Expense() );
		Expense expenseToEdit = this.expenseService.getOneExpense(id);
		model.addAttribute("expenseToEdit", expenseToEdit);
		return "editExpense.jsp";
	}
	
	@PutMapping("/expense/updating/{id}")
	public String updateExpense(@PathVariable("id") Long id ,@Valid @ModelAttribute("expenseToUpdate") Expense expenseToUpdate, BindingResult result) {
		if(result.hasErrors()) {
			return "editExpense.jsp";
		}else {
			this.expenseService.updatExpense(expenseToUpdate);
			return "redirect:/expense";
		}
		
	}
	
	//delete link
	@RequestMapping("/expense/delete/{id}")
	public String deleteOneExpense(@PathVariable("id") Long id) {
		this.expenseService.deleteOneExpense(id);
		return "redirect:/expense";
	}
	
	//show page render
	@RequestMapping("/expense/show/{id}")
	public String showExpensePage(@PathVariable("id") long id, Model model) {
		Expense expenseToShow = this.expenseService.getOneExpense(id);
		model.addAttribute("expenseToShow", expenseToShow);
		return "show_details.jsp";
	}
	
	
	
}
