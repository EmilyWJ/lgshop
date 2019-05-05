const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 商品请求的方法
router.get("/productlist",(req,res)=>{
  var $family_id=req.query.family_id;

  let sql="select * from lg_laptop where family_id=?";
  pool.query(sql,[$family_id],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;