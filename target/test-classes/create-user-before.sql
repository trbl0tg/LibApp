delete from user_role;
delete from usr;
delete from hibernate_sequence;

insert into usr (id,active,password,username) values (1,true,'$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6','admin');

insert into usr (id,active,password,username) values (2,true,'$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6','test');

insert into user_role (user_id, roles)
  values (1,'USER'), (1,'ADMIN'),
         (2,'USER');

insert into hibernate_sequence (next_val) values (5);