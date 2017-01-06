*Prep App - by Chris Jerret, Lenny Litvak, and Cole Sawyer*

##OVERVIEW:

Prep App is a messaging/social networking app built for the purpose of
facilitating communication between students of a Prep class and between
students and teachers of a Prep class.

##SPECIFICATION:
### Abstract
Prep App will include a way to register your student account as a
member of any classes you are currently enrolled in as a Prep
student.
For any classes you are registered you will be able to enter a group
message with your fellow students or with your teacher to ask questions
about homework assignments, projects, or any other school-related
topics.
<em>The app interfaces with our PHP and SQL based backend, which provides
clean and scalible performance.</em>
<em>The backend runs on a ubuntu web server using a nginx web server.</em>
        
        
### Libaries
In addition to the built in swift libaries Prep App uses use the 
alamofire framework to make both Get and Post request.
        
## Complete
1. Enrolling in classes (Chris)
2. Authentication (Chris)
3. Chat UISs (Cole)
4. Server backend (Chris)
5. Server Communication and JSON Parsing (Lenny)
        
## In Progress
1. Message board for class(Chris and Lenny)
        ..*Allows users to have a class wide chat.
## No Yet Started
1. In app regitration.
2. Teacher only chat.
       
## Blind Spots
1. Would have been helpful if we focued on more advanced UI design, especially constrains and stack views.
2. Web request and netwoeking in swift.
3. Tableviews.

## Resources
1. A web server would have been useful to allow us to deploy the backend easier.    
2. Some way to deploy to app store so we could allow more classmates to test out the app in their devices so we could find more bugs and get user feedback.

## Known bugs
1. Table does not relaod data after enrolling in a class.
2. Requests made using HTTP not HTTPS.
