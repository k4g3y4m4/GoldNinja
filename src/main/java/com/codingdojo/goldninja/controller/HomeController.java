package com.codingdojo.goldninja.controller;

import com.codingdojo.goldninja.model.Activity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home(HttpSession session, Model model) {

       if (session.getAttribute("gold") == null & session.getAttribute("activities") == null) {
           session.setAttribute("gold", 0);
           ArrayList<Activity> activities = new ArrayList<>();
           session.setAttribute("activities", activities);
       }else{
           session.setAttribute("gold", session.getAttribute("gold"));
           session.setAttribute("activities", session.getAttribute("activities"));
       }
       model.addAttribute("gold", session.getAttribute("gold"));
       model.addAttribute("activities", session.getAttribute("activities"));
       return "index.jsp";
    }

    @PostMapping("/processGold")
    public String processGold(
            @RequestParam(value = "building") String building,
            HttpSession session,
            Model model
    )
    {
        int gold = (int) session.getAttribute("gold");
        ArrayList<Activity> activities = (ArrayList<Activity>) session.getAttribute("activities");
        java.text.DateFormat df = new java.text.SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");

        if (building.equals("farm")) {
            //min = 10, max = 20
            int goldActivity = (int) (Math.random() * 11) + 10;
            gold += goldActivity;
            activities.add(new Activity("farm", goldActivity,"green", df.format(new java.util.Date())));

        } else if (building.equals("cave")) {
            //min = 5, max = 10
            int goldActivity = (int) (Math.random() * 6) + 5;
            gold += goldActivity;
            activities.add(new Activity("cave", goldActivity,"green",  df.format(new java.util.Date())));
        } else if (building.equals("house")) {
            //min = 2, max = 5
            int goldActivity = (int) (Math.random() * 3) + 2;
            gold += goldActivity;
            activities.add(new Activity("house", goldActivity,"green",  df.format(new java.util.Date())));
        } else if (building.equals("casino")) {
            //min = -50, max = 100
            int goldActivity = (int) (Math.random() * 101) - 50;
            gold += goldActivity;
            if (goldActivity < 0) {
                activities.add(new Activity("casino", goldActivity,"red",  df.format(new java.util.Date())));
            }  else {
                activities.add(new Activity("casino", goldActivity,"green",  df.format(new java.util.Date())));
            }
        }
        session.setAttribute("gold", gold);
        session.setAttribute("activities", activities);
        model.addAttribute("gold", gold);
        model.addAttribute("activities", activities);
        return "redirect:/";
    }

    @GetMapping("/reset")
    public String reset(HttpSession session, Model model) {
        session.setAttribute("gold", 0);
        ArrayList<Activity> activities = new ArrayList<>();
        session.setAttribute("activities", activities);
        model.addAttribute("gold", session.getAttribute("gold"));
        model.addAttribute("activities", session.getAttribute("activities"));
        return "redirect:/";
    }
}

