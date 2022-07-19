OLP = {};

if(document.getElementById("colValue").value){
    document.getElementById("colValue").value =  getSavedValue("colValue")
}

if (document.getElementById("colName").value) {
    document.getElementById("colName").value = getSavedValue("colName")
}

function saveValue(e){
    var id = e.id;
    var val = e.value;
    localStorage.setItem(id, val);
}
function getSavedValue(v){

    if(!localStorage.getItem(v)){
        return ""
    }
    return localStorage.getItem(v)

}
var form = document.forms['se']
form.onchange = function (e) {
    var optionValue = this.colName
    saveValue(optionValue)
}

