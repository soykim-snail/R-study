# R study start! Git-hub 푸쉬 기능을 사용합니다.
v1 <- 1:10
v2 <- v1 + 10
print(v2)
print(as.character(v2), quote=F) # 따옴표를 제거
print(c("A","B","C"), quote=F)
v1 <- c(4, 1, 8, 6, 10)
print(v1)
v1 #변수명만 입력해도 자동으로 print 함수
?rep #help()
rep(1, 100)
rep(1:3, 5)
rep(1:3, times=5) #키워드 파라미터 
rep(1:3, each=5)

LETTERS
letters
month.name
month.abb
pi

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(1)]; 
LETTERS[c(3,4,5)]; LETTERS[3:5];LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)] #빼고 나머지 

length(LETTERS)
length(month.name)
length(pi)


x <- 1:10
x
print(x)
class(x)
rev(x)
range(x) #min and max
sort(x)
sort(x, decreasing = TRUE)
sort(x, decreasing = T)
#x <- sort(x)
order(x) #소트한 순서를 인덱스로 리턴
?order


x[3] <- 20
x
x + 1
x <- x + 1
max(x);min(x);mean(x);sum(x)
summary(x)

x[c(2,4)] # x[2], x[4]
x[c(F,T,F,T,F)] # x[c(T,F)] 
x > 5
x[x > 5] 
x[x > 5 & x < 15]
#x[x > 5 | x < 15]

names(x)
names(x) <- LETTERS[1:4]
names(x) <- NULL
x[2];x["B"]


# &, &&
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
c(T, T, F, F) && c(T, F, T, F)
c(T, T, F, F) || c(T, F, T, F)


ls()
rm(x)
x
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall > 100)
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)]
which.max(rainfall)
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


sample(1:20, 3)
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T)
sample(1:3, 10, replace=T, prob=c(1, 2, 7))

count <- sample(1:100,7)
month.korname <- c("일요일", "월요일", "화요일",
                   "수요일", "목요일", 
                   "금요일", "토요일")

paste(month.korname, count, sep = ":")
month.korname[which.max(count)]
month.korname[which.min(count)]
month.korname[which(count > 50)]

paste(month.korname, count, sep = " : ")

paste("I'm","Duli","!!")
paste("I'm","Duli","!!", sep="")
paste0("I'm","Duli","!!")

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")


