const express=require("express");
const router=express.Router();
const pool=require('../pool');

//登录的请求方式
router.get("/login",(req,res)=>{
  var $uname=req.query.uname;
  var $upwd=req.query.upwd;
  console.log($uname,$upwd);

  let sql="select * from lg_user where uname=? and upwd=?";
  pool.query(sql,[$uname,$upwd],(err,result)=>{
    if(err) throw err;
    // console.log(result.length);
    res.send(result);
  })
})

module.exports=router;