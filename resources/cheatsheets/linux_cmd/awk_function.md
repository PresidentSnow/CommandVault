# AWK BUILT-IN FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html)
* **ORIGINAL DATE:** 2025/06/23

## NUMERIC FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/Numeric-Functions.html)

* "atan2(y, x)": this function has two arguments. Return the arctangent of 'y / x' in radians.

  * **EXAMPLES:** 'pi = atan2(0, -1)' to retrieve the value of pi.

* "atan(x)": arctangent of 'x'.

* "cos(x)": return the cosine of 'x', with 'x' in radians.

* "exp(x)": return the exponential of 'x(e^x)' or report an error if 'x' is out of range. The range of values 'x' can have depends on your machine's floating-point representation.

* "int(x)": return the nearest integer to 'x', located between 'x' and zero and truncated toward zero. For example, 'int(3)' is 3, 'int(3.9)' is 3, 'int(-3.9)' is -3, 'int(-3) is -3 as well.

* "log(x)": return the natural logarithm of 'x', if 'x' is positive; otherwise, return 'NaN ("not a number")' on IEEE 754 systems. Additionally, gawk prints a warning message when 'x' is negative.

* "rand()": return a random number. The values of 'rand()' are uniformly distributed between zero and one. The value could be zero but is never one. Often random integers are needed instead. Following is user-defined function that can be used to obtain a random non negative integer less than 'n'.

* "sin()": return the sine of 'x', with 'x' in radians.

* "sqrt()": return the positive square root of 'x'. gawk prints a warning message if 'x' is negative. Thus, "sqrt(4)" is 2.

* "srand([x])": set the starting point, or seed, for generating random numbers to the value 'x'.

  * **CAUTION:** in most awk implementations, including gawk, 'rand()' starts generating numbers from the same starting number, or 'seed', each tie you run awk. Thus, a program generates the same results each time you run it. The numbers are random within one awk run but predictable from run to run. This convenient for debugging, but if you want a program to do different things each time it's used, you must change the 'seed' to a value that is different in each run. To do this, use 'srand()'.

* "tan(x)": return the tangent of 'x'.

## I/O FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/I_002fO-Functions.html)

* "print": the most simple way to show text or variables. **ALWAYS** add a line break and for arguments using the OFS (Output Field Separator) value, which by default is a space.

* "printf(format, ...)": just like C, your directly decide exactly how it's printed. It allows you to format numbers, alignment, decimals, etc. It doesn't add a line break unless you add it.
  * **EXAMPLE:**

  ```awk
  printf "%-10s %5.2\n", $1, $2
  ```

* "getline": this doesn't print anything; it's function is to *read*: read the next input line, read a variable, read from a file, or read from a command.

* "close(filenam[,how])": close the file 'filename' for input or output.

* "fflush([filename])": flush and buffered output associated with 'filename', which is either a file opened for writing or a shell command for redirecting output to a pipe or coprocess.

* "systime(command)": execute the operating system command 'command' and then return to the awk program.

## TIME FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/Time-Functions.html)

* "mktime(datespec[, utc-flag])": turn 'datespec' into timestamp in the same form as is returned by 'systie()'. The argument, 'datespec', is a string of the form "YYYY MM DD HH MM SS [DST]". If 'usc-flag' is present and is either nonzero or non-null, the time is assumed to be in the UTC time zone; otherwise, the time is assumed to be in the local time zone.

* "strftime([format[, timestamp[, utc-flag]]])": Format the time specified by 'timestamp' based on the contents of the 'format' string and return the result. It is similar to the function of the same name in ISO C. If 'utc-flag' is present and is either nonzero or non-null, the value is formatted as UTC. Otherwise, the value is formatted for the local time zone. The 'timestamp' is in the same format as the value returned by the 'systime()' function. If no 'timestamp' argument is supplied, gawk uses the current time of day as the timestamp. Without a 'format' argument, 'strftime()' uses the value of "PROCINFO["strftime"] as the format string. The default string value is '%a %b %e %H:%M:%S %Z %Y"'. Also can assign a new value to 'PROCINFO["strftime"]'.

* "systime()": this returns the currently time in seconds since 1970-01-01 00:00:00.

## ARRAY FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/Arrays.html)

* **CAUTION:** a number of functions deal with indices into strings. For these functions, the first character of a string is at position (index) one. This IS DIFFERENT from C and the languages descended from it, where the first character is at position zero.

* "asort(source[, dest[, how]])": sorts the array values and return the array with sorted values and numeric keys.

  * **EXAMPLES:**

* "asorti(source[, dest[, how]])": sort array by index and return the array with sorted index and numeric keys.

  * **EXAMPLES:**

