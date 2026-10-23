#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Ask for username
echo "Enter your username:"
read USERNAME

# Check whether the user exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  # Insert new user into database
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null

  # Get new user ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

else
  # Returning user statistics
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")

  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")

  # Display returning user message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Initialize guess counter
NUMBER_OF_GUESSES=0

# Start the game
echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  # Count the guess
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  # Validate integer input
  if [[ ! $GUESS =~ ^-?[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Compare guess with secret number
  if (( GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"

  elif (( GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"

  else
    # Save completed game
    $PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)" > /dev/null

    # Winning message
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    break
  fi
done
