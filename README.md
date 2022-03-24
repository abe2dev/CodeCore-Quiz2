# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


----------------------------------------------------------------------------------------------------------------------------
I added this comment to check the new branch "solution" is working on GitHub.
* Initial commit for solution branch!
-----------------------------------------------------------------------------------------------------------------------------
# Web App --> Idea Factory
* mkdir quiz2
* cd quiz2
* rails new IdeaFactory ---> BUILD A NEW WEB APP
* cd IdeaFactory
* git status => ON MAIN BRANCH
* git add .
* git commit -m "Set up new app"
* git remote add origin https://github.com/abe2dev/IdeaFactory.git (THIS ONE DIDN'T WORK) SO WE HAD TO DELETE IT (git remote remove origin)
* git remote add ssh git@github.com:abe2dev/IdeaFactory.git
* git push -u ssh main
* git status 
* git checkout -b solution 
* WE TEST OUR NEW BRANCH BY PUSHING A COMMIT BEEN MADE ON README.md
-----------------------------------------------------------------------------------------------------------
TEST THE VALIDATIONS:
* Run --> rails c
* Model name + .all --> to make sure it's empty, in this quiz we run --> Idea.all
* Model name + create(we pass the validations we put in the migration file), in this quiz --> Idea.create(title:"", description:"hello there!") --> I left the title empty to make sure the validation of the title should be presence is working!
* then we give the variable here a name which in this quiz --> i=Idea.create(title:"", description:"hello there!")
* Then we will run --> i.errors.full_messages --> to see our errors with full messages
---------------------------------------------------------------------------------------------------------------
MODELS:
rails g model user
rails g model idea title:string description:text
rails g model like
rails g model review 
rails g model join
rails g cancan:ability

* WE EDIT OUR VALIDATIONS IF IT'S REQUIRED THEN RUN THE COMMAND "rails db:migrate"


CONTROLLERS: 
rails g controller ideas
rails g controller joins
rails g controller likes
rails g controller reviews
rails g controller sessions
rails g controller users


VIEWS: 
ideas:
_form & edit & idex & new & show.html.erb

sessions:
new.html.erb

users:
new.html.erb


DB/MIGRATE:
* RUN THE "rails db:migrate" after creating them
rails g migration AddUserReferencesToIdea
rails g migration AddIdeaReferencesToReview

