Generate a Rails app called "jokes".

- use the latest stable version of Rails and Ruby
- create a database called jokes_development, for the development env, and jokes_production, for the production env, but don't generate any tables for the db yet. You should have only two envs
- development and production.
- create one controller called MainController, and put one action called "ping" in there, and when you point a browser at

```
/ping
```
you will see this json:

```
{
  responses: [
    {
      pong: true
    }
  ]
}
```
so of course you will need a route for `/ping`. It should render only json - no html, no xml.

- Do your best to remove any view logic from the jokes application. No views, no view helpers, no references to views in any config. This doesn't have to be perfect, but let's make sure there are no view directories in the project.

- push your jokes app to github, and post the link here in hipchat
