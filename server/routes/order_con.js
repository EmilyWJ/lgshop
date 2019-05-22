const express=require('express');
const router=express.Router();
const pool=require('../pool');

// 结算
router.get("/getOrder",(req,res)=>{
  // console.log(req.query)
  // let product_id=req.query.product_id;
  // let o_count=req.query.o_count;
  let sql=`insert into lg_order_detail set ?`;
  pool.query(sql,[req.query],(err,result)=>{
    if(err) throw err;
    res.send('1');
  })
})
// 请求数据
router.get("/Order",(req,res)=>{
  let order_id=req.query.order_id;
  console.log(req.query);
  let sql="select DISTINCT * from lg_order_detail li inner join lg_laptop l on li.product_id=l.lid where li.order_id=?";
  pool.query(sql,[order_id],(err,result)=>{
    if(err)throw err;
    console.log(result);
    res.send(result);
  });
})
// 返回上一页面则删除数据
router.get("/dorder",(req,res)=>{
  let sql="delete from lg_order_detail where order_id=?";
  pool.query(sql,[req.query],(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})
module.exports=router;