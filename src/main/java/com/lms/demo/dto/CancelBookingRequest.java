package com.lms.demo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CancelBookingRequest {

    @NotBlank
    @JsonProperty("bookingId")
    private String bookingId;
}
