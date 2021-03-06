package com.springapp.mvc;

import javax.persistence.*;

@Entity
@Table(name = "cafe")
public class Cafe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "middle_cost")
    private int middleCost;

    @Column(name = "address")
    private String address;

    @Column(name = "contacts")
    private String contacts;

    @Column(name = "type")
    private String type;

    @Column(name = "x")
    private double x;

    @Column(name = "y")
    private double y;

    public Cafe(){}

    public Cafe(String name, String description, int middleCost, String address,
                String contacts, String type, double x, double y) {
        this.name = name;
        this.description = description;
        this.middleCost = middleCost;
        this.address = address;
        this.contacts = contacts;
        this.type = type;
        this.x = x;
        this.y = y;
    }

    public Cafe(CafeDto cafeDto) {
        this.name = cafeDto.getName();
        this.description = cafeDto.getDescription();
        this.middleCost = cafeDto.getMiddleCost();
        this.address = cafeDto.getAddress();
        this.contacts = cafeDto.getContacts();
        this.type = cafeDto.getType();
        this.x = cafeDto.getX();
        this.y = cafeDto.getY();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMiddleCost() {
        return middleCost;
    }

    public void setMiddleCost(int middleCost) {
        this.middleCost = middleCost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }
}
