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

  ##### jsp 알아보자
  - run
    ```
    jsp -> servlet(jsp container가 생성) -> class -> 메모리에 올림 -> 실행
    
    class파일이 없으면 java, class파일 생성
    class파일이 존재하면 재활용해서 실행된다.
    
    다른 CGI언어들에 비해서 빠르다.
    ```
    
  - 문법
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

### 2020.08.20

  - req, res
    - request 관련 메소드
      - setCharacterEncoding("EUC-KR") [한국어 패치]
      - getContextpath()
      - getMethod() [get방식인지 post방식인지 반환]
      - getSession() 
      - getProtocol() [http인지 https인지 ...]
      - getRequestURL() [request 주소값 반환]
      - getRequestURI() [request 주소값에서 포트번호 뒷 부분 반환]
      - getQueryString()
      - getServerPort() [포트번호 반환]
      - getServerName()
      - getParameter(name) [name에 해당하는 value반환]
      - getParameterNames() [넘어본 name 값들 반환]
      - getParameterValues(name) [value가 여러가지인 경우]
    
    - response 관련 메소드
      - getCharacterEncoding() [한국어 패치]
      - addCookie(Cookie) [쿠키를 지정]
      - sendRedirect(URL) [지정한 URL로 이동]

- jsp 액션 태그
  - forward
    ```
      url은 바뀌지 않는다. 페이지만 바뀐다.
      <jsp:forward page="sub.jsp">
    ```
  - include
    ```
      일반적으로 flush는 false로 둔다.
      출력버퍼는 비워지고 모든 헤더정보를 웹브라우저에 전송하게 되는데 include페이지에서 header에 데이터를 추가해도 반영되지 않기 때문에 false로 둔다.
      <jsp:include page="include02.jsp" flush="true">
    ```
  - param
    > forward와 include로 페이지가 넘어갈 때 param값을 넘겨줄 때 사용한다.
    ```
      <jsp:forward page="forward_param.jsp">
        <jsp:param name="id" value="adfsf">
        <jsp:param name="pw" value="1234">
      </jsp:forward>
    ```

- 쿠키
  - 생성
    ```
      Cookie.cookie = new Cookie("name", "value");
    ```

  - 관련 메소드
    - setMaxAge() [유효기간 설정]
    - setPaht() [유효 디렉토리를 설정] 주로 사용되진 않음
    - setValue() [값을 설정]
    - setVersion() [버전 설정]
    - getMaxAge() [유효기간 정보 반환]
    - getName() [쿠키 이름 반환]
    - getPath() [유효 디렉토리 정보 반환]
    - getValue() [값을 반환]
    - getVersion() [버전 정보 반환]
  
  - 클라이언트로 전송
    ```
      response.addCookie(cookie);
    ```

  - jsp에서 쿠키 값 받기
    ```
      Cookie[] cookies = request.getCookies();
    ```
  
  - jsp에서 쿠키 삭제
    > 쿠키 유효기간을 0으로 바꾸고 다시 넘김
    ```
      cookie.setMaxAge(0);
      response.addCookie(cookie);
    ```

- 세션
  - 클라이언트로부터 요청이 발생하면 서버 컨테이너에서 자동으로 생성
  - 관련 메소드
    - setAttribute() [세션에 속성 설정]
    - getAttribute() [속성 반환]
      ```
        세션은 object로 받아와진다.
        Object obj = session.getAttribute("name");
      ```
    - getAttributeNames()
    - getId() [자동 생성된 세션의 고유 id 반환]
    - isNew() [세션이 최초 생성인지 이전에 생성되었는지 불린 값으로 반환]
    - getMaxInactiveInterval() [유효시간 반환]
    - removeAttribute() [특정 데이터 삭제]
    - Invalidate() [모든 데이터 삭제]

- 예외 페이지 처리
  - jsp file
    ```
      /* 에러가 발생한 페이지 */
      // 에러가 발생하면 errorPage.jsp로 이동하라
      <%@ page errorPage = "errorPage.jsp" %>

      /* 에러 내용 반환 페이지 */
      // 에러 메세지를 출력하기 위해 에러 페이지라는 것을 정의
      <%@ page isErrorPage = "true">

      // 이 페이지는 문제 없다는 것을 정의
      // 없으면 500 에러 발생
      <% response.setStatus(200); %>

      // 에러 메세지 출력
      <%= exception.getMessage() %>
    ```
  
  - web.xml
    ```
      // 어떤 페이지에서도 처리 가능
      <error-page>
        <error-code>404</error-code>
        <location>/error404.jsp</location>
      </error-page>
      <error-page>
        <error-code>500</error-code>
        <location>/error500.jsp</location>
      </error-page>
    ```

- 빈
  > 반복적인 일을 효율적으로 처리하기 위해 사용.
  ```
    빈이란?
    JAVA언어의 데이터(속성)와 기능(메소드)으로 이루어진 클래스.
  ```

  - 빈 사용하기
    ```
      // 특정 빈을 사용한다고 명시 할 때 사용.
      // scope은 범위를 나타낸다(page일 경우 생성된 페이지 내에서만 사용 가능)
      // scope 종류
      // page, request, session, application 
      <jsp:useBean id="student" class="com.javalec.ex.Student" scope="page" />

      // setProperty
      <jsp:setProperty name="student" property="name" value="darrun" />
      // getProperty
      <jsp:getProperty name="student" property="name" />
    ```

- EL(Expression Language)
  > ${test} ${}로 
  ```
    <jsp:getProperty name="student" property="name" />
    ${student.name} 으로 간소화 가능
  ```

- url-pattern
  ```
    http://localhost:8181/jsp/insert.do
    http://localhost:8181/jsp/update.do
    
    mapping @WebServlet("*.do")
    두 url 다 *.do 서블릿으로 간다.
  ```

- 포워딩
  - request 정보 넘겨주기
    ```
      RequestDispatcher dispatcher = request.getRequestDispatcher("/dispacherJsp.jsp");
      dispatcher.forward(request, response);
    ```
