
package com.bootexample4.api_tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
// import com.intuit.karate.http.HttpServer;
// import com.intuit.karate.http.ServerConfig;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ApiProductOrderingV2Test {

	@Test
	void testAll() {
		String apiHostServer = System.getenv().getOrDefault("nnnn_URL_BASE", "http://127.0.0.1:4010");
		String nnnnauthtoken = System.getenv().getOrDefault("nnnn_AUTH_TOKEN", "dummy_nnnn_AUTH_TOKEN");
		String apiHostServer = System.getenv().getOrDefault("nnnn_NNNN_URL_BASE", "http://127.0.0.1:4010");
		String nnnnnnnnauthtoken = System.getenv().getOrDefault("nnnn_NNNN_AUTH_TOKEN", "dummy_nnnn_NNNN_AUTH_TOKEN");
		String apiHostServer = System.getenv().getOrDefault("nnnn_NNNN_NNNN_URL_BASE", "http://127.0.0.1:4010");
		String apiHostServer = System.getenv().getOrDefault("nnnn_NNNN_NNNN_NNNN_URL_BASE", "http://127.0.0.1:4010");
		String nnnnnnnnnnnnauthtoken = System.getenv()
			.getOrDefault("nnnn_NNNN_NNNN_AUTH_TOKEN", "dummy_nnnn_NNNN_NNNN_AUTH_TOKEN");
		String apiHostServer = System.getenv()
			.getOrDefault("nnnn_NNNN_NNNN_NNNN_NNNN_URL_BASE", "http://127.0.0.1:4010");
		String nnnnnnnnnnnnnnnnauthtoken = System.getenv()
			.getOrDefault("nnnn_NNNN_NNNN_NNNN_AUTH_TOKEN", "dummy_nnnn_NNNN_NNNN_NNNN_AUTH_TOKEN");
		String apiHostServer = System.getenv()
			.getOrDefault("nnnn_NNNN_NNNN_NNNN_NNNN_NNNN_URL_BASE", "http://127.0.0.1:4010");
		String nnnnnnnnnnnnnnnnnnnnauthtoken = System.getenv()
			.getOrDefault("nnnn_NNNN_NNNN_NNNN_NNNN_AUTH_TOKEN", "dummy_nnnn_NNNN_NNNN_NNNN_NNNN_AUTH_TOKEN");
		Results results = Runner.path("src/test/java/com/bootexample4/api_tests/ApiProductOrderingV2")
			.systemProperty("nnnn_URL_BASE", apiHostServer)
			.systemProperty("nnnn_AUTH_TOKEN", nnnnauthtoken)
			.systemProperty("nnnn_NNNN_URL_BASE", apiHostServer)
			.systemProperty("nnnn_NNNN_AUTH_TOKEN", nnnnnnnnauthtoken)
			.systemProperty("nnnn_NNNN_NNNN_URL_BASE", apiHostServer)
			.systemProperty("nnnn_NNNN_NNNN_NNNN_URL_BASE", apiHostServer)
			.systemProperty("nnnn_NNNN_NNNN_AUTH_TOKEN", nnnnnnnnnnnnauthtoken)
			.systemProperty("nnnn_NNNN_NNNN_NNNN_NNNN_URL_BASE", apiHostServer)
			.systemProperty("nnnn_NNNN_NNNN_NNNN_AUTH_TOKEN", nnnnnnnnnnnnnnnnauthtoken)
			.systemProperty("nnnn_NNNN_NNNN_NNNN_NNNN_NNNN_URL_BASE", apiHostServer)
			.systemProperty("nnnn_NNNN_NNNN_NNNN_NNNN_AUTH_TOKEN", nnnnnnnnnnnnnnnnnnnnauthtoken)
			.reportDir("testReport")
			.parallel(1);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

}
