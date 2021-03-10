# Yelp 

- This project is a clone of the website "Yelp", which deals with writing reviews for different businesses. It is written in Ruby and runs on Rails 6.


## Features
- Login, Registration, Facebook login
- Creating, removing and editing a business
- Creating, removing and editing a review
- Image upload
- Smart search


## Database schema
[![Database schema](https://i.ibb.co/RYYHtQh/Screenshot-from-2021-03-10-08-36-41.png "Database schema")](https://i.ibb.co/RYYHtQh/Screenshot-from-2021-03-10-08-36-41.png "Database schema")



## Example code for calculating  and displaying number of stars to display

```ruby
def blank_stars
    5 - rating.to_i
  end

 <p>
  <strong>Average rating:</strong>
  <%= @business.reviews.average(:rating)%>
</p>
```


