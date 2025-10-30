plugins {
    java
    application
    id("org.springframework.boot") version "3.2.2"
    id("io.spring.dependency-management") version "1.1.3"
}

group = "itmo.code"
version = "1.0-SNAPSHOT"

application {
    mainClass = "itmo.code.App"
}
repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter")
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-devtools")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
    compileOnly("org.projectlombok:lombok:1.18.30")
    annotationProcessor("org.projectlombok:lombok:1.18.30")
}

tasks.withType<Test> {
    useJUnitPlatform()
}