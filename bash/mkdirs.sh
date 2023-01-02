#!/bin/bash

# If the directory does not exist yet
if [ ! -d "../generated/codes" ]
then
	mkdir -p "../generated/codes"
fi

if [ ! -d "../generated/csv" ]
then
	mkdir -p "../generated/csv"
fi

if [ ! -d "../generated/aspirations" ]
then
	mkdir -p "../generated/aspirations"
fi

if [ ! -d "../generated/contexts" ]
then
	mkdir -p "../generated/contexts"
fi

if [ ! -d "../generated/dump-html" ]
then
	mkdir -p "../generated/dump-html"
fi

if [ ! -d "../generated/dump-texts" ]
then
	mkdir -p "../generated/dump-texts"
fi

if [ ! -d "../generated/occurrences" ]
then
	mkdir -p "../generated/occurrences"
fi

if [ ! -d "../generated/concordances" ]
then
	mkdir -p "../generated/concordances"
fi

if [ ! -d "../html" ]
then
	mkdir -p "../html"
fi

if [ ! -d "../generated/itramer" ]
then
	mkdir -p "../generated/itramer"
fi
