package com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra;

import io.cucumber.junit.platform.engine.Constants;
import org.junit.platform.suite.api.ConfigurationParameter;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;

@Suite
@SelectClasspathResource("features")
@ConfigurationParameter(key = Constants.GLUE_PROPERTY_NAME, 
value = "com.qajuanauth.ccmbr_sprg_mvn_ra.ccmbr_sprg_mvn_ra.steps")
@ConfigurationParameter(key = Constants.PLUGIN_PROPERTY_NAME, value = "pretty, html:target/cucumber-report/cucumber.html")
public class EntryPointITTest {
}
