# Overview
1. App brief for ReSUS
2. Requirements
3. Wireframing & workflow diagram
4. User stories
5. DB Schema
6. Current bugs, future updates and others.
7. Coding and current bugs

---
## 1. App brief for Stylr
My app is to help who want to improve or explore fashion styles. Though Instagram does help with showing different peoples styles, and Pinterest helps in enabling a particular person organise all those styles, fashion is far more complicated than single hashtag searches or board captions. I wanted to make an app that tries to address the nuance of fashion and allow others to reach out to people who are fashion expert and allow said expert to get paid.

I came up with the idea of having styleboards having different photos. The styleboards can be upvoted and downvoted on so that users know which styles are popular(similar to reddit). Then each photo can be upvoted and downvoted on so users can see what is popular in terms of photos. Comments on photos will help the stylist to see what is popular and not.

Link : [My app on Heroku](stylr-app.herokuapp.com)

---
## 2. Requirements

[Project requirements](https://s3-ap-southeast-2.amazonaws.com/stylrphotos/Photos/rails-checklist+(1).png)

---
## 3. Wireframing and diagrams
I used Figma to create my wireframes, and dbdesigner to create my database schema.
dbdesigner Wireframes

[Trello](https://trello.com/b/435wq8id/stylr)
[Figma wireframes](https://trello.com/b/435wq8id/stylr)

---

## 4. User stories

1. As a stylist, I want to be able to explore different styles, so I can have a more rounded style palette.
2. As a curious teenager, I would like to see different different styles, in order to expand the clothes i wear.
3. As a rich clothing wearer, I would like to see different clothing styles, iso that I can wear more clothes that suit me.
4. As a consumer, I want to get advice about what I should wear based on my current style, so that I can dress better.
5. As a model/hype beast, I want to see what styles are fashionable, so I don't get left behind.
6. As a papa who is fashionable but in the wrong way, I want to see what the other papas in the world are wearing, so that I can expand my wardrobe a little bit.
7. As a fan of a fashion icon, I want to be able to see what my fashion icon wears, so i can be a little more like them.
8. As a business, I want users wearing out product, to be able to link that to our product, so that people know exactly which of our products people are wearing/using.
9. As a business, I want to be able to  be able to see who is wearing which of our products, so that we know which of our products is trending/most popular.
10. As a stylist, I want to help people create styles and get money doing it,   so that I have another platform to sell my goods.
11. As a consumer, I want to be able to rate different photos and styleboards, so that I know whats 'hot or not'


---
## 5. DB Schema

![Dbdesigner](https://s3-ap-southeast-2.amazonaws.com/stylrphotos/Photos/download-1.png)

---
## 6. Tools used

1. Trello - [Link to Trello](https://trello.com/b/435wq8id/stylr)  
2. DB designer - [Link to DB Designer](https://dbdesigner.net/designer/schema/56751)
3. Figma for wireframing
4. Gem : Devise, S3, Stripe, Mailgun, seed-dump, Carrierwave (for image uploads)

__Notes__ :   
Trello was used as a project planning too and also to keep track of ongoing changes and updates.


---
## 8. Current bugs, future updates and others.

* Coding  
  1. More reliable hashtagging, especially for updating image captions.
  2. Styling is non existent. Would like to have more styling (as a fashion app one might say its necessary...)(Styleboards look clunky aswell as like buttons, no styling on most form views )
  3. Styleboards are a
  4. Have a nicer UX, link pathing etc.

* Bugs  
  1. Sometimes hashtags wouldn't record properly


* Future updates  
  1. New message notifications
  2. Follower update notification
  3. Not just limited to clothes but also interior design, house design, websites ie.anyting with styling
  4. More than one type of consultation e.g. Videocall or appointment arrangement
  5. Devise email confirmation

---
