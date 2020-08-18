# practice for java spring

### 2020.08.18
- 자바 & 이클립스 환경설정
- mapping
  > servlet을 routing하는 개념이라고 생각하면 된다.
  > 1. servlet java 파일에서 mapping해주는 방법
    ```
      @WebServlet("/HWorld")
    ```
  > 1. WebContent > WEB-INF > web.xml 에서 mapping해주는 방법
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