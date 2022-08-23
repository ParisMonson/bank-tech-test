# bank-tech-test

A basic banking program.

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
