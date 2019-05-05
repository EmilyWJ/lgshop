const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1.keyWords 关键字查询
router.get('/keyWords',(req,res)=>{
  let $kws=req.query.kws;
  let sql=`select * from lg_laptop where subtitle like "%${$kws}%"`
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send(result)
    else
      res.send('1');
  })
})

// 2.price价格查询
router.get('/price',(req,res)=>{
  let $minPrice = req.query.minPrice;
  let $maxPrice = req.query.maxPrice;
  console.log(req.query);
  let sql=`select*from lg_laptop where price between ? and ? order by price asc`;
  pool.query(sql,[$minPrice,$maxPrice],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send(result);
    else
      res.send('0');
  })
})  

module.exports=router;