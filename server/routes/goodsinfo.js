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
// 导出路由
module.exports=router;