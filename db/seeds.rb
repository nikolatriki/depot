#---
# Excerpted from "Agile Web Development with Rails 7",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/rails7 for more book information.
#---
# encoding: utf-8

User.create!(name: "admin", password: Rails.application.credentials.admin_password)

Product.delete_all
product_1 = Product.create!(title: "Темјаника Прима",
  description:
    %(<p>
    <em>Суво бело вино со македонско потекло</em> Прозрачната бистрина, аромите на круша, бозел и ананас и средното до лесно тело ја прават <em>Темјаника Прима </em> пример за елеганција.
    </p>),
  image_url: "temjanika.jpg",
  price: 599.00)

  # . . .
  product_2 = Product.create!(title: "Скротен Вранец",
  description:
  %(<p>
  <em> Опремено за уживање</em>,
  црвеното вино Скротен Вранец од винарија Арсов ќе ги освежи вашите чувства. Препорачано за сервирање на 18 степени Целзиусови, ова вино совршено се сложува со разно сирење и апетисани.
  Добра практика е да се чува на најладното место (но не во фрижидер) па после отворањето, за време на пиењето полека ќе се стоплува и ќе ја достигне идеалната температура.
  </p>),
  image_url: "vranec.jpg",
  price: 199.00)
  # . . .

  # Using the Mobility gem to add translations to the products
  I18n.locale = :en
  product_1.title = "Temjanika Prima"
  product_1.description = %(<p><em>Dry white wine of Macedonian origin</em> Translucent clarity, aromas of pear, elderberry and pineapple and medium to light body make <em>Temjanika Prima</em> an example of elegance.
  </p>)
  product_1.save!

  product_2.title = "Skroten Vranec"
  product_2.description = %(<p><em>Ready for enjoyment</em>, the red wine Skroten Vranec from the Arsov winery will refresh your senses. Recommended for serving at 18 degrees Celsius, this wine pairs perfectly with various cheeses and appetizers.
  It is a good practice to keep it in the coolest place (but not in the refrigerator) so after opening, during drinking it will slowly warm up and reach the ideal temperature.
  </p>)
  product_2.save!

# Product.create!(title: "CoffeeScript",
#   description:
#     %(<p>
#       <em>Text-based JavaScript</em>
#       CoffeeScript is JavaScript without the ugly syntax. It’s a
#       programming language that compiles into JavaScript. This book
#       teaches you how to write CoffeeScript, how to test it, and how
#       to build it into a standalone application. Because it’s based on
#       JavaScript, you can use any existing JavaScript library in your
#       CoffeeScript code.
#       </p>),
#   image_url: "cs.jpg",
#   price: 36.00)

# Product.create!(title: "Programming Ruby 1.9 & 2.0",
#   description:
#     %(<p>
#       <em>The Pragmatic Programmers’ Guide</em>
#       Ruby is the fastest growing and most exciting dynamic language
#       out there. If you need to get working programs delivered fast,
#       you should add Ruby to your toolbox.
#       </p>),
#   image_url: "ruby.jpg",
#   price: 49.95)

# Product.create!(title: "Rails Test Prescriptions",
#   description:
#     %(<p>
#       <em>Do you test your Rails applications?</em>
#       This book will help you get started with testing your Rails
#       applications. You’ll learn how to use the built-in testing
#       framework in Rails, how to write unit tests, and how to test
#       your applications with Cucumber and RSpec.
#       </p>),
#   image_url: "rtp.jpg",
#   price: 34.95)

# Product.create!(title: "Agile Web Development with Rails 6",
#   description:
#     %(<p>
#       <em>Learn Rails the way the Rails core team recommends it</em>
#       This book is a step-by-step tutorial to creating a Rails application.
#       It covers the development of a shopping cart application, including
#       tasks like creating a catalog, building a shopping cart, and

# Product.create!(title: "Modern CSS with Tailwind",
#   description:
#     %(<p>
#       <em>Flexible Styling Without the Fuss</em>
#       Tailwind CSS is an exciting new CSS framework that allows you to
#       design your site by composing simple utility classes to create complex
#       effects. With Tailwind, you can style your text, move your items on
#       the page, design complex page layouts, and adapt your design for
#       devices from a phone to a wide-screen monitor. With this book, you’ll
#       learn how to use the Tailwind for its flexibility and its consistency,
#       from the smallest detail of your typography to the entire design of
#       your site.
#       </p>),
#   image_url: "tailwind.jpg",
#   price: 18.95)
