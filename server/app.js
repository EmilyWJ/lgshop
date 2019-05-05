const express=require('express');
const bodyParser=require('body-parser');
const cors = require('cors');
const session=require('express-session');
// const userRouter=require('./routes/user');
const indexRouter=require('./routes/index');
const productRouter=require('./routes/product');
const regRouter=require("./routes/reg");
const goodsinfoRouter=require('./routes/goodsinfo');
const loginRouter=require('./routes/login');
const shopRouter=require('./routes/shopping_car');
// const detailRouter=require('./routes/detail');

// 创建web服务器
var app=express();
app.listen(3000);

// cloudo静态资源
app.use( express.static('public') );

// 使用body-parser中间件
app.use( bodyParser.urlencoded({
  extended:false
}));

app.use(cors({
  origin:['http://localhost:8080','http://127.0.0.1:8080'],
  credentials:true
  })
)

app.use(session({
  secret:"128位随机字符",
  resave:false,
  saveUninitialized:true
}))

// // 用户挂载
// app.use( '/user', userRouter);
// // 主页挂载
app.use( '/index', indexRouter);
// 商品挂载
app.use( '/product', productRouter);
// // 详情页挂载
app.use( '/goodsinfo', goodsinfoRouter);
// 注册
app.use("/reg",regRouter);
// 登录
app.use("/login",loginRouter);
// 购物车
app.use("/shopping_car",shopRouter);


