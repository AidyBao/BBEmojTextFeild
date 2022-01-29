//
//  String+Emoj.swift
//  BBEmojTextFeild
//
//  Created by AidyBao on 2022/1/29.
//

import UIKit

extension Character {
    var isSimpleEmoji: Bool {
        guard let firstScalar = unicodeScalars.first else {
            return false
        }
        return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
    }
    var isCombinedIntoEmoji: Bool {
        unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false
    }
    var isEmoji: Bool { isSimpleEmoji || isCombinedIntoEmoji }
}

extension String {
    var isSingleEmoji: Bool {
        return count == 1 && containsEmoji
    }
    var containsEmoji: Bool {//是否包含emoji
        return contains { $0.isEmoji }
    }
    var containsOnlyEmoji: Bool {//是否全是emoji
        return !isEmpty && !contains { !$0.isEmoji }
    }
    var emojiString: String {
        return emojis.map { String($0) }.reduce("", +)
    }
    var emojis: [Character] {
        return filter { $0.isEmoji }
    }
    var emojiScalars: [UnicodeScalar] {
        return filter { $0.isEmoji }.flatMap { $0.unicodeScalars }
    }
    func stringByRemovingEmoji() -> String {//删除字符串中的emoji
        return String(self.filter { !($0.isEmoji) })
    }
}

