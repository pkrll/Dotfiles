# Go to ioopm folder and update repo

function ioopm() {
  cd ~/Public/Git/IOOPM/
  if [[ $# -gt 0 ]]; then
      if [[ $1 == '-u' ]]; then
          git up
      fi
  fi
}
