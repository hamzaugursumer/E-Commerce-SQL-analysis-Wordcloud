# 📑 **SQL Capstone Project - Brazilian E-Commerce Public Dataset by Olist**

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/blob/main/dataset-cover.png)

## 📌 **Veri Seti Hakkında**
Olist'ten Brezilya E-Ticaret Kamu Veri Seti
Hoş geldiniz! Bu, Olist Store'da yapılan siparişlerin Brezilya e-ticaret genel veri kümesidir. Veri kümesi, 2016'dan 2018'e kadar Brezilya'daki birden fazla pazar yerinde yapılan 100 bin siparişin bilgisine sahiptir. Özellikleri, bir siparişi birden fazla boyuttan görüntülemeye olanak tanır: sipariş durumu, fiyat, ödeme ve nakliye performansından müşteri konumuna, ürün özelliklerine ve son olarak müşteriler tarafından yazılan incelemelere kadar. Ayrıca Brezilya posta kodlarını enlem/boylam koordinatlarıyla ilişkilendiren bir coğrafi konum veri seti de yayınladık.
Bu gerçek ticari verilerdir, anonimleştirilmiştir ve inceleme metnindeki şirketlere ve ortaklara yapılan atıflar Game of Thrones'un büyük evlerinin isimleriyle değiştirilmiştir.

* Dataset : [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

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

## 📌 **Olist Veri Seti ERD Diyagramı :** 

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/assets/127680099/f61eb286-99c2-4a83-9575-9efdf57355d1)

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

