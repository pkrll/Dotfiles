# Recursively remove files
function clean() {
  if [ $# -eq 0 ]; then
    fileToClean=".DS_Store"
  else
    fileToClean=$1
  fi

  c=`find . -type f -name "$fileToClean" -ls -delete | grep -c "$fileToClean"`

  if [ $c -eq 0 ]; then
    echo "Nothing to clean"
  else
    echo "File $fileToClean recursively cleaned"
  fi
}
