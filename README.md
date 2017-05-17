# SecurityTest

A demo to test authentication

To test the standard Guardian authentication just go to localhost:4000/users/new
note that authorization levels were not implemented in this demo


The API authentication can be accessed with the following commands

localhost:4000/api/login?email=bob@example.com&password=secret12
should return success with JWT in the HTTP header


 localhost:4000/api/sum  
 with the JWT retrieved from the login inside the HTTP header - should return SUCCESS :)

EXAMPLE with Curl:
curl -H "authorization : Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjEiLCJleHAiOjE0OTc1MTk0MTcsImlhdCI6MTQ5NDkyNzQxNywiaXNzIjoic2VjdXJpdHlfdGVzdCIsImp0aSI6IjY1YWIwNWVhLWYxOWItNDQyNy05ZGU2LTQzYmEzYTQxM2RkZSIsInBlbSI6e30sInN1YiI6IlVzZXI6MSIsInR5cCI6ImFwaSJ9.kIvxDRTANz1_dUg18tvw6e2f5-PfxZLRi0SK35NEjfDpULRQyOGmhxFOfhXuN8GbSLwin3IrNwEFLGYXSzywBw" "http://localhost:4000/api/sum"
