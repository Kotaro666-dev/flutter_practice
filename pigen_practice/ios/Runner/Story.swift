// Autogenerated from Pigeon (v4.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif


/// Generated class from Pigeon.

///Generated class from Pigeon that represents data sent in messages.
struct Story {
  var title: String? = nil
  var author: String? = nil
  var comments: [Comment?]? = nil
  var rates: Double? = nil
  var year: Int32? = nil
  var isFavorite: Bool? = nil

  static func fromMap(_ map: [String: Any?]) -> Story? {
    let title = map["title"] as? String 
    let author = map["author"] as? String 
    let comments = map["comments"] as? [Comment?] 
    let rates = map["rates"] as? Double 
    let year = map["year"] as? Int32 
    let isFavorite = map["isFavorite"] as? Bool 

    return Story(
      title: title,
      author: author,
      comments: comments,
      rates: rates,
      year: year,
      isFavorite: isFavorite
    )
  }
  func toMap() -> [String: Any?] {
    return [
      "title": title,
      "author": author,
      "comments": comments,
      "rates": rates,
      "year": year,
      "isFavorite": isFavorite
    ]
  }
}

///Generated class from Pigeon that represents data sent in messages.
struct Comment {
  var user: String? = nil
  var body: String? = nil

  static func fromMap(_ map: [String: Any?]) -> Comment? {
    let user = map["user"] as? String 
    let body = map["body"] as? String 

    return Comment(
      user: user,
      body: body
    )
  }
  func toMap() -> [String: Any?] {
    return [
      "user": user,
      "body": body
    ]
  }
}
private class HostStoryApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Comment.fromMap(self.readValue() as! [String: Any])      
      case 129:
        return Story.fromMap(self.readValue() as! [String: Any])      
      default:
        return super.readValue(ofType: type)
      
    }
  }
}
private class HostStoryApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Comment {
      super.writeByte(128)
      super.writeValue(value.toMap())
    } else if let value = value as? Story {
      super.writeByte(129)
      super.writeValue(value.toMap())
    } else {
      super.writeValue(value)
    }
  }
}

private class HostStoryApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return HostStoryApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return HostStoryApiCodecWriter(data: data)
  }
}

class HostStoryApiCodec: FlutterStandardMessageCodec {
  static let shared = HostStoryApiCodec(readerWriter: HostStoryApiCodecReaderWriter())
}

///Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol HostStoryApi {
  func respond() -> Story?
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class HostStoryApiSetup {
  /// The codec used by HostStoryApi.
  static var codec: FlutterStandardMessageCodec { HostStoryApiCodec.shared }
  /// Sets up an instance of `HostStoryApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: HostStoryApi?) {
    let respondChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.HostStoryApi.respond", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      respondChannel.setMessageHandler { _, reply in
        let result = api.respond()
        reply(wrapResult(result))
      }
    } else {
      respondChannel.setMessageHandler(nil)
    }
  }
}

private func wrapResult(_ result: Any?) -> [String: Any?] {
  return ["result": result]
}

private func wrapError(_ error: FlutterError) -> [String: Any?] {
  return [
    "error": [
      "code": error.code,
      "message": error.message,
      "details": error.details
    ]
  ]
}
