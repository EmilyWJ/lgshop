const express=require("express");
const router=express.Router();
const pool=require('../pool');

//登录的请求方式
router.get("/shop",(req,res)=>{
  // 获取请求的lid值并赋值给一个变量
  var $id=req.query.id;
  // console.log($lid);

  // 以请求的lid值为sql语句查询的条件，查询符合条件的数据，因为需要的数据存储在两张表中，所以需要用到关联复合查询，将两张表关联查询
  let sql="select DISTINCT * from lg_laptop l inner join lg_shoppingcart_item li on l.lid=li.product_id inner join lg_user u on li.user_id=u.uid where li.user_id=?";
  // let sq="select * from lg_shoppingcart_item li inner join lg_user u on li.user_id=u.uid where li.user_id=7";
  pool.query(sql,[$id],(err,result)=>{
    if(err) throw err;
    // console.log(result.length);
    // 将拿到的结果响应给客户端
    res.send(result);
  })
})

// 购物车数
router.get("/car",(req,res)=>{
  let sql="select * from lg_shoppingcart_item li inner join lg_user u on li.user_id=u.uid where user_id=?";
  // console.log(req.query)
  pool.query(sql,[req.query.user_id],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send(result);
    else
      res.send('0');
  })
})

// 购物车
router.get("/cartlist",(req,res)=>{

})
// 导出路由
module.exports=router;