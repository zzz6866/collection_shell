# LINUX WIFI USB LOAD SHELL
부팅시 WIFI USB를 인식하고 연결하기 위한 쉘 스크립트
88x2bu.ko, cfg80211.ko 등을 모듈에 로드하여 WIFI USB에 필요한 드라이버를 로드함

# 88x2bu.ko
연결할 WIFI USB에 필요한 드라이버를 컴파일한 파일  
리눅스 커널에 기본적인 드라이버는 있지만, 본인이 구입한 WIFI USB는 호환 대상이 아니기 때문에 컴파일하여 드라이버를 로드하여야 사용이 가능하다.
# 드라이버 로드 및 언로드 방법
insmod $MODULES_PATH/$MODULES_FILENAME : 모듈 로드  
rmmod $MODULES_PATH/$MODULES_FILENAME : 모듈 언로드

# SH 실행방법 
./S10load88x2bu.sh start : 드라이버 로드 및 USB 바인딩  
./S10load88x2bu.sh stop : 드라이버 언로드