* "how": this is an asort/asorti parameter that controls how to sort array values.
  * These are the types:
    * 1: Lexicographic order ascendant (by default).
    * 2: Numeric order ascendant.
    * 3: Lexicographic order descendant.
    * 4: Numeric order descendant.

## STRING FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html)

* "gensub('regexp', 'replacement', 'how [, target]')": this function is a general substitution function.

  * **EXAMPLES:**

```awk
    $ gawk '
    BEGIN {
        a = "abc def"
        b = gensub(/(.+) (.+)/, "\\2 \\1", "g", a)
        print b
    }'
    - | def abc

    $ echo a b c a b c |
    gawk '{print gensub(/a/, "AA", 2)}'
    - | a b c AA b c
```

* "gsub()": search 'target', leftmost, 'nonoverlapping' matching substrings it can find and replace them with 'replacement'. The 'g' in 'gsub()' stands for 'global', which means replace everywhere.

  * **EXAMPLES:**

```awk
{gsub (/Britain/, "United Kingdom"; print)}
```

* "index(in, find)":

* "length([string])":

* "match(string, regex[, array])": search 'string' for the longest, leftmost substring matched by the regular expression 'regex' and return the characters position ('index') at which that substring begins. If no match is found, return zero.

  * **EXAMPLES:**

```awk
    {
    if ($1 == "FIND")
        regex = $2
    else {
        where = match($0, regex)
        if (where != 0)
            print "Match of", regex, "found at", where, "in", $0
       }
    }

    $ echo foooobazbarrrrr |
    > gawk '{ match($0, /(fo+).+(bar*)/, arr)
    >         print arr[1], arr[2] }'
    -| foooo barrrrr

    $ echo foooobazbarrrrr |
    > gawk '{ match($0, /(fo+).+(bar*)/, arr)
    >           print arr[1], arr[2]
    >           print arr[1, "start"], arr[1, "length"]
    >           print arr[2, "start"], arr[2, "length"]
    > }'
    -| foooo barrrrr
    -| 1 5
    -| 9 7
```

* "patsplit(string, array[, fieldpat[, seps]])":

* "split(string, array[, fieldsep[, seps]])":

* "sprintf(format, expression1, ...)":

* "strtonum(str)":

* "sub(regex, replacement[, target])":

* "substr(string, star[, length]):

* "tolower(string)":

* "toupper(string)":

## BITWISE FUNCTIONS

* **INFO:** [GNU ORG](https://www.gnu.org/software/gawk/manual/html_node/Bitwise-Functions.html)

* "and(v1, v2[,...])":

* "comp(val)":

* "lshift(val, count)":

* "or(v1, v2[, ...])":

* "rshift(val, count)":

* "xor(v1, v2[, ...])":

  * **EXAMPLES:**

```awk
# bits2str --- turn an integer into readable ones and zeros

function bits2str(bits,        data, mask) {
    if (bits == 0)
        return "0"

    mask = 1
    for (; bits != 0; bits = rshift(bits, 1))
        data = (and(bits, mask) ? "1" : "0") data

    while ((length(data) % 8) != 0)
        data = "0" data

    return data
}

BEGIN {
    printf "123 = %s\n", bits2str(123)
    printf "0123 = %s\n", bits2str(0123)
    printf "0x99 = %s\n", bits2str(0x99)
    comp = compl(0x99)
    printf "compl(0x99) = %#x = %s\n", comp, bits2str(comp)
    shift = lshift(0x99, 2)
    printf "lshift(0x99, 2) = %#x = %s\n", shift, bits2str(shift)
    shift = rshift(0x99, 2)
    printf "rshift(0x99, 2) = %#x = %s\n", shift, bits2str(shift)
}
$ gawk -f testbits.awk
-| 123 = 01111011
-| 0123 = 01010011
-| 0x99 = 10011001
-| compl(0x99) = 0x3fffffffffff66 =
-| 00111111111111111111111111111111111111111111111101100110
-| lshift(0x99, 2) = 0x264 = 0000001001100100
-| rshift(0x99, 2) = 0x26 = 00100110
```

## GETTING TYPE INFORMATION FUNCTIONS

* "isarray(x)": return a true value if 'x' is an array. Otherwise, return false.

* "typeof(x)": return one of the following string, depending upon the type of 'x': array, regexp, number, number|bool, string, strnum, unassigned and untyped.

## OTHER FUNCTIONS

* "mkbool": this function is specific to gawk. It's not compatibility... It takes one argument, which is any awk expression, and it returns a value of boolean type.

* "exit(n)":
