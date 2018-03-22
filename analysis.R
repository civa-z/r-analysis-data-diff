get_array <- function(data.folder){
	print(data.folder)
	list.data = list()
	data.dir=dir(data.folder)
	for (i in c(1:length(data.dir))){
		bindata.data <- read.table(paste(data.folder, "/", data.dir[i], sep=""),  head=FALSE)
		list.data <- c(list.data, as.matrix(bindata.data))
	}
	array.data = array(unlist(list.data), dim = c(14,3,length(data.dir)))
	return (array.data)
}

get_level2_array <- function(folder.data){
	list.data = c()
	length.data = 0
	folders.data=dir(folder.data)
	for (i in c(1:length(folders.data))){
		folder.i = paste(folder.data, "/",folders.data[i], sep="")
		array.i = get_array(folder.i)
		print(dim(array.i))
		length.data = length.data + dim(array.i)[2]
		list.data = c(list.data, array.i)
	}
	print(length.data)
	array.data = array(unlist(list.data), dim = c(14,3,length.data))
	return (array.data)
}

folder.old = "ResultsData_old"
folder.new = "ResultsData_new"
array.old = get_level2_array(folder.old)
array.new = get_level2_array(folder.new)

array.diff = array.old - array.new

print(length(array.old))
print(dim(array.old))

print(length(array.new))
print(dim(array.new))

print(length(array.diff))
print(dim(array.diff))

hist(array.diff)
