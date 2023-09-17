# Food App API

## Introduction

The Food App API is a Ruby on Rails application that provides information about different meals and categories. This API allows users to browse and interact with various meals and categories, making it easy to discover new recipes and culinary inspirations. It is backed by a PostgreSQL database and designed to support CRUD (Create, Read, Update, Delete) operations for meals and categories.

## Features

- Browse and search for different meal recipes.
- Explore meal categories and discover related recipes.
- Create, update, and delete meal records.
- Access detailed information about specific meals and categories.

## Prerequisites

Before running the Food App API, make sure you have the following prerequisites installed:

- Ruby 2.7.4
- Ruby on Rails 6.0
- PostgreSQL 13.0

## Installation

1. Clone the repository to your local machine:

   ```shell
   git clone git@github.com:Muhammad-Zafeer/FoodApp.git


## Usage

1. [Provide details on how to use each API endpoint, including request and response formats.]

2. [Include examples or code snippets for common use cases.]

## API Endpoints
### Categories

- `GET /categories`: Retrieve a list of all food categories.
- `GET /categories/:id`: Retrieve details of a specific food category.
- `POST /categories`: Create a new food category.
- `PUT /categories/:id`: Update an existing food category.
- `DELETE /categories/:id`: Delete a food category.
- `GET /categories/fetch_data`: Fetch and create food categories data.

### Meals

- `GET /meals`: Retrieve a list of all meals.
- `GET /meals/:id`: Retrieve details of a specific meal.
- `POST /meals`: Create a new meal.
- `PUT /meals/:id`: Update an existing meal.
- `DELETE /meals/:id`: Delete a meal.
- `GET /meals/fetch_meals`: Fetch and create meal data.

### Cart Items
- `POST /cart_items/:id/add_meal`: Add a meal to a cart item.

### Shopping Cart

- `POST /shopping_cart`: Create a new shopping cart.
- `GET /shopping_cart/:id`: Retrieve details of a specific shopping cart.
- `PUT /shopping_cart/:id`: Update an existing shopping cart.
- `DELETE /shopping_cart/:id`: Delete a shopping cart.
- `GET /shopping_cart/:id/checkout`: Checkout the shopping cart.
