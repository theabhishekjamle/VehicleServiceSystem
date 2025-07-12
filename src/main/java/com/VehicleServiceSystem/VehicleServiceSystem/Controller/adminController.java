package com.VehicleServiceSystem.VehicleServiceSystem.Controller;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Service.adminService;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class adminController {

    @Autowired
    public adminService adminservice;





    // Show Admin Login Page
    @GetMapping("/admin")
    public String adminLoginPage() {
        return "adminLogin"; // JSP: adminLogin.jsp
    }

    // Admin Signup Endpoint
    @PostMapping("/adminSignup")
    public String adminSignUp(@ModelAttribute("admin") adminDataModel admin, Model model) {
        boolean status = adminservice.adminSignUp(admin);
        if (status) {
            model.addAttribute("SuccessMessage", "Admin registered successfully!");
        } else {
            model.addAttribute("ErrorMessage", "Something went wrong during registration.");
        }
        return "adminLogin";
    }


    @PostMapping("/adminlogout")
    public String Adminlogout(HttpSession session) {
        session.invalidate();
        return "adminLogin";
    }



    @PostMapping("/adminLoginHere")
    public String adminLoginPage(@ModelAttribute("admin") adminDataModel admin, HttpSession session, Model model) {
        System.out.println("Admin ID: " + admin.getAdminId());
        System.out.println("Password: " + admin.getPassword());

        adminDataModel validAdmin = adminservice.findByAdminIdAndPassword(admin.getAdminId(), admin.getPassword());

        if (validAdmin != null) {
            session.setAttribute("loggedInAdmin", validAdmin);
            return "redirect:/admin/dashboard"; // ✅ successful login
        } else {
            model.addAttribute("ErrorMessage", "Invalid ID or Password!");
            return "adminLogin"; // ❗ go back to login page if failed
        }
    }




    // Logout Handler (Optional)
}
