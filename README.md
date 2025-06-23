# Repro


```shell
fvm install
cd flutter_module/
fvm flutter pub get
```

> [!NOTE]
> You would need to set the development team to run on a real device.

```shell
cd ../ios_fullscreen
pod install
open IOSFullScreen.xcworkspace
# Then, click "Run" in Xcode to launch the app into your device
```

> [!NOTE]
> You could use fvm to switch to 3.24.5 version of Flutter to see how it used to work.

```shell
fvm use 3.24.5
cd flutter_module/
fvm flutter clean
fvm flutter pub get
```
