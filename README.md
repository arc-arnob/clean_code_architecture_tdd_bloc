# clean_code_architecture_tdd_bloc
Flutter Clean Code Architecture Intro project
Clean Code Architecture: https://www.freecodecamp.org/news/a-quick-introduction-to-clean-architecture-990c014448d2/
# Architecture used in this code base
![code_architecture](https://raw.githubusercontent.com/ResoCoder/flutter-tdd-clean-architecture-course/master/architecture-proposal.png)
# Clean Code Architecture
### 1. ![alt](https://cdn-media-1.freecodecamp.org/images/oVVbTLR5gXHgP8Ehlz1qzRm5LLjX9kv2Zri6)
### 2. ![alt](https://cdn-media-1.freecodecamp.org/images/YsN6twE3-4Q4OYpgxoModmx29I8zthQ3f0OR)
# Folder Structure
![alt_text](https://raw.githubusercontent.com/arc-arnob/clean_code_architecture_tdd_bloc/main/reference_images/Screenshot%202023-04-21%20at%2012.53.56%20PM.png)

# Project Structure Explanation:

1. Every "feature" of the app, like getting some interesting trivia about a number, will be divided into 3 layers - presentation, domain and data.
2. Presentation:
    1. This is the stuff you're used to from "unclean" Flutter architecture. 
    2. You obviously need widgets to display something on the screen. These widgets then dispatch events to the state management and listen for states.

3. Domain:
    1. Domain is the inner layer which shouldn't be susceptible to the whims of changing data sources or porting our app to Angular Dart.
    2. It will contain only the core business logic (use cases) and business objects (entities). It should be totally independent of every other layer.
    3. Use Cases are classes which encapsulate all the business logic of a particular use case of the app (e.g. GetConcreteNumberTrivia or GetRandomNumberTrivia).

4. Data:
    1. The data layer consists of a Repository implementation (the contract comes from the domain layer) and data sources - one is usually for getting remote (API) data and the other for caching that data. 
    2. Repository is where you decide if you return fresh or cached data, when to cache it and so on.

## Folder Explanations:

1. Domain
    1. Entities: Business objects (entities) that our application will use
    2. Repositories: Contracts(abstract classes) is defined in `Domain`, knowing that the actual implementation of the Repository in the `Data` layer will fullfill this contract.
    3. Usecases: Containes only business logics
3. Data:
    1. Datasources:
    2. Models: This is that transforming raw data (e.g JSON) into Dart objects requires some JSON conversion code. We create Model classes which extend `Entities` and add some specific functionality (toJson, fromJson) or additional fields, like database ID, for example.
    3. Repositories: Repository implementation (the contract comes from the `Domain` layer)
4. Presentation: 
    1. Bloc: TODO
    2. Pages: TODO
    3. Widgets: TODO


