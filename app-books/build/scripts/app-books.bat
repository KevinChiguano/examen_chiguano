@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  app-books startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and APP_BOOKS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\app-books-1.0-SNAPSHOT.jar;%APP_HOME%\lib\helidon-integrations-cdi-datasource-hikaricp-4.0.11.jar;%APP_HOME%\lib\helidon-microprofile-server-4.0.11.jar;%APP_HOME%\lib\jersey-media-json-binding-3.1.7.jar;%APP_HOME%\lib\postgresql-42.7.2.jar;%APP_HOME%\lib\helidon-microprofile-rest-client-4.0.11.jar;%APP_HOME%\lib\helidon-microprofile-cors-4.0.11.jar;%APP_HOME%\lib\consul-api-1.4.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-hibernate-4.0.11.jar;%APP_HOME%\lib\hibernate-core-6.4.4.Final.jar;%APP_HOME%\lib\jakarta.persistence-api-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-jta-weld-4.0.11.jar;%APP_HOME%\lib\weld-jta-5.1.1.SP2.jar;%APP_HOME%\lib\helidon-integrations-cdi-jta-4.0.11.jar;%APP_HOME%\lib\narayana-jta-7.0.0.Final.jar;%APP_HOME%\lib\jboss-transaction-spi-8.0.0.Final.jar;%APP_HOME%\lib\jakarta.resource-api-2.0.0.jar;%APP_HOME%\lib\jakarta.ejb-api-4.0.1.jar;%APP_HOME%\lib\jakarta.transaction-api-2.0.1.jar;%APP_HOME%\lib\helidon-integrations-cdi-jpa-4.0.11.jar;%APP_HOME%\lib\helidon-microprofile-cdi-4.0.11.jar;%APP_HOME%\lib\helidon-webserver-observe-4.0.11.jar;%APP_HOME%\lib\helidon-webserver-static-content-4.0.11.jar;%APP_HOME%\lib\helidon-webserver-context-4.0.11.jar;%APP_HOME%\lib\helidon-webserver-cors-4.0.11.jar;%APP_HOME%\lib\helidon-webserver-4.0.11.jar;%APP_HOME%\lib\helidon-4.0.11.jar;%APP_HOME%\lib\helidon-jersey-common-4.0.11.jar;%APP_HOME%\lib\helidon-jersey-server-4.0.11.jar;%APP_HOME%\lib\helidon-jersey-client-4.0.11.jar;%APP_HOME%\lib\helidon-jersey-media-jsonp-4.0.11.jar;%APP_HOME%\lib\helidon-microprofile-config-4.0.11.jar;%APP_HOME%\lib\helidon-config-yaml-mp-4.0.11.jar;%APP_HOME%\lib\helidon-config-yaml-4.0.11.jar;%APP_HOME%\lib\helidon-config-mp-4.0.11.jar;%APP_HOME%\lib\helidon-config-encryption-4.0.11.jar;%APP_HOME%\lib\helidon-config-object-mapping-4.0.11.jar;%APP_HOME%\lib\helidon-config-4.0.11.jar;%APP_HOME%\lib\weld-se-core-4.0.11.jar;%APP_HOME%\lib\helidon-http-media-jsonp-4.0.11.jar;%APP_HOME%\lib\helidon-http-media-4.0.11.jar;%APP_HOME%\lib\helidon-http-encoding-4.0.11.jar;%APP_HOME%\lib\helidon-cors-4.0.11.jar;%APP_HOME%\lib\helidon-http-4.0.11.jar;%APP_HOME%\lib\helidon-common-tls-4.0.11.jar;%APP_HOME%\lib\helidon-common-key-util-4.0.11.jar;%APP_HOME%\lib\helidon-common-configurable-4.0.11.jar;%APP_HOME%\lib\helidon-common-context-4.0.11.jar;%APP_HOME%\lib\helidon-common-socket-4.0.11.jar;%APP_HOME%\lib\helidon-inject-api-4.0.11.jar;%APP_HOME%\lib\helidon-common-uri-4.0.11.jar;%APP_HOME%\lib\helidon-common-types-4.0.11.jar;%APP_HOME%\lib\helidon-builder-api-4.0.11.jar;%APP_HOME%\lib\helidon-common-features-4.0.11.jar;%APP_HOME%\lib\helidon-logging-common-4.0.11.jar;%APP_HOME%\lib\helidon-common-config-4.0.11.jar;%APP_HOME%\lib\helidon-common-media-type-4.0.11.jar;%APP_HOME%\lib\helidon-common-parameters-4.0.11.jar;%APP_HOME%\lib\helidon-common-mapper-4.0.11.jar;%APP_HOME%\lib\helidon-common-crypto-4.0.11.jar;%APP_HOME%\lib\helidon-common-4.0.11.jar;%APP_HOME%\lib\helidon-common-buffers-4.0.11.jar;%APP_HOME%\lib\helidon-common-security-4.0.11.jar;%APP_HOME%\lib\helidon-common-task-4.0.11.jar;%APP_HOME%\lib\helidon-common-features-api-4.0.11.jar;%APP_HOME%\lib\helidon-integrations-cdi-datasource-4.0.11.jar;%APP_HOME%\lib\helidon-integrations-cdi-configurable-4.0.11.jar;%APP_HOME%\lib\helidon-integrations-cdi-reference-counted-context-4.0.11.jar;%APP_HOME%\lib\helidon-integrations-cdi-delegates-4.0.11.jar;%APP_HOME%\lib\helidon-integrations-jta-jdbc-4.0.11.jar;%APP_HOME%\lib\helidon-integrations-jdbc-4.0.11.jar;%APP_HOME%\lib\jersey-server-3.1.7.jar;%APP_HOME%\lib\jersey-hk2-3.1.7.jar;%APP_HOME%\lib\jersey-media-json-processing-3.1.7.jar;%APP_HOME%\lib\jersey-client-3.1.7.jar;%APP_HOME%\lib\jersey-common-3.1.7.jar;%APP_HOME%\lib\jersey-mp-rest-client-3.1.7.jar;%APP_HOME%\lib\jersey-weld2-se-3.1.7.jar;%APP_HOME%\lib\jersey-cdi1x-3.1.7.jar;%APP_HOME%\lib\jersey-media-sse-3.1.7.jar;%APP_HOME%\lib\jaxb-runtime-4.0.3.jar;%APP_HOME%\lib\jaxb-core-4.0.3.jar;%APP_HOME%\lib\jaxb-impl-4.0.3.jar;%APP_HOME%\lib\jaxb-core-4.0.3.jar;%APP_HOME%\lib\jakarta.xml.bind-api-4.0.0.jar;%APP_HOME%\lib\jakarta.ws.rs-api-3.1.0.jar;%APP_HOME%\lib\weld-lite-extension-translator-5.1.1.SP2.jar;%APP_HOME%\lib\weld-spi-5.0.SP3.jar;%APP_HOME%\lib\weld-api-5.0.SP3.jar;%APP_HOME%\lib\jakarta.enterprise.cdi-api-4.0.1.jar;%APP_HOME%\lib\jakarta.enterprise.lang-model-4.0.1.jar;%APP_HOME%\lib\jakarta.el-api-5.0.1.jar;%APP_HOME%\lib\jakarta.interceptor-api-2.1.0.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar;%APP_HOME%\lib\parsson-1.1.5.jar;%APP_HOME%\lib\jakarta.json-api-2.1.3.jar;%APP_HOME%\lib\jakarta.json.bind-api-3.0.1.jar;%APP_HOME%\lib\angus-activation-2.0.1.jar;%APP_HOME%\lib\jakarta.activation-api-2.1.2.jar;%APP_HOME%\lib\parsson-media-1.1.5.jar;%APP_HOME%\lib\yasson-3.0.3.jar;%APP_HOME%\lib\snakeyaml-2.0.jar;%APP_HOME%\lib\gson-2.9.0.jar;%APP_HOME%\lib\byte-buddy-1.14.14.jar;%APP_HOME%\lib\microprofile-config-api-3.0.3.jar;%APP_HOME%\lib\microprofile-rest-client-api-3.0.1.jar;%APP_HOME%\lib\microprofile-reactive-streams-operators-api-3.0.jar;%APP_HOME%\lib\jandex-3.1.6.jar;%APP_HOME%\lib\HikariCP-5.0.1.jar;%APP_HOME%\lib\slf4j-api-2.0.9.jar;%APP_HOME%\lib\jakarta.validation-api-3.0.2.jar;%APP_HOME%\lib\weld-environment-common-5.1.1.SP2.jar;%APP_HOME%\lib\jboss-classfilewriter-1.3.0.Final.jar;%APP_HOME%\lib\jboss-logging-3.5.3.Final.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\httpclient-4.5.5.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.16.0.jar;%APP_HOME%\lib\checker-qual-3.42.0.jar;%APP_HOME%\lib\httpcore-4.4.9.jar;%APP_HOME%\lib\hibernate-commons-annotations-6.0.6.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\antlr4-runtime-4.13.0.jar;%APP_HOME%\lib\jboss-invocation-2.0.0.Final.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar;%APP_HOME%\lib\weld-core-impl-4.0.11.jar;%APP_HOME%\lib\jboss-logging-processor-2.2.1.Final.jar;%APP_HOME%\lib\hk2-locator-3.0.6.jar;%APP_HOME%\lib\javassist-3.30.2-GA.jar;%APP_HOME%\lib\txw2-4.0.3.jar;%APP_HOME%\lib\istack-commons-runtime-4.1.2.jar;%APP_HOME%\lib\jboss-logging-annotations-2.2.1.Final.jar;%APP_HOME%\lib\jdeparser-2.0.3.Final.jar;%APP_HOME%\lib\hk2-api-3.0.6.jar;%APP_HOME%\lib\aopalliance-repackaged-3.0.6.jar;%APP_HOME%\lib\hk2-utils-3.0.6.jar


@rem Execute app-books
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %APP_BOOKS_OPTS%  -classpath "%CLASSPATH%" com.distribuida.Main %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable APP_BOOKS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%APP_BOOKS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
