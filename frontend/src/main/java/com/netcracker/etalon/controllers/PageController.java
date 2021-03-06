/*
 This software is the confidential information and copyrighted work of
 NetCracker Technology Corp. ("NetCracker") and/or its suppliers and
 is only distributed under the terms of a separate license agreement
 with NetCracker.
 Use of the software is governed by the terms of the license agreement.
 Any use of this software not in accordance with the license agreement
 is expressly prohibited by law, and may result in severe civil
 and criminal penalties. 
 
 Copyright (c) 1995-2017 NetCracker Technology Corp.
 
 All Rights Reserved.
 
*/
/*
 * Copyright 1995-2017 by NetCracker Technology Corp.,
 * University Office Park III
 * 95 Sawyer Road
 * Waltham, MA 02453
 * United States of America
 * All rights reserved.
 */
package com.netcracker.etalon.controllers;

import com.netcracker.pmbackend.interfaces.HeadofpracticesService;
import com.netcracker.pmbackend.interfaces.StudentsService;
import com.netcracker.pmbackend.interfaces.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class PageController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private StudentsService studentsService;

    @Autowired
    private HeadofpracticesService headofpracticesService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String redirectRoleToPage() {
        User user;
        try {
            user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        }catch (ClassCastException e){
            return "redirect:/authorization";
        }
        String userLogin = user.getUsername();
        String userRole = null;
        String urlRedirect = "redirect:/authorization";

        for (GrantedAuthority authority : user.getAuthorities()) {
            userRole = authority.getAuthority();
        }

        switch (userRole){
            case "ROLE_ADMIN":{
                urlRedirect = "redirect:/admin";
                break;
            }
            case "ROLE_STUDENT":{
                long studentId = studentsService.findByUserId(usersService.findByLogin(userLogin).getId()).getId();
                urlRedirect = "redirect:/studentProfile/" + studentId;
                break;
            }
            case "ROLE_HEADOFPRACTICE":{
                long curatorId = headofpracticesService.findByUserId(usersService.findByLogin(userLogin).getId()).getId();
                urlRedirect = "redirect:/curator/" + curatorId;
                break;
            }
        }
        return urlRedirect;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String goToLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/authorization", method = RequestMethod.GET)
    public String goToAuthorizationPage() {
        return "authorization";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String goToAdmin() {
        return "adminpage";
    }

    @RequestMapping(value = "/curator/{id}", method = RequestMethod.GET)
    public String goToCuratorPage() {
        return "curator";
    }

    @RequestMapping(value = "/practicesRequests", method = RequestMethod.GET)
    public String goToPractice() {
        return "allRequests";
    }

    @RequestMapping(value = "/studentProfile/{id}", method = RequestMethod.GET)
    public String goToStudentProfile() {
        return "studentprofile";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration() {
        return "registration";
    }

    @RequestMapping(value = "/registration/faculty", method = RequestMethod.GET)
    public String registrationFaculty() {
        return "createFaculty";
    }

    @RequestMapping(value = "/registration/practice", method = RequestMethod.GET)
    public String registrationPractice() {
        return "createRequest";
    }


}
/*
 WITHOUT LIMITING THE FOREGOING, COPYING, REPRODUCTION, REDISTRIBUTION,
 REVERSE ENGINEERING, DISASSEMBLY, DECOMPILATION OR MODIFICATION
 OF THE SOFTWARE IS EXPRESSLY PROHIBITED, UNLESS SUCH COPYING,
 REPRODUCTION, REDISTRIBUTION, REVERSE ENGINEERING, DISASSEMBLY,
 DECOMPILATION OR MODIFICATION IS EXPRESSLY PERMITTED BY THE LICENSE
 AGREEMENT WITH NETCRACKER. 
 
 THIS SOFTWARE IS WARRANTED, IF AT ALL, ONLY AS EXPRESSLY PROVIDED IN
 THE TERMS OF THE LICENSE AGREEMENT, EXCEPT AS WARRANTED IN THE
 LICENSE AGREEMENT, NETCRACKER HEREBY DISCLAIMS ALL WARRANTIES AND
 CONDITIONS WITH REGARD TO THE SOFTWARE, WHETHER EXPRESS, IMPLIED
 OR STATUTORY, INCLUDING WITHOUT LIMITATION ALL WARRANTIES AND
 CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 TITLE AND NON-INFRINGEMENT.
 
 Copyright (c) 1995-2017 NetCracker Technology Corp.
 
 All Rights Reserved.
*/