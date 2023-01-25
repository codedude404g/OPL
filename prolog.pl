/*module/library*/
:- use_module(lambda).
 
 /*function composition definition*/
compose(F,G, FG) :-
	FG =  \X^Z^(call(G,X,Y), call(F,Y,Z)).
 
/*function to cube an input value*/
cube(X, Y) :-
	Y is X ** 3.

/*function to cube root an input value*/
cube_root(X, Y) :-
	Y is X ** (1/3).

/*main function to test values*/ 
first_class :-
    /*lists of functions and seperate list of inverse functions*/
	L = [sin, cos, cube],
	IL = [asin, acos, cube_root],
    
    /*provided function, maplist, to compose functions in lists L and IL then
    store in Lst, where compose parameter is callable*/
	% we create the composed functions
	maplist(compose, L, IL, Lst),
 
    /*maplist that calls the composed functions in Lst with 3rd parameter
    values and store in R*/
	% we call the functions
	maplist(call, Lst, [0.5,0.5,0.5], R),
 
    /*maplist to use provided function, writeln, on the lists of values from
    the composed functions in Lst*/
	% we display the results
	maplist(writeln, R).