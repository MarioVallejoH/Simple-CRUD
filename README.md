# Test-App (practive)

A new Flutter project.

Documentation for this App maybe it's not the best, i'll work in that if it's necessary. 

Screens (`lib/Screens/`) for app are divided in components (`lib/Screens/Screen/components`), to make app easy to read and understand, components who are commonly used are in folder `lib/components/`.

Bloc folder (`bloc/`) contain two files, one of them are `lib/bloc/validations.dart` who can be used to validate form fields, the other one `lib/bloc/bloc.dart` contain a Bloc class to manage app data using streams.

Models folder (`lib/models/`) contain classes to work with JSON files from server.

Providers folder (`lib/providers/`) contain class and methods to use APIs from server.
