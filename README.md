###To install:

```sh
bundle install
bundle exec rake db:create db:migrate
bundle exec rails s
```

###To use `jokes#index` action for `'/jokes'` route:

First, add a user and some jokes using `seeds.rb` file (or save your own data on `rails console`)

```sh
bundle exec rake db:seed
```
--

Check if it's working correctly. Use `cURL` and `Postman` as here for example:

Use [cURL](http://curl.haxx.se/docs/httpscripting.html)
+ authenticate the user and create a session
+ get the session's token number here

```sh
curl --data "email=user_one@example.com&password=secret" http://localhost:3000/sessions
# => {"id":1,"token":"dc77617f-181f-4de6-95f6-72a3ba4a667f","created_at":"2015-09-02T01:11:49.480Z","updated_at":"2015-09-02T01:11:49.480Z","user_id":1}
```
+ and use the session's token number
+ open `'/jokes'` route now you should get JSON for all jokes

```sh
curl -H "Authorization: Auth dc77617f-181f-4de6-95f6-72a3ba4a667f" http://localhost:3000/jokes
# => [{"id":1,"body":"What happens to a frog's car when it breaks down? It gets toad away."},{"id":2,"body":"My friend thinks he is smart. He told me an onion is the only food that makes you cry, so I threw a coconut at his face."}]
```
Use [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop) chrome app

+ Choose verb `POST` and route `'/sessions'` with URL Parameters: email and password of a saved user.
+ Choose verb `GET` and route `'/jokes'` with a Header: Authorization "Auth <token number>" to get JSON of all jokes listed
