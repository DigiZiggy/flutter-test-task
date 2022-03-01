
## Lightyear front-end test task

### Flutter

First things first, you'll need to set up and get familiar a bit with Flutter. We suggest to use the official guide over at https://docs.flutter.dev/get-started/install

Flutter is very much like React so if you have a background in web and React, picking up Flutter should not be an issue. If you have absolutely no experience with Flutter it would be wise to go through a basic code example, for example: https://docs.flutter.dev/get-started/codelab

### Requirements

The goal of the task is to create an application that has a single screen and lists some news about certain stocks.

- The news data is included in the project in the file `./data/news.json`
- The instrument data can be requested from our public endpoint: https://lightyear.ee/api/v1/instrument -- you will need this to link the news to certain instruments. In news there are only `instrumentIds`, and to get the symbol and company name it needs to be looked up from this data source.
- For the prices, it's OK to generate some random numbers. Some positive and negative ones.
- The brand colors that we use are included in the file `./lib/colors.dart` - there shouldn't be a need to use any other colors.
- The detailed design in figma can be found here: https://www.figma.com/file/rdOB7Eh5lSUMcCStIJdcTn/News

![Stock News Requirements](/requirements/stock_news.png?raw=true)