[![ADA](https://img.shields.io/badge/Vapor-4.0-blue)]()

## Overview
A simple movie app where you can add a list of review to a specific movie. I create this project to practice using Vapor which is a Server Side Swift Framework to act as a backend service of my app. I also use PostgreSQL as my database from the Vapor Fluent ORM.

## Technology & Style Used
* [Vapor 4.0](https://vapor.codes) (Server-side Swift Framework)
* SwiftUI
* Networking
* PostgreSQL

##  First Setting
* Create database on Postgre
<pre>CREATE DATABASE moviesdb;</pre>

* Edit Project Scheme and change custom working directory to your directory settings
* Check the database setting(username,password,etc) on server's configure file

## Migrations
After the setting is done, proceed with migration on your project directory
<pre>vapor run migrate</pre>

## Error Handling
If you turns on and off the server forcibly, the server may crash. To fix this:
<pre>killAll Run</pre>


# Demo

<img src="MovieAppVapor/appPreview/appPreview.gif" width=250 height=500>
