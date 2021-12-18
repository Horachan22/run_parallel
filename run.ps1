#===================================================================
#Project Name    : run_parallel
#File Name       : run.ps1
#Encoding        : UTF-8
#Creation Date   : 2021/12/15
#===================================================================

cd "path"

$CLUSTER_name    = "Ryzen5600"
$item_list       = Get-ChildItem ".\"
$number_of_files = 0

foreach($item in $item_list){
	$file_name = $item.Name
	if($file_name -like $CLUSTER_name + "*"){
		$number_of_files = $number_of_files + 1
	}
}

for($i = 1; $i -lt $number_of_files + 1; $i++){
	$file_num = [string]$i
	if($file_num.Length -eq 1){
		$file_num = "0" + $file_num
	}
	$exe_name = ".\" + $CLUSTER_name + "_" + $file_num + ".exe"
	start-process -FilePath $exe_name
}
