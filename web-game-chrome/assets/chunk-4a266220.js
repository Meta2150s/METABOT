chrome.runtime.onMessage.addListener(e=>{e.action==="openPopup"&&chrome.windows.create({url:`chrome-extension://${chrome.runtime.id}/popup.html`,type:"popup",width:420,height:600,left:0,top:0})});
