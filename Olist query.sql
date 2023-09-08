Case 1 : Sipariş Analizi

Question 1 :
Aylık olarak order dağılımını inceleyiniz.

select 
	to_char(order_approved_at, 'YYYY-MM') as month_,
    count(order_id) order_count
from orders
where order_approved_at is not null
group by 1
order by 1
;


Question 2 : (Görselleşecek)
Aylık olarak order status kırılımında order sayılarını inceleyiniz. 

select  
	to_char(order_approved_at, 'YYYY-MM') as month,
	order_status,
	count(order_id) order_count
from orders
where order_approved_at is not null
group by 1,2
order by 1 
;

Question 3 :
Ürün kategorisi kırılımında sipariş sayılarını inceleyiniz.

-- kategori bazlı order sayısı
select 
	count(O.ORDER_ID) as ORDER_ID,
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


Question 4 : (Görselleşecek)
Haftanın günleri bazında order sayılarını inceleyiniz.

select 
  count(order_id) as order_count, 
  to_char(order_approved_at::date, 'Day') as day_of_week
from orders
group by 2
order by 1 DESC
;


Case 2 : Müşteri Analizi 

Question 1 :
Hangi şehirlerdeki müşteriler daha çok alışveriş yapıyor? 
Müşterinin şehrini en çok sipariş verdiği şehir olarak belirleyip analizi ona göre yapınız. 

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


Question 2 :
Müşteri bazlı siparişlerin kategorilerini inceleyiniz. 
Müşteriler genellikle aynı kategorideki ürünlerin siparişini mi veriyor? 
Her müşteri için sipariş kategori yüzdesini hesaplayın. 

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


Case 3: Satıcı Analizi

Question 1 : 
Siparişleri en hızlı şekilde müşterilere ulaştıran satıcılar kimlerdir? Top 5 getiriniz. 
Bu satıcıların order sayıları ile ürünlerindeki yorumlar ve puanlamaları inceleyiniz ve yorumlayınız.

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


Question 2 : (Görselleşebilir)
Hangi satıcılar daha fazla kategoriye ait ürün satışı yapmaktadır? 
Fazla kategoriye sahip satıcıların order sayıları da fazla mı? 

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


Case 4 : Payment Analizi

Question 1 : 
Ödeme yaparken taksit sayısı fazla olan kullanıcılar en çok hangi bölgede yaşamaktadır? 

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


Question 2 : 
Ödeme tipine göre başarılı order sayısı ve toplam başarılı ödeme tutarını hesaplayınız. 

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



Question 3 : 
Tek çekimde ve taksitle ödenen siparişlerin kategori bazlı analizini yapınız. 
En çok hangi kategorilerde taksitle ödeme kullanılmaktadır?

--total order tablosu
select  count(distinct o.order_id) as order_count,
		p.product_category_name
from orders as o
left join order_items as oi
ON oi.order_id = o.order_id
left join products as p
ON oi.product_id = p.product_id
group by 2
order by 1 desc
;


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
