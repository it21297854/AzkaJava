package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.FoodModel;
import util.dbConnect;

public class FoodController {
    private static Connection con;
    private PreparedStatement preparedStatement;

    public ArrayList<FoodModel> getFoodItems() {

        ArrayList<FoodModel> foodArrayList  = new ArrayList<>();
        String query = "SELECT * FROM AzfoodTB ORDER BY id"; // Assuming you have a "feedback" table in your database

        try {
            con = dbConnect.initializeDatabase();
            preparedStatement = con.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	FoodModel food = new FoodModel();
                food.setId(resultSet.getInt("id"));
                food.setFoodName(resultSet.getString("foodName"));
                food.setCategory(resultSet.getString("category"));
                food.setPrice(resultSet.getDouble("price"));
                food.setDescription(resultSet.getString("description"));
                foodArrayList.add(food);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return foodArrayList;
    }


    public FoodModel getFoodByID(int foodId) {
        FoodModel food = new FoodModel();
        String query = "SELECT * FROM azfoodtb WHERE id = ?";

        try {
            con = dbConnect.initializeDatabase();
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, foodId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                food.setId(resultSet.getInt("id"));
                food.setFoodName(resultSet.getString("foodName"));
                food.setCategory(resultSet.getString("category"));
                food.setPrice(resultSet.getDouble("price"));
                food.setDescription(resultSet.getString("description"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return food;
    }
    
    public boolean editFood(FoodModel food) {
        String editQuery = "UPDATE azfoodtb SET foodName = ?, category = ?, price = ?, description = ? WHERE id = ?";

        try {
            con = dbConnect.initializeDatabase();
            preparedStatement = con.prepareStatement(editQuery);

            preparedStatement.setString(1, food.getFoodName());
            preparedStatement.setString(2, food.getCategory());
            preparedStatement.setDouble(3, food.getPrice());
            preparedStatement.setString(4, food.getDescription());
            preparedStatement.setInt(5, food.getId());
            
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return true;
    }



    public boolean deleteFood(int feedbackId) {
        String deleteQuery = "DELETE FROM AzfoodTB WHERE id = ?";

        try {
            con = dbConnect.initializeDatabase();
            preparedStatement = con.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, feedbackId);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return true;
    }

}
