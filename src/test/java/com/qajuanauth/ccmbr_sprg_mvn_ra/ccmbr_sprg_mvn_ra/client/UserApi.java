package com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.client;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class UserApi {

    private RequestSpecification request;

    public UserApi() {

        this.request = RestAssured.given()
                .baseUri("https://reqres.in/api")
                .contentType(ContentType.JSON);
    }

    public Response getAllUsers() {
        return request.log().all().get("/users?page=2");
    }

    public Response getUserById(int userId) {
        return request.get("/users/{userId}", userId);
    }

}
