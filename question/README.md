# Question Generator

This is open-source code repositary of `Question Generator` with dart for those who want to approach
application programming with **Object Oriented** paradigm.

## Question Code

Project file structure are look like this.

```
bin
 - main.dart
 - app.dart
 - model
     - question_model.dart
     - question_generator_model.dart
     - abstract_concept.dart
```

> Abstract Class is for implementing of common functionalities that can be used back by sub-class
> (Child).We can instance abstract class because it is not created for to use as a object. It is for
> providing support for its children concrete class (Normal Class). The one last thing `abstract`
> can perform for you is that abstract can act like a interface pattern

> The defination of interface is simple. It is a degree that describes who you are and what you
> do.If you a shopkepper, then your duties to open shop,exhibit products to customer,and close in
> the evening.(Shopkeeper => 1.Open Shop 2.Sell Products 3.Close Shop ).Shopkeeper is interface that
> define works what you have to do as a shopkeepr. So, if you implement a interface , it is sure you
> have to implement (work) all things it describe.

> Abstract Class can be perform like this interface manner.If you define a method without curly
> bracket, compiler know that this method is abstract method and all children must be implement
> (work) this method in their own respective way. On the other hand , methods with curly bracket in
> abstract class will remain as common provider utility funtions for its sub-class.You can everytime
> use it back.

## Compiled Application File or When you compile application ( .exe )

The compiled application ( CLI ) will be inside `build` folder.

If you want to compile by yourself , navigate this project directory inside your computer and run
this

```
dart compile exe main.dart "build/question.exe"
```
