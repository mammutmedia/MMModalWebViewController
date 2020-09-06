documentation:
	@jazzy \
		--min-acl internal \
		--github_url 'https://github.com/repo-url' \
		--module-version '0.0.1'
		--no-hide-documentation-coverage \
		--theme fullwidth \
		--output ./docs \
		--documentation=./*.md
	@rm -rf ./build
