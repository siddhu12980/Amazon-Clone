const expxress=require('express')

const adminAuthRouter=expxress.Router();

adminAuthRouter.get('/login',(req,res)=>{
    res.send("Auth router")
})

module.exports={
    adminAuthRouter
}   