create database flashdeck_db;
use flashdeck_db;
create table users(
	id_user int not null primary key auto_increment, 
	username varchar(50) not null unique, 
	email varchar(100) not null unique,
	password_hash varchar(255) not null, 
	created_at timestamp default current_timestamp
);
create table decks(
	id_deck int not null primary key auto_increment,
    id_user int not null,
    name_deck varchar(100) not null,
    description TEXT,
    created_at timestamp default current_timestamp,
    foreign key (id_user) references users(id_user) on delete cascade
);
create table flashcards(
	id_flashcard int not null primary key auto_increment,
    id_deck int not null,
    front_text text not null,
    back_text text not null,
    created_at timestamp default current_timestamp,
    foreign key (id_deck) references decks(id_deck) on delete cascade
);