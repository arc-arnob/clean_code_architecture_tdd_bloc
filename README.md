
# Clean Code Architecture with Flutter, BloC in TDD Approach

This is a project that demonstrates how to implement a clean code architecture in Flutter using the Business Logic Component (BloC) pattern and a Test-Driven Development (TDD) approach.

The project is structured according to the principles of clean architecture, with separate layers for presentation, application, domain, and infrastructure. The presentation layer is implemented using Flutter, while the other layers are platform-independent.

The BloC pattern is used to manage the application state and business logic. Each screen in the app has its own BloC, which is responsible for handling user input and updating the UI. The BloCs communicate with the domain layer to perform business logic and with the infrastructure layer to access external services and data sources.

The TDD approach is used to ensure that the code is robust, reliable, and maintainable. Each feature is developed incrementally, with tests written before the code. This helps catch bugs early and ensures that the code is testable, which makes it easier to refactor and maintain over time.

The project includes examples of how to implement common features in Flutter using the BloC pattern, such as navigation, form validation, and data fetch. It also includes unit tests for each feature, demonstrating how to write tests using the Flutter testing framework and the Mockito library.

## Getting Started

To get started with the project, simply clone the repository and run `flutter run` in the project directory. You can also run the tests using the `flutter test` command.

Clean Code Architecture Theory: https://www.freecodecamp.org/news/a-quick-introduction-to-clean-architecture-990c014448d2/
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
    1. Datasources: this one is usually for getting remote (API) data and the other for caching that data. Here we have remote datasource and local datasource. In Simple terms this is the API of your application
    2. Models: This is that transforming raw data (e.g JSON) into Dart objects requires some JSON conversion code. We create Model classes which extend `Entities` and add some specific functionality (toJson, fromJson) or additional fields, like database ID, for example. Simple words, Blueprint of the data our app will work with
    3. Repositories: Repository implementation (the contract comes from the `Domain` layer). This is a place to even fine tune the data, i.e filter, sort, clean and all last moment changes before sending data to business logic layer
4. Presentation: 
    1. Bloc: TODO
    2. Pages: TODO
    3. Widgets: TODO
    
## Contributing

Please raise a small PR


