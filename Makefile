.PHONY: test coverage format analyze clean

test:
	fvm flutter test

coverage:
	./scripts/check_coverage.sh

format:
	fvm dart format .

analyze:
	fvm flutter analyze

clean:
	fvm flutter clean
	rm -rf coverage

# Run all checks
check: format analyze test

# Run all checks and generate coverage report
all: format analyze test coverage
