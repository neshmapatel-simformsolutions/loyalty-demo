# Loyalty Program Practical
At it's most basic, the platform offers clients the ability to issue loyalty points to their end users. End users use their points to claim/purchase rewards offered by the client.

To review the practical, follow the steps mentioned below:

clone project using command:

```bash
git clone https://github.com/neshmapatel-simformsolutions/loyalty-demo.git
```

After cloning github repo, checkout to master branch, execute following commands:

```bash
git fetch
```

execute following commands:
1. To install the gems required for the smooth execution, execute:

```bash
bundle install
```

2. Create database in local system,

```bash
rails db:create
```

3. To migrate database files and table related modifications, use command:

```bash
rails db:migrate
```

4. To add dummy data in database to verify the working, run seed file using:

```bash
rails db:seed
```

Or you can use following command to setup database directly,

```bash
rails db:setup
```

You are ready to test with seed data.

To create a new user go to http://localhost:3000/users/sign_up

Add valid details, save the user.

You can create transactions and check the working of the rules specified.

# Release Note
## Brief about test

User makes transactions in his/her native currency or foreign currency. Based on the spendings, they get points. On the basis of the points accumulated by the user, their tier is defined. Customer's or User's tier are predefined; they are

```bash
standard, gold & platinum
```

Users are rewarded based on their spendings focusing on several rules.

## Reward Rules
1. For every $100 the end user spends they receive 10 points

2. If the end user spends any amount of money in a foreign country they receive 2x the standard points

3. If the end user accumulates 100 points in one calendar month they are given a Free Coffee reward

4. A Free Coffee reward is given to all users during their birthday month

5. A 5% Cash Rebate reward is given to all users who have 10 or more transactions that have an amount > $100

6. A Free Movie Tickets reward is given to new users when their spending is > $1000 within 60 days of their first transaction

7. A standard tier customer is an end user who accumulates 0 points

8. A gold tier customer is an end user who accumulates 1000 points

9. A platinum tier customer is an end user who accumulates 5000 points

10. Points expire every year

11. Loyalty tiers are calculated on the highest points in the last 2 cycles

12. Give 4x Airport Lounge Access Reward when a user becomes a gold tier customer

13. Every calendar quarterly give 100 bonus points for any user spending greater than $2000 in that quarter

## Reward Rules Implemented
1. For every $100 the end user spends they receive 10 points

2. If the end user spends any amount of money in a foreign country they receive 2x the standard points

3. If the end user accumulates 100 points in one calendar month they are given a Free Coffee reward

4. A Free Coffee reward is given to all users during their birthday month

5. A Free Movie Tickets reward is given to new users when their spending is > $1000 within 60 days of their first transaction

6. A standard tier customer is an end user who accumulates 0 points

7. A gold tier customer is an end user who accumulates 1000 points

8. A platinum tier customer is an end user who accumulates 5000 points

9. Points expire every year

10. Give 4x Airport Lounge Access Reward when a user becomes a gold tier customer

11. Every calendar quarterly give 100 bonus points for any user spending greater than $2000 in that quarter

## Reward Rules Pending

1. Loyalty tiers are calculated on the highest points in the last 2 cycles

2. A 5% Cash Rebate reward is given to all users who have 10 or more transactions that have an amount > $100

## Assumptions

For certain rewards, currency is assumed to be same for user and transactions. In other words, transactions done by the user in foreign currencies are not taken into consideration; only the native currency of the user is kept in centre while claiming rewards for the user.

The rewards for which the currency assumption is made are as follow:

1. A Free Movie Tickets reward is given to new users when their spending is > $1000 within 60 days of their first transaction

2. Every calendar quarterly give 100 bonus points for any user spending greater than $2000 in that quarter

## Addtional Configuration

For security in rails applications, SecureHeaders gem is configured in the proposed solution with it's default configuarion. This gem will automatically apply several headers that are related to security.
