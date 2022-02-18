package com.avis.travels.services;

import org.springframework.stereotype.Service;

import com.avis.travels.models.Expense;
import com.avis.travels.repositories.ExpenseRepository;
import java.util.List;

@Service
public class ExpenseService {
	
	private final ExpenseRepository expenseRepo;

	public ExpenseService (ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	
	//create Expense 
	public Expense createExpense(Expense addExpense) {
		return this.expenseRepo.save(addExpense);
		
	}
	
	//get all expenses
	public List<Expense> getAllExpenses() {
		return (List<Expense>)this.expenseRepo.findAll();
	}
	
	//update expense
	public Expense updatExpense(Expense expense) {
		return this.expenseRepo.save(expense);
	}
	
	//get one expense to update or else etc
	public Expense getOneExpense(Long id) {
		return this.expenseRepo.findById(id).orElse(null);
	}
	//delete one expense
	public void deleteOneExpense(Long id) {
		this.expenseRepo.deleteById(id);
	}
	
}
