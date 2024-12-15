# Hack.Auth
A centralised auth provider for the Hack Club community

# How does it work?
1. Hackclubbers create applications via a Slack Bot
2. Applications are then manually approved (along with restricted scopes)
3. People then interact with the service via oauth2, Anyone can have an account. but only Hackclubbers can create apps
4. Hack.auth authenticates, and redirects to the requesting service
