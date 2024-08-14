package com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.utils;

import org.assertj.core.api.AssertionsForClassTypes;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.pojos.AuthClientRequest;
import com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.pojos.AuthClientResponse;

public class TokenManager {

	public static String getToken(String tokenUrl, String clientID, String clientSecret, String audience) {
		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<AuthClientRequest> request = new HttpEntity<>(
				new AuthClientRequest(clientID, clientSecret, audience, "client_credentials"));
		ResponseEntity<AuthClientResponse> responseEntity = restTemplate.exchange(tokenUrl, HttpMethod.POST, request,
				AuthClientResponse.class);
		AssertionsForClassTypes.assertThat(responseEntity.getStatusCode().is2xxSuccessful()).isTrue();
		AuthClientResponse auth0ClientCredentialFlowResponse = responseEntity.getBody();
		return auth0ClientCredentialFlowResponse.getAccess_token();
	}

}
