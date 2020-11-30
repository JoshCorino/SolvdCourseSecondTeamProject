package com.solvd.secondTeamProject.model;

public class Product extends AbstractEntity{
	private String name;
	private double price;
	private double volume;
	
	public Product() {
		name="no-name";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getVolume() {
		return volume;
	}
	public void setVolume(double volume) {
		this.volume = volume;
	}
	
}