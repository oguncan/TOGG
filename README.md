# Flutter GetX Concept TOGG Project

🚀 A Flutter project application that make use of the state manager GetX.

## Resources TOGG Project

- Logging in operation
- Showing registered fields on GoogleMap
- Showing the detail of the marked areas on the map
- Adding the marked areas on the map to favorites
- Displaying the favorite screen to the user
- Having the feature of removing from favorites

## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [Flutter](https://flutter.dev/docs/get-started/install) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone git@github.com:oguncan/TOGG.git

# Go into the repository
$ cd TOGG

# Install dependencies
$ flutter packages get

# Run the app
$ flutter run
```

---

## The project structure

For this project, i focused to solve the problem using only the GetX resources and following the below structure i feel good about the results,  the simplicity to understand the project and its rules.

```yaml
- lib/src/generated
# Proto generated files

- /lib/pages
# This is the folder who we have to get more attention and
# careful to manage the structure becaouse GetX can be used in 
# many different ways, and a wrong way maybe can broken you app 
# in the future, so because that, i defined some rules:
    - /page_name
        # RULE 1: For all pages, we have to create a folder
        # named with our page name where we can create the 
        # appropriate files.
        - screen.dart
        # RULE 2: Design
        - controller.dart
        # RULE 3: Every page, in most of cases, will need to
        # implement a controller to take care about some 
        # particular data and functions for this page. How this 
        # controller is initialized in a GetBuilder on index.
        # dart, it only will be available and alive while this 
        # page is in use, for any other case, this controller 
        # will not be available. 
        - binding.dart   
- lib/utils
# Used for generic purposes the utils implements functions 
# to be used in the most parts of our project without 
# dependencies of other files.

- lib/components

- application.dart

- main.dart
# This file is the point of start of application, it means that 
# if it dispose, the app should closes too. This file has the
# responsability to initialize the GetX context, start our 
# AppController for global purposes and implement all 
# the route screens to allow navigations. Also, to initialize 
# the AppController in this file, i make use of 
# Get.put(AppController()) because the use of named_routes in 
# the GetMaterialApp does not instance any Widget direcly, 
# therefore, it cannot be used with GetBuild.

- lib/router/*
```

---

### Some Screenshots

<img src="https://github.com/oguncan/TOGG/blob/master/assets/one.png" height="300em" /><img src="https://github.com/oguncan/TOGG/blob/master/assets/two.png" height="300em" /><img src="https://github.com/oguncan/TOGG/blob/master/assets/three.png" height="300em" />
<img src="https://github.com/oguncan/TOGG/blob/master/assets/four.png" height="300em" /><img src="https://github.com/oguncan/TOGG/blob/master/assets/five.png" height="300em" /> 


## Contributors

 - [Ogün Can KAYA](https://github.com/oguncan)

## Licenses

This library licensed under the MIT license. This library makes use of code originally developed and licensed by [Ogün Can KAYA](https://github.com/oguncan).

    The MIT License Copyright (c) 2022 Ogün Can KAYA (oguncanlnx@gmail.com)
    
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
    associated documentation files (the "Software"), to deal in the Software without restriction,
    including without limitation the rights to use, copy, modify, merge, publish, distribute,
    sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all copies or
    substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
    NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
