# Introduction to events

By using events, the programmer will extend without any limitation the possibilities of its application.

By creating a new user, writing a record in the database, publishing a file, ..., he can fire an event "New user created", "Sales record stored in DB", "File xxx published" and let any other piece of code, unknown at design time to answer to that event and "do things".

The core of the program doesn't need to know how many pieces of code will handle the event and doesn't need to know what will be done.

But, the core can also interact with the listeners: fire the event and wait that listeners have done their job then receive f.i. a result like a GO/NOGO (can the user be created?).

Using events will also make the core smaller and more manageable. This will reduce the risk of regression since only listeners needs to be updated (in case of just adding a feature (i.e. a listener)).
