
Report Summary

┌───────────────────────────────────┬────────┬─────────────────┬─────────┐
│              Target               │  Type  │ Vulnerabilities │ Secrets │
├───────────────────────────────────┼────────┼─────────────────┼─────────┤
│ spring-app:latest (alpine 3.22.2) │ alpine │        0        │    -    │
├───────────────────────────────────┼────────┼─────────────────┼─────────┤
│ app/app.jar                       │  jar   │        9        │    -    │
└───────────────────────────────────┴────────┴─────────────────┴─────────┘
Legend:
- '-': Not scanned
- '0': Clean (no security findings detected)


Java (jar)
==========
Total: 9 (MEDIUM: 5, HIGH: 4, CRITICAL: 0)

┌─────────────────────────────────────────────────────┬────────────────┬──────────┬────────┬───────────────────┬───────────────────────────┬──────────────────────────────────────────────────────────────┐
│                       Library                       │ Vulnerability  │ Severity │ Status │ Installed Version │       Fixed Version       │                            Title                             │
├─────────────────────────────────────────────────────┼────────────────┼──────────┼────────┼───────────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┤
│ ch.qos.logback:logback-core (app.jar)               │ CVE-2025-11226 │ MEDIUM   │ fixed  │ 1.5.18            │ 1.5.19                    │ ch.qos.logback/logback-core: Conditional abitrary code       │
│                                                     │                │          │        │                   │                           │ execution in logback-core                                    │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-11226                   │
├─────────────────────────────────────────────────────┼────────────────┼──────────┤        ├───────────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┤
│ org.apache.tomcat.embed:tomcat-embed-core (app.jar) │ CVE-2025-48988 │ HIGH     │        │ 10.1.40           │ 11.0.8, 10.1.42, 9.0.106  │ tomcat: Apache Tomcat DoS in multipart upload                │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-48988                   │
│                                                     ├────────────────┤          │        │                   ├───────────────────────────┼──────────────────────────────────────────────────────────────┤
│                                                     │ CVE-2025-48989 │          │        │                   │ 11.0.10, 10.1.44, 9.0.108 │ tomcat: http/2 "MadeYouReset" DoS attack through HTTP/2      │
│                                                     │                │          │        │                   │                           │ control frames                                               │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-48989                   │
│                                                     ├────────────────┤          │        │                   ├───────────────────────────┼──────────────────────────────────────────────────────────────┤
│                                                     │ CVE-2025-55752 │          │        │                   │ 11.0.11, 10.1.45, 9.0.109 │ tomcat: org.apache.tomcat/tomcat-catalina: Apache Tomcat:    │
│                                                     │                │          │        │                   │                           │ Directory traversal via rewrite with possible RCE            │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-55752                   │
│                                                     ├────────────────┼──────────┤        │                   ├───────────────────────────┼──────────────────────────────────────────────────────────────┤
│                                                     │ CVE-2025-49124 │ MEDIUM   │        │                   │ 11.0.8, 10.1.42, 9.0.106  │ Apache Tomcat installer for Windows has an untrusted search  │
│                                                     │                │          │        │                   │                           │ path vulnerability                                           │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-49124                   │
│                                                     ├────────────────┤          │        │                   │                           ├──────────────────────────────────────────────────────────────┤
│                                                     │ CVE-2025-49125 │          │        │                   │                           │ tomcat: Apache Tomcat: Security constraint bypass for        │
│                                                     │                │          │        │                   │                           │ pre/post-resources                                           │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-49125                   │
├─────────────────────────────────────────────────────┼────────────────┼──────────┤        ├───────────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┤
│ org.springframework:spring-core (app.jar)           │ CVE-2025-41249 │ HIGH     │        │ 6.1.19            │ 6.2.11                    │ org.springframework/spring-core: Spring Framework Annotation │
│                                                     │                │          │        │                   │                           │ Detection Vulnerability                                      │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-41249                   │
├─────────────────────────────────────────────────────┼────────────────┼──────────┤        │                   ├───────────────────────────┼──────────────────────────────────────────────────────────────┤
│ org.springframework:spring-web (app.jar)            │ CVE-2025-41234 │ MEDIUM   │        │                   │ 6.2.8, 6.1.21             │ springframework: Reflected download attack in Spring         │
│                                                     │                │          │        │                   │                           │ Framework with non-ASCII headers                             │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-41234                   │
├─────────────────────────────────────────────────────┼────────────────┤          │        │                   ├───────────────────────────┼──────────────────────────────────────────────────────────────┤
│ org.springframework:spring-webmvc (app.jar)         │ CVE-2025-41242 │          │        │                   │ 6.2.10                    │ org.springframework/spring-webmvc: Spring Framework MVC path │
│                                                     │                │          │        │                   │                           │ traversal vulnerability                                      │
│                                                     │                │          │        │                   │                           │ https://avd.aquasec.com/nvd/cve-2025-41242                   │
└─────────────────────────────────────────────────────┴────────────────┴──────────┴────────┴───────────────────┴───────────────────────────┴──────────────────────────────────────────────────────────────┘
