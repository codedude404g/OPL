(*function to return the cube of an argument*)
let cube x = x ** 3.;;
(*function to return the cube root of an argument*)
let cbrt x = x ** (1. /. 3.);;
(*lists of functions and seperate list of their inverse functions*)
let functions = [sin; cos; cube];;
let inverses = [asin; acos; cbrt];;
(*test values*)
let () =
  begin
    (*for loop starting at 0 to the length of functions list minus one*)
    for i=0 to (List.length functions)-1 do
      (*Compose functions in both lists at index i and store in result*)
      let result = (List.nth functions i) ((List.nth inverses i) 0.5) in
      (*find the difference of our composition result and the input value*)
      let diff = result-.0.5 in
      (*print the difference of each function composition result from the base value*)
      Printf.printf "Functions %d have a difference of %f\n" i (abs_float(diff))
    done
  end;;
