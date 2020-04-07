# [ 동적 크롤링 수행평가 ]
# https://www.istarbucks.co.kr/store/store_map.do?disp=locale
# 로 요청한 후에 서울지역을 클릭하고, 
# 모든 매장들의 매장명(shopname), 위도(lat), 경도(lng), 주소(addr) 그리고 전화번호(telephone)를 추출하여 starbucks.csv 로 저장한다. 속성 정보를 추출하는 API는 강사컴 학습관련소스와문서/4월7일 폴더의 RSelenium.pdf를 참고한다.
# starbucks.R 과 starbucks.csv 을 메일로(unicodaum@hanmail.net – 메일 제목 : 동적 크롤링 수행평가 - XXX)제출한다.
# https://www.w3schools.com/jsref/met_element_scrollintoview.asp
# 힌트… 사이트의 도움을 받아야 할 수도 있다.

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open()
url <- 'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)
Sys.sleep(2)

sel_seoul <- remDr$findElement(using = 'css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
Sys.sleep(1)
sel_seoul$clickElement()
sel_full <- remDr$findElement(using = 'css', '#mCSB_2_container > ul > li:nth-child(1) > a')
sel_full$clickElement()
Sys.sleep(2)
# 전체 매장 갯수 추출
limit <- remDr$findElement(using = 'css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span')$getElementText()
limit <- as.numeric(limit)

#지점 정보 읽어 오기
shopname <- c()
lat <- c()
lng <- c()
addr <- c()
telephone <- c()

for(index in 1:limit){
  index
  css <- paste0('#mCSB_3_container > ul > li:nth-child(', index,')')
  dom <- remDr$findElement(using = 'css', css)
  shopname <- c(shopname, dom$getElementAttribute('data-name'))
  lat <- c(lat, dom$getElementAttribute('data-lat'))
  lng <- c(lng, dom$getElementAttribute('data-long'))
  css_sub <- paste0('#mCSB_3_container > ul > li:nth-child(', index,') > p')
  dom_sub <- remDr$findElement(using = 'css', css_sub)
  info <- dom_sub$getElementText()
  addr <- c(addr, unlist(strsplit(unlist(info), split = '\n'))[1])
  telephone <- c(telephone, unlist(strsplit(unlist(info), split = '\n'))[2])
  
  #3개 지점마다 스크롤 발생
  if(index %% 3 == 0 && index != limit)
    remDr$executeScript(
      "var dom = document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]];
      dom.scrollIntoView();", list(index)
    )
  # executeScript 함수 부분 분석해서 재작성 하기
  
}

write.csv(cbind(shopname, lat, lng, addr, telephone), file = "starbucks.csv")


