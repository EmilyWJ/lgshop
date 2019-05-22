const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 商品请求的方法
router.get("/detail",(req,res)=>{
  // 获取请求的lid值并赋值给一个变量
  var $lid=req.query.lid;
  // 以请求的lid值为sql语句查询的条件，查询符合条件的数据，因为需要的数据存储在两张表中，所以需要用到关联复合查询，将两张表关联查询
  let sql="select * from lg_laptop l inner join lg_laptop_pic p on l.lid =p.laptop_id where lid=?";
  pool.query(sql,[$lid],(err,result)=>{
    if(err) throw err;
    // 将拿到的结果响应给客户端
    res.send(result);
  })
})
//加入购物车前查询数据的请求方式
router.get("/getshop",(req,res)=>{
  // 获取请求的lid值并赋值给一个变量
  // console.log(req.query);
  var $id=req.query.id;
  var $lid=req.query.lid;
  console.log($id,$lid);
  // console.log($lid);

  // 以请求的lid值为sql语句查询的条件，查询符合条件的数据，因为需要的数据存储在两张表中，所以需要用到关联复合查询，将两张表关联查询
  // let sql="select DISTINCT * from lg_laptop l inner join lg_shoppingcart_item li on l.lid=li.product_id inner join lg_user u on li.user_id=u.uid where li.user_id=? and li.product_id=?";
  let sql='select*from lg_shoppingcart_item where user_id=? and product_id=?'
  // let sq="select * from lg_shoppingcart_item li inner join lg_user u on li.user_id=u.uid where li.user_id=7";
  pool.query(sql,[$id,$lid],(err,result)=>{
    if(err) throw err;
    // console.log(result.length);
    // 将拿到的结果响应给客户端
    res.send(result);
  })
})

router.get("/upshop",(req,res)=>{
  var $lid=req.query.lid;
  var $count=req.query.count;

  let sql="update lg_shoppingcart_item set COUNT=COUNT+? where product_id=?";
  pool.query(sql,[$lid,$count],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 添加到购物车
router.get("/inshop",(req,res)=>{
  let $user_id=req.query.id;
  let $lid=req.query.lid;
  let $count=req.query.count;
  console.log($count);
  // console.log($user_id,$lid,$count);
  let sql="insert into lg_shoppingcart_item values(NULL,?,?,?,NULL)";
  pool.query(sql,[$user_id,$lid,$count],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
// 导出路由
module.exports=router;