#!/usr/bin/env zsh

START=$1
END=$2

function noOfCommits() {
  git log --no-merges --left-right --cherry-pick --oneline $START...$END | wc -l
}

function noOfCommitsWithMerges() {
  git log --left-right --cherry-pick --oneline $START...$END | wc -l
}

function jsFilesChanged() {
  git diff --stat $START $END **/*.js | tail -n 1
}

function noOfAuthors() {
  git log --left-right --cherry-pick --format="%ae" $START...$END | sort | uniq | wc -l
}

echo """
{
  noOfCommits: $(noOfCommits),
  noOfCommitsWithMerges: $(noOfCommitsWithMerges),
  jsFilesChanged: $(jsFilesChanged),
  noOfAuthors: $(noOfAuthors),
}
"""
