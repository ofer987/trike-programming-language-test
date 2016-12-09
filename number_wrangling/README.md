# Problem 2 - Number Wrangling

## Notes

1. This has only been tested with positive integers and the value 0.
2. Operations that result in division by zero are ignored. They are reported to the log file `log/app.log`. And the results are omitted. So for example, if 100 guesses are requested, but one of them fails for whatever reason (like division by zero), then only 999 guesses will be displayed and reported.

## Instructions

### Command Line

Run `bin/app` with the following arguments:

1. the number of attempts
2. the expected total
3. as many operands (i.e., positive integers) for the calculation

Example:

```sh
bin/app 1000 568762 123 8479543 589345 09 57 5895 284 059 758 10 9238 7485 23 9
```

### API

The **EquationGuesser** class exposes an interface for attempting to guess the solution to list of provided positive integers.

Arguments:

1. Array of positive integers (Array of **Integer**s)
2. Expected total (**Integer**)
3. Number of attempts (**Integer**)

Output:

- Array of results (Array of **Result**)
- prints to STDOUT the string representation of **Result** on each line
- prints to STDOUT the number of guesses and the best guess on one line

```ruby
EquationGuesser.new(array_of_operands, expected_total).guess(number_of_attempts)
```

## Performance

Running the following command:

```shell
bin/app 1000 324 123 7 6 28 3 19 7 10 32 80
```

for a thousand guesses for 10 operands, takes **0.38** seconds on my local computer. My computer is *relatively* modest. It is a 2012 MacBook Air (13 inch) with a 1.8 GHz Intel Core i5 processor and 8 GB of RAM. This is far less than the demanded five seconds.
