package com.aquent.crudapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.service.ClientService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aquent.crudapp.domain.Person;
import com.aquent.crudapp.service.PersonService;

/**
 * Controller for handling basic person management operations.
 */
@Controller
@RequestMapping("person")
public class PersonController {

    public static final String COMMAND_DELETE = "Delete";

    @Inject private PersonService personService;
    @Inject private ClientService clientService;

    /**
     * Renders the listing page.
     *
     * @return list view populated with the current list of people
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("person/list");
        mav.addObject("persons", personService.listPeople());
        return mav;
    }

    /**
     * Renders an empty form used to create a new person record.
     *
     * @return create view populated with an empty person
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("person/create");
        mav.addObject("person", new Person());
        mav.addObject("errors", new ArrayList<String>());
        mav.addObject("clients", clientService.listClients());
        return mav;
    }

    /**
     * Validates and saves a new person.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param person populated form bean for the person
     * @return redirect, or create view with errors
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ModelAndView create(Person person) {
        List<String> errors = personService.validatePerson(person);
        if (errors.isEmpty()) {
            personService.createPerson(person);
            return new ModelAndView("redirect:/person/list");
        } else {
            ModelAndView mav = new ModelAndView("person/create");
            mav.addObject("person", person);
            mav.addObject("errors", errors);
            mav.addObject("clients", clientService.listClients());
            return mav;
        }
    }

    /**
     * Views an existing person record.
     *
     * @param personId the ID of the person to edit
     * @return edit view populated from the person record
     */
    @RequestMapping(value = "view/{personId}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable Integer personId) {
        ModelAndView mav = new ModelAndView("person/view");
        Person person = personService.readPerson(personId);
        mav.addObject("person", person);
        if (null == person.getClientId() || 0 == person.getClientId()) {
            mav.addObject("client", new Client());
        } else {
            mav.addObject("client", clientService.readClient(person.getClientId()));
        }
        return mav;
    }

    /**
     * Renders an edit form for an existing person record.
     *
     * @param personId the ID of the person to edit
     * @return edit view populated from the person record
     */
    @RequestMapping(value = "edit/{personId}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer personId) {
        ModelAndView mav = new ModelAndView("person/edit");
        mav.addObject("person", personService.readPerson(personId));
        mav.addObject("errors", new ArrayList<String>());
        mav.addObject("clients", clientService.listClients());
        return mav;
    }

    /**
     * Validates and saves an edited person.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param person populated form bean for the person
     * @return redirect, or edit view with errors
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView edit(Person person) {
        List<String> errors = personService.validatePerson(person);
        if (errors.isEmpty()) {
            personService.updatePerson(person);
            return new ModelAndView("redirect:/person/list");
        } else {
            ModelAndView mav = new ModelAndView("person/edit");
            mav.addObject("person", person);
            mav.addObject("errors", errors);
            mav.addObject("clients", clientService.listClients());
            return mav;
        }
    }

    /**
     * Renders the deletion confirmation page.
     *
     * @param personId the ID of the person to be deleted
     * @return delete view populated from the person record
     */
    @RequestMapping(value = "delete/{personId}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Integer personId) {
        ModelAndView mav = new ModelAndView("person/delete");
        mav.addObject("person", personService.readPerson(personId));
        return mav;
    }

    /**
     * Handles person deletion or cancellation, redirecting to the listing page in either case.
     *
     * @param command the command field from the form
     * @param personId the ID of the person to be deleted
     * @return redirect to the listing page
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam String command, @RequestParam Integer personId) {
        if (COMMAND_DELETE.equals(command)) {
            personService.deletePerson(personId);
        }
        return "redirect:/person/list";
    }
}
