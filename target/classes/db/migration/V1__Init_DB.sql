create table hibernate_sequence (next_val bigint) engine=MyISAM;

create table book (
    id bigint not null auto_increment,
    book_author varchar(255),
    book_name varchar(255) not null,
    book_details varchar(255),
    filename varchar(255),
    published_in varchar(255),
    tag varchar(255),
    user_id bigint,
    primary key (id)
) engine=MyISAM;

create table user_role (
    user_id bigint not null,
    roles varchar(255)
) engine=MyISAM;

create table usr (
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
) engine=MyISAM;

alter table book
    add constraint book_user_fk
    foreign key (user_id) references usr (id);


alter table user_role
    add constraint user_role_fk
    foreign key (user_id) references usr (id)