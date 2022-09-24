# Bank Tech Test

## Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Technologies Used:

- Ruby(3.1.2)
- Rspec(Testing)
- RVM
- Rubocop(Linter)
- Simplecov(Test Coverage)

## Design:

I decided to use two classes, 'Account' to handle deposits and withdrawals, and 'Statement' to format the transactions into the correct string output to print a bank statement. In order to seperate tasks into functions I created an 'Account' class method called 'perform_transaction' which created and saved either a credit or debit transaction. This meant that my withdrawal and deposit methods only job was to call perform_transactions with the correct value.

The 'Statement' class included various formatting methods such as 'format_date' & 'format_number' allowing me to further split my code into multiple smaller functions only responsible for one thing.

## Setup:

First fork and clone this repository to your local machine.
Then run the following commands from within the project home directory to install the require dependancies:

```bash
bundle install
```

To run the tests, from the parent directory type:

```bash
rspec spec/.
```
