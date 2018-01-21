### airplane.ci deployment target setup, sync fly and login

#### setup

- install lastpass cli
- add a lastpass site entry with information taken from the airplane.ci deployments page

USERNAME - your airplane.ci deployment user
PASSWORD - your airplane.ci deployment password
URL - your airplane.ci deployment url
NOTES - your airplane.ci caCert.pem inline content

#### usage

`./login.sh` # log in to `airplane` target and team `main`

`./login.sh airplane main` # log in to `airplane` target and `main` team

`./login.sh ci dev` # log in to `ci` target and `dev` team

#### service

Airplane CI - Hosted Concourse CI
