# Bank Tech Test


### Test Requirements

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

# Technologies Used:

- Ruby(3.1.2)
- Rspec(Testing)
- RVM
- Rubocop(Linter)
- Simplecov(Test Coverage)

# Design:

I decided to use one class called 'Account' to handle deposits, withdrawals and statements. I felt that this was not too much for one class to handle.

The 'deposit' and 'withdraw' methods only job was to create a transaction record hash and store it in an array.
The 'statement' methods jobs was to print the records from the transaction array into an easy to read string format.

# Setup:

First fork and clone this repository to your local machine.
Then run the following commands from within the project home directory to install the require dependancies:

```bash
bundle install
```

To run the tests, from the parent directory type:

```bash
rspec spec/.
```
