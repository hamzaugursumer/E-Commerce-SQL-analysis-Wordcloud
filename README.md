# 📑 **SQL Capstone Project - Brazilian E-Commerce Public Dataset by Olist**

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/blob/main/dataset-cover.png)

## 📌 **Veri Seti Hakkında**
Olist'ten Brezilya E-Ticaret Kamu Veri Seti
Hoş geldiniz! Bu, Olist Store'da yapılan siparişlerin Brezilya e-ticaret genel veri kümesidir. Veri kümesi, 2016'dan 2018'e kadar Brezilya'daki birden fazla pazar yerinde yapılan 100 bin siparişin bilgisine sahiptir. Özellikleri, bir siparişi birden fazla boyuttan görüntülemeye olanak tanır: sipariş durumu, fiyat, ödeme ve nakliye performansından müşteri konumuna, ürün özelliklerine ve son olarak müşteriler tarafından yazılan incelemelere kadar. Ayrıca Brezilya posta kodlarını enlem/boylam koordinatlarıyla ilişkilendiren bir coğrafi konum veri seti de yayınladık.
Bu gerçek ticari verilerdir, anonimleştirilmiştir ve inceleme metnindeki şirketlere ve ortaklara yapılan atıflar Game of Thrones'un büyük evlerinin isimleriyle değiştirilmiştir.

## 📌 **İçerik**
Bu veri seti, Brezilya'daki pazar yerlerinin en büyük mağazası olan Olist tarafından cömertçe sağlanmıştır. Olist, Brezilya'nın her yerinden küçük işletmeleri sorunsuz ve tek bir sözleşmeyle kanallara bağlar. Bu tüccarlar ürünlerini Olist Store üzerinden satabilir ve Olist lojistik ortaklarını kullanarak doğrudan müşterilere gönderebilirler. Web sitemizde daha fazlasını görün: www.olist.com

Bir müşteri Olist Store'dan ürün satın aldıktan sonra satıcıya siparişi yerine getirmesi için bildirim gönderilir. Müşteri ürünü teslim aldığında veya tahmini teslimat tarihi geldiğinde, müşteri e-posta ile satın alma deneyimi için not verebileceği ve bazı yorumlar yazabileceği bir memnuniyet anketi alır.

## 📌 **Dikkat**
Bir siparişte birden fazla ürün olabilir.
Her bir ürün farklı bir satıcı tarafından gönderilebilir.
Mağazaları ve ortakları tanımlayan tüm metinler Game of Thrones'un büyük evlerinin isimleriyle değiştirildi.

