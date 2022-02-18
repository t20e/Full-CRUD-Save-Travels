package com.avis.travels.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.avis.travels.models.Expense;

@Repository
public interface ExpenseRepository  extends CrudRepository<Expense, Long>{
	
}
