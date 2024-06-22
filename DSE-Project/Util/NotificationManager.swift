//
//  NotificationManager.swift
//  WhatsGoingNearby
//
//  Created by Victor Ordozgoite on 28/02/24.
//

import Foundation
import SwiftUI
import NotificationCenter

@MainActor
class NotificationManager: NSObject, ObservableObject {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    // Comment
    @Published var publicationId: String?
    @Published var isPublicationDisplayed: Bool = false
    
    // Message
    @Published var chatId: String?
    @Published var username: String?
    @Published var senderUserUid: String?
    @Published var chatPic: String?
    @Published var isChatDisplayed: Bool = false
    
    override init() {
        super.init()
        notificationCenter.delegate = self
    }
    
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent _: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let options: UNNotificationPresentationOptions = [.badge, .banner, .sound]
        completionHandler(options)
    }
    
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        NotificationCenter.default.post(
            name: Notification.Name("didReceiveRemoteNotification"),
            object: nil,
            userInfo: userInfo
        )
        completionHandler()
    }
}
