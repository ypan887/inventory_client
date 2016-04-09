[![Build Status](https://travis-ci.org/ypan887/inventory_client.svg?branch=master)](https://travis-ci.org/ypan887/inventory_client)
[![Coverage Status](https://coveralls.io/repos/github/ypan887/inventory_client/badge.svg?branch=master)](https://coveralls.io/github/ypan887/inventory_client?branch=master)

# Introduction
This is an RESTful Api client for my Inventory api. You can find the api [here](https://github.com/ypan887/inventory_api)

Only the customer CRUD operations was complete and tested for now. More features will be added soon.

# Installation

To install, clone the code to you local directory

```
bundle install
rails s
```

And you should be able to open it at localhost:3000

# Customization

For covenience, this client app directly interact with the demo api that I depolyed on AWS. For test, or development for yourself, you can clone and deploy your own api. Just remember to change the api server address in `\lib\inventory_api.rb`

```
base_uri "52.37.73.85"  # Change it to your own api server address. For example, "localhost:3000" if you simply launch the api with rails server
```

