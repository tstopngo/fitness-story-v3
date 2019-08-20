# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Logs)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Logs belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Logs has_many Log_Workouts through Workouts)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Logs has_many Log_Workouts through Workouts & Workouts has_many Log_workouts through Logs)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. workouts.amount)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Log, Workouts , Log_Workouts)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. Log.newest URL: /logs/newest)
- [x] Include signup (how e.g. bcrypt)
- [x] Include login (how e.g. bcrypt)
- [x] Include logout (how e.g. bcrypt)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. users/1/logs/new)
- [x] Include form display of validation errors (form URL e.g. /users/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
