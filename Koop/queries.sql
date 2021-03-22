-- products
select product_name, price, pr.picture, blocked, supplier_abbr, category_name
from products as pr
         left join suppliers s on s.supplier_id = pr.supplier_id
         left join product_categories pc on pr.product_id = pc.product_id
         left join categories c on pc.category_id = c.category_id
order by s.supplier_abbr;

-- cooperator's order
-- order_id corresponds to the week's order
select first_name, last_name, product_name, aq.quantity, unit_name, oi.quantity, order_status_name
from cooperators as co
         left join ordered_items oi on co.coop_id = oi.coop_id
         left join order_status os on oi.order_status_id = os.order_status_id
         left join products p on oi.product_id = p.product_id
         left join units u on p.unit_id = u.unit_id
         left join available_quantities aq on p.product_id = aq.product_id
where order_id = 1 and co.coop_id = 6;

-- cooperator
select first_name, last_name, email, phone, function_name, value
from cooperators as co
         inner join functions f on f.function_id = co.function_id
         inner join funds f2 on co.fund_id = f2.fund_id
order by function_name;

-- products
select distinct pc.product_id,
    product_name,
    amount_in_magazine,
    amount_max,
    (select category_name + ','
        from categories as ca
            inner join product_categories p on ca.category_id = p.category_id
        where p.product_id = pc.product_id
        for XML PATH('')) as categories,
    (select cast(quantity as varchar(10)) + ','
        from available_quantities as ava
        where ava.product_id = pc.product_id
        for XML PATH('')) as avail_quantities,
    unit_name,
    cast(price as decimal(10, 2)) as price,
    supplier_abbr,
    available
from products
    inner join units u on products.unit_id = u.unit_id
    inner join product_categories pc on products.product_id = pc.product_id
    inner join categories c on pc.category_id = c.category_id
    inner join available_quantities aq on products.product_id = aq.product_id
    inner join suppliers s on products.supplier_id = s.supplier_id;

-- cooperator's order history
select first_name, last_name, order_stop_date, concat(cast(sum(price) as decimal(10, 2)), ' zl'), order_status_name
from cooperators as c
     left join ordered_items oi on c.coop_id = oi.coop_id
     left join products pr on oi.product_id = pr.product_id
     left join order_status os on oi.order_status_id = os.order_status_id
     left join orders o on oi.order_id = o.order_id
where c.coop_id = 1
group by first_name, last_name, c.coop_id, order_stop_date, order_status_name;

-- suppliers
select supplier_name, supplier_abbr, s.email, s.phone, order_closing_date, (first_name + ' ' + last_name) as OpRo
from suppliers as s
     inner join cooperators c on s.opro_id = c.coop_id;

-- orders/baskets
select first_name, last_name, basket_id
from cooperators
where basket_id is not null
order by basket_id;

-- paczkers' data
-- select product_name, 



create or alter view coop_order_history_view as
select c.coop_id, first_name, last_name, order_stop_date, concat(cast(sum(price) as decimal(10, 2)), ' zl') as price, order_status_name
from cooperators as c
         left join ordered_items oi on c.coop_id = oi.coop_id
         left join products pr on oi.product_id = pr.product_id
         left join order_status os on oi.order_status_id = os.order_status_id
         left join orders o on oi.order_id = o.order_id
group by first_name, last_name, c.coop_id, order_stop_date, order_status_name;

select * from coop_order_history_view;