//
//  File.swift
//  
//
//  Created by Neil Jain on 11/5/21.
//

import Foundation

public enum AppError: Error, Equatable {
    public static func == (lhs: AppError, rhs: AppError) -> Bool {
        switch (lhs, rhs) {
        case (.canNotParse, .canNotParse):
            return true
        case (.message, .message):
            return true
        case (.emptyData, .emptyData):
            return true
        case (.debugMessage, .debugMessage):
            return true
        case (.notConnected, .notConnected):
            return true
        case (.sessionExpired, .sessionExpired):
            return true
        default:
            return false
        }
    }
    
    case canNotParse
    case message(String?)
    case emptyData(UIImage?, String, String)
    case debugMessage(Any)
    case notConnected
    case sessionExpired
}

public extension AppError {
    var title: String {
        switch self {
        case .canNotParse:
            return ""
        case .emptyData(_, let title, _):
            return title
        case .message:
            return ""
        case .debugMessage:
            return ""
        case .notConnected:
            return ""
        case .sessionExpired:
            return "Session Expired"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .canNotParse, .notConnected:
            return nil
        case .emptyData(let image, _, _):
            return image
        default:
            return nil
        }
    }
    
    var message: String {
        switch self {
        case .canNotParse:
            return "There is something went wrong."
        case .emptyData(_, _, let message):
            return message
        case .message(let string):
            return string ?? "There is something went wrong here."
        case .debugMessage(let any):
            return String(describing: any)
        case .notConnected:
            return "The Internet connection appears to be offline."
        case .sessionExpired:
            return "Please login again to continue."
        }
    }
}

extension AppError: Identifiable {
    public var id: String {
        switch self {
        case .canNotParse:
            return "CanNotParse"
        case .message:
            return "Message"
        case .emptyData:
            return "EmptyData"
        case .debugMessage:
            return "DebugMessage"
        case .notConnected:
            return "NotConnected"
        case .sessionExpired:
            return "SessionExpired"
        }
    }
}

#if canImport(SwiftUI)
import SwiftUI
public extension AppError {
    func alert(defaultAction: @escaping (()->Void) = {}) -> Alert {
        Alert(
            title: Text(self.title),
            message: Text(self.message),
            dismissButton: .default(Text("Ok"), action: defaultAction)
        )
    }
}
#endif

