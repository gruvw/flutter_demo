rm -rf ./coverage
dlcov gen-refs

# Flutter only tests
# flutter test --coverage -r github test || exit 1

# Flutter tests + Integration tests
flutter test --coverage -r github --coverage-path=coverage/lcov.base.info test
flutter emulators --launch Medium_Phone_API_34
adb wait-for-device
flutter test --coverage -r github --merge-coverage integration_test -d sdk
adb emu kill

# Show coverage info
genhtml coverage/lcov.info -o coverage/html
dlcov --coverage=80 --include-untested-files=true --log=true
