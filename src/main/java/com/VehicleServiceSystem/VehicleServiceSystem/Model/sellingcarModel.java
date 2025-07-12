package com.VehicleServiceSystem.VehicleServiceSystem.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "sellingcarsList")
public class sellingcarModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String carimage;

    @Column
    private String carname;

    @Column
    private String carmodel;

    @Column
    private String carprice;

    @Column
    private String carlocation;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarimage() {
        return carimage;
    }

    public void setCarimage(String carimage) {
        this.carimage = carimage;
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname;
    }

    public String getCarmodel() {
        return carmodel;
    }

    public void setCarmodel(String carmodel) {
        this.carmodel = carmodel;
    }

    public String getCarprice() {
        return carprice;
    }

    public void setCarprice(String carprice) {
        this.carprice = carprice;
    }

    public String getCarlocation() {
        return carlocation;
    }

    public void setCarlocation(String carlocation) {
        this.carlocation = carlocation;
    }

    // Convenience method for controller
    public void setImagePath(String imagePath) {
        this.carimage = imagePath;
    }
}
