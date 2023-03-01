dev:
	@echo "Starting Jekyll dev mode"
	bundle exec jekyll serve --livereload
build:
	jekyll build
