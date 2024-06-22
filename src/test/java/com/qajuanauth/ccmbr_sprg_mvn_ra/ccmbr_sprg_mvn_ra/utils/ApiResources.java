package com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.utils;

public enum ApiResources {


    // next implementations

    AddPlaceAPI("/maps/api/place/add/json"), getPlaceApi("/maps/api/place/get/json"),
    deletePlaceApi("maps/api/place/delete/json");

    private String resource;

    ApiResources(String resource) {
        this.resource = resource;
    }

    public String getResource() {
        return resource;
    }

}
