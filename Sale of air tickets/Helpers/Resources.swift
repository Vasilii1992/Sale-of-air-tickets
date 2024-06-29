
import Foundation


enum Resources {
    
    enum TabBar {
        
        enum Name {
            static let airTicketsViewController    = "Авиабилеты"
            static let hotelsViewController        = "Отели"
            static let shortWayViewController      = "Короче"
            static let subscriptionsViewController = "Подписки"
            static let profileViewController       = "Профиль"
        }
        
        enum Image {
            static let airTicketsViewController    = "tickets"
            static let hotelsViewController        = "hotels"
            static let shortWayViewController      = "way"
            static let subscriptionsViewController = "subscriptions"
            static let profileViewController       = "profile"
        }
    }
    
    enum TextField {
        static let charactersIn = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя- "
    }
    
    enum UserDefaults {
        
        enum TextField {
            static let lastFromTextFieldValue = "lastFromTextFieldValue"
            static let lastToTextFieldValue   = "lastToTextFieldValue"
        }
        enum Date {
            static let selectedLeaveDate = "selectedDate"
            static let selectedReturnDate = "selectedReturnDate"

            
        }
        
    }
}
