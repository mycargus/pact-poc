# pact-poc

This is an example of using the [Pact](https://github.com/realestate-com-au/pact) gem for consumer-driven contract testing.

If you're new to consumer-driven contract (CDC) testing, then I suggest the following resources:

- [Official Pact documentation](https://docs.pact.io/)
- [Martin Fowler's article on CDC](http://martinfowler.com/articles/consumerDrivenContracts.html#Consumer-drivenContracts)

Note this repo contains two separate projects with their own Gemfiles. In the
real world, of course, the API service and any clients would normally reside
in their own repos.

## Provider: `Quiz API`
###### (resides in the `provider/` directory)

`Quiz API` is our service provider for this example. It's a simple Sinatra app.

I chose not to add a database service, though the Quiz API app would certainly
need one in order to function. I feel the existing code is sufficient for an
example of Pact. If you can't stand failing specs, then feel free to add a
database. :)

## Consumer: `Quiz Web`
###### (resides in the `consumer/` directory)

`Quiz Web` consumes the `Quiz API` service. You can observe its functionality
in the files `consumer/quiz.rb` and `consumer/quiz_service_client.rb`.

## Setup

1. `git clone` this repo to your machine.
2. `cd pact-poc` and familiarize yourself with both the consumer and producer
3. `cd consumer/ && bundle`
4. `cd ../provider/ && bundle`

## Steps to see Pact in action

After having completed the Setup instructions above, you're ready to generate
and verify pacts.

1. Generate your consumer's pact file: `cd consumer/ && bundle exec rspec`
2. Observe the shiny new pact located inside `consumer/spec/pacts/`
3. Also observe the useful logs located inside `consumer/log/`
4. Verify the pact against the provider's API: `cd ../provider/ && bundle exec rake pact:verify`
5. Now observe Pact's auto-generated logs for the provider: `provider/log/`

Because we don't have a running database, the pact verification will fail.
That's OK. Check out the helpful error output in the console! Pact is pretty
awesome. 

This is useful too: `provider/reports/pacts/help.md`.

## Learning Exercises

Open `provider/quiz_api.rb`. See the two defined routes? Try adding an RSpec
specification to the consumer that will generate a pact against the `/` route.
You can get this one to pass without a running database.

## Additional Info

Pact has [Javascript](https://github.com/pact-foundation/pact-js/), Go, Swift, and .NET libraries too, among others. See [https://docs.pact.io/](https://docs.pact.io/) for details.


