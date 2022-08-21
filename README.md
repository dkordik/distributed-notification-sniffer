# macOS DistributedNotification sniffer

Find out what events apps are publishing!

I primarily used this tool to seek out new media player events to wire up to [dkordik/nowplaying](https://www.npmjs.com/package/nowplaying)

Adapted from https://github.com/JayBrown/NSDNCMonitor - this is the closest I've ever come to touching Objective-C, and just tried to color within the lines of the previous artists :)

## Requirements

- **macOS 11 (Big Sur) or OLDER** (macOS 12 and newer will not work, as wildcard listening with this method was removed on 12+)
- gcc (Presumably from Xcode Command Line Tools)

## Usage

```
  ./build-and-run.sh
```