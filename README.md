# Система сервиса по доставке товаров из Китая

Этот проект представляет собой систему для доставки товаров из Китая с разных торговых площадок (например, Poizon, Taobao, JD.com и другие).
# Функциональные требования:
## 1. Регистрация и авторизация пользователей

### Регистрация пользователя
- Возможность для пользователей создавать учетные записи, указав личные данные, такие как имя, email, номер телефона, адрес доставки.

### Авторизация
- Поддержка стандартной авторизации по логину и паролю.
- Возможность восстановления пароля.

### Учетная запись пользователя
- Ведение профиля с возможностью редактировать личную информацию, контактные данные, историю заказов.

## 2. Поиск и выбор товаров

### Поиск товаров
- Возможность искать товары на разных торговых платформах (например, Poizon, Taobao, JD.com и другие) по различным критериям (название, категория, цена, отзывы).

### Фильтрация товаров
- Фильтрация товаров по цене, категории, рейтингу и другим характеристикам.

### Просмотр товаров
- Информация о товаре, его изображение, описание, цена, срок доставки.

## 3. Добавление товара в корзину

### Корзина покупок
- Возможность добавлять товары в корзину для последующего оформления заказа.

### Редактирование корзины
- Возможность изменения количества товаров в корзине, удаления ненужных товаров, изменения количества выбранных товаров.

## 4. Оформление заказа

### Выбор способа доставки
- Поддержка различных способов доставки из Китая (например, авиа, морская, экспресс-доставка).

### Оплата
- Интеграция с платежными системами для безопасной оплаты (кредитные карты, электронные кошельки, криптовалюты).

### Указание адреса доставки
- Возможность ввода нескольких адресов для доставки, выбор предпочтительного адреса при оформлении заказа.

## 5. Отслеживание заказов

### Статус заказа
- Пользователи могут отслеживать статус заказа (отправлен, в пути, доставлен, а также промежуточные статусы).

### Трек-номер
- Автоматическое получение трек-номера для отслеживания посылки на различных платформах (например, на сайтах перевозчиков).

## 6. Управление возвратами и претензиями

### Возврат товаров
- Возможность оформления возврата товаров в случае повреждения или несоответствия описанию.

### Поддержка
- Возможность задать интересующий вопрос или подать жалобу на товар или доставку (например, несоответствие описанию или задержка доставки).

## 7. Интеграции с внешними системами

### Интеграция с торговыми площадками
- Интеграция с API различных китайских платформ для автоматического получения информации о товарах, ценах и наличии товаров.

### Интеграция с транспортными компаниями
- Автоматическое получение данных о статусе доставки у различных логистических компаний.

## 8. Уведомления

### Уведомления по заказам
- Уведомления по статусу заказа через email, SMS, пуш-уведомления.

### Оповещения о скидках и акциях
- Регулярные уведомления о специальных предложениях, скидках и акциях на товары и доставку.

## 9. Оценка качества товаров и площадок

### Отзывы и рейтинги
- Возможность оставлять отзывы, ставить оценки на основе опыта покупок.

### Фильтрация товаров по рейтингу
- Возможность сортировать товары по рейтингу.

## 10. Административная панель

### Управление пользователями
- Возможность администрирования учетных записей пользователей (блокировка, восстановление доступа).

### Мониторинг заказов
- Статистика по заказам, доставка, возвраты и т.д.

### Управление товарами
- Модерация товаров, добавление новых товаров (через добавление новой площадки).

## 11. Безопасность

