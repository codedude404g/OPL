--Peter Nguyen
--This program is from rossettacode.org/wiki/First-class_functions#Ada
--To run program (in linux) using gcc and gnat:
--compile with command: gcc -c first_class_functions.adb
--bind file: gnatbind first_class_functions
--link file: gnatlink first_class_functions
--run exe: ./first_class_functions

--Libraries
with Ada.Float_Text_IO,
     Ada.Integer_Text_IO,
     Ada.Text_IO,
     Ada.Numerics.Elementary_Functions;

--Procedure
procedure First_Class_Functions is
    --Using libraries
   use Ada.Float_Text_IO,
       Ada.Integer_Text_IO,
       Ada.Text_IO,
       Ada.Numerics.Elementary_Functions;

    --User defined Sqr function that takes in a Float and returns the Float cubed (ignore name)
   function Sqr (X : Float) return Float is
   begin
      return X ** 3;
   end Sqr;

    --Define new function to find cube root 
    function Cube (X: Float) return Float is
    begin
      return X ** (1.0/3.0);
    end Cube;

    --Declare A_Function with access and is a function that returns a float
   type A_Function is access function (X : Float) return Float;
 
    --Generic variables of type A_Function
   generic
      F, G : A_Function;

    --Declare Compose function 
   function Compose (X : Float) return Float;
    
    --Definition of Compose that accepts a Float and returns a float
   function Compose (X : Float) return Float is
   begin
       --return A_Function, F, with G(X) (Another A_Function) passed as argument
      return F (G (X));
   end Compose;
 
    --An array that stores type A_Function filled with Sin, Cos, and Sqr functions
   Functions : array (Positive range <>) of A_Function := (Sin'Access,
                                                           Cos'Access,
                                                           Sqr'Access);
     --An array that stores type A_Function with the inverse functions inside Functions
   Inverses  : array (Positive range <>) of A_Function := (Arcsin'Access,
                                                           Arccos'Access,
                                                           Cube'Access);

--beginning of procedure/main
begin
    --For loop that iterates through number of elements in Functions array 
    --where I is an int
   for I in Functions'Range loop
        --Declarative part of loop
      declare
          --Function that dynamically allocates new memory from Compose function
          --
         function Identity is new Compose (Functions (I), Inverses (I));
          --Testiong program with value 0.5 and declare a result variable
         Test_Value : Float := 0.5;
         Result     : Float;
       --begin main part of loop
      begin
         --Assign Result variable to value from Identity function
         Result := Identity (Test_Value);
         
         --if statement that checks Result value should be equal to input value
         if Result = Test_Value then
            Put      ("Example ");
            Put      (I, Width => 0);
            Put_Line (" is perfect for the given test value.");
         --else the Result value differs from input value and show by how much
         else
            Put      ("Example ");
            Put      (I, Width => 0);
            Put      (" is off by");
            Put      (abs (Result - Test_Value));
            Put_Line (" for the given test value.");
         --end statements
         end if;
      end;
   end loop;
end First_Class_Functions;