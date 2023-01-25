using System;
//program to creat order collect function to real numbers
class Program
{

//adding argument through strung
static void Main(string[] args)
{

//function to the variable
var cube = new Func<double, double>(x => Math.Pow(x, 3.0));
var croot = new Func<double, double>(x => Math.Pow(x, 1 / 3.0));

//bulding function user defined using given functions

var functionTuples = new[]
{
(forward: Math.Sin, backward: Math.Asin),
(forward: Math.Cos, backward: Math.Acos),
(forward: cube, backward: croot)
};
//original value
foreach (var ft in functionTuples)
{
Console.WriteLine(ft.backward(ft.forward(0.5)));
}
}
}