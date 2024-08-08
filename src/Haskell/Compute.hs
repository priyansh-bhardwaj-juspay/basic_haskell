module Haskell.Compute where

-- JAF:The function 'add' is a simple arithmetic function that takes two arguments and returns their sum.
add :: Num a => a -> a -> a
add a b = a + b

-- JAF:The function 'sub' is a simple subtraction operation that accepts two numeric inputs and returns their difference. The
-- function is binary, meaning it operates on two arguments. The business logic is primarily mathematical subtraction of
-- the second argument from the first.
sub :: Num a => a -> a -> a
sub a b = a - b

-- JAF:The function 'mul' takes two arguments, multiplies them, and returns the product. It is a simple arithmetic operation
-- with a clear purpose: to compute the multiplication of two numbers.
mul :: Num a => a -> a -> a
mul a b = a * b

-- JAF:The function 'div' performs a division operation. It takes two numerical input values and divides the first by the
-- second, returning the result as a floating-point number.
div :: Fractional a => a -> a -> a
div a b = a / b

-- JAF:The function 'modulus' calculates the remainder after division of two integer numbers. The purpose of this function is
-- to perform a modulus operation which is a common mathematical operation used in programming to determine the remainder
-- when one integer is divided by another. In this case, 'modulus' takes two integer inputs and returns their modulus.
modulus :: Integral a => a -> a -> a
modulus a b = a `mod` b

-- JAF:The function 'power' takes two numerical values as arguments and raises the first argument to the power of the second
-- argument, effectively computing a^b.
power :: (Num a, Integral b) => a -> b -> a
power a b = a ^ b

-- JAF:The function 'factorial' is a recursive function that calculates the factorial of a given non-negative integer 'n'. The
-- factorial of a number is the product of all positive integers less than or equal to that number. For example, the
-- factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1, which is 120. The function defines a base case for 0 (0! = 1) and a
-- recursive case for all positive integers.
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- JAF:The function 'gcdd' calculates the greatest common divisor (GCD) of two given integers using Euclid's algorithm.
-- Euclid's algorithm is an efficient method for computing the greatest common divisor of two numbers, which iteratively
-- reduces the problem using the modulo operation until the remainder becomes zero. The GCD is the largest number that
-- divides both inputs without leaving a remainder.
gcdd :: Integral a => a -> a -> a
gcdd a b
    | b == 0    = a
    | otherwise = gcdd b (a `mod` b)

