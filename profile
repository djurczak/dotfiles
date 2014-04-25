EDITOR=/usr/bin/vim
set -o vi

## old cluster
#if [ `hostname` != "piwi" ]; then
#  source /sw/lenny/etc/brenneckegrp.bash
#  source /sw/lenny/etc/openmpi.bash
#fi

#if [ `hostname` = "piwi" ]; then
  [ -s "/usr/local/rvm/scripts/rvm" ] && . "/usr/local/rvm/scripts/rvm"
#fi

  module add gridengine-client
  module add brennecke.grp
#  module add openmpi

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

function bamidxtot {
  if [ -z "$1" ]
  then
    echo "no BAM file given"
  else
    samtools idxstats $@ | ruby -nae 'BEGIN{total = 0}; total += $F[2].to_i; END{ puts total }'
  fi
}

function bamidxtot_unmapped {
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
    wc -l $@ | ruby -nae '$F[0].to_i /2'
  fi
}
