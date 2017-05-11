User.create!([
  {email: "a@gmail.com", encrypted_password: "$2a$11$zNJIvqFW/i6T57q.6g3w8OBJNh6ABxQCHGCGbKX42Oa3QzykGm1OK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2017-05-11 04:43:41", last_sign_in_at: "2017-05-11 04:42:28", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "b@gmail.com", encrypted_password: "$2a$11$z6mCFDgnJbsKHrXCkunyhO4.adBgSMGmxUKQe..jXaJ4REgzY2orK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-05-11 04:42:41", last_sign_in_at: "2017-05-04 16:22:25", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "c@gmail.com", encrypted_password: "$2a$11$NE8m99CdBU7S7wYB10/edO6DsKih.8q3uCk5uOmS.v04LhKmPBpPO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2017-05-11 04:42:53", last_sign_in_at: "2017-05-04 16:25:19", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "d@gmail.com", encrypted_password: "$2a$11$I.m886L4FULdSFxjORw0NuEbA2NxeelYf0jAhVaZerXXBrzF41Iby", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-05-11 04:43:07", last_sign_in_at: "2017-05-04 16:28:25", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "e@gmail.com", encrypted_password: "$2a$11$t5goWPoGCTig9DeytsDPuuuHFd.ZP/NlYRjsDD44yVasJIMQDd9q2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-05-11 04:43:26", last_sign_in_at: "2017-05-04 16:30:26", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Hashtag.create!([
  {styleboard_id: 1, tag: "#love"},
  {styleboard_id: 1, tag: "#life"},
  {styleboard_id: 1, tag: "#sick"}
])
ProfessionalProfile.create!([
  {user_id: 1, message_price: 4},
  {user_id: 2, message_price: 6},
  {user_id: 3, message_price: 8},
  {user_id: 4, message_price: 10},
  {user_id: 5, message_price: 4}
])
Profile.create!([
  {user_id: 1, first_name: "Anderson", last_name: ".Paak", profile_pic: nil, username: "andypaak", bio: "Smooth as a motherfucker,\r\nsuede on the inside. \r\nTell me hat the rims look like"},
  {user_id: 2, first_name: "Mac ", last_name: "Miller", profile_pic: nil, username: "macmiller", bio: "Chillin 4 hour\r\nwatching worldstar\r\n"},
  {user_id: 3, first_name: "A$AP", last_name: "Rocky", profile_pic: nil, username: "asaprocky", bio: "livethroughtthehustlinnnnn\r\nlife's an everyday\r\n(hustle)"},
  {user_id: 4, first_name: "Quentin", last_name: "Tarantino", profile_pic: nil, username: "thefilmaker", bio: "The man\r\nThe myth \r\nTHe legend"},
  {user_id: 5, first_name: "Girl", last_name: "Skater", profile_pic: nil, username: "thegirlskater", bio: "I like riding skateboards\r\nAnd bunning"}
])
Styleboard.create!([
  {user_id: 1, name: "Chill", description: "#love #life #sick", public: false, photo: "tumblr_lwgi5sOHZi1qipxexo1_500.jpg"}
])
