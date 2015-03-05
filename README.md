PM2-Q2
=======

## Requirements

### Singleton bean
Prepare a singleton bean to store temperature as the code in XXX. Main function of the class is to store today's temperature. Singleton guarantees all the users get the same temperature back.

### REST server
Create a RESTful service for this bean class. You can create a new Web application project (new project java web Web application). Then create a RESTful service from patterns (new others Web services RESTful service from patterns). Select the \Single Root Resource" pattern. The Netbeans IDE creates the resource class for you. Your job is to connect the resource class to this bean class, i.e., develop the getXML(), putXML() methods in the resource class. Then use the test function to test this service.

_Hint: you can load the sample project \HelloWorld RESTful service" in Netbeans IDE and check how this work can be done. You can also start from the other options (other than \Single Root Resource") to implement this function._

### REST client
Create a JavaScript client for this RESTful service. You use JavaScript to send GET and PUT messages to get the temperature and change the temperature. The result screen can be something like in Figure 4.

_Hint:
you do not need complicate functions. Just prepare GET HTTP request and PUT HTTP request with JavaScript code. There are many ways to do this. Suggest you use AJAX to send the request and process the response._
