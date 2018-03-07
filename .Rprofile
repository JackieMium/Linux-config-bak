# customized options
options(prompt="\033[0;36mR >>> \033[0m", continue="... ")
options(editor="vim", menu.graphics=FALSE)
options(stringsAsFactors = FALSE, show.signif.stars = TRUE, digits = 4)

# launch Bioconductor and set Bioconductor mirror at startup
#source("http://bioconductor.org/biocLite.R")
#options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")   # mighty USTC
#options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")   # TUNA then
#source("https://bioc.ism.ac.jp/biocLite.R")   # an alternative Japanese mirror

# set CRAN mirror. Better add at least two in case that one of them stops working
options(repos=c("http://mirrors.ustc.edu.cn/CRAN/", "https://mirrors.tongji.edu.cn/CRAN/",
                "http://mirrors.tuna.tsinghua.edu.cn/CRAN/", "https://mirrors.aliyun.com/CRAN/"))

# lanuch Bioconductor may take too long, disable auto start and start when needed
source.bio <- function(){
	source("http://bioconductor.org/biocLite.R")
	options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")
}


# useful little customized functions
cd <- setwd
pwd <- getwd
hh <- function(d) {
  row_num <- min(5,nrow(d))
  col_num <- min(5,ncol(d))
  return(d[1:row_num,1:col_num])
}

# load favorite packages automatically at startup
options(defaultPackages=c(getOption("defaultPackages"), 'beepr',
       "colorout"))

# display greeting message at startup
.First <- function(){
	message("Welcome back, ", Sys.getenv("USER"),"!\n","Current working directory: ", getwd(),
                "\nDate and time: ", format(Sys.time(), "%Y-%m-%d %H:%M"), "\r\n")
	# display a message when all above loaded successfully
	message("###### SUCCESSFULLY LOADED. LET'S DO THIS! ######")
}

# goodbye at closing
.Last <- function() {
	cat("\nGoodbye at ", date(), "\n")
}
