# flutter-components

## Table of Contents
- [About](#about)
- [Dependencies](#dependencies)
- [Requirements](#requirements)
- [Installation](#installation)
- [Code Contribution](#code-contribution)
- [Widget](#widget)
- [Sample](#sample-data)

## About

**flutter-components** is a library that contains the components that is going to be managed by native libraries.

## Dependencies

## Requirements

- Fvm
- Visual Studio Code or Android Studio

## Installation

In order to compile the component move to the ```lib``` folder then run ```fvm flutter pub get``` once the compilation process
finished you can run the example app.

## Code Contribution

- Define the component to test

On ```main.dart``` file every you should have to define the component that is going to manage the specific widget/screen to the specific
library, to do that you need to replace on the body, the widget that is going to be used, this is the list of current widgets available:
- MoviesView
- MovieDetailsView

```
Widget build(BuildContext context) {
    return ModularApp(
      module: MoviesModule(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movies',
        home: Scaffold(
          drawer: MovieDrawer() ,
          body: /** WIDGET **/,
        ),
      ),
    );
  }
```

- Test the component

The ```drawer``` widget (MovieDrawer) managed all the events to show the specific widget/screen. Every tile has a title and an action.
The title correspond to the widget name and the action call the bloc event required.

## Widget

To add a new widget, it is necessary to perform the following steps, first we need to define its name, once this is defined, we proceed to add it to the library export ```movies.dart```, 
this will allow us to use it in the module.

Each new widget must have the following configured within its initState

```
@override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler((call) async {
      var state = States.values.firstWhere((st) => st.state == call.method);
      switch (state) {
        //Configure the state to call a bloc method.
      }
    });
  }
```

This will allow us to make a call to the block that we have defined and be able to display information within the widget.

## Sample Data

Inside the assets folder, there is the sample folder, which contains three ```.json``` files, which correspond to mocked data to be used for 
movies, genres and cast from each movie.