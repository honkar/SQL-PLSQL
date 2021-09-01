set autotrace traceonly explain
SELECT count(*) FROM sh.promotions WHERE promo_subcategory IN ('ad','coupon news');
set autotrace off
set autotrace traceonly explain
select count(*) FROM sh.promotions WHERE promo_category='flyer';
set autotrace off
