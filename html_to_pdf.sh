INFILE=$1
OUTFILE=$2
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
--headless==new \
--print-to-pdf=${OUTFILE} \
--no-pdf-header-footer \
--virtual-time-budget=10000 \
$INFILE 2>&1 