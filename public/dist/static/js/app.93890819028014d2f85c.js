webpackJsonp([1],{"09X1":function(e,t){},"1YXr":function(e,t){},"4qN4":function(e,t){},"6DE0":function(e,t){},HBSQ:function(e,t){},IrZw:function(e,t){},NHnr:function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var o=i("MVMM"),n={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{attrs:{id:"app"}},[t("router-view")],1)},staticRenderFns:[]};var s=i("Z0/y")({name:"App",mounted:function(){this.$nextTick(function(){})}},n,!1,function(e){i("rYN9")},"data-v-f3259c74",null).exports,r=i("zO6J"),a=i("x4un"),l=i.n(a),u=(i("4qN4"),i("HBSQ"),i("6DE0"),i("KPSb")),m=i.n(u),c=i("aozt"),d=i.n(c),p=Date.parse(new Date)+"wechatbak",g={time:Date.parse(new Date),apitoken:m()(p),getAxio:function(e,t){return d()({url:e,method:"post",data:t}).then(function(e){return e.data})}},h=i("3cXf"),f=i.n(h),v={data:function(){return{checked:!0,ruleForm:{username:"",password:""},rules:{username:[{trigger:"blur",required:!0,message:"请输入账号"}],password:[{trigger:"blur",required:!0,message:"请输入密码"}]},loading:!1}},mounted:function(){this.$nextTick(function(){localStorage.getItem("password")&&(this.ruleForm=JSON.parse(localStorage.getItem("password")))})},methods:{submitForm:function(e){var t=this;this.$refs[e].validate(function(e){if(!e)return!1;t.loading=!0;var i={username:t.ruleForm.username,pwd:t.ruleForm.password,time:t.tools.time,apitoken:t.tools.apitoken};t.tools.getAxio("http://www.songphper.top/index/Login/userLogin.html",i).then(function(e){t.loading=!1,1==e.status?(t.checked?localStorage.setItem("password",f()(t.ruleForm)):localStorage.getItem("password")&&localStorage.removeItem("password"),t.$router.push({name:"configure",path:"/configure"})):t.$message.error(e.msg)})})}}},b={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("el-form",{ref:"ruleForm",attrs:{model:e.ruleForm,"label-width":"60px","status-icon":"",rules:e.rules}},[i("h3",{staticClass:"title"},[e._v("微信开发者后台")]),e._v(" "),i("el-form-item",{attrs:{label:"账号",prop:"username"}},[i("el-input",{model:{value:e.ruleForm.username,callback:function(t){e.$set(e.ruleForm,"username",t)},expression:"ruleForm.username"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"密码",prop:"password"}},[i("el-input",{attrs:{type:"password"},nativeOn:{keyup:function(t){if(!("button"in t)&&e._k(t.keyCode,"enter",13,t.key,"Enter"))return null;e.submitForm("ruleForm")}},model:{value:e.ruleForm.password,callback:function(t){e.$set(e.ruleForm,"password",t)},expression:"ruleForm.password"}})],1),e._v(" "),i("el-form-item",[i("el-checkbox",{model:{value:e.checked,callback:function(t){e.checked=t},expression:"checked"}},[e._v("记住密码")])],1),e._v(" "),i("el-button",{staticStyle:{width:"100%"},attrs:{type:"primary",loading:e.loading},on:{click:function(t){e.submitForm("ruleForm")}}},[e._v("登录")])],1)},staticRenderFns:[]};var w=i("Z0/y")(v,b,!1,function(e){i("IrZw")},"data-v-70b9faf7",null).exports,_={data:function(){return{router:!0,isCollapse:!1,collapseTransition:!1,width:"200px",activeIndex:"configure",username:"",nowPublic:""}},mounted:function(){this.$nextTick(function(){localStorage.getItem("password")?this.username=JSON.parse(localStorage.getItem("password")).username:this.$router.push({name:"login",path:"/login"})})},methods:{handleOpen:function(e,t){},handleClose:function(e,t){},change:function(){this.isCollapse?this.width="200px":this.width="60px",this.isCollapse=!this.isCollapse},loginOut:function(){var e=this,t={time:this.tools.time,apitoken:this.tools.apitoken};this.tools.getAxio("http://www.songphper.top/index/Login/logout.html",t).then(function(t){1==t.status?e.$router.push({name:"login",path:"/login"}):e.$message.error(t.msg)})},getnowPublic:function(e){this.nowPublic=e},getactiveIndex:function(e){this.activeIndex=e}}},k={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("el-container",[i("el-header",[i("el-col",{staticClass:"header"},[i("el-col",{staticClass:"logo",style:{width:e.width},attrs:{span:4}},[e._v("微信开发者后台")]),e._v(" "),i("el-col",{attrs:{span:10}},[i("div",{staticClass:"tools",on:{click:e.change}},[i("i",{staticClass:"fa fa-align-justify"})]),e._v(" "),i("div",{staticClass:"nowPublic"},[e._v("\n\t\t\t\t\t当前公众号 : "),i("span",[e._v(e._s(e.nowPublic))])])]),e._v(" "),i("el-col",{staticClass:"information",attrs:{span:3}},[i("el-dropdown",{staticStyle:{cursor:"pointer"},attrs:{trigger:"click"}},[i("span",{staticClass:"el-dropdown-link"},[e._v("\n\t\t\t\t\t    "+e._s(e.username)),i("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),e._v(" "),i("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[i("el-dropdown-item",{nativeOn:{click:function(t){return e.loginOut(t)}}},[e._v("\n\t\t\t\t\t\t\t退出登录\n\t\t\t\t\t\t")])],1)],1)],1)],1)],1),e._v(" "),i("el-container",{staticClass:"main-container"},[i("el-aside",{style:{width:e.width}},[i("el-menu",{attrs:{collapse:e.isCollapse,router:e.router,"collapse-transition":e.collapseTransition,"default-active":e.activeIndex,"active-text-color":"#F56C6C","text-color":"#909399"},on:{open:e.handleOpen,close:e.handleClose}},[i("el-submenu",{attrs:{index:"1"}},[i("template",{slot:"title"},[i("span",[e._v("公众号管理")])]),e._v(" "),i("el-menu-item-group",[i("el-menu-item",{attrs:{index:"configure"}},[e._v("公众号配置")]),e._v(" "),i("el-menu-item",{attrs:{index:"menu"}},[e._v("自定义菜单")]),e._v(" "),i("el-menu-item",{attrs:{index:"autoReply"}},[e._v("自动回复配置")])],1)],2),e._v(" "),i("el-submenu",{attrs:{index:"2"}},[i("template",{slot:"title"},[i("span",[e._v("消息推送")])]),e._v(" "),i("el-menu-item-group",[i("el-menu-item",{attrs:{index:"2-1"}},[e._v("模板消息")])],1)],2),e._v(" "),i("el-submenu",{attrs:{index:"3"}},[i("template",{slot:"title"},[i("span",[e._v("系统管理")])]),e._v(" "),i("el-menu-item-group",[i("el-menu-item",{attrs:{index:"3-1"}},[e._v("权限设置")]),e._v(" "),i("el-menu-item",{attrs:{index:"3-2"}},[e._v("系统日志")])],1)],2)],1)],1),e._v(" "),i("el-main",[i("router-view",{on:{nowPublic:e.getnowPublic,activeIndex:e.getactiveIndex}})],1)],1)],1)},staticRenderFns:[]};var y={components:{Header:i("Z0/y")(_,k,!1,function(e){i("1YXr")},"data-v-de593c7a",null).exports}},x={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"main"},[t("Header")],1)},staticRenderFns:[]};var F=i("Z0/y")(y,x,!1,function(e){i("l/04")},"data-v-13903662",null).exports,$={data:function(){return{publicConfig:[],loading:!0,loading2:!1,dialogVisible:!1,ruleForm:{wechatid:"",name:"",appid:"",appsecret:"",token:"",encodingaeskey:""},addOrEdit:-1,title:"添加公众号",rules:{wechatid:[{trigger:"blur",required:!0,message:"请输入微信号"}],name:[{trigger:"blur",required:!0,message:"请输入公众号名称"}],appid:[{trigger:"blur",required:!0,message:"请输入appid"}],appsecret:[{trigger:"blur",required:!0,message:"请输入appsecret"}],token:[{trigger:"blur",required:!0,message:"请输入token"}]}}},mounted:function(){this.$nextTick(function(){this.$emit("activeIndex","configure"),this.getconfigInfo()})},methods:{use:function(e){var t=this;this.$confirm("是否切换到 "+e.name).then(function(i){var o={time:t.tools.time,apitoken:t.tools.apitoken,id:e.id};t.tools.getAxio("http://www.songphper.top/index/Config/changeAccount.html",o).then(function(i){1==i.status?(t.$message.success(i.msg),t.getconfigInfo(),t.$emit("nowPublic",e.name),sessionStorage.setItem("name",e.name)):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)})}).catch(function(e){})},add:function(e){var t=this;if(this.dialogVisible=!0,-1!=e){this.addOrEdit=e.id,this.title="编辑公众号";var i={time:this.tools.time,apitoken:this.tools.apitoken,id:e.id};this.tools.getAxio("http://www.songphper.top/index/Config/getConfigInfo.html",i).then(function(e){1==e.status?t.ruleForm=e.configinfo:2==e.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(e.msg)})}else this.addOrEdit=-1,this.title="添加公众号",this.ruleForm={wechatid:"",name:"",appid:"",appsecret:"",token:"",encodingaeskey:""}},submitForm:function(e){var t=this;this.$refs[e].validate(function(i){if(!i)return!1;if(t.loading2=!0,-1!=t.addOrEdit){var o={time:t.tools.time,apitoken:t.tools.apitoken,name:t.ruleForm.name,appid:t.ruleForm.appid,appsecret:t.ruleForm.appsecret,token:t.ruleForm.token,encodingaeskey:t.ruleForm.encodingaeskey,wechatid:t.ruleForm.wechatid,id:t.addOrEdit};t.tools.getAxio("http://www.songphper.top/index/Config/updateConfig.html",o).then(function(i){t.loading2=!1,1==i.status?(t.$message.success(i.msg),t.$refs[e].resetFields(),t.dialogVisible=!1,t.getconfigInfo()):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)})}else{var n={time:t.tools.time,apitoken:t.tools.apitoken,name:t.ruleForm.name,appid:t.ruleForm.appid,appsecret:t.ruleForm.appsecret,token:t.ruleForm.token,encodingaeskey:t.ruleForm.encodingaeskey,wechatid:t.ruleForm.wechatid};t.tools.getAxio("http://www.songphper.top/index/Config/addconfig.html",n).then(function(i){t.loading2=!1,1==i.status?(t.$message.success(i.msg),t.$refs[e].resetFields(),t.dialogVisible=!1,t.getconfigInfo()):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)})}})},getconfigInfo:function(){var e=this,t={time:this.tools.time,apitoken:this.tools.apitoken};this.tools.getAxio("http://www.songphper.top/index/Config/index.html",t).then(function(t){if(e.loading=!1,1==t.status){var i=!0;e.publicConfig=t.configlist,e.publicConfig.forEach(function(t,o){1==t.status&&(e.$emit("nowPublic",t.name),sessionStorage.setItem("name",t.name),i=!1)}),i&&e.$emit("nowPublic","暂时没有哦")}else 2==t.status?e.$router.push({name:"login",path:"/login"}):e.$message.error(t.msg)})},del:function(e){var t=this;this.$confirm("是否删除 "+e.name).then(function(i){var o={time:t.tools.time,apitoken:t.tools.apitoken,id:e.id};t.tools.getAxio("http://www.songphper.top/index/Config/delConfig.html",o).then(function(e){1==e.status?(t.$message.success(e.msg),t.getconfigInfo()):2==e.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(e.msg)})}).catch(function(e){})}}},C={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"main"},[i("h1",[e._v("公众号配置")]),e._v(" "),i("el-button",{staticClass:"addPublic",attrs:{type:"primary"},on:{click:function(t){e.add(-1)}}},[i("i",{staticClass:"el-icon-plus"}),e._v(" 添加公众号")]),e._v(" "),i("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticStyle:{width:"100%"},attrs:{data:e.publicConfig,border:""}},[i("el-table-column",{attrs:{type:"expand"},scopedSlots:e._u([{key:"default",fn:function(t){return[i("el-form",{staticClass:"demo-table-expand",attrs:{"label-position":"left",inline:""}},[i("el-form-item",{attrs:{label:"微信号"}},[i("span",[e._v(e._s(t.row.wechatid))])]),e._v(" "),i("el-form-item",{attrs:{label:"公众号名称"}},[i("span",[e._v(e._s(t.row.name))])]),e._v(" "),i("el-form-item",{attrs:{label:"APPID"}},[i("span",[e._v(e._s(t.row.appid))])]),e._v(" "),i("el-form-item",{attrs:{label:"Appsecret"}},[i("span",[e._v(e._s(t.row.appsecret))])]),e._v(" "),i("el-form-item",{attrs:{label:"Encodingaeskey"}},[i("span",[e._v(e._s(t.row.encodingaeskey))])]),e._v(" "),i("el-form-item",{attrs:{label:"Token"}},[i("span",[e._v(e._s(t.row.token))])]),e._v(" "),i("el-form-item",{attrs:{label:"创建时间"}},[i("span",[e._v(e._s(t.row.createtime))])]),e._v(" "),i("el-form-item",{attrs:{label:"更新时间"}},[i("span",[e._v(e._s(t.row.updatetime))])])],1)]}}])}),e._v(" "),i("el-table-column",{attrs:{type:"index",width:"60",label:"ID"}}),e._v(" "),i("el-table-column",{attrs:{prop:"wechatid",label:"微信号",width:"180"}}),e._v(" "),i("el-table-column",{attrs:{prop:"name",label:"公众号名称",width:"200"}}),e._v(" "),i("el-table-column",{attrs:{prop:"appid",label:"APPID"}}),e._v(" "),i("el-table-column",{attrs:{prop:"status",label:"状态",width:"80"},scopedSlots:e._u([{key:"default",fn:function(t){return[1==t.row.status?i("span",{staticClass:"active"},[e._v("使用中")]):i("span",{staticClass:"nactive"},[e._v("未使用")])]}}])}),e._v(" "),i("el-table-column",{attrs:{label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[1==t.row.status?i("el-button",{attrs:{type:"info",size:"middle",disabled:""}},[e._v("使用")]):i("el-button",{attrs:{type:"primary",size:"middle"},on:{click:function(i){e.use(t.row)}}},[e._v("使用")]),e._v(" "),i("el-button",{attrs:{type:"success",size:"middle"},on:{click:function(i){e.add(t.row)}}},[i("i",{staticClass:"el-icon-edit"})]),e._v(" "),i("el-button",{attrs:{type:"danger",size:"middle"},on:{click:function(i){e.del(t.row)}}},[i("i",{staticClass:"el-icon-delete"})])]}}])})],1),e._v(" "),i("el-dialog",{attrs:{title:e.title,visible:e.dialogVisible,width:"640px",top:"10vh"},on:{"update:visible":function(t){e.dialogVisible=t}}},[i("el-form",{ref:"ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"120px","status-icon":""}},[i("el-form-item",{attrs:{label:"微信号",prop:"wechatid"}},[i("el-input",{model:{value:e.ruleForm.wechatid,callback:function(t){e.$set(e.ruleForm,"wechatid",t)},expression:"ruleForm.wechatid"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"公众号名称",prop:"name"}},[i("el-input",{model:{value:e.ruleForm.name,callback:function(t){e.$set(e.ruleForm,"name",t)},expression:"ruleForm.name"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"Appid",prop:"appid"}},[i("el-input",{model:{value:e.ruleForm.appid,callback:function(t){e.$set(e.ruleForm,"appid",t)},expression:"ruleForm.appid"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"Appsecret",prop:"appsecret"}},[i("el-input",{model:{value:e.ruleForm.appsecret,callback:function(t){e.$set(e.ruleForm,"appsecret",t)},expression:"ruleForm.appsecret"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"Token",prop:"token"}},[i("el-input",{model:{value:e.ruleForm.token,callback:function(t){e.$set(e.ruleForm,"token",t)},expression:"ruleForm.token"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"Encodingaeskey",prop:"encodingaeskey"}},[i("el-input",{model:{value:e.ruleForm.encodingaeskey,callback:function(t){e.$set(e.ruleForm,"encodingaeskey",t)},expression:"ruleForm.encodingaeskey"}})],1)],1),e._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(t){e.dialogVisible=!1}}},[e._v("取 消")]),e._v(" "),i("el-button",{directives:[{name:"loading",rawName:"v-loading",value:e.loading2,expression:"loading2"}],attrs:{type:"primary"},on:{click:function(t){e.submitForm("ruleForm")}}},[e._v("确 定")])],1)],1)],1)},staticRenderFns:[]};var I=i("Z0/y")($,C,!1,function(e){i("TKys")},"data-v-9ecb26c4",null).exports,P={data:function(){var e=this,t=function(t,i,o){""===i?2==e.radio?o(new Error("请输入链接地址")):4==e.radio&&o(new Error("请输入小程序路径")):o()};return{loading:!0,menuInfo:[],title:"添加顶级菜单",dialogVisible:!1,radio:"1",isParent:-1,isEditParent:1,EditId:0,isParentText:"顶级菜单",ruleForm:{buttonname:"",key:"",url:"",url2:"",sort:""},rules:{buttonname:[{trigger:"change",required:!0,validator:function(t,i,o){var n=i.replace(/[^\x00-\xff]/g,"aa").length;""===i?o(new Error("请输入菜单名称")):-1==e.isParent&&n>8?o(new Error("顶级菜单不能超过4个汉字或者8个字母或数字")):-1!=e.isParent&&n>16?o(new Error("子菜单不能超过8个汉字或者16个字母或数字")):o()}}],key:[{trigger:"blur",required:!0,message:"请输入小程序APPID"}],url:[{trigger:"blur",required:!0,validator:t}],url2:[{trigger:"blur",required:!0,validator:t}]}}},mounted:function(){this.$nextTick(function(){this.$emit("activeIndex","menu"),this.getMenuInfo(),sessionStorage.getItem("name")?this.$emit("nowPublic",sessionStorage.getItem("name")):this.$emit("nowPublic","暂时没有哦")})},methods:{getMenuInfo:function(){var e=this,t={time:this.tools.time,apitoken:this.tools.apitoken};this.tools.getAxio("http://www.songphper.top/index/Menu/index.html",t).then(function(t){e.loading=!1,1==t.status?(t.menulist.forEach(function(e,t){"view"==e.type?e.type="跳转网页":"show"==e.type?e.type="显示子菜单":"media_id"==e.type?e.type="跳转图文消息":"miniprogram"==e.type&&(e.type="跳转小程序"),e.chmenu.forEach(function(e,t){"view"==e.type?e.type="跳转网页":"show"==e.type?e.type="显示子菜单":"media_id"==e.type?e.type="跳转图文消息":"miniprogram"==e.type&&(e.type="跳转小程序")})}),e.menuInfo=t.menulist):2==t.status?e.$router.push({name:"login",path:"/login"}):e.$message.error(t.msg)})},add:function(e,t){var i=this;if(this.EditId=0,this.dialogVisible=!0,this.ruleForm={buttonname:"",key:"",url:"",sort:""},-1==e?(this.isEditParent=1,this.isParent=-1,this.radio="1",this.isParentText="顶级菜单",this.title="添加顶级菜单"):(this.isEditParent=1,this.isParent=e.id,this.radio="2",this.isParentText="子菜单",this.title="添加"+e.buttonname+"下的子菜单"),void 0!=t){this.EditId=e.id,1==t?(this.title="编辑顶级菜单",this.isParentText="顶级菜单",this.isParent=-1,"显示子菜单"==e.type?this.isEditParent=-1:this.isEditParent=1):0==t&&(this.isEditParent=1,this.title="编辑"+e.buttonname,this.isParent=e.parentid);var o={time:this.tools.time,apitoken:this.tools.apitoken,id:e.id};this.tools.getAxio("http://www.songphper.top/index/Menu/getMenuInfo.html",o).then(function(e){1==e.status?(i.ruleForm=e.menuinfo,"show"==e.menuinfo.type?i.radio="1":"view"==e.menuinfo.type?(i.radio="2",i.ruleForm.url2="",i.ruleForm.key=""):"media_id"==e.menuinfo.type?i.radio="3":"miniprogram"==e.menuinfo.type&&(i.radio="4",i.ruleForm.url2=e.menuinfo.url,i.ruleForm.url="")):2==e.status?i.$router.push({name:"login",path:"/login"}):i.$message.error(e.msg)})}},del:function(e){var t=this,i={time:this.tools.time,apitoken:this.tools.apitoken,id:e.id};this.$confirm("是否删除 "+e.buttonname).then(function(e){t.tools.getAxio("http://www.songphper.top/index/Menu/delMenu.html",i).then(function(e){1==e.status?(t.getMenuInfo(),t.$message.success(e.msg)):2==e.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(e.msg)})}).catch(function(e){})},getMenu:function(){var e=this,t={time:this.tools.time,apitoken:this.tools.apitoken};this.$confirm("是否要从微信服务器拉取菜单").then(function(i){var o=e.$loading({text:"拼命拉取中..."});e.tools.getAxio("http://www.songphper.top/index/Wechat/getMenu.html",t).then(function(t){1==t.status?(e.getMenuInfo(),e.$message.success(t.msg)):2==t.status?e.$router.push({name:"login",path:"/login"}):e.$message.error(t.msg),o.close()})}).catch(function(e){})},putMenu:function(){var e=this,t={time:this.tools.time,apitoken:this.tools.apitoken};this.$confirm("是否要把本地菜单推送到微信服务器").then(function(i){var o=e.$loading({text:"拼命推送中..."});e.tools.getAxio("http://www.songphper.top/index/Wechat/createMenu.html",t).then(function(t){1==t.status?e.$message.success(t.msg):2==t.status?e.$router.push({name:"login",path:"/login"}):e.$message.error(t.msg),o.close()})}).catch(function(e){})},submitForm:function(e){var t=this;this.$refs[e].validate(function(i){if(!i)return!1;var o={time:t.tools.time,apitoken:t.tools.apitoken,buttonname:t.ruleForm.buttonname,sort:t.ruleForm.sort,status:1};-1==t.isParent?(0!=t.EditId&&(o.id=t.EditId),o.parentid=0,1==t.radio?o.type="show":2==t.radio?(o.type="view",o.url=t.ruleForm.url):3==t.radio?o.type="media_id":4==t.radio&&(o.type="miniprogram",o.url=t.ruleForm.url2,o.key=t.ruleForm.key),0==t.EditId?t.tools.getAxio("http://www.songphper.top/index/Menu/addMenu.html",o).then(function(i){1==i.status?(t.getMenuInfo(),t.$message.success(i.msg),t.dialogVisible=!1,t.$refs[e].resetFields()):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)}):t.tools.getAxio("http://www.songphper.top/index/Menu/editMenu.html",o).then(function(i){1==i.status?(t.getMenuInfo(),t.$message.success(i.msg),t.dialogVisible=!1,t.$refs[e].resetFields()):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)})):(o.parentid=t.isParent,0!=t.EditId&&(o.id=t.EditId),2==t.radio?(o.type="view",o.url=t.ruleForm.url):3==t.radio?o.type="media_id":4==t.radio&&(o.type="miniprogram",o.url=t.ruleForm.url2,o.key=t.ruleForm.key),0==t.EditId?t.tools.getAxio("http://www.songphper.top/index/Menu/addMenu.html",o).then(function(i){1==i.status?(t.getMenuInfo(),t.$message.success(i.msg),t.dialogVisible=!1,t.$refs[e].resetFields()):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)}):t.tools.getAxio("http://www.songphper.top/index/Menu/editMenu.html",o).then(function(i){1==i.status?(t.getMenuInfo(),t.$message.success(i.msg),t.dialogVisible=!1,t.$refs[e].resetFields()):2==i.status?t.$router.push({name:"login",path:"/login"}):t.$message.error(i.msg)}))})}}},E={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"main"},[i("h1",[e._v("自定义菜单")]),e._v(" "),i("el-button",{staticClass:"addPublic",attrs:{type:"primary"},on:{click:function(t){e.add(-1)}}},[i("i",{staticClass:"el-icon-plus"}),e._v(" 顶级菜单")]),e._v(" "),i("el-button",{staticClass:"addPublic",attrs:{type:"primary"},on:{click:e.putMenu}},[i("i",{staticClass:"el-icon-upload2"}),e._v(" 推送菜单")]),e._v(" "),i("el-button",{staticClass:"addPublic",attrs:{type:"primary"},on:{click:e.getMenu}},[i("i",{staticClass:"el-icon-download"}),e._v(" 获取菜单")]),e._v(" "),i("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticStyle:{width:"100%","margin-top":"20px","min-width":"1160px"},attrs:{data:e.menuInfo}},[i("el-table-column",{attrs:{type:"expand"},scopedSlots:e._u([{key:"default",fn:function(t){return[i("el-table",{staticClass:"childrenMenu",attrs:{data:t.row.chmenu,"show-header":!1}},[i("el-table-column",{attrs:{prop:"id",width:"58",label:"ID"}}),e._v(" "),i("el-table-column",{attrs:{prop:"buttonname",label:"菜单名",width:"200"}}),e._v(" "),i("el-table-column",{attrs:{prop:"type",label:"功能",width:"200"}}),e._v(" "),i("el-table-column",{attrs:{label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[i("el-button",{attrs:{type:"success",size:"middle"},on:{click:function(i){e.add(t.row,0)}}},[i("i",{staticClass:"el-icon-edit"})]),e._v(" "),i("el-button",{attrs:{type:"danger",size:"middle"},on:{click:function(i){e.del(t.row)}}},[i("i",{staticClass:"el-icon-delete"})])]}}])})],1)]}}])}),e._v(" "),i("el-table-column",{attrs:{prop:"id",width:"60",label:"ID"}}),e._v(" "),i("el-table-column",{attrs:{prop:"buttonname",label:"菜单名",width:"200"}}),e._v(" "),i("el-table-column",{attrs:{prop:"type",label:"功能",width:"200"}}),e._v(" "),i("el-table-column",{attrs:{label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[i("el-button",{attrs:{type:"success",size:"middle"},on:{click:function(i){e.add(t.row,1)}}},[i("i",{staticClass:"el-icon-edit"})]),e._v(" "),i("el-button",{attrs:{type:"danger",size:"middle"},on:{click:function(i){e.del(t.row)}}},[i("i",{staticClass:"el-icon-delete"})]),e._v(" "),"显示子菜单"==t.row.type?i("el-button",{attrs:{type:"primary",size:"middle"},on:{click:function(i){e.add(t.row)}}},[i("i",{staticClass:"el-icon-plus"}),e._v("子菜单")]):e._e()]}}])})],1),e._v(" "),i("el-dialog",{attrs:{title:e.title,visible:e.dialogVisible,width:"640px"},on:{"update:visible":function(t){e.dialogVisible=t}}},[i("el-form",{ref:"ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"120px","status-icon":""}},[i("el-form-item",{attrs:{label:e.isParentText,prop:"buttonname"}},[i("el-input",{model:{value:e.ruleForm.buttonname,callback:function(t){e.$set(e.ruleForm,"buttonname",t)},expression:"ruleForm.buttonname"}})],1),e._v(" "),1==e.isEditParent?i("el-form-item",{attrs:{label:"菜单功能"}},[i("el-radio-group",{attrs:{size:"mini"},model:{value:e.radio,callback:function(t){e.radio=t},expression:"radio"}},[-1==e.isParent?i("el-radio",{attrs:{border:"",label:"1"}},[e._v("显示子菜单")]):e._e(),e._v(" "),i("el-radio",{attrs:{border:"",label:"2"}},[e._v("跳转网页")]),e._v(" "),i("el-radio",{attrs:{border:"",label:"3"}},[e._v("跳转图文消息")]),e._v(" "),i("el-radio",{attrs:{border:"",label:"4"}},[e._v("跳转小程序")])],1)],1):e._e(),e._v(" "),1==e.isEditParent?i("div",[1==e.radio?i("div"):2==e.radio?i("div",[i("el-form-item",{attrs:{label:"链接地址",prop:"url"}},[i("el-input",{model:{value:e.ruleForm.url,callback:function(t){e.$set(e.ruleForm,"url",t)},expression:"ruleForm.url"}})],1)],1):3==e.radio?i("div"):4==e.radio?i("div",[i("el-form-item",{attrs:{label:"小程序APPID",prop:"key"}},[i("el-input",{model:{value:e.ruleForm.key,callback:function(t){e.$set(e.ruleForm,"key",t)},expression:"ruleForm.key"}})],1),e._v(" "),i("el-form-item",{attrs:{label:"小程序路径",prop:"url2"}},[i("el-input",{model:{value:e.ruleForm.url2,callback:function(t){e.$set(e.ruleForm,"url2",t)},expression:"ruleForm.url2"}})],1)],1):e._e()]):e._e(),e._v(" "),i("el-form-item",{attrs:{label:"排序"}},[i("el-input",{model:{value:e.ruleForm.sort,callback:function(t){e.$set(e.ruleForm,"sort",t)},expression:"ruleForm.sort"}})],1)],1),e._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(t){e.dialogVisible=!1}}},[e._v("取 消")]),e._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:function(t){e.submitForm("ruleForm")}}},[e._v("确 定")])],1)],1)],1)},staticRenderFns:[]};var M=i("Z0/y")(P,E,!1,function(e){i("09X1")},"data-v-61e3ab58",null).exports;o.default.use(l.a),o.default.use(r.a),o.default.prototype.tools=g;var A=new r.a({routes:[{path:"/",name:"login",component:w},{path:"/login",name:"login",component:w},{path:"/main",name:"main",component:F,children:[{name:"configure",path:"/configure",component:I},{name:"menu",path:"/menu",component:M}]}]});o.default.config.productionTip=!1,new o.default({el:"#app",router:A,components:{App:s},template:"<App/>"})},TKys:function(e,t){},"l/04":function(e,t){},rYN9:function(e,t){}},["NHnr"]);
//# sourceMappingURL=app.93890819028014d2f85c.js.map