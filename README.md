### To install:

```sh
bundle install
bundle exec rake db:create db:migrate
bundle exec rails s
```

First, add a user and some jokes using `seeds.rb` file (or save your own data on `rails console`)

```sh
bundle exec rake db:seed
```
--
### Pull Requests, Merging, and PivotalTracker
"Start" a ticket on PivotalTracker and add yourself as an owner

Use the ticket id# to name branches in the following format:
+ feature/ticket_number-INITIALS
+ bugfix/ticket_number-INITIALS

Push branch, open pull request, and "Finish" ticket on PivotalTracker

Once PR is approved, merge PR and "Deliver" ticket on PivotalTracker

Product Manager will Accept or Reject the ticket

--

### To use:

Check if it's working correctly. Use [**cURL**](http://curl.haxx.se/docs/httpscripting.html) and [**Postman**](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop) chrome app here for example:

+ authenticate the user and create a session

#### use `sessions#create` action to generate token for a user

Use cURL

```sh
curl -X POST --data "email=user_one@example.com&password=secret" http://localhost:3000/sessions
# => {"id":1,"token":"dc77617f-181f-4de6-95f6-72a3ba4a667f","created_at":"2015-09-02T01:11:49.480Z","updated_at":"2015-09-02T01:11:49.480Z","user_id":1}
```
Use Postman

Choose verb `POST` and route `'/sessions'` with URL Parameters: email and password of a saved user.

+ and then use the session's token string
+ open `'/jokes'` route now you should get JSON for all jokes

#### use `jokes#index` action for `'/jokes'` route:

Use cURL

```sh
curl -H "Accept: application/json" -H "Authorization: Auth dc77617f-181f-4de6-95f6-72a3ba4a667f" http://localhost:3000/jokes
# => [{"id":1,"body":"What happens to a frog's car when it breaks down? It gets toad away."},{"id":2,"body":"My friend thinks he is smart. He told me an onion is the only food that makes you cry, so I threw a coconut at his face."}]
```
Use Postman

Choose verb `GET` and route `'/jokes'` with the following Headers: 
  Accept		"application/json"
  Authorization "Auth \<token\>" 
to get JSON of all jokes listed

+ delete a user

#### use `users#destroy` action to delete a user

Use cURL

```sh
curl -X DELETE --header "Authorization: Auth dc77617f-181f-4de6-95f6-72a3ba4a667f" http://localhost:3000/users/1
```
Use Postman

Choose verb `DELETE` and route `'/users/1'` with a Header: Authorization as "Auth \<token\>"

#### use `tags#create` action to create a tag

Use cURL

```sh
curl -X POST -H "Accept: application/json" -H "Authorization: Auth 84df3357-aadc-495d-a52a-5c4a041461b0" --data "joke_id=1&tag=test" http://localhost:3000/tags
# => {"id":1,"joke_id":1,"tag":"test","created_at":"2015-09-16T02:55:41.712Z","updated_at":"2015-09-16T02:55:41.712Z"}
```
Use Postman

Choose verb `POST` and route `'/tags'` with the following:
Headers: Accept as "application/json" and Authorization as "Auth \<token\>"
Body: joke_id as integer and tag as string

#### use `tags#update` action to update a tag

Use cURL

```sh
curl -X PUT -H "Accept: application/json" -H "Authorization: Auth 84df3357-aadc-495d-a52a-5c4a041461b0" --data "joke_id=1&tag=update" http://localhost:3000/tags/1
# => {"id":1,"joke_id":1,"tag":"update","created_at":"2015-09-16T02:55:41.712Z","updated_at":"2015-09-16T03:11:08.740Z"}
```
Use Postman

Choose verb `PATCH` and route `'/tags/1'` with the following:
Headers: Accept as "application/json" and Authorization as "Auth \<token\>"
Body: joke_id as integer and tag as string

#### use `tags#delete` action to delete a tag

Use cURL

```sh
curl -X DELETE -H "Accept: application/json" -H "Authorization: Auth 84df3357-aadc-495d-a52a-5c4a041461b0" http://localhost:3000/tags/1
# => {"id":1,"joke_id":1,"tag":"test","created_at":"2015-09-16T02:55:41.712Z","updated_at":"2015-09-16T02:55:41.712Z"}
```
Use Postman

Choose verb `DELETE` and route `'/tags/1'` with the following:
Headers: Accept as "application/json" and Authorization as "Auth \<token\>"
