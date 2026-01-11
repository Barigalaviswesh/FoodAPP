package com.foodapp.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Cart {

    private Map<Integer, CartItem> items = new HashMap<>();

    public boolean addItem(CartItem item, int rid) {
        // ✅ Allow items from multiple restaurants
        int itemId = item.getItemId();

        if (items.containsKey(itemId)) {
            CartItem existing = items.get(itemId);
            existing.setQuantity(existing.getQuantity() + item.getQuantity());
        } else {
            items.put(itemId, item);
        }
        return true;
    }

    public void updateItem(int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            if (quantity <= 0) {
                items.remove(itemId);
            } else {
                items.get(itemId).setQuantity(quantity);
            }
        }
    }

    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public int getTotalItemCount() {
        int count = 0;
        for (CartItem item : items.values()) {
            count += item.getQuantity();
        }
        return count;
    }

    public double getTotal() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }

    public void clear() {
        items.clear();
    }

    // Get all unique restaurant IDs in the cart
    public Set<Integer> getRestaurantIds() {
        Set<Integer> restaurantIds = new HashSet<>();
        for (CartItem item : items.values()) {
            restaurantIds.add(item.getRestaurantId());
        }
        return restaurantIds;
    }

    // Get items grouped by restaurant ID
    public Map<Integer, List<CartItem>> getItemsByRestaurant() {
        Map<Integer, List<CartItem>> itemsByRestaurant = new HashMap<>();
        for (CartItem item : items.values()) {
            int rid = item.getRestaurantId();
            itemsByRestaurant.computeIfAbsent(rid, k -> new ArrayList<>()).add(item);
        }
        return itemsByRestaurant;
    }
}
