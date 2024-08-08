module Haskell.Basic where

-- JAF:The function 'listLength' calculates the length of a given list by recursively counting the number of elements. It uses
-- pattern matching to differentiate between an empty list and a non-empty list. For an empty list, it returns 0, and for a
-- non-empty list, it increments the count by 1 and continues with the rest of the list until it reaches the end.
listLength :: [a] -> Int
listLength []     = 0
listLength (_:xs) = 1 + listLength xs

-- JAF:The function 'listReverse' takes a list as input and returns a new list that is the reverse of the input list. It does
-- this by recursively calling itself to reverse the rest of the list (excluding the first element) and then appending the
-- first element to the end of the reversed list.
listReverse :: [a] -> [a]
listReverse []     = []
listReverse (x:xs) = listReverse xs ++ [x]

-- JAF:The function 'listConcat' combines two lists into a single list by appending all elements from the first list 'xs' in
-- front of the second list 'ys'. It does so using the foldr function, which traverses the first list 'xs' from right to
-- left and uses the list cons operator ':' to prepend each element to the second list 'ys'. The result is a new list that
-- begins with the elements of 'xs' followed by those of 'ys'.
listConcat :: [a] -> [a] -> [a]
listConcat xs ys = foldr (:) ys xs

-- JAF:The 'listMap' function is a custom implementation of the 'map' function in Haskell. It applies a given function 'f' to
-- each element of a list, transforming them one by one, and constructs a new list with the results of these applications.
-- The function works recursively: it handles one element of the list at a time, applies the function to it, and then calls
-- itself on the rest of the list.
listMap :: (a -> b) -> [a] -> [b]
listMap _ []     = []
listMap f (x:xs) = f x : listMap f xs

-- JAF:The purpose of this function is to filter a list based on a predicate. The function iteratively checks each element of
-- the list against a predicate function and retains the elements for which the predicate returns true. It is a recursive
-- function that constructs a new list only containing elements that satisfy the predicate condition.
listFilter :: (a -> Bool) -> [a] -> [a]
listFilter _ [] = []
listFilter p (x:xs)
    | p x       = x : listFilter p xs
    | otherwise = listFilter p xs

-- JAF:The function 'listHead' retrieves the head, or first element, of a non-empty list. If the list is empty, it raises an
-- error.
listHead :: [a] -> a
listHead (x:_) = x
listHead []    = error "empty list"

-- JAF:The function 'listTail' takes a list as input and returns the tail of the list, which is the list without the first
-- element. If the input list is empty, the function will throw an error indicating that an empty list does not have a
-- tail.
listTail :: [a] -> [a]
listTail (_:xs) = xs
listTail []     = error "empty list"

-- JAF:The function 'listLast' is designed to retrieve the last element from a non-empty list. It uses recursion to traverse
-- the list until it reaches the last element. If the list is empty, it throws an error.
listLast :: [a] -> a
listLast [x]    = x
listLast (_:xs) = listLast xs
listLast []     = error "empty list"

-- JAF:The 'listTake' function is designed to return the first 'n' elements from a given list. It recursively slices the head
-- of the list until 'n' elements are taken or the list is exhausted.
listTake :: Int -> [a] -> [a]
listTake 0 _      = []
listTake _ []     = []
listTake n (x:xs) = x : listTake (n-1) xs

-- JAF:The function 'listDrop' is a custom implementation of a function that removes the first 'n' elements from a list. If 'n'
-- is zero, it returns the entire list untouched. If the list is already empty, it returns an empty list, regardless of
-- 'n'. Otherwise, it recursively removes one element from the front of the list and decrements the count 'n' until all 'n'
-- elements are removed or the list becomes empty.
listDrop :: Int -> [a] -> [a]
listDrop 0 xs     = xs
listDrop _ []     = []
listDrop n (_:xs) = listDrop (n-1) xs

-- JAF:The function 'listNull' checks whether a given list is empty. If the list is empty, it returns True, indicating the list
-- has no elements. If the list contains at least one element, it returns False.
listNull :: [a] -> Bool
listNull [] = True
listNull _  = False

-- JAF:The function 'stringToUpperCase' converts a given string into uppercase. The conversion is done by mapping each
-- character of the string to a corresponding uppercase character, if it's a lowercase letter. The mapping utilizes a
-- helper function 'toUpper' to perform the actual character transformation.
stringToUpperCase :: String -> String
stringToUpperCase = map toUpper
  where
    toUpper c
        | 'a' <= c && c <= 'z' = toEnum (fromEnum c - 32)
        | otherwise            = c

-- JAF:The function named 'stringToLowerCase' is a utility function that takes a string as input and converts all uppercase
-- letters in that string to their corresponding lowercase letters. It iterates through each character of the string and
-- applies the 'toLower' transformation if necessary.
stringToLowerCase :: String -> String
stringToLowerCase = map toLower
  where
    toLower c
        | 'A' <= c && c <= 'Z' = toEnum (fromEnum c + 32)
        | otherwise            = c

-- JAF:The function 'stringReverse' serves to reverse a given string. It utilizes the helper function 'listReverse' to achieve
-- this, which suggests that it operates on the string as a list of characters.
stringReverse :: String -> String
stringReverse = listReverse

-- JAF:This function is defined to specifically concat strings which are elements in a list. It is an alias for a helper
-- function named listConcat that already exists in the system, implying that listConcat can handle the concatenation of
-- list items that are strings.
stringConcat :: String -> String -> String
stringConcat = listConcat

-- JAF:The function 'stringIsPalindrome' checks if the given string is a palindrome. A palindrome is a word, number, phrase, or
-- other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and
-- capitalization). This function uses the helper function 'stringReverse' to reverse the string and then compares it with
-- the original string to determine if it is a palindrome.
stringIsPalindrome :: String -> Bool
stringIsPalindrome s = s == stringReverse s
