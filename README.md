# Mad Lib API

Provides a REST service for creating, updating, and fetching mad libs.  Based on this [kata](https://github.com/jessharrell/madlib-kata).

### Run Tests

Run `dotnet test`.

### Run REST Service

Run `dotnet run --project MadLibApi`.  Use a program like cURL, Insomnia, or Postman to hit endpoints.

Available routes and methods:
    - `GET /madlib`

`pack_ui.sh` copies in the UI into the `static/` directory.  The UI can be accessed at `http://localhost:5000/index.html`.
