# practice for java spring

### 2020.08.18

- 자바 & 이클립스 환경설정
- mapping
  > servlet을 routing하는 개념이라고 생각하면 된다.

  - servlet java 파일에서 mapping해주는 방법
    ```
      @WebServlet("/HWorld")
    ```
  - WebContent > WEB-INF > web.xml 에서 mapping해주는 방법
    ```
      <servlet>
        <servlet-name>helloworld</servlet-name>
        <servlet-class>com.javalec.ex.HelloWorld</servlet-class>
      </servlet>
      <servlet-mapping>
        <servlet-name>helloworld</servlet-name>
        <url-pattern>/hw</url-pattern>
      </servlet-mapping>
    ```

### 2020.08.19

  - parameter 받기

    - getParameter(name)
      > 해당 name의 value값 반환

    - getParameterValues(name)
      > optionbox 나 checkbox 처럼 여러개의 값이 넘어올 때

    - getParameterNames()
      > name들을 배열로 가져옴

    > ex) request.getParameter("id")

  - 한글 처리

    > 기본적으로 한글 처리를 지원하지 않는다.

    - get 방식
      1. server.xml
      1. find Connector 
      1. 속성에 URLEncoding="EUC-KR" 추가
      1. server 동기화 해주기

    - post 방식
      1. java 파일에서 request.setCharacterEncoding("EUC-KR"); 추가

  - 초기 parameter
    > 요청을 받을 때 기본적으로 세팅하는 parameter
    
    - web.xml에서 선언하기
      - web.xml에서 init-param 설정 
      - 값을 호출 할 때는 request.getInitParameter(name);

    - servlet파일에서 선언하기
      ```
      import javax.servlet.annotation.WebInitParam;
      @WebServlet(urlPatterns={"/InitP"}, initParams={ @WebInitParam(name="id", value="abcde"), @WebInitParam(name="pw", value="12345")})
      ```

  - 여러 servlet에서 공유할 수 있는 parameter
    > web.xml에서 선언
    
    - context-param 추가

  - listener 생성
    > 라이프 사이클에 맞는 이벤트 발생

    - ServletContextListener를 implements해서 class생성
    - 마우스 오른쪽 클릭 -> Source -> override ~~ 눌러서 메서드 생성
      - class에서 선언하기
        > class위에 @WebListener작성 후 import시켜주기
      - web.xml에 선언하기
        ```
        <listener>
          <listener-class>com.javalec.ex2.ServletL</listener-class>
        </listener>
        ```
### 2020.08.20

  - jsp 알아보자
    - run
      ```
      jsp -> servlet(jsp container가 생성) -> class -> 메모리에 올림 -> 실행
      
      class파일이 없으면 java, class파일 생성
      class파일이 존재하면 재활용해서 실행된다.
      
      다른 CGI언어들에 비해서 빠르다.
      ```
  - 지시자: <%@ %> 
    > 페이지 속성(include, import, taglib)
  - 주석: <%-- --%> 
    > html주석은 브라우저에서 노출되지만 jsp주석은 노출되지 않는다.
  - 선언: <%! %> 
    > 변수, 메소드 전역으로 선언
  - 표현식: <%= %>
    > 결과값 출력
  - 스크립트릿: <% %> 
    > JAVA코드
  - 액션태그: <jsp:action> </jsp:action>
    > 자바빈 연결
  
  - import 단축키
    > import 시킬 객체에 타겟을 맞추고 ctrl + space 누르면 목록이 나온다.