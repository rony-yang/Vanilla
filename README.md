# 가상 쇼핑몰 구현
JSP 개인 프로젝트

**1. 메인 사진**
![main](https://user-images.githubusercontent.com/116271236/209049093-685296eb-2a8d-4216-a75f-74ef81a91e06.png)

**2. URL 주소** : 추후 예정

**3. 작업기간** : 2022. 9. 5 ~ 9. 19

**4. 개발 목표** : 가상의 쇼핑몰 구현 (사진 및 상품정보는 피그먼트(http://pigment.co.kr/) 사이트 참조)

**5. 사용 기술**

- 언어 : Java, JSP, HTML, CSS, JS, ajax

- 프로그램 : eclipse, sql developer

- 서버 : Tomcat, Oracle

**6. 주요기능**

- 회원가입 및 로그인 기능

- 상품 구경 및 장바구니 기능

- 게시판 글쓰기 및 조회/수정/삭제 기능


**7. Advanced Feature**

상품(Product) 테이블을 만들고 상의(top), 하의(bottom), 원피스(dress)로 그룹을 나누어서 

해당 그룹에 해당되는 상품만을 조회해서 배열로 가져오는 기능입니다.

```java
public ArrayList<Product> getList(int pageNumber, String group) {
		String SQL = null;
			SQL = "SELECT * FROM product where productCode < ? and productGroup ='"+group+"'"
					+ "order by productCode asc";
		
		ArrayList<Product> list = new ArrayList<Product>();
		try {  
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1) * 8);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductGroup(rs.getString(1));
				product.setProductSection(rs.getString(2));
				product.setProductCode(rs.getInt(3));
				product.setProductName(rs.getString(4));
				product.setProductPrice(rs.getString(5));
				product.setProductStock(rs.getInt(6));
				list.add(product);  
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
  ```


**8. 개선사항** : 장바구니 기능을 아직 완성하지 못하여 추후 보완 예정입니다.
