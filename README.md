# Introduction 
Audit Log Scanner connects to Audit Logging API on Cloudhub, gathers and transforms the logs and pushes to a 3rd party logging system.

# Getting Started
- Copy contents of libs_for_m2 folder to .m2/repository to get dependent libraries
- Import project in Anypoint Studio and run
- Currently project runs on http port and with number 8082

# Build and Test
- To get the current token used: GET http://localhost:8082/api/currenttoken
- Force run caching: GET http://localhost:8082/api/helloworld
- Test a transform: POST http://localhost:8082/api/testTransform

