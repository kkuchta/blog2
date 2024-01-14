set -euo pipefail

echo 'building resume pdf'
curl -s localhost:4000/resume > /dev/null || { echo 'ERROR: localhost:4000/resume is not running. Try "make dev"?' ; exit 1; }
echo "✅ Localhost is running"
sh html_to_pdf.sh http://localhost:4000/resume ./resume.pdf
echo "Done bulding resume pdf"