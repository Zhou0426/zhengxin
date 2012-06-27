/*************************************************************************************
	����Ŀ¼���ؼ�CHM�����ĵ����ģ����� �������������2003��7��16�գ���������Ȩ����
**************************************************************************************/
function getScriptPath(js)
{
	js=js.toLowerCase()
	var script=document.getElementsByTagName("SCRIPT");
	for(var i=0;i<script.length;i++)
	{
		var s=script[i].src.toLowerCase()
		if(s.indexOf(js)!=-1)return s.replace(js,"")
	}
	return null
}

function alai_tree_help(toObject)
{
	var path=getScriptPath("alai_tree_1_1.js")
	if(path==null){alert("run alai_tree_help() fail, please load alai_tree.js first!");return;}
	var icons=new alai_imagelist()
	icons.path=path+"../img/"
	icons.add("hfile","default")
	icons.add("plus","expand")
	icons.add("minus","collapse")
	icons.add("hfold_open")
	icons.add("hfold_close")
	var tree=new alai_tree(icons,18,toObject)
	tree.afteradd=function(srcNode)
	{
		if(srcNode.parent!=tree.root)srcNode.parent.icon.src=icons.item["hfold_open"].src
	}
	tree.afterremove=function(srcNode)
	{
		if(srcNode.parent!=null && srcNode.parent.hasChild==false)srcNode.parent.icon.src=icons.item["default"].src
	}
	tree.onexpand=function(srcNode)
	{
		srcNode.icon.src=icons.item["hfold_open"].src
	}
	tree.oncollapse=function(srcNode)
	{
		srcNode.icon.src=icons.item["hfold_close"].src
	}
	return tree
}