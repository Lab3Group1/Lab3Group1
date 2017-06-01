package com.lab.account.web;

import com.lab.account.validator.UserValidator;
import com.shop.database.entities.*;
import com.shop.database.entities.Object;
import com.shop.database.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.net.URISyntaxException;
import java.util.List;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ObjectService objectService;
    @Autowired
    private ObjectTypeService objectTypeService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private ParameterService parameterService;
    @Autowired
    private AttributeService attributeService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String getIndexPage() {

        //objectTypeService.save(new ObjectType("Phone", null, null));
//        attributeService.save(new Attribute("price", objectTypeService.findById(10)));
//        objectService.save(new Object("LG", objectTypeService.findById(10), null));
//        objectService.save(new Object("Samsung", objectTypeService.findById(10), null));
//        objectService.save(new Object("Nokia", objectTypeService.findById(10), null));

    /*    User user = new User();
        user.setId(1L);
        user.setUsername("slava");
        user.setPassword("123");
        user.setPasswordConfirm("123");
        Set<Role> set = new HashSet<Role>();
        set.add(new Role(1L,"ROLE_USER"));
        user.setRoles(set);
        userService.save(user);*/
        //return "UserManagement";
        return "main";
    }

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public ResponseEntity<List<Object>> welcome() {
        List<Object> objects = objectService.findByObjectType(objectTypeService.findById(1));
        if (objects.isEmpty()) {
            return new ResponseEntity<List<Object>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Object>>(objects, HttpStatus.OK);
    }

    @RequestMapping(value = {"/phone"}, method = RequestMethod.GET)
    public ResponseEntity<List<Object>> phones() {
        System.out.println("HELLO123");
        List<Object> objects = objectService.findByObjectType(objectTypeService.findById(10));
        System.out.println("LIST OF OBJECTS SIZE " + objects.size());
        for (Object o : objects) {
            System.out.println("OBJECT NAME: " + o.getName());
            for (Parameter p : o.getParameters()) {
                System.out.println("parameter: " + p.getValue());
            }
        }
        if (objects.isEmpty()) {
            return new ResponseEntity<List<Object>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Object>>(objects, HttpStatus.OK);
    }

    //    @RequestMapping(value={"/phone/{id}"})
//    public ResponseEntity<Object> details(@PathVariable("id") int id) throws URISyntaxException {
//        URI location = new URI("/details");
//        Object object = objectService.findById(id);
//        return ResponseEntity.created(location).body(object);
//    }
    @RequestMapping(value = {"/phone/{id}"})
    public String details(@PathVariable("id") int id, Model model) throws URISyntaxException {
        System.out.println("IN JAVA METHOD");
        model.addAttribute("test1", "test2");
        return "welcome";
    }


}