![image]((https://github.com/hamzaugursumer/SQL-Capstone-Project/assets/127680099/5267ae3b-05ff-4d36-9295-55ecb635c3a8)

## 📌**Case 2 : Müşteri Analizi**

* 🔅 **Question 1 :**

Hangi şehirlerdeki müşteriler daha çok alışveriş yapıyor? 
Müşterinin şehrini en çok sipariş verdiği şehir olarak belirleyip analizi ona göre yapınız. 
````sql
WITH city_and_order as (
select 
	cs.customer_unique_id,
    cs.customer_city,
    count(o.order_id) as order_count
from customers cs
left join orders o
on o.customer_id = cs.customer_id
group by 1,2
order by 3 desc
),
customer_city as (
select 
	customer_unique_id,
    customer_city,
    order_count,
    row_number() over(partition by customer_unique_id order by order_count desc) as rn
from city_and_order
),
city_of_customer as (
select 
	customer_unique_id, 
	customer_city 
	from customer_city 
	where rn=1
)
select 
	cs.customer_city,
    count(distinct o.order_id) as order_count
from city_of_customer as cs
left join customers as c
on c.customer_unique_id = cs.customer_unique_id
left join orders AS o
on c.customer_id = o.customer_id
group by 1
order by 2 desc
;
````
|       |   customer_city     | order_count |
|-------|---------------------|-------------|
|   1   |     "sao paulo"     |    15536    |
|   2   | "rio de janeiro"    |    6881     |
|   3   |  "belo horizonte"   |    2776     |
|   4   |     "brasilia"      |    2130     |
|   5   |     "curitiba"      |    1521     |
|   6   |     "campinas"      |    1442     |
|   7   |  "porto alegre"     |    1379     |
|   8   |     "salvador"      |    1243     |
|   9   |    "guarulhos"      |    1188     |
|  10   | "sao bernardo do campo" |  938     |
* Toplamda 4119 satırlık çıktının 10 satırı görüntülenmektedir.

* 🔅 **Question 2 :**

Müşteri bazlı siparişlerin kategorilerini inceleyiniz. 
Müşteriler genellikle aynı kategorideki ürünlerin siparişini mi veriyor? 
Her müşteri için sipariş kategori yüzdesini hesaplayın. 
````sql
with table1 as 
(
select 
	distinct customer_unique_id, 
	p.product_category_name,
    count(distinct o.order_id) as order_count
from customers as c
left join orders as o
ON o.customer_id = c.customer_id
left join order_items as oi
ON oi.order_id = o.order_id
left join products as p
ON p.product_id = oi.product_id
where product_category_name is not null and
o.order_status !='cancelled'	
group by 1,2
),
table2 as 
(
select 
	distinct c.customer_unique_id,
    count(distinct o.order_id) as total_order_count
from customers as c
left join orders as o
ON c.customer_id = o.customer_id
where o.order_status !='cancelled'
group by 1
)
select 
	table1.customer_unique_id,
	table1.product_category_name,
	table1.order_count,
	table2.total_order_count,
	row_number() over (partition by table1.customer_unique_id order by table1.order_count desc) as rn,
    round((table1.order_count*1.0/table2.total_order_count*1.0),2)*100 as category_value
from table1
left join table2 
ON table1.customer_unique_id = table2.customer_unique_id
order by 4 desc
;
````
|       |       customer_unique_id       |       product_category_name       | order_count | total_order_count | rn  | category_value |
|-------|---------------------------------|-----------------------------------|-------------|-------------------|----|----------------|
|   1   |  "8d50f5eadf50201ccdcedfb9e2ac8455" |   "fashion_bolsas_e_acessorios"   |      3      |        17         |  2 |      18.00     |
|   2   |  "8d50f5eadf50201ccdcedfb9e2ac8455" |          "esporte_lazer"          |      11     |        17         |  1 |      65.00     |
|   3   |  "8d50f5eadf50201ccdcedfb9e2ac8455" | "construcao_ferramentas_ferramentas"|      1      |        17         |  3 |       6.00     |
|   4   |  "3e43e6105506432c953e165fb2acf44c" |      "casa_construcao"            |      1      |        9          |  4 |      11.00     |
|   5   |  "3e43e6105506432c953e165fb2acf44c" |    "utilidades_domesticas"        |      1      |        9          |  3 |      11.00     |
|   6   |  "3e43e6105506432c953e165fb2acf44c" |       "cama_mesa_banho"           |      4      |        9          |  1 |      44.00     |
|   7   |  "3e43e6105506432c953e165fb2acf44c" |      "moveis_decoracao"           |      3      |        9          |  2 |      33.00     |
|   8   |  "3e43e6105506432c953e165fb2acf44c" | "informatica_acessorios"          |      1      |        9          |  5 |      11.00     |
|   9   |  "1b6c7548a2a1f9037c1fd3ddfed95f33" |         "beleza_saude"            |      1      |        7          |  2 |      14.00     |
|  10   |  "1b6c7548a2a1f9037c1fd3ddfed95f33" |      "moveis_decoracao"           |      3      |        7          |  1 |      43.00     |
* Toplamda 96470 satırlık çıktının 10 satırı görüntülenmektedir.

## 🗝️ **Case 2 Dashboard :** 

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/assets/127680099/96d0d2a0-6a45-461f-9b85-9fac16be29ae)


## 📌**Case 3 : Satıcı Analizi**

* 🔅 **Question 1 :**

Siparişleri en hızlı şekilde müşterilere ulaştıran satıcılar kimlerdir? Top 5 getiriniz. 
Bu satıcıların order sayıları ile ürünlerindeki yorumlar ve puanlamaları inceleyiniz ve yorumlayınız.
````sql
with sellers_tab as (
select 
	distinct s.seller_id,
	extract(day from age(order_delivered_customer_date, order_purchase_timestamp)) AS day_diff
from orders o
left join order_items as oi
	ON oi.order_id = o.order_id
left join sellers as s 
	ON s.seller_id = oi.seller_id
where s.seller_id is not null 
	and extract(day from age(order_delivered_customer_date, order_purchase_timestamp)) is not null
	and order_status = 'delivered'
order by day_diff asc
limit 5
)
select 
	st.seller_id,
	count(distinct o.order_id) as count_order,
	round(avg(or_.review_score),1) avg_score
	-- or_.review_comment_message
from sellers_tab as st
left join order_items as oi
	ON oi.seller_id = st.seller_id
left join orders as o
	ON o.order_id = oi.order_id
left join order_reviews as or_
	ON or_.order_id = o.order_id
where or_.review_id is not null
and or_.review_comment_message is not null
group by 1
order by 2 desc , 3 desc
;
````
|       |           seller_id            | count_order | avg_score |
|-------|--------------------------------|-------------|-----------|
|   1   | "001cca7ae9ae17fb1caed9dfb1094831" |     92      |    3.5    |
|   2   | "0241d4d5d36f10f80c644447315af0bd" |     89      |    3.9    |
|   3   | "004c9cd9d87a3c30c522c48c4fc07416" |     60      |    3.7    |
|   4   | "00ee68308b45bc5e2660cd833c3f81cc" |     50      |    4.0    |
|   5   | "01fdefa7697d26ad920e9e0346d4bd1b" |     48      |    4.0    |

* 🔅 **Question 2 :**

Hangi satıcılar daha fazla kategoriye ait ürün satışı yapmaktadır? 
Fazla kategoriye sahip satıcıların order sayıları da fazla mı? 
````sql
select 	
	distinct s.seller_id,
	count(distinct p.product_category_name) as count_category,
	count(distinct o.order_id) as count_order
from sellers as s
left join order_items as oi
	ON oi.seller_id = s.seller_id
left join orders as o
	ON o.order_id = oi.order_id
left join products as p
	ON p.product_id = oi.product_id
where p.product_category_name is not null
group by 1
order by 2 desc, 3 asc
````
|       |           seller_id            | count_category | count_order |
|-------|--------------------------------|----------------|-------------|
|   1   | "b2ba3715d723d245138f291a6fe42594" |      27        |     337     |
|   2   | "4e922959ae960d389249c378d1c939f5" |      23        |     405     |
|   3   | "955fee9216a65b617aa5c0531780ce60" |      23        |    1287     |
|   4   | "1da3aeb70d7989d1e6d9b0e887f97c23" |      21        |     265     |
|   5   | "f8db351d8c4c4c22c6835c19a46f01b0" |      19        |     665     |
|   6   | "18a349e75d307f4b4cc646a691ed4216" |      17        |     121     |
|   7   | "6edacfd9f9074789dad6d62ba7950b9c" |      15        |     208     |
|   8   | "70a12e78e608ac31179aea7f8422044b" |      15        |     315     |
|   9   | "fd386aa7bed2af3c7035c65506c9b4a3" |      14        |      69     |
|  10   | "2ff97219cb8622eaf3cd89b7d9c09824" |      14        |      89     |
* Toplamda 3035 satırlık çıktının 10 satırı görüntülenmektedir.

## 🗝️ **Case 3 Dashboard :** 

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/assets/127680099/32837f6d-84e1-47f0-9d4f-8f0bf948414f)

