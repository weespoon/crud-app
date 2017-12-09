package com.aquent.crudapp.controller;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.inject.Inject;

import com.aquent.crudapp.domain.Person;
import com.aquent.crudapp.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.service.ClientService;

/**
 * Controller for handling basic client management operations.
 */
@Controller
@RequestMapping("client")
public class ClientController {

    public static final String COMMAND_DELETE = "Delete";

    @Inject private ClientService clientService;
    @Inject private PersonService personService;

    /**
     * Renders the listing page.
     *
     * @return list view populated with the current list of clients
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("client/list");
        mav.addObject("clients", clientService.listClients());
        return mav;
    }

    /**
     * Renders an empty form used to create a new client record.
     *
     * @return create view populated with an empty client
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("client/create");
        mav.addObject("client", new Client());
        mav.addObject("errors", new ArrayList<String>());
        mav.addObject("people", personService.listPeople());
        return mav;
    }

    /**
     * Validates and saves a new client.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param client populated form bean for the client
     * @return redirect, or create view with errors
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ModelAndView create(Client client, @RequestParam(value = "personId", required=false)String[] personIds) {
        List<String> errors = clientService.validateClient(client);
        if (errors.isEmpty()) {
            Integer clientId = clientService.createClient(client);

            if (null != personIds) {
                List<Integer> newClientPeopleIds = Stream.of(personIds).map(Integer::valueOf).collect(Collectors.toList());
                addClientConnections(newClientPeopleIds, clientId);
            }

            return new ModelAndView("redirect:/client/list");
        } else {
            ModelAndView mav = new ModelAndView("client/create");
            mav.addObject("client", client);
            mav.addObject("errors", errors);
            mav.addObject("people", personService.listPeople());
            return mav;
        }
    }

    /**
     * Renders an edit form for an existing client record.
     *
     * @param clientId the ID of the client to edit
     * @return edit view populated from the client record
     */
    @RequestMapping(value = "edit/{clientId}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/edit");
        mav.addObject("client", clientService.readClient(clientId));
        mav.addObject("errors", new ArrayList<String>());
        mav.addObject("people", personService.listPeople());
        return mav;
    }

    /**
     * Validates and saves an edited client.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param client populated form bean for the client
     * @return redirect, or edit view with errors
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView edit(Client client, @RequestParam(value = "personId", required=false)String[] personIds) {
        List<String> errors = clientService.validateClient(client);
        if (errors.isEmpty()) {
            clientService.updateClient(client);

            if (null == personIds) {
                personIds = new String[0];
            }

            // resolve new and old connections
            List<Person> priorClientPeople = personService.listClientPeople(client.getClientId());
            List<Integer> priorClientPeopleIds = priorClientPeople.stream().map(Person::getPersonId).collect(Collectors.toList());
            List<Integer> newClientPeopleIds = Stream.of(personIds).map(Integer::valueOf).collect(Collectors.toList());
            List<Integer> removeIds = new ArrayList<Integer>(priorClientPeopleIds);
            removeIds.removeAll(newClientPeopleIds);
            newClientPeopleIds.removeAll(priorClientPeopleIds);

            addClientConnections(newClientPeopleIds, client.getClientId());
            removeClientConnections(removeIds);

            return new ModelAndView("redirect:/client/list");
        } else {
            ModelAndView mav = new ModelAndView("client/edit");
            mav.addObject("client", client);
            mav.addObject("errors", errors);
            mav.addObject("people", personService.listPeople());
            return mav;
        }
    }

    /**
     * Renders the deletion confirmation page.
     *
     * @param clientId the ID of the client to be deleted
     * @return delete view populated from the client record
     */
    @RequestMapping(value = "delete/{clientId}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/delete");
        mav.addObject("client", clientService.readClient(clientId));
        return mav;
    }

    /**
     * Handles client deletion or cancellation, redirecting to the listing page in either case.
     *
     * @param command the command field from the form
     * @param clientId the ID of the client to be deleted
     * @return redirect to the listing page
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam String command, @RequestParam Integer clientId) {
        if (COMMAND_DELETE.equals(command)) {
            // clean up connections first
            List<Person> priorClientPeople = personService.listClientPeople(clientId);
            List<Integer> priorClientPeopleIds = priorClientPeople.stream().map(Person::getPersonId).collect(Collectors.toList());
            removeClientConnections(priorClientPeopleIds);

            clientService.deleteClient(clientId);
        }
        return "redirect:/client/list";
    }

    private void addClientConnections(List<Integer> personIds, Integer clientId) {
        for(Integer pid : personIds) {
            Person person = personService.readPerson(pid);
            person.setClientId(clientId);
            personService.updatePerson(person);
        }
    }

    private void removeClientConnections(List<Integer> personIds) {
        for(Integer pid : personIds) {
            Person person = personService.readPerson(pid);
            person.setClientId(null);
            personService.updatePerson(person);
        }
    }
}
