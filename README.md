# Csurfing Exercise

## About

- This repository contains a simple app that has basic (mock) social capabilities.
- It features a user centric view that showcases a person's profile, including a photo, name, and "about me". On this same view the person's friends and posts can be seen.

## Structure

- The app was built using a simple Clean Architecture, containing UI, presentation, domain, and data layers.
- UI layer: Flutter package. Contains all screens, views, and components, including injection points of Blocs.
- Presentation layer: Dart package. Contains all code related to the application, including state management. The app's Blocs are here. Also has wiring file for defining Bloc dependency injection.
- Domain layer: Dart package. Contains entities and data source interface definitions to allow Blocs to access data sources.
- Data layer: Dart package. Contains data source implementations. Also has wiring file for defining data source dependency injection.

## Assumptions

- "User centric view" was interpreted to mean the core pieces of functionality, i.e. profile, friends, and posts, can be done from the same view.
- The app features basic navigation, with the ability to navigate to and from different user profiles (friends).
- Users are randomly created (mocked) when retrieved from the user data source.
- Friends are randomly created (mocked) when retrieved from the friends data source.
  - Users do not have a "friends" property, instead the friends of a user are retrieved from the data source using the user's ID. It is assumed that the backend has a user's friends tied to its ID.
- Posts are randomly created (mocked) when retrieved from the posts data source.
  - Users do not have a "posts" property, instead the posts of a user are retrieved from the data source using the user's ID. It is assumed that the backend has a user's posts tied to its ID.
