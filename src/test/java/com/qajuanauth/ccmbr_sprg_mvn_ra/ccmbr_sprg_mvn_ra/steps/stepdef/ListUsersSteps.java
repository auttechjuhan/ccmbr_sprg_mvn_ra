package com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.steps.stepdef;

import java.lang.invoke.MethodHandles;
import java.util.List;

import org.hamcrest.Matchers;
import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.client.UserApi;
import com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.steps.config.DataUser;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;

public class ListUsersSteps {

    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    private Response response;
    private UserApi userApi;

    public ListUsersSteps() {
        this.userApi = new UserApi();
    }

    @When("^I send a GET HTTP request$")
    public void sendGetRequest() {
        response = userApi.getAllUsers();
    }

    @Then("^I receive a valid response with a list of users$")
    public void verifyResponse() {
        logger.info("The list users should be visible as a json format");
        response = userApi.getAllUsers();
        JsonPath jsonPathEvaluator = response.jsonPath();

        List<DataUser> users = jsonPathEvaluator.getList("data",
                DataUser.class);

        for (DataUser user : users) {
            System.out.println("ID: " + user.getId());
            System.out.println("Email: " + user.getEmail());
            System.out.println("First Name: " + user.getFirst_name());
            System.out.println("Last Name: " + user.getLast_name());
            System.out.println("Avatar: " + user.getAvatar());
            System.out.println();
        }

        Assert.assertNotNull(users);
        Assert.assertTrue(users.size() > 0);
        response.then().body("data", Matchers.notNullValue());
        response.then().body("data.size()", Matchers.greaterThan(0));

    }

}