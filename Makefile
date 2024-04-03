.PHONY: gen genAll rebuild check get localize runDev runDevQa runDevStaging lines release apk

# clean project, install dependencies & generate sources
rebuild:
	fvm flutter clean
	fvm flutter packages pub get
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fluttergen -c pubspec.yaml

# generate localizations, dependencies, image assets, colors, fonts
gen:
	fvm dart run build_runner build --delete-conflicting-outputs

get:
	fvm flutter pub get

# generate localizations, dependencies, image assets, colors, fonts
genAll:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm flutter pub run intl_utils:generate
	fvm fluttergen -c pubspec.yaml

# generate localizations
localize:
	fvm dart run intl_utils:generate

# analyze the project
check:
	fvm dart analyze .
	# flutter pub run dart_code_metrics:metrics analyze lib

# flavors
runDev:
	fvm flutter run --flavor dev -t lib/main.dart

runDevQa:
	fvm flutter run --flavor dev -t lib/main_qa.dart

runDevStaging:
	fvm flutter run --flavor dev -t lib/main_staging.dart

release:
	fvm flutter run --release -t lib/main_release.dart

prodRelease:
	fvm flutter run --flavor prod --release -t lib/main_release.dart

apk:
	fvm flutter build apk --release -t lib/main_release.dart

lines:
	find . -name '*.dart' | xargs wc -l

force_upgrade:
	fvm flutter update-packages --force-upgrade
