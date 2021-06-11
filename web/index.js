var prev=document.getElementById("prev");
var next=document.getElementById("next");
var img=document.getElementById("img")
// 创建一个数组 保存图片路径
var arr=["img/lunbotu1.jpg","img/lunbotu2.jpg","img/lunbotu3.jpg","img/lunbotu4.jpg","img/lunbotu5.jpg","img/lunbotu6.jpg"]
var index=0
// 轮播图
prev.onclick=function(){
    index--
    if(index<0){
        index=5
    }
    img.src=arr[index]
    // img.style.transition="all 2s;"
}
next.onclick=function(){
    index++
    if(index>5){
        index=0
    }
    img.src=arr[index]
    // img.style.transition="all 2s;"
}
window.setInterval(()=>{
    index++
    if(index>5){
        index=0
    }
    img.src=arr[index]
    // img.style.transition="all 2s;"
},3000)

// tab栏切换
var navContainer=document.getElementById("navContainer")
var ul=navContainer.getElementsByTagName("ul")[0]
var lis=ul.getElementsByTagName("li")
var part1=document.querySelector(".banner .part1")
var part2=document.querySelector(".banner .part2")
var part3=document.querySelector(".banner .part3")
var part4=document.querySelector(".banner .part4")
var part5=document.querySelector(".banner .part5")
lis[0].onclick=function(){
    part1.style.display="block"
    part2.style.display="none"
    part3.style.display="none"
    part4.style.display="none"
    part5.style.display="none"
    for(var i=0;i<lis.length;i++){
        lis[i].className=""
    }
    lis[0].className="on"
}
lis[1].onclick=function(){
    part1.style.display="none"
    part2.style.display="block"
    part3.style.display="none"
    part4.style.display="none"
    part5.style.display="none"
    for(var i=0;i<lis.length;i++){
        lis[i].className=""
    }
    lis[1].className="on"
}
lis[2].onclick=function(){
    part1.style.display="none"
    part2.style.display="none"
    part3.style.display="block"
    part4.style.display="none"
    part5.style.display="none"
    for(var i=0;i<lis.length;i++){
        lis[i].className=""
    }
    lis[2].className="on"
}
lis[3].onclick=function(){
    part1.style.display="none"
    part2.style.display="none"
    part3.style.display="none"
    part4.style.display="block"
    part5.style.display="none"
    for(var i=0;i<lis.length;i++){
        lis[i].className=""
    }
    lis[3].className="on"
}
lis[4].onclick=function(){
    part1.style.display="none"
    part2.style.display="none"
    part3.style.display="none"
    part4.style.display="none"
    part5.style.display="block" 
    for(var i=0;i<lis.length;i++){
        lis[i].className=""
    }
    lis[4].className="on"
}