#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {

  echo "Enter your username:"
  read USERNAME
  GAME_RESULTS=$($PSQL "SELECT * FROM game WHERE username='$USERNAME'")
  NEWUSER=1

  if [[ $GAME_RESULTS ]]
  then
    IFS="|" read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$GAME_RESULTS"
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    NEWUSER=0
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    GAMES_PLAYED=0
    BEST_GAME=0
  fi

  GAME_EXECUTION $USERNAME $GAMES_PLAYED $BEST_GAME $NEWUSER

}

GAME_EXECUTION() {

  USERNAME=$1
  GAMES_PLAYED=$2
  BEST_GAME=$3
  NEWUSER=$4
  CURRENT_GAME_COUNT=0

  RANDOM_NUMBER=$((1 + $RANDOM % 1000))

  echo "Guess the secret number between 1 and 1000:"
  read GUESSED_NUMBER
  CURRENT_GAME_COUNT=$((CURRENT_GAME_COUNT + 1))

  while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]];
  do
    echo "That is not an integer, guess again:"
    read GUESSED_NUMBER
    CURRENT_GAME_COUNT=$((CURRENT_GAME_COUNT + 1))
  done

  while [[ $RANDOM_NUMBER -ne $GUESSED_NUMBER ]];
  do
    if [[ $RANDOM_NUMBER -gt $GUESSED_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      read GUESSED_NUMBER
      CURRENT_GAME_COUNT=$((CURRENT_GAME_COUNT + 1))
      while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]];
      do
        echo "That is not an integer, guess again:"
        read GUESSED_NUMBER
        CURRENT_GAME_COUNT=$((CURRENT_GAME_COUNT + 1))
      done
    elif [[ $RANDOM_NUMBER -lt $GUESSED_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read GUESSED_NUMBER
      CURRENT_GAME_COUNT=$((CURRENT_GAME_COUNT + 1))
      while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]];
      do
        echo "That is not an integer, guess again:"
        read GUESSED_NUMBER
        CURRENT_GAME_COUNT=$((CURRENT_GAME_COUNT + 1))
      done
    fi
  done

  echo "You guessed it in $CURRENT_GAME_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
  if [[ $CURRENT_GAME_COUNT -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
  then
    BEST_GAME=$CURRENT_GAME_COUNT
  else
    BEST_GAME=$BEST_GAME
  fi

  GAMES_PLAYED=$((GAMES_PLAYED+1))

  if [[ $NEWUSER -eq 1 ]]
  then
    ENTER_GAME_RESULTS=$($PSQL "INSERT INTO game VALUES('$USERNAME', $GAMES_PLAYED, $BEST_GAME);")
  else
    ENTER_GAME_RESULTS=$($PSQL "UPDATE game SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';")
  fi

}

MAIN_MENU
