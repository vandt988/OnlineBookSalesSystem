/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Cart {

    private ArrayList<Item> items;

    public Cart() {
        
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public Item getItemById(int id) {
        for (Item item : items) {
            if (item.getProduct().getProductID() == id) {
                return item;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getProductID()) != null) {
            Item m = getItemById(t.getProduct().getProductID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public int getTotalMoney() {
        int t = 0;
        for (Item i : items) {
            t += (i.getPrice() * i.getQuantity());
        }
        return t;
    }

    public Product getProductById(int id, ArrayList<Product> list) {
        for (Product p : list) {
            if (p.getProductID() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart(String cart, ArrayList<Product> list) {
        items = new ArrayList<>();
        try {
            if (cart != null && cart.length() != 0) {
                String[] s = cart.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    Item t = new Item(p, quantity, p.getPrice());
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
        }
    }
}
