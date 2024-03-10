dlcov gen-refs
flutter test --coverage -r github --coverage-path=coverage/lcov.base.info test || exit 1
flutter emulators --cold --launch Medium_Phone_API_34
adb wait-for-device
flutter test --coverage -r github --merge-coverage integration_test -d sdk || (adb emu kill && exit 1)
adb emu kill
dlcov --coverage=80 --include-untested-files=true --log=true
genhtml coverage/lcov.info -o coverage/html
dlcov -c=80
