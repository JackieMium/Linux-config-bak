# customized options
options(prompt="\033[0;36mR >>> \033[0m", continue="... ", editor="vim")
options(show.signif.stars = TRUE, menu.graphics=FALSE)
options(max.print=300)
options(stringsAsFactors = FALSE)
options("download.file.method" = "libcurl")  # https://github.com/r-lib/remotes/issues/350
utils::rc.settings( ipck=TRUE)
# set Bioconductor mirror at startup
#options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")   # mighty USTC
#options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")   # TUNA then

# set CRAN mirror. Better add at least two in case that one of them stops working
options(repos="http://mirrors.tuna.tsinghua.edu.cn/CRAN/")
#options(repos=c("http://mirrors.ustc.edu.cn/CRAN/", "https://mirrors.tongji.edu.cn/CRAN/",
#                "http://mirrors.tuna.tsinghua.edu.cn/CRAN/", "https://mirrors.aliyun.com/CRAN/", 
#                "http://mirror.lzu.edu.cn/CRAN/"))
# set Bioconductor mirror at startup
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")  # "http://mirrors.ustc.edu.cn/bioc/" 
#options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")   # mighty USTC
#options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")   # TUNA then

# useful little customized functions
cd <- setwd
pwd <- getwd
hh <- function(d) {
  row_num <- min(5,nrow(d))
  col_num <- min(5,ncol(d))
  return(d[1:row_num,1:col_num])
}
notify <- function(){
	cmd <- "notify-send"
	system2(cmd, args="-i notification-message-im 'R Message' 'Mission Complete, Next->!'")
}
beep <- function() {beepr::beep()}
q <- function(save = "no", ...) {quit(save = save, ...)}
u <- function() { rvcheck::update_all(check_R = FALSE) }

# load favorite packages automatically at startup
#options(defaultPackages=c(getOption("defaultPackages"), 'colorout'))

# display greeting message at startup
.First <- function(){
	message("Welcome back, ", Sys.getenv("USER"),"!\n","Current working directory: ", getwd(),
                "\nDate and time: ", format(Sys.time(), "%Y-%m-%d %H:%M"), "\r\n")
	# display a message when all above loaded successfully
	message("###### SUCCESSFULLY LOADED. LET'S DO THIS! ######")
}

# goodbye message at closing
#.Last <- function() {
#	cat("\nGoodbye at ", date(), "\n")
#}