## 📌**Case 4 : Payment Analizi**

* 🔅 **Question 1 :**

Ödeme yaparken taksit sayısı fazla olan kullanıcılar en çok hangi bölgede yaşamaktadır? 
````sql
with customers as (
select 
	c.customer_unique_id,
	payment_installments,
	c.customer_state,
	payment_type
from order_payments op
left join orders as o 
ON op.order_id = o.order_id
left join customers as c
ON c.customer_id = o.customer_id
where payment_type = 'credit_card' 
	and payment_installments = 24
order by payment_installments desc
				   )
select 
	 customer_state,	
     count(customer_unique_id) as count_customer
from customers as c
group by 1
order by 2 desc
;
````
|       | customer_state | count_customer |
|-------|----------------|----------------|
|   1   |      "SP"      |       4        |
|   2   |      "RJ"      |       3        |
|   3   |      "MG"      |       2        |
|   4   |      "RS"      |       2        |
|   5   |      "BA"      |       1        |
|   6   |      "PR"      |       1        |
|   7   |      "RO"      |       1        |
|   8   |      "PB"      |       1        |
|   9   |      "CE"      |       1        |
|  10   |      "DF"      |       1        |
|  11   |      "GO"      |       1        |

* 🔅 **Question 2 :**
 
Ödeme tipine göre başarılı order sayısı ve toplam başarılı ödeme tutarını hesaplayınız. 
````sql
select 	
	payment_type,
	count(distinct o.order_id) as count_order,
	sum(payment_value) as total_payment_value
