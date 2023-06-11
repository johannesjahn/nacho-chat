# nacho_chat

A flutter chat App for [https://chat.johannes-jahn.com/](https://chat.johannes-jahn.com/).

This is just my playground to try out different new flutter features.
Screenshots from MacOS client.
<image src="./screenshots/login.png" style="max-width:49%; max-height:300px">
<image src="./screenshots/messenger_tablet.png" style="max-width:49%; max-height:300px">
<image src="./screenshots/list_small.png" style="max-width:50%; max-height:300px">
<image src="./screenshots/chat_small.png" style="max-width:50%; max-height:300px">

To run the code generation run:

```shell
flutter pub run build_runner build
```

To create the openapi scaffold run:

```shell
openapi-generator generate -i https://chat.johannes-jahn.com/api-json -g dart-dio -o ./api
```
