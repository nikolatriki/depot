#---
# Excerpted from "Agile Web Development with Rails 7",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/rails7 for more book information.
#---
# encoding: utf-8

Product.delete_all
Product.create!(title: "Темјаника Прима",
  description:
    %(<p>
    <em>Суво бело вино со македонско потекло</em> Прозрачната бистрина, аромите на круша, бозел и ананас и средното до лесно тело ја прават <em>Темјаника Прима </em> пример за елеганција.
    </p>),
  image_url: "temjanika.jpg",
  price: 599.00)
# . . .
Product.create!(title: "Скротен Вранец",
  description:
    %(<p>
    <em> Опремено за уживање</em>,
    црвеното вино Скротен Вранец од винарија Арсов ќе ги освежи вашите чувства. Препорачано за сервирање на 18 степени Целзиусови, ова вино совршено се сложува со разно сирење и апетисани.
Добра практика е да се чува на најладното место (но не во фрижидер) па после отворањето, за време на пиењето полека ќе се стоплува и ќе ја достигне идеалната температура.
    </p>),
  image_url: "vranec.jpg",
  price: 199.00)
# . . .

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
