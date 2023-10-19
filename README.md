# Product Search App

This app is a POC/MVP for a product search interface.  
It uses Phoenix LiveView for the front end.  
The back end has a GraphQL endpoint that queries a SQLite database.  
The "home" page limits search results to a max of 4 products.  
The "search" page will list all products found.  
The GraphQL endpoint being used, queries each product's name, tags, and description (descriptions are all the same).

Working routes:

- http://localhost:4000/
- http://localhost:4000/search
- http://localhost:4000/gql/graphiql

To start the Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser
