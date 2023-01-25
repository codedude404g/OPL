#Merhawi Haile
#Feb 1,2022

from math import (acos, cos, asin, sin)
from inspect import signature
 
 
# main :: IO ()
def main():
    '''Composition of several functions.'''
 
    pwr = flip(curry(pow))
 
    fs = [sin, cos, pwr(3.0), pwr(2.0),convertCToF]
    ifs = [asin, acos, pwr(1 / 3.0), pwr(1 / 2.0),convertFToC]
 
    value = float(input("Enter value: "))

    print("Value of sin, cos, cube, square, C->F degree and these inverse: ")
    
    print([
        f(value) for f in
        zipWith(compose)(fs)(ifs)
    ])
 
# Generic function

def convertFToC(x):
    '''Convert Fahrenheit to Celsius degree'''
    return (x - 32) / 1.8

def convertCToF(x):
    '''Convert Celsius to Fahrenheit degree'''
    return x * 1.8 + 32
 
 
# compose (<<<) :: (b -> c) -> (a -> b) -> a -> c
def compose(g):
    '''Right to left function composition.'''
    return lambda f: lambda x: g(f(x))
 
 
# curry :: ((a, b) -> c) -> a -> b -> c
def curry(f):
    '''A curried function derived
       from an uncurried function.'''
    return lambda a: lambda b: f(a, b)
 
 
# flip :: (a -> b -> c) -> b -> a -> c
def flip(f):
    '''The (curried or uncurried) function f with its
       two arguments reversed.'''
    if 1 < len(signature(f).parameters):
        return lambda a, b: f(b, a)
    else:
        return lambda a: lambda b: f(b)(a)
 
 
# zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
def zipWith(f):
    '''A list constructed by zipping with a
       custom function, rather than with the
       default tuple constructor.'''
    return lambda xs: lambda ys: [
        f(a)(b) for (a, b) in zip(xs, ys)
    ]
 
 
if __name__ == '__main__':
    main()
