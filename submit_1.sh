#!/bin/bash

rm log/*
rm output/*
rm error/*

filename=$1

while read -r line; do
  name="$line"
  bash submit_2.sh submit_3.sh $name
done < $filename

