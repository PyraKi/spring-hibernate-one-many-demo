/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se.onetomany.controller;

/**
 *
 * @author TriPham
 */
import com.se.onetomany.entity.CreditCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.se.onetomany.service.PersonService;
import com.se.onetomany.entity.Person;
import com.se.onetomany.service.CreditCardService;
import java.util.List;

@Controller
@RequestMapping("/person")
public class PersonController {

    @Autowired
    // need to inject our customer service
    private PersonService personService;
    private CreditCardService creditCardService;

    @PostMapping("/savePerson")
    public String savePerson(@ModelAttribute("person") Person thePerson) {
        // save the customer using our service
        personService.savePerson(thePerson);
        return "redirect:/person/list";
    }
    
    @PostMapping("/updatePerson")
    public String updatePerson(@ModelAttribute("person") Person thePerson) {
        // save the customer using our service
        int personId = thePerson.getId();
//        List<CreditCard> creditCards = personService.getCreditCards(thePerson.getId());
//        for (CreditCard theCard : creditCards) {
//            if(theCard != null)
//                creditCardService.saveCreditCard(theCard, personId);
//        }
//        thePerson.setCreditCards(creditCards);
        personService.savePerson(thePerson);
        return "redirect:/person/list";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("personId") int theId,
            Model theModel) {
        // get the customer from our service
        Person thePerson = personService.getPerson(theId);
      
        // set customer as a model attribute to pre-populate the form
        theModel.addAttribute("person", thePerson);
        theModel.addAttribute("isUpdate", true);
        // send over to our form		
        return "person-form";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        // create model attribute to bind form data
        Person thePerson = new Person();
        theModel.addAttribute("person", thePerson);
        theModel.addAttribute("isUpdate", false);
        return "person-form";
    }

    @GetMapping("/delete")
    public String deletePerson(@RequestParam("personId") int theId) {

        // delete the customer
        personService.deletePerson(theId);

        return "redirect:/person/list";
    }

    @GetMapping("/list")
    public String listPersons(Model theModel) {
        // get persons from the service
        List<Person> thePersons = personService.getPersons();
        // add the customers to the model
        theModel.addAttribute("persons", thePersons);
        return "list-persons";
    }
    
    @GetMapping("/showInfo")
    public String infoCreditCard(Model theModel, @RequestParam("personId") int theId) {
        // get persons from the service
        Person person = personService.getPerson(theId);
        // add the customers to the model
        theModel.addAttribute("person", person);
        return "credit-info";
    }

}
