:- dynamic letter/1.       

letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

do(1) :- display_letters, menu.
do(2) :- add_letter,      menu.
do(3) :- add_top,         menu.
do(4) :- add_bottom,      menu.
do(5) :- delete_letter,   menu.
do(6) :- delete_all,      menu.
do(7) :- write('Goodbye!'), nl.           
do(_) :- write('Invalid choice, try again.'), nl, menu.


display_letters :-
    findall(L, letter(L), Letters),
    write('Current letters: '), write(Letters), nl.


add_letter :-
    write('Enter the letter (lowercase, end with a full stop): '),
    read(L),
    assertz(letter(L)).

add_top :-
    write('Enter the letter (lowercase, end with a full stop): '),
    read(L),
    asserta(letter(L)).

add_bottom :-
    write('Enter the letter (lowercase, end with a full stop): '),
    read(L),
    assertz(letter(L)).


delete_letter :-
    write('Enter the letter to delete: '),
    read(L),
    (   retract(letter(L))
    ->  write('Letter deleted.'), nl
    ;   write('Letter not found.'), nl
    ).

delete_all :-
    retractall(letter(_)),
    write('All letters deleted.'), nl.