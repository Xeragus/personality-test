# README
### Video of the app: https://www.loom.com/share/1c1239e91ba848f393b7c761eb105250
This app is a playground app for demonstrating `Rails` practices, techniques and patterns. Besides `Rails`,
special attention is paid to front-end `JS`, while also implementing a `Hotwired Turbo` form.

## Patterns Used
The current app implements the following patterns: `Decorator/Presenter`, `Repository` and `Service`.

## Spec coverage
For spec coverage `simplecov` is used. The app is 99.7% covered. Important note for the reader is that not all possible 
edge cases are covered, and if one tries to find a missing spec scenario, one will definitely find it.

## General note to reader
Read the installation instructions below and run the app. Experiment with the CRUD interface for questions and
answers. Experiment with the `homepage` personality test. Backend structure is designed in a well-organized and
maintainable way. Some of the features are over-engineered only so that some specific point can be made about
code design/architecture.

## Development Environment
### 1. Ruby version
Make sure your machine runs `ruby 3.1.2`. Look into `rbenv` or `rvm` for version management.
### 2. Clone the repo
Clone the repo on your machine.
### 3. Install dependencies
In the app, run `bundle install`.
### 4. Run seeds
The seeder adds base questions & answers data so that you don't have to create them manually if you don't want to.

To seed the database, run `rake db:seed`.

