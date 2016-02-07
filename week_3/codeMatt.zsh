#!/usr/bin/env zsh

function gitCodeMatt() {
  code-matt -c git -l $1 -a $2
}

function authorsAndRevisions() {
  code-matt -l $1 -c git -a authors \
  | csvgrep -c entity -m "lib/"
}

function jsCoupling() {
  code-matt -l $1 -c git -a coupling \
  | csvgrep -c entity -m "lib/"
}

# joinAnalysisForLogs <analysis> <log1> <log2>
function joinAnalysisForLogs() {
  csvjoin -c "entity,entity" \
    <(code-matt -c git -a $1 -l $2) \
    <(code-matt -c git -a $1 -l $3) \
  | csvgrep -c entity -m "lib/" \
  | csvcut -c 1,2,3,5,6
}

