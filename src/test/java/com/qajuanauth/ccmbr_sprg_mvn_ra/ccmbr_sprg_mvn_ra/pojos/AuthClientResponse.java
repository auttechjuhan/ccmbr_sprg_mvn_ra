package com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthClientResponse {
    String access_token;
    String scope;
    String expires_in;
    String token_type;

}
