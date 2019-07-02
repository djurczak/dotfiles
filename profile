EDITOR=/usr/bin/vim
set -o vi

## tell tmux that terminal supports 256 colors via using -2 switch
## usefulin tmux-in-tmux scenarios
alias tmux='tmux -2'

function hgrep() {
  if [ -z "$1" ]
  then
    history
  else
    history | grep "$@" --color=auto
  fi
}

function rtouch() {
  find . -print0 | xargs -0 touch
}

function strlen() {
  if [ -z "$1" ]
  then
    echo "No string given"
  else
    echo "$@" | ruby -nae 'puts $_.chomp.size'
  fi
}

function bamtot {
  if [ -z "$1" ]
  then
    echo "no BAM file given"
  else
    samtools idxstats $@ | ruby -nae 'BEGIN{total = 0}; total += $F[2].to_i; END{ puts total }'
  fi
}

function bamtot_unmapped {
  if [ -z "$1" ]
  then
    echo "no BAM file given"
  else
    samtools idxstats $@ | ruby -nae 'BEGIN{total = 0}; total += $F[3].to_i; END{ puts total }'
  fi
}

function fastatot {
  if [ -z "$1" ]
  then
    echo "no fasta file given"
  else
    wc -l $@ | ruby -nae 'puts $F[0].to_i / 2'
  fi
}

function qstat-mine {
  echo "qstat for `whoami`"
  qstat -u `whoami`
}

function module-grep {
  module avail -t 2>&1 | grep -i $@
}

alias login1='ssh krnju01@login01.binac.uni-tuebingen.de'
alias login2='ssh krnju01@login02.binac.uni-tuebingen.de'

alias macmini='ssh jurczak@Mac-mini.local'
alias macair='ssh administrator@macbook-air.local'
alias nyx='ssh djurczak@nyx.local'
