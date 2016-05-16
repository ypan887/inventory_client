[![Build Status](https://travis-ci.org/ypan887/inventory_client.svg?branch=master)](https://travis-ci.org/ypan887/inventory_client)
[![Coverage Status](https://coveralls.io/repos/github/ypan887/inventory_client/badge.svg?branch=master)](https://coveralls.io/github/ypan887/inventory_client?branch=master)

# Introduction
This is a client app for my Inventory api. You can find the api [here](https://github.com/ypan887/inventory_api)

Right now, the app is able to interact with categories, products and customers resources from the api. 

You can find a demon version [here](https://inventory-client.herokuapp.com/)

# Installation

To install, clone the code to your local directory

```
bundle install
rails s
```

And you should be able to open it at localhost:3000

# Customization

For convenience, this client app directly interact with the demo api that I deployed on AWS. You may want to clone and deploy your own api first. You change the api server address at `\lib\inventory_api.rb`

```
base_uri "52.37.73.85"  # Change it to your own api server address. For example, "localhost:3000" 
```

# Next

The next step is to add features for shipments, supplies, and statement. When these basic feature are done. I will try refactor the app for better performance and add AJAX support.
