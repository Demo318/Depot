# The Depot App

A follow-along project from [*Agile Web Development with Rails 7*](https://pragprog.com/titles/rails7/agile-web-development-with-rails-7/) by [Sam Ruby](https://intertwingly.net/blog/).

As each chapter corrects my bad habits, this repository serves as a reference library for how a Ruby on Rails applications *should* be written.

## Start-Up Procedure

1. Install (or enable, if you're using a version manager) [Ruby 3.3.0](https://www.ruby-lang.org/en/documentation/installation/).

2. Install the [Bundler](https://bundler.io/) gem (if you haven't already) with `$ gem install bundler`.

3. Clone this repo, and navigate to the directory where `Gemfile` is located.

4. Run `$ bundle install` to install dependencies.

5. Run `$ rails server` to start development server, which by default will go live at [http://localhost:3000](http://localhost:3000).

## Rails Reference

Below are a collection of notes I've gleaned from the book along the way.

### Templates

#### Preview Text

Use `truncate()` to only grab the first x number of characters from a string. Useful for displaying *the first 100 chracters* from a blog post, for example.

```RHTML
<%= truncate(article.body, length: 100) %>
```

#### Tables

Use the `cycle()` helper method to add alternating colors row-by-row to a table body. Example:

```RHTML
<table>
  <tfoot>
    <tr>
	  <td></td>
	  ...
	</tr>
  </tfoot>
  <tbody>
    <% @items.each do |item| %>
	  <tr class="<%= cycle('bg-green-50', 'bg-white') %> >
	    <td></td>
		...
	  </tr>
	<% end %>
  </tbody>
</table>
```

### Testing

#### Uniqueness

If after the initial creation of a model you add validations to determine a property on an object needs to be unique in each instance, be sure to modify the `create()` and `update()` tests in `test/controllers/your_controller_name_test.rb` to provide unique arguments where appropriate.

For an example, see the `title:` provided to the `create()` and `update()` tests in `test/controllers/products_controller_test.rb` in this repo. Numbers are appended so as to create a random, unique title for both methods.

#### Validations

Validations should be added to the model inside of `app/models/your_model_name.rb`.

Then tests should be written for each validation inside of `test/models/your_model_name_test.rb`.

Use `assert instance.valid?` for when a test ought to pass validatons and successfully save to the database.

Use `assert instance.invalid?` when validations ought to prevent saving the object.


