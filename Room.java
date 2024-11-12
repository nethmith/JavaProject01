package Model;

public class Room {
	//Attributes
    private int id;
    private String roomType;
    private double price;
    private int capacity;

    //Overloaded Constructor
    public Room(int id, String roomType, double price, int capacity) {
		this.id = id;
		this.roomType = roomType;
		this.price = price;
		this.capacity = capacity;
	}

	// Getters and setters
    public int getId() { 
    	return id;
    }
    
    public void setId(int id) { 
    	this.id = id; 
    }
    
    public String getRoomType() { 
    	return roomType; 
    }
    
    public void setRoomType(String roomType) { 
    	this.roomType = roomType; 
    }
    
    public double getPrice() { 
    	return price;
    }
    
    public void setPrice(double price) { 
    	this.price = price; 
    }
    
    public int getCapacity() { 
    	return capacity; 
    }
    
    public void setCapacity(int capacity) { 
    	this.capacity = capacity; 
    }
}