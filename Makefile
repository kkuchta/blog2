dev:
	@echo "Starting Jekyll dev mode"
	bundle exec jekyll serve --livereload --host 0.0.0.0
generate-resume-pdf:
	sh build_resume_pdf.sh
build:
	bundle exec jekyll build
install:
	bundle install