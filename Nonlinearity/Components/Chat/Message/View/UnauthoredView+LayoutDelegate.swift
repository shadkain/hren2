//
//  Layout.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension ChatMessageUnauthoredView {
    class LayoutDelegate {
        var widthConstraint: NSLayoutConstraint!
        var changingConstraints = [NSLayoutConstraint]()
        private(set) var size: CGSize!
        private(set) var timeWidth: CGFloat!
        private(set) var lastLineWidth: CGFloat!
        private var blocks = [State:() -> Void]()
        private var state: State! {
            didSet {
                if state != oldValue {
                    forceRebuild()
                }
            }
        }
        
        func set(block: @escaping () -> Void, on state: State) {
            blocks[state] = block
        }
        
        func activateConstraints() {
            NSLayoutConstraint.activate(changingConstraints)
        }
        
        func deactivateConstraints() {
            NSLayoutConstraint.deactivate(changingConstraints)
            changingConstraints.removeAll()
        }
        
        func rebuildIfNeeded(messageLabel: UILabel, timeLabel: UILabel) {
            let maxWidth = widthConstraint.constant
            
            timeWidth = timeLabel.textWidth
            let messageTextBreakpoint = maxWidth - (3*spacing.commonH + timeWidth)
            if messageLabel.textWidth < messageTextBreakpoint {
                state = .singleLine
                return
            }
            
            size = messageLabel.estimatedRect(withMaxWidth: maxWidth).size
            lastLineWidth = messageLabel.lastLineWidth(withMaxWidth: maxWidth - 2*spacing.commonH)
            state = lastLineWidth < maxWidth - (timeWidth + 3*spacing.commonH) ?
                .multiLineSame : .multiLineSeparate
        }
        
        func forceRebuild() {
            deactivateConstraints()
            blocks[state]?()
            activateConstraints()
        }

        enum State {
            case singleLine, multiLineSame, multiLineSeparate
        }
    }
}
