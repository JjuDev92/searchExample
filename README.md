# searchExample
# JjuDev
my personal first work

# 1 
- 이미지 리스트
- 리스트 상단 검색 텍스트 필드

# 2 
- 즐겨 찾기 리스트

-lib : flutter source
 |
 |__asset : 로컬 이미지 저장
 |    |_ assets.dart : 이미지의 패스를 정의해 놓는다.
 |
 |__models : model 클래스 구현(search_images.dart > 검색 json 데이터의 모델 클래스를 작성
 |
 |
 |__providers : widget과 뷰모델과 상태 공유
 |       |_ bottom_tab_provider.dart : bottom_navi.dart 위젯에 선택된 탭 상태 공유
 |       |_ fav_get_controllder.dart : privder?는 아니지만 디렉토리를 .... 역할은 비슷하다
 |                           SharedPreference repository와 위젯(page1, page2) 사이 상태 공유
 |
 |_router : 페이지 이동 url과 UI 클래스 매핑
 |
 |_screens : 각종 UI 화면 디렉토리
 |     |
 |     |_common : 탭 화면이나, 상세화면이 아닌 공통 화면을 빼놓았다.(바텀 네비, 
 |     |              페이지1,2의 상위 위젯, 메인페이지, 스플래시 스크린, 웹뷰)
 |     |
 |     |_pages : 탭 1, 2의 화면. 메인 페이지의 하위 스크린
 |     |
 |     |_widgets : 스크린 단위의 화면에서 일부 공통으로 쓰는 위젯을 빼놓았다.
 |                   (리스트 비었을 경우, 로딩 위젯, 검색 결과 없음)    
 |     
 |_repository : 각종 데이터를 가져와 처리한다.(image 검색 결과, shared preference 저장된 값)
 |
 |
 |_viewmodel : model과 view 사이 접착제 역할? (이미지 검색 결과를 저장소에서 가져와 
 |                                                view에서 용이하게 쓰도록 한다)
 |
 |_main.dart : 앱의 시작점