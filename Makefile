dev:
	@echo "Starting Jekyll dev mode"
	bundle exec jekyll serve --livereload --host 0.0.0.0
build:
	jekyll build
