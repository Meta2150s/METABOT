import{z as we,u as Ce,r as s,A as ke,L as Ve,d as i,K as Y,o as d,c as Q,C as y,D as E,f as e,e as a,w as o,i as O,B as P,m,j as f,x as A,l as S,a4 as xe,k as M,a5 as Se,a6 as Be,s as Ne}from"./index.47c6a412.js";const Oe={class:"app-container"},Ue=["textContent"],Ke={class:"dialog-footer"},De=we({name:"Oss"}),Ie=Object.assign(De,{setup(Re){const G=Ce(),{proxy:g}=Ne(),L=s([]),b=s(!1),D=s(!0),J=s(!1),C=s(!0),U=s(!0),$=s([]),W=s(!0),j=s(!0),R=s(0),T=s(""),K=s(0),k=s(!0),B=s([]),q=s({prop:"createTime",order:"ascending"}),X=ke({form:{},queryParams:{pageNum:1,pageSize:10,fileName:void 0,originalName:void 0,fileSuffix:void 0,url:void 0,createTime:void 0,createBy:void 0,service:void 0},rules:{file:[{required:!0,message:"\u6587\u4EF6\u4E0D\u80FD\u4E3A\u7A7A",trigger:"blur"}]}}),{queryParams:r,form:V,rules:Z}=Ve(X);function v(){C.value=!0,g.getConfigKey("sys.oss.previewListResource").then(n=>{k.value=n.msg===void 0?!0:n.msg==="true"}),Se(g.addDateRange(r.value,B.value,"CreateTime")).then(n=>{L.value=n.rows,R.value=n.total,C.value=!1,D.value=!0})}function F(n){return["png","jpg","jpeg"].some(p=>n.indexOf(p)>-1)}function ee(){b.value=!1,I()}function I(){V.value={file:void 0},g.resetForm("ossRef")}function h(){r.value.pageNum=1,v()}function le(){D.value=!1,B.value=[],g.resetForm("queryRef"),r.value.orderByColumn=q.value.prop,r.value.isAsc=q.value.order,h()}function ae(n){$.value=n.map(l=>l.ossId),W.value=n.length!=1,j.value=!n.length}function te({column:n}){n.order=n.multiOrder}function ne(n){if(n.sortable==="custom"){switch(n.multiOrder){case"descending":n.multiOrder="ascending";break;case"ascending":n.multiOrder="";break;default:n.multiOrder="descending";break}oe(n.property,n.multiOrder)}}function oe(n,l){let p=r.value.orderByColumn?r.value.orderByColumn.split(","):[],u=r.value.isAsc?r.value.isAsc.split(","):[],x=p.indexOf(n);x!==-1?l?u[x]=l:(u.splice(x,1),p.splice(x,1)):(p.push(n),u.push(l)),r.value.orderByColumn=p.join(","),r.value.isAsc=u.join(","),v()}function re(){G.push("/system/oss-config/index")}function se(){I(),b.value=!0,T.value="\u4E0A\u4F20\u6587\u4EF6",K.value=0}function ie(){I(),b.value=!0,T.value="\u4E0A\u4F20\u56FE\u7247",K.value=1}function ue(){b.value=!1,v()}function de(n){g.$download.oss(n.ossId)}function pe(n){let l=n?"\u542F\u7528":"\u505C\u7528";g.$modal.confirm('\u786E\u8BA4\u8981"'+l+'""\u9884\u89C8\u5217\u8868\u56FE\u7247"\u914D\u7F6E\u5417?').then(()=>g.updateConfigByKey("sys.oss.previewListResource",n)).then(()=>{v(),g.$modal.msgSuccess(l+"\u6210\u529F")}).catch(()=>{})}function H(n){const l=n.ossId||$.value;g.$modal.confirm('\u662F\u5426\u786E\u8BA4\u5220\u9664OSS\u5BF9\u8C61\u5B58\u50A8\u7F16\u53F7\u4E3A"'+l+'"\u7684\u6570\u636E\u9879?').then(()=>(C.value=!0,Be(l))).then(()=>{C.value=!1,v(),g.$modal.msgSuccess("\u5220\u9664\u6210\u529F")}).finally(()=>{C.value=!1})}return v(),(n,l)=>{const p=i("el-input"),u=i("el-form-item"),x=i("el-date-picker"),c=i("el-button"),z=i("el-form"),N=i("el-col"),ce=i("right-toolbar"),me=i("el-row"),_=i("el-table-column"),fe=i("el-table"),ge=i("pagination"),ye=i("fileUpload"),_e=i("imageUpload"),ve=i("el-dialog"),w=Y("hasPermi"),be=Y("loading");return d(),Q("div",Oe,[y(a(z,{model:e(r),ref:"queryRef",inline:!0},{default:o(()=>[a(u,{label:"\u6587\u4EF6\u540D",prop:"fileName"},{default:o(()=>[a(p,{modelValue:e(r).fileName,"onUpdate:modelValue":l[0]||(l[0]=t=>e(r).fileName=t),placeholder:"\u8BF7\u8F93\u5165\u6587\u4EF6\u540D",clearable:"",style:{width:"200px"},onKeyup:O(h,["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),a(u,{label:"\u539F\u540D",prop:"originalName"},{default:o(()=>[a(p,{modelValue:e(r).originalName,"onUpdate:modelValue":l[1]||(l[1]=t=>e(r).originalName=t),placeholder:"\u8BF7\u8F93\u5165\u539F\u540D",clearable:"",style:{width:"200px"},onKeyup:O(h,["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),a(u,{label:"\u6587\u4EF6\u540E\u7F00",prop:"fileSuffix"},{default:o(()=>[a(p,{modelValue:e(r).fileSuffix,"onUpdate:modelValue":l[2]||(l[2]=t=>e(r).fileSuffix=t),placeholder:"\u8BF7\u8F93\u5165\u6587\u4EF6\u540E\u7F00",clearable:"",style:{width:"200px"},onKeyup:O(h,["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),a(u,{label:"\u521B\u5EFA\u65F6\u95F4"},{default:o(()=>[a(x,{modelValue:e(B),"onUpdate:modelValue":l[3]||(l[3]=t=>P(B)?B.value=t:null),"value-format":"YYYY-MM-DD HH:mm:ss",type:"daterange","range-separator":"-","start-placeholder":"\u5F00\u59CB\u65E5\u671F","end-placeholder":"\u7ED3\u675F\u65E5\u671F","default-time":[new Date(2e3,1,1,0,0,0),new Date(2e3,1,1,23,59,59)]},null,8,["modelValue","default-time"])]),_:1}),a(u,{label:"\u4E0A\u4F20\u4EBA",prop:"createBy"},{default:o(()=>[a(p,{modelValue:e(r).createBy,"onUpdate:modelValue":l[4]||(l[4]=t=>e(r).createBy=t),placeholder:"\u8BF7\u8F93\u5165\u4E0A\u4F20\u4EBA",clearable:"",style:{width:"200px"},onKeyup:O(h,["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),a(u,{label:"\u670D\u52A1\u5546",prop:"service"},{default:o(()=>[a(p,{modelValue:e(r).service,"onUpdate:modelValue":l[5]||(l[5]=t=>e(r).service=t),placeholder:"\u8BF7\u8F93\u5165\u670D\u52A1\u5546",clearable:"",style:{width:"200px"},onKeyup:O(h,["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),a(u,null,{default:o(()=>[a(c,{type:"primary",icon:"search",onClick:h},{default:o(()=>[m("\u641C\u7D22")]),_:1}),a(c,{icon:"Refresh",onClick:le},{default:o(()=>[m("\u91CD\u7F6E")]),_:1})]),_:1})]),_:1},8,["model"]),[[E,e(U)]]),a(me,{gutter:10,class:"mb8"},{default:o(()=>[a(N,{span:1.5},{default:o(()=>[y((d(),f(c,{type:"primary",plain:"",icon:"Plus",onClick:se},{default:o(()=>[m("\u4E0A\u4F20\u6587\u4EF6")]),_:1})),[[w,["system:oss:upload"]]])]),_:1},8,["span"]),a(N,{span:1.5},{default:o(()=>[y((d(),f(c,{type:"primary",plain:"",icon:"Plus",onClick:ie},{default:o(()=>[m("\u4E0A\u4F20\u56FE\u7247")]),_:1})),[[w,["system:oss:upload"]]])]),_:1},8,["span"]),a(N,{span:1.5},{default:o(()=>[y((d(),f(c,{type:"danger",plain:"",icon:"Delete",disabled:e(j),onClick:H},{default:o(()=>[m("\u5220\u9664")]),_:1},8,["disabled"])),[[w,["system:oss:remove"]]])]),_:1},8,["span"]),a(N,{span:1.5},{default:o(()=>[y((d(),f(c,{type:e(k)?"danger":"warning",plain:"",onClick:l[6]||(l[6]=t=>pe(!e(k)))},{default:o(()=>[m("\u9884\u89C8\u5F00\u5173 : "+A(e(k)?"\u7981\u7528":"\u542F\u7528"),1)]),_:1},8,["type"])),[[w,["system:oss:edit"]]])]),_:1},8,["span"]),a(N,{span:1.5},{default:o(()=>[y((d(),f(c,{type:"info",plain:"",icon:"Operation",onClick:re},{default:o(()=>[m("\u914D\u7F6E\u7BA1\u7406")]),_:1})),[[w,["system:oss:list"]]])]),_:1},8,["span"]),a(ce,{showSearch:e(U),"onUpdate:showSearch":l[7]||(l[7]=t=>P(U)?U.value=t:null),onQueryTable:v},null,8,["showSearch"])]),_:1}),e(D)?y((d(),f(fe,{key:0,data:e(L),onSelectionChange:ae,"header-cell-class-name":te,onHeaderClick:ne},{default:o(()=>[a(_,{type:"selection",width:"55",align:"center"}),S("",!0),a(_,{label:"\u6587\u4EF6\u540D",align:"center",prop:"fileName"}),a(_,{label:"\u539F\u540D",align:"center",prop:"originalName"}),a(_,{label:"\u6587\u4EF6\u540E\u7F00",align:"center",prop:"fileSuffix"}),a(_,{label:"\u6587\u4EF6\u5C55\u793A",align:"center",prop:"url"},{default:o(t=>[e(k)&&F(t.row.fileSuffix)?(d(),f(xe,{key:0,width:100,height:100,src:t.row.url,"preview-src-list":[t.row.url]},null,8,["src","preview-src-list"])):S("",!0),!F(t.row.fileSuffix)||!e(k)?(d(),Q("span",{key:1,textContent:A(t.row.url)},null,8,Ue)):S("",!0)]),_:1}),a(_,{label:"\u521B\u5EFA\u65F6\u95F4",align:"center",prop:"createTime",width:"180",sortable:"custom"},{default:o(t=>[M("span",null,A(n.parseTime(t.row.createTime,"{y}-{m}-{d}")),1)]),_:1}),a(_,{label:"\u4E0A\u4F20\u4EBA",align:"center",prop:"createBy"}),a(_,{label:"\u670D\u52A1\u5546",align:"center",prop:"service",sortable:"custom"}),a(_,{label:"\u64CD\u4F5C",align:"center","class-name":"small-padding fixed-width"},{default:o(t=>[y((d(),f(c,{link:"",type:"primary",icon:"Edit",onClick:he=>de(t.row)},{default:o(()=>[m("\u4E0B\u8F7D")]),_:2},1032,["onClick"])),[[w,["system:oss:download"]]]),y((d(),f(c,{link:"",type:"primary",icon:"Delete",onClick:he=>H(t.row)},{default:o(()=>[m("\u5220\u9664")]),_:2},1032,["onClick"])),[[w,["system:oss:remove"]]])]),_:1})]),_:1},8,["data"])),[[be,e(C)]]):S("",!0),y(a(ge,{total:e(R),page:e(r).pageNum,"onUpdate:page":l[8]||(l[8]=t=>e(r).pageNum=t),limit:e(r).pageSize,"onUpdate:limit":l[9]||(l[9]=t=>e(r).pageSize=t),onPagination:v},null,8,["total","page","limit"]),[[E,e(R)>0]]),a(ve,{title:e(T),modelValue:e(b),"onUpdate:modelValue":l[12]||(l[12]=t=>P(b)?b.value=t:null),width:"500px","append-to-body":""},{footer:o(()=>[M("div",Ke,[a(c,{loading:e(J),type:"primary",onClick:ue},{default:o(()=>[m("\u786E \u5B9A")]),_:1},8,["loading"]),a(c,{onClick:ee},{default:o(()=>[m("\u53D6 \u6D88")]),_:1})])]),default:o(()=>[a(z,{ref:"ossRef",model:e(V),rules:e(Z),"label-width":"80px"},{default:o(()=>[a(u,{label:"\u6587\u4EF6\u540D"},{default:o(()=>[e(K)===0?(d(),f(ye,{key:0,modelValue:e(V).file,"onUpdate:modelValue":l[10]||(l[10]=t=>e(V).file=t)},null,8,["modelValue"])):S("",!0),e(K)===1?(d(),f(_e,{key:1,modelValue:e(V).file,"onUpdate:modelValue":l[11]||(l[11]=t=>e(V).file=t)},null,8,["modelValue"])):S("",!0)]),_:1})]),_:1},8,["model","rules"])]),_:1},8,["title","modelValue"])])}}});export{Ie as default};