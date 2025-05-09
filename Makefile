.PHONY: test coverage format analyze clean

# Run tests
test:
	fvm flutter test

# Generate and view coverage report
coverage:
	./scripts/check_coverage.sh

# Format code
format:
	fvm dart format .

# Analyze code
analyze:
	fvm flutter analyze

# Clean build artifacts
clean:
	fvm flutter clean
	rm -rf coverage

# Run all checks
check: format analyze test

# Run all checks and generate coverage report
all: format analyze test coverage
