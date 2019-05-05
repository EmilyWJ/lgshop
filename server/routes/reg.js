const express=require("express");
const router=express.Router();
const pool=require("../pool");



// 注册的post方法
router.post("/reg",(req,res)=>{
    console.log(req.body)
    let sql=`insert into lg_user set ?`;
    pool.query(sql,[req.body],(err,result)=>{
      if(err) throw err;
      if(result.affectedRows>0){
        res.send("发送成功");
      }
    })
})

module.exports=router;
