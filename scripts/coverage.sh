# Setup
rm -rf ./coverage
dlcov gen-refs

# Flutter tests
flutter test --coverage -r github test

# Show coverage info
genhtml coverage/lcov.info -o coverage/html
dlcov -c 80
