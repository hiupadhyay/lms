package com.lms.demo.data.repository;

import com.lms.demo.data.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface OrderRepository extends JpaRepository<Order, String> {

    void deleteByBookingId(String bookingId);
}
