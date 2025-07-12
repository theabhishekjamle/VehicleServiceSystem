package com.VehicleServiceSystem.VehicleServiceSystem.Controller;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.bookingModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;

import com.VehicleServiceSystem.VehicleServiceSystem.Service.bookingService;
import com.VehicleServiceSystem.VehicleServiceSystem.Service.sellingcarsService;
import com.VehicleServiceSystem.VehicleServiceSystem.Service.userService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class userController {

    @Autowired
    private userService userservice;

    @Autowired
    private sellingcarsService sellingservice;

    @Autowired
    private bookingService bookingservice;




    @GetMapping("/admin/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        adminDataModel admin = (adminDataModel) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin";
        }

        List<userDataModel> userList = userservice.getAllUsers();
        model.addAttribute("user_data", userList);

        // ✅ Add this: fetch listed cars for sale
        List<sellingcarModel> carList = sellingservice.getAllSellingCars();
        model.addAttribute("sellingcars_list", carList); // Send to JSP

        List<bookingModel> bookingList = bookingservice.getAllBooking();
        model.addAttribute("bookingservice", bookingList);

        return "adminDashboard"; // JSP view name
    }



    @GetMapping("/service")
    public String servicePa(){
        return "servicePage";
    }

    @GetMapping("/trackVehicle")
    public String track(){
        return "trackVehiclePage";
    }


    @GetMapping("/home")
    public String homePage(){
        return "home";
    }

    @GetMapping("/loginPage")
    public String loginPageGet(){
        return "login";
    }



    @PostMapping("/userLogin")
    public String loginPagePost(@ModelAttribute("user") userDataModel user, HttpSession session, Model model) {
        userDataModel validUser = userservice.userLogin(user.getEmail(), user.getPassword());
        if (validUser != null) {
            session.setAttribute("loggedInUser", validUser); // ✅ Store user in session
            return "home";
        } else {
            model.addAttribute("ErrorMessage", "Invalid email or password!");
            return "login";
        }
    }


    @PostMapping("/signupPage")
    public String signupPagePost(@ModelAttribute("user") userDataModel user, Model model){
        boolean status = userservice.userSignUp(user);
        if(status){
            model.addAttribute("SuccessMessage","User Registered SuccessFully !");
        }else {
            model.addAttribute("ErrorMessage"," Something Went Wrong ! ");
        }
        return "login";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // ✅ Clear session
        return "login";
    }

//    @PostMapping("/bookService")
//    public String bookService(@RequestParam Map<String, String> formData,
//                              @RequestParam(required = false) List<String> services,
//                              Model model) {
//        // Save to DB or process
//        System.out.println("Name: " + formData.get("customerName"));
//        System.out.println("Services Selected: " + services);
//
//        model.addAttribute("msg", "Booking Successful!");
//        return "confirmationPage";  // Create a success JSP
//    }

    // userList is List<userDataModel>


}
