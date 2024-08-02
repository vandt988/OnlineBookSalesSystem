/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Cart;
import Models.Category;
import Models.Item;
import Models.OderDetail;
import Models.Order;
import Models.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> listProduct = new ArrayList<>();
        String sql = "select p.productID, p.nameProduct, p.price, p.image, p.quantity,"
                + " p.description, p.categoryID, c.nameCategory from Product p "
                + "join Category c ON p.categoryID = c.categoryID";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                String image = rs.getString(4);
                int quantity = rs.getInt(5);
                String des = rs.getString(6);
                int cateID = rs.getInt(7);
                String cateName = rs.getString(8);
                Category cate = new Category(cateID, cateName);
                listProduct.add(new Product(id, name, price, image, quantity, des, cate));
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public ArrayList<Product> getTop8Product() {
        ArrayList<Product> listProduct = new ArrayList<>();
        String sql = "select top 8 p.productID, p.nameProduct, p.price, p.image, p.quantity,"
                + " p.description, p.categoryID, c.nameCategory from Product p "
                + "join Category c ON p.categoryID = c.categoryID";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                String image = rs.getString(4);
                int quantity = rs.getInt(5);
                String des = rs.getString(6);
                int cateID = rs.getInt(7);
                String cateName = rs.getString(8);
                Category cate = new Category(cateID, cateName);
                listProduct.add(new Product(id, name, price, image, quantity, des, cate));
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> listCategory = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                listCategory.add(new Category(id, name));
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listCategory;
    }

    public ArrayList<Product> getProductByCateID(int categoryID) {
        ArrayList<Product> listProduct = new ArrayList<>();
        String sql = "select p.productID, p.nameProduct, p.price, p.image, p.quantity,"
                + " p.description, p.categoryID, c.nameCategory from Product p "
                + "join Category c ON p.categoryID = c.categoryID where p.categoryID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                String image = rs.getString(4);
                int quantity = rs.getInt(5);
                String des = rs.getString(6);
                int cateID = rs.getInt(7);
                String cateName = rs.getString(8);
                Category cate = new Category(cateID, cateName);
                listProduct.add(new Product(id, name, price, image, quantity, des, cate));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }

    public Category getNameCateByID(int categoryID) {
        String sql = "select * from Category where categoryID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                return new Category(id, name);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductByID(int categoryID) {
        String sql = "select p.productID, p.nameProduct, p.price, p.image, p.quantity,"
                + " p.description, p.categoryID, c.nameCategory from Product p "
                + "join Category c ON p.categoryID = c.categoryID where productID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                String image = rs.getString(4);
                int quantity = rs.getInt(5);
                String des = rs.getString(6);
                int cateID = rs.getInt(7);
                String cateName = rs.getString(8);
                Category cate = new Category(cateID, cateName);
                return new Product(id, name, price, image, quantity, des, cate);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Product> searchProduct(String txt) {
        ArrayList<Product> listSearchProduct = new ArrayList<>();
        String sql = "select p.productID, p.nameProduct, p.price, p.image, p.quantity,"
                + " p.description, p.categoryID, c.nameCategory from Product p "
                + "join Category c ON p.categoryID = c.categoryID where nameProduct like ?";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "%" + txt + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                String image = rs.getString(4);
                int quantity = rs.getInt(5);
                String des = rs.getString(6);
                int cateID = rs.getInt(7);
                String cateName = rs.getString(8);
                Category cate = new Category(cateID, cateName);
                listSearchProduct.add(new Product(id, name, price, image, quantity, des, cate));
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listSearchProduct;
    }

    public Account login(String user, String pass) {
        String sql = "select * from Account where username = ? AND password = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String password = rs.getString(6);
                int roleid = rs.getInt(7);
                return new Account(id, username, email, phone, address, password, roleid);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "select * from Account where username = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String password = rs.getString(6);
                int roleid = rs.getInt(7);
                return new Account(id, username, email, phone, address, password, roleid);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addAccount(String username, String email, String phone, String address, String password) {
        String sql = "insert into Account values (?, ?, ?, ?, ?, 2)";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> listAccount = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String pass = rs.getString(6);
                int roleid = rs.getInt(7);
                listAccount.add(new Account(id, name, email, phone, address, pass, roleid));
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listAccount;
    }

    public Account getAccountByID(int eid) {
        String sql = "select * from Account where accountID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, eid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String pass = rs.getString(6);
                int roleid = rs.getInt(7);
                return new Account(id, name, email, phone, address, pass, roleid);
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void setRole(int uID, int roleID) {
        String sql = "update  Account set roleID = ? where accountID = ? ";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, roleID);
            ps.setInt(2, uID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductByID(int ID) {
        String sql = "delete from Product where productID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, ID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProduct(int ID, String name, String price, String img, int quantity, String des, String cate) {
        String sql = "update Product set nameProduct = ?, price =?, image = ?, quantity = ?, description = ?, categoryID = ? where productID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, img);
            ps.setInt(4, quantity);
            ps.setString(5, des);
            ps.setString(6, cate);
            ps.setInt(7, ID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addProduct(String name, int price, String img, int quan, String des, String cate) {
        String sql = "insert into Product values (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setString(3, img);
            ps.setInt(4, quan);
            ps.setString(5, des);
            ps.setString(6, cate);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addOder(String name, String email, String phone, String address, Account a, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            // add order
            String sql = "insert into [Order] values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, a.getId());
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, date);
            ps.setInt(7, cart.getTotalMoney());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getOrderIdTop1() {
        // lay id cua order vua add
        String sql1 = "select top 1 orderID from [Order] order by orderID desc";
        try {
            PreparedStatement ps1 = connect.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt("orderID");
                return orderid;
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public void addOderDetail(Cart cart) {
        //add orderdetail
        for (Item item : cart.getItems()) {
            String sql2 = "insert into OrderDetail values (?, ?, ?, ?, ?)";
            try {
                PreparedStatement ps2 = connect.prepareStatement(sql2);
                ps2.setInt(1, getOrderIdTop1());
                ps2.setInt(2, item.getProduct().getProductID());
                ps2.setInt(3, item.getPrice());
                ps2.setInt(4, item.getQuantity());
                ps2.setInt(5, item.getPrice() * item.getQuantity());
                ps2.executeUpdate();
            } catch (Exception e) {
            }
        }
    }

    public void updateProduct(int ID, int quantity) {
        String sql = "update Product set quantity = ? where productID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, ID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> listOrder = new ArrayList<>();
        String sql = " select * from [Order]";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int accID = rs.getInt(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                Date date = rs.getDate(7);
                int total = rs.getInt(8);
                listOrder.add(new Order(id, accID, name, email, phone, address, date, total));
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return listOrder;
    }
    
    public String getUsernameById(int id) { 
        String sql = " select username from Account where accountID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) { 
                String name = rs.getString(1); 
                return name;
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
     
}
