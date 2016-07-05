#!/bin/bash

## Usage: create_pdf.sh output-filename
## Creates a PDF document using `pdflatex` from a LaTeX document that is
## passed via STDIN and writes the result to `output-filename`.

log() {
  echo "[`date +'%F %H:%M:%S'`] $1"
}

on_exit() {
  dir=$1
  start_time=$2
  log "removing temporary directory $dir"
  rm -r $dir
  end_time=$(date +%s)
  log "took $((end_time - start_time)) seconds"
}

NUM_RUNS=2

output_filename=$1
if [ -z "$output_filename" ]
then
  grep '^##' $0 | sed -e 's,## ,,'
  exit
fi

start_time=`date +%s`
dir=`mktemp -d`
trap "{ on_exit $dir $start_time; }" EXIT

log "creating $dir/output.tex"
cat > $dir/output.tex

for i in `seq 1 $NUM_RUNS`
do
  log "starting pdflatex run $i.."
  (cd $dir; pdflatex output.tex) >/dev/null 2>&1

  if [ $? -ne 0 ]
  then
    log "failed to created pdf"
    cat $dir/output.log
    exit
  fi
done

log "pdf created at '$output_filename'"
cp $dir/output.pdf $1