![image](https://i.imgur.com/JuJMns1.png)

## 📌 **Veri Şeması**

![image](https://i.imgur.com/HRhd2Y0.png)
* **Veri Seti toplamda 9 tane CSV dosyasından ve 52 adet sütundan oluşmaktadır.**

# 🚀 **Veri Seti**

🔴 **"Customers" Veri Kümesi**

Bu veri kümesi müşteri ve konumu hakkında bilgi içerir. Siparişler veri kümesindeki benzersiz müşterileri tanımlamak ve siparişlerin teslimat konumunu bulmak için kullanın.
Sistemimizde her sipariş benzersiz bir customer_id'ye atanır. Bu, aynı müşterinin farklı siparişler için farklı kimlikler alacağı anlamına gelir. Veri kümesinde bir customer_unique_id'ye sahip olmanın amacı, mağazada yeniden satın alma yapan müşterileri tanımlamanıza olanak sağlamaktır. Aksi takdirde, her siparişin farklı bir müşteriyle ilişkilendirildiğini görürsünüz.

| Column Name               | Description                                           |
|---------------------------|-------------------------------------------------------|
| customer_id                | Key to the orders dataset. Each order has a unique customer_id  |
| customer_unique_id         | Unique identifier of a customer.                      |
| customer_zip_code_prefix  | The first five digits of the customer's zip code.    |
| customer_city             | The city name of the customer.                        |
| customer_state            | The state of the customer.                            |

🔴 **"Geolocations" Veri Kümesi**

Bu veri kümesi Brezilya posta kodları ve enlem/boylam koordinatları bilgisine sahiptir. Haritaları çizmek ve satıcılar ile müşteriler arasındaki mesafeleri bulmak için kullanın.

| Column Name               | Description                                           |
|---------------------------|-------------------------------------------------------|
| geolocation_zip_code_prefix| The first five digits of the zip code.               |
| geolocation_lat           | The latitude coordinates.                             |
| geolocation_lng           | The longitude coordinates.                            |
| geolocation_city          | The name of the city.                                 |
| geolocation_state         | The state or region.                                  |

🔴 **"Order Items" Veri Kümesi**

Bu veri kümesi, her bir siparişte satın alınan ürünlerle ilgili verileri içerir.

Örnek:

order_id = 00143d0f86d6fbd9f9b38ab440ac16f5 3 ürüne sahiptir (aynı ürün). Her ürünün değeri, ölçülerine ve ağırlığına göre hesaplanır. Her sipariş için toplam değerini elde etmek için sadece toplamanız gerekir.

Toplam order_item değeri: 21.33 * 3 = 63.99

Toplam navlun değeri: 15,10 * 3 = 45,30

Toplam sipariş değeri (ürün + kargo): 45.30 + 63.99 = 109.29

| Column Name           | Description                                                      |
|-----------------------|------------------------------------------------------------------|
| order_id              | Unique identifier for each order.                                |
| order_item_id         | Sequential number identifying the item within the same order.    |
| product_id            | Unique identifier for each product.                              |
| seller_id             | Unique identifier for each seller.                               |
| shipping_limit_date   | Indicates the seller's shipping limit date for handing the order over to the logistics partner.     |
| price                 | Price of the item.                                               |
| freight_value         | Freight value of the item. If an order has multiple items, the  freight value is divided among them.   |

🔴 **"Order Payments" Veri Kümesi**

Bu veri kümesi, siparişlerin ödeme seçeneklerine ilişkin verileri içerir.

| Column Name           | Description                                                      |
|-----------------------|------------------------------------------------------------------|
| order_id              | Unique identifier for each order.                                |
| payment_sequential    | Represents the sequence of payment methods used by a customer for a single order. If multiple payment methods are used, a sequence is created to accommodate them.     |
| payment_type          | The method of payment chosen by the customer for the order.     |
| payment_installments  | The number of installments chosen by the customer for the order.|
| payment_value         | The transaction value for the order.                             |

🔴 **"Order Reviews" Veri Kümesi**

Bu veri kümesi, müşteriler tarafından yapılan değerlendirmelerle ilgili verileri içerir.
Bir müşteri Olist Store'dan ürün satın aldıktan sonra satıcıya siparişi yerine getirmesi için bildirim gönderilir. Müşteri ürünü teslim aldığında veya tahmini teslimat tarihi geldiğinde, müşteri e-posta ile satın alma deneyimi için not verebileceği ve bazı yorumlar yazabileceği bir memnuniyet anketi alır.

| Column Name             | Description                                                      |
|-------------------------|------------------------------------------------------------------|
| review_id               | Unique identifier for each review.                               |
| order_id                | Unique identifier for each order associated with the review.     |
| review_score            | A rating ranging from 1 to 5, provided by the customer in a satisfaction survey.      |
| review_comment_title    | The title of the comment left by the customer in Portuguese.    |
| review_comment_message  | The message of the comment left by the customer in Portuguese.  |
| review_creation_date    | The date when the satisfaction survey was sent to the customer.  |
| review_answer_timestamp | The timestamp of the customer's response to the satisfaction survey.    |

🔴 **"Orders" Veri Kümesi**

Bu çekirdek veri kümesidir. Her siparişten diğer tüm bilgileri bulabilirsiniz.

| Column Name                       | Description                                                          |
|-----------------------------------|----------------------------------------------------------------------|
| order_id                          | Unique identifier for each order.                                    |
| customer_id                       | Key to the customer dataset. Each order has a unique customer_id.    |
| order_status                      | Reference to the order status (delivered, shipped, etc).             |
| order_purchase_timestamp          | Timestamp indicating when the order was purchased.                    |
| order_approved_at                 | Timestamp indicating when the payment for the order was approved.    |
| order_delivered_carrier_date      | Timestamp indicating when the order was handed over to the logistic  partner for delivery.  |
| order_delivered_customer_date     | Timestamp indicating the actual date when the order was delivered to the customer.   |
| order_estimated_delivery_date     | Timestamp indicating the estimated delivery date provided to the customer at the time of purchase. |

🔴 **"Products" Veri Kümesi**
Bu veri kümesi Olist tarafından satılan ürünlerle ilgili verileri içerir.

| Column Name                | Description                                                           |
|----------------------------|-----------------------------------------------------------------------|
| product_id                 | Unique identifier for each product.                                   |
| product_category_name      | The root category of the product in Portuguese.                        |
| product_name_length        | The number of characters extracted from the product name.              |
| product_description_length | The number of characters extracted from the product description.       |
| product_photos_qty         | The number of photos published for the product.                        |
| product_weight_g           | The weight of the product measured in grams.                          |
| product_length_cm          | The length of the product measured in centimeters.                    |
| product_height_cm          | The height of the product measured in centimeters.                    |
| product_width_cm           | The width of the product measured in centimeters.                     |

🔴 **"Sellers" Veri Kümesi**

Bu veri kümesi, Olist'te verilen siparişleri gerçekleştiren satıcılarla ilgili verileri içerir. Satıcı konumunu bulmak ve her bir ürünü hangi satıcının gönderdiğini belirlemek için kullanın.

| Column Name           | Description                                              |
|-----------------------|----------------------------------------------------------|
| seller_id             | Unique identifier for each seller.                        |
| seller_zip_code_prefix| The first five digits of the seller's zip code.          |
| seller_city           | The city name of the seller.                              |
| seller_state          | The state of the seller.                                  |

🔴 **"Category Name Translation" Veri Kümesi**

product_category_name öğesini İngilizceye çevirir.

| Column Name                | Description                                                         |
|----------------------------|---------------------------------------------------------------------|
| product_category_name       | The category name of the product in Portuguese.                     |
| product_category_name_english| The category name of the product translated to English.              |

# 🚀 **Case Studies**

## 📌**Case 1 : Sipariş Analizi**

* 🔅 **Question 1 :**
Aylık olarak order dağılımını inceleyiniz.
````sql
select 
	to_char(order_approved_at, 'YYYY-MM') as month_,
    count(order_id) order_count
from orders
where order_approved_at is not null
group by 1
order by 1
;
````
|       |   month_  | order_count |
|-------|-----------|-------------|
|   1   |  2016-09  |      1      |
|   2   |  2016-10  |     320     |
|   3   |  2016-12  |      1      |
|   4   |  2017-01  |     760     |
|   5   |  2017-02  |    1765     |
|   6   |  2017-03  |    2689     |
|   7   |  2017-04  |    2374     |
|   8   |  2017-05  |    3693     |
|   9   |  2017-06  |    3252     |
|  10   |  2017-07  |    3974     |
|  11   |  2017-08  |    4348     |
|  12   |  2017-09  |    4301     |
|  13   |  2017-10  |    4590     |
|  14   |  2017-11  |    7395     |
|  15   |  2017-12  |    5832     |
|  16   |  2018-01  |    7187     |
|  17   |  2018-02  |    6706     |
|  18   |  2018-03  |    7288     |
|  19   |  2018-04  |    6778     |
|  20   |  2018-05  |    7066     |
|  21   |  2018-06  |    6164     |
|  22   |  2018-07  |    6176     |
|  23   |  2018-08  |    6620     |
|  24   |  2018-09  |      1      |

* 🔅 **Question 2 :**
Aylık olarak order status kırılımında order sayılarını inceleyiniz. 
````sql
select  
	to_char(order_approved_at, 'YYYY-MM') as month,
	order_status,
	count(order_id) order_count
from orders
where order_approved_at is not null
group by 1,2
order by 1 
;
````
|       |   month   | order_status | order_count |
|-------|-----------|--------------|-------------|
|   1   |  2016-09  |  delivered   |      1      |
|   2   |  2016-10  |  canceled    |     20      |
|   3   |  2016-10  |  delivered   |     265     |
|   4   |  2016-10  |  invoiced    |     18      |
|   5   |  2016-10  |  processing  |      2      |
|   6   |  2016-10  |  shipped     |      9      |
|   7   |  2016-10  |  unavailable |      6      |
|   8   |  2016-12  |  delivered   |      1      |
|   9   |  2017-01  |  canceled    |      2      |
|  10   |  2017-01  |  delivered   |     715     |
* Toplamda 129 satırlık çıktının sadece 10 satırı görüntülenmektedir.

* 🔅 **Question 3 :**
Ürün kategorisi kırılımında sipariş sayılarını inceleyiniz.
````sql
-- kategori bazlı order sayısı
select 
	count(O.ORDER_ID) as order_count,
    p.PRODUCT_CATEGORY_NAME
from ORDERS as O
left join ORDER_ITEMS as OI 
on O.ORDER_ID = OI.ORDER_ID
left join PRODUCTS as p 
on p.PRODUCT_ID = OI.PRODUCT_ID
left join category_name_translation as c on c.PRODUCT_CATEGORY_NAME = p.PRODUCT_CATEGORY_NAME
where o.order_status !='cancelled' and p.product_category_name is not null
group by 2
order by 1 desc
;
````
|       | order_count |       product_category_name       |
|-------|----------|-----------------------------------|
|   1   |  11115   |         "cama_mesa_banho"        |
|   2   |   9670   |           "beleza_saude"         |
|   3   |   8641   |          "esporte_lazer"         |
|   4   |   8334   |      "moveis_decoracao"          |
|   5   |   7827   | "informatica_acessorios"          |
|   6   |   6964   |   "utilidades_domesticas"        |
|   7   |   5991   |     "relogios_presentes"         |
|   8   |   4545   |           "telefonia"            |
|   9   |   4347   |    "ferramentas_jardim"          |
|  10   |   4235   |         "automotivo"             |
|  11   |   4117   |          "brinquedos"            |
|  12   |   3796   |         "cool_stuff"             |
|  13   |   3419   |         "perfumaria"             |
|  14   |   3065   |             "bebes"              |
|  15   |   2767   |        "eletronicos"             |
* Toplamda 73 satırlık çıktının 15 satırı görüntülenmektedir.

````sql
-- Cevap ; 
select  
	count(distinct o.order_id) as order_count,
	cn.product_category_name_english,
	CASE
		WHEN to_char(order_approved_at, 'YYYY-MM-DD') BETWEEN '2016-02-05' AND '2016-02-10' THEN 'Brezilya Karnavalı'
        WHEN to_char(order_approved_at, 'YYYY-MM-DD') BETWEEN '2017-02-24' AND '2017-03-01' THEN 'Brezilya Karnavalı'
        WHEN to_char(order_approved_at, 'YYYY-MM-DD') BETWEEN '2018-02-09' AND '2018-02-14' THEN 'Brezilya Karnavalı'
    else 'Diğer'
    end as rio
from orders as o
left join order_items as oi 
ON oi.order_id=o.order_id
left join products as p
ON p.product_id=oi.product_id
left join category_name_translation as cn 
ON p.product_category_name=cn.product_category_name
where o.order_status != 'cancelled' 
AND to_char(order_approved_at,'YYYY-MM-DD') BETWEEN '2016-02-05' AND '2016-02-10'
or to_char(order_approved_at,'YYYY-MM-DD') BETWEEN '2017-02-24' AND '2017-03-01'
or to_char(order_approved_at,'YYYY-MM-DD') BETWEEN '2018-02-09' AND '2018-02-14'
group by 2,3
order by 1 desc
;
````
|       | order_count | product_category_name_english |             rio              |
|-------|-------------|------------------------------|-----------------------------|
|   1   |     177     |      "bed_bath_table"        |     "Brezilya Karnavalı"    |
|   2   |     137     | "computers_accessories"       |     "Brezilya Karnavalı"    |
|   3   |     131     |     "sports_leisure"         |     "Brezilya Karnavalı"    |
|   4   |     117     |      "health_beauty"         |     "Brezilya Karnavalı"    |
|   5   |      95     |    "furniture_decor"         |     "Brezilya Karnavalı"    |
|   6   |      79     |        "telephony"           |     "Brezilya Karnavalı"    |
|   7   |      66     |     "garden_tools"           |     "Brezilya Karnavalı"    |
|   8   |      66     |      "housewares"            |     "Brezilya Karnavalı"    |
|   9   |      58     |      "watches_gifts"         |     "Brezilya Karnavalı"    |
|  10   |      52     |             "auto"           |     "Brezilya Karnavalı"    |
* Toplamda 58 satırlık çıktının 10 satırı görüntülenmektedir.

* 🔅 **Question 4 :**
Haftanın günleri bazında order sayılarını inceleyiniz.
````sql
select 
  count(order_id) as order_count, 
  to_char(order_approved_at::date, 'Day') as day_of_week
from orders
group by 2
order by 1 DESC
;
````
| Index | order_count |  day_of_week  |
|-------|-------------|---------------|
|   1   |    19154    |   "Tuesday"  |
|   2   |    15786    |  "Wednesday" |
|   3   |    15471    |   "Thursday" |
|   4   |    14659    |    "Friday"  |
|   5   |    13001    |    "Monday"  |
|   6   |    12196    |  "Saturday"  |
|   7   |     9014    |    "Sunday"  |
|   8   |     160     |     [null]          |

## 🗝️ **Case 1 Dashboard :** 

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/assets/127680099/dfef4da6-f2f8-4360-98f6-2598adf7c7ac)