from order_payments as op
left join orders as o
ON o.order_id = op.order_id
where o.order_status not in ('unavailable','cancelled')
group by 1
order by 2 desc
````
|       | payment_type  | count_order | total_payment_value |
|-------|---------------|-------------|---------------------|
|   1   | "credit_card" |    76062    |     12,447,417.87   |
|   2   |   "boleto"    |    19634    |     2,844,306.40    |
|   3   |   "voucher"   |    3839     |      375,539.32     |
|   4   | "debit_card"  |    1522     |      215,129.02     |
|   5   | "not_defined" |      3      |         0.00        |

* 🔅 **Question 3 :**

Tek çekimde ve taksitle ödenen siparişlerin kategori bazlı analizini yapınız. 
En çok hangi kategorilerde taksitle ödeme kullanılmaktadır?

````sql
-- tek çekimde ödenen siparişlerin kategori bazlı analizi
with tek_çekim as (
select  
	count(distinct o.order_id) as order_count_tek_çekim,
	p.product_category_name as category_name
from orders as o
left join order_items as oi
	ON oi.order_id = o.order_id
left join products as p
	ON oi.product_id = p.product_id
left join order_payments as op
	ON op.order_id = o.order_id
where op.payment_installments = 1
group by 2
order by 1 desc
),
-- taksitle ödenen siparişlerin kategori bazlı analizi
taksit as (
select  
	count(distinct o.order_id) as order_count_taksit,
	p.product_category_name as category_name 
from orders as o
left join order_items as oi
	ON oi.order_id = o.order_id
left join products as p
	ON oi.product_id = p.product_id
left join order_payments as op
	ON op.order_id = o.order_id
where op.payment_installments > 1 and payment_type = 'credit_card'
group by 2
order by 1 desc
)
select 
	tç.category_name,
	tç.order_count_tek_çekim,
	t.order_count_taksit
from tek_çekim as tç
left join taksit as t 
	ON t.category_name = tç.category_name
where tç.category_name is not null 
and t.order_count_taksit is not null
order by t.order_count_taksit desc
;

-- Ans 2;
select  
	p.product_category_name,
	count(distinct case when op.payment_installments = 1 then o.order_id end) as tek_çekim,
	count(distinct case when op.payment_installments > 1 and payment_type = 'credit_card' then o.order_id end) as taksitli_ödeme
from orders as o
left join order_items as oi
	ON oi.order_id = o.order_id
left join products as p
	ON oi.product_id = p.product_id
left join order_payments as op
	ON op.order_id = o.order_id
where p.product_category_name is not null
group by 1
order by 3 desc
;
````
|       |   category_name    | order_count_tek_çekim | order_count_taksit |
|-------|--------------------|-----------------------|---------------------|
|   1   |  "cama_mesa_banho" |         3535          |        5965         |
|   2   |    "beleza_saude"  |         3880          |        5006         |
|   3   | "relogios_presentes"|         1890          |        3794         |
|   4   |  "esporte_lazer"   |         4299          |        3480         |
|   5   | "moveis_decoracao" |         3152          |        3353         |
|   6   | "utilidades_domesticas" |     2732          |        3197         |
|   7   | "informatica_acessorios" |  4177          |        2562         |
|   8   |    "cool_stuff"    |         1451          |        2217         |
|   9   |    "brinquedos"    |         1902          |        2008         |
|  10   |   "perfumaria"     |         1238          |        1945         |
* Toplamda 72 satırlık çıktının 10 satırı görüntülenmektedir.

## 🗝️ **Case 4 Dashboard :** 

![image](https://github.com/hamzaugursumer/SQL-Capstone-Project/assets/127680099/984be859-9369-4f15-bf26-a1400830911f)

