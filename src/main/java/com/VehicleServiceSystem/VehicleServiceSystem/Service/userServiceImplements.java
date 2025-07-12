package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Repository.userRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class userServiceImplements implements userService{

    @Autowired
    private userRepository userRepo;

    @Override
    public boolean userSignUp(userDataModel user) {
        try{
            userRepo.save(user);
            System.out.println(" User Register ");
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public userDataModel userLogin(String email, String password) {
        userDataModel validUser = userRepo.findByEmail(email);
        if(validUser != null && validUser.getPassword().equals(password)) return validUser;
        return null;
    }

    @Override
    public List<userDataModel> getAllUsers() {
            return userRepo.findAll();
        }


}
