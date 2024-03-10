dlcov gen-refs
flutter test --coverage -r github --coverage-path=coverage/lcov.base.info test
flutter emulators --cold --launch Medium_Phone_API_34
flutter test --coverage -r github --merge-coverage integration_test -d sdk
dlcov --coverage=80 --include-untested-files=true --log=true
genhtml coverage/lcov.info -o coverage/html