### Защита данных
- Шифрование данных пользователей, безопасное хранение и передача информации.
```plantuml
@startuml
entity "Customer" {
  *id : int
  first_name : varchar(50)
  last_name : varchar(50)
  email : varchar(255)
  phone : varchar(10)
}
entity "Address" {
  *id : int
  customer_id : int
  country : varchar(255)
  region : varchar(255)
  city : varchar(255)
  street : varchar(255)
  postal_code : varchar(255)
}
entity "Platform" {
  *id : int
  name : varchar(255)
  api_base_url : varchar(255)
}
entity "Category" {
  *id : int
  name : varchar(255)
}

entity "Product" {
  *id : int
  category_id : int
  platform_id : int
  name : varchar(255)
  price : decimal
  currency : varchar(3)
  available : boolean
}

entity "Cart" {
  *id : int
  customer_id : int
}
entity "CartItem" {
  *cart_id : int
  *product_id : int
  quantity : int
}
entity "Order" {
  *id : int
  customer_id : int
  address_id : int
  shipment_method_id : int
  payment_id : int
  status : varchar(255)
  total_amount : decimal
  currency : varchar(3)
}
entity "OrderItem" {
  *order_id : int
  *product_id : int
  quantity : int
  unit_price : decimal
}
entity "PaymentMethod" {
  *id : int
  name : varchar(255)
  type : varchar(255)
}
entity "Payment" {
  *id : int
  order_id : int
  method_id : int
  amount : decimal
  currency : varchar(3)
  status : varchar(50)
}
entity "LogisticCompany" {
  *id : int
  name : varchar(255)
  api_base_url : varchar(255)
}
entity "ShipmentMethod" {
  *id : int
  name : varchar(255)
  carrier_id : int
  estimated_days : int
}
entity "Shipment" {
  *id : int
  order_id : int
  shipment_method_id : int
  shipped_at : datetime
  estimated_delivery : date
}
entity "TrackingInfo" {
  *id : int
  shipment_id : int
  tracking_number : varchar(255)
}
entity "Return" {
  *id : int
  order_id : int
  reason : text(255)
  status : varchar(255)
}
entity "ReturnItem" {
  *return_id : int
  *order_item_order_id : int
  *order_item_product_id : int
  quantity : int
}
entity "SupportTicket" {
  *id : int
  customer_id : int
  order_id : int
  subject : varchar(255)
  status : varchar(255)
}
entity "TicketMessage" {
  *id : int
  ticket_id : int
  author_type : varchar(255)
  author_id : int
  message : varchar(255)
}
entity "Review" {
  *id : int
  customer_id : int
  product_id : int
  order_id : int
  rating : int
  comment : varchar(255)
}
entity "NotificationType" {
  *id : int
  name : varchar(255)
  channel : varchar(255)
}
entity "NotificationSubscription" {
  *customer_id : int
  *type_id : int
  enabled : boolean
}
entity "Notification" {
  *id : int
  customer_id : int
  type_id : int
  content : text
}
entity "AdminUser" {
  *id : int
  username : varchar(255)
  role : varchar(255)
}
"AdminUser" ||--o{ "Customer" : управляет
"Customer" ||--o{ "Address" : принадлежит
"Customer" ||--o{ "Cart" : принадлежит
"Cart" ||--o{ "CartItem" : содержит
"Customer" ||--o{ "Order" : размещает
"Order" ||--o{ "OrderItem" : содержит
"Product" ||--o{ "CartItem" : содержит
"Product" ||--o{ "OrderItem" : содержит
"Platform" ||--o{ "Product" : предоставляет
"Category" ||--o{ "Product" : категоризирует
"Order" ||--o{ "Payment" : оплачивается
"PaymentMethod" ||--o{ "Payment" : использует
"Order" ||--o{ "Shipment" : доставляется
"ShipmentMethod" ||--o{ "Shipment" : использует
"LogisticCompany" ||--o{ "ShipmentMethod" : использует
"Shipment" ||--o{ "TrackingInfo" : отслеживает
"Order" ||--o{ "Return" : возвращается
"Return" ||--o{ "ReturnItem" : содержит
"OrderItem" ||--o{ "ReturnItem" : возвращается
"Customer" ||--o{ "SupportTicket" : открывается
"SupportTicket" ||--o{ "TicketMessage" : содержит
"Customer" ||--o{ "Review" : пишет
"Product" ||--o{ "Review" : получает
"Order" ||--o{ "Review" : для
"Customer" ||--o{ "NotificationSubscription" : подписывается
"NotificationType" ||--o{ "NotificationSubscription" : определяет
"Customer" ||--o{ "Notification" : получает
"NotificationType" ||--o{ "Notification" : тип
```