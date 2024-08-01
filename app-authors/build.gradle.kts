plugins {
    id("java")
    id("application")
}

group = "com.distribuida"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

application {
    mainClass.set("com.distribuida.Main")
}

dependencies {

    implementation(platform("io.helidon:helidon-dependencies:4.0.11"))

    // Actualiza las dependencias a la versión correspondiente
    implementation("io.helidon.integrations.cdi:helidon-integrations-cdi-datasource-hikaricp:4.0.11")
    implementation("io.helidon.microprofile.server:helidon-microprofile-server:4.0.11")
    implementation("org.glassfish.jersey.media:jersey-media-json-binding:3.0.0")

    runtimeOnly("jakarta.persistence:jakarta.persistence-api:2.2.3")
    runtimeOnly("jakarta.transaction:jakarta.transaction-api:1.3.3")

    runtimeOnly("io.helidon.integrations.cdi:helidon-integrations-cdi-datasource-hikaricp:4.0.11")
    runtimeOnly("io.helidon.integrations.cdi:helidon-integrations-cdi-hibernate:4.0.11")
    runtimeOnly("io.helidon.integrations.cdi:helidon-integrations-cdi-jta-weld:4.0.11")
    runtimeOnly("io.helidon.integrations.cdi:helidon-integrations-cdi-jpa:4.0.11")

    implementation("org.postgresql:postgresql:42.7.2")
    implementation("org.hibernate:hibernate-core:6.4.4.Final")

    implementation("com.ecwid.consul:consul-api:1.4.0")

    //implementation("io.helidon.microprofile:helidon-microprofile-cors:4.0.11")

    implementation("io.helidon.microprofile:helidon-microprofile-cors")
    implementation("org.jboss:jandex:3.1.6")
}



tasks.test {
    useJUnitPlatform()
}

sourceSets {
    main {
        output.setResourcesDir( file("${buildDir}/classes/java/main") )
    }
}

tasks.jar {
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE

    manifest {
        attributes(
            mapOf("Main-Class" to "com.distribuida.Main",
                "Class-Path" to configurations.runtimeClasspath
                    .get()
                    .joinToString(separator = " ") { file ->
                        "${file.name}"
                    })
        )
    }
    configurations.runtimeClasspath.get().map { if (it.isDirectory) it else zipTree(it) }
}


tasks.distTar {
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    configurations.runtimeClasspath.get().map { if (it.isDirectory) it else zipTree(it) }
}

tasks.distZip {
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    configurations.runtimeClasspath.get().map { if (it.isDirectory) it else zipTree(it) }
}

tasks.installDist{
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    configurations.runtimeClasspath.get().map { if (it.isDirectory) it else zipTree(it) }
}

tasks.named<JavaExec>("run") {
    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("com.distribuida.Main")
}




