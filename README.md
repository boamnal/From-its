# ✨ 프로미스 (From-its)
<div align="center">
<img width="768" alt="프로미스 메인 화면" src="https://github.com/user-attachments/assets/c4d055f3-4067-4483-aa47-c9eeafc31b03">
</div>

## ☀️ 프로젝트 주제
<p align="center"><b>약속, 모임 실시간 통합 관리 웹 애플리케이션</b></p>

<b>🚨 1. 문제 정의</b>
- 현재, 친구들과 공유하는 기능이 부족한 네이버 지도나 카카오 맵의 한계 때문에, 약속 장소를 정할 때 고충이 많습니다.
- (2024.07.29 기준) 현재까지 사용자들의 중간 지점을 기준으로 찜한 가게 목록을 공유하는 서비스가 없습니다.
- 이로 인해 약속을 잡을 때마다 본인이 찜한 가게 목록을 일일히 SNS 채팅으로 공유해야 하는 번거로움이 있습니다. 이런 번거로움을 없애고, 친구들과 간편하게 공유하며 약속 장소를 정할 수 있는 서비스가 필요하기 때문에 이 주제를 선정하게 되었습니다.


<b>🙌🏻 2. 필요성</b>
- 중간 지점을 기준으로 찜한 가게 목록을 공유하는 서비스를 통해 약속 장소를 정하는 과정이 훨씬 편리하고 신속해질 것입니다. 이 서비스를 통해 사용자들은 손쉽게 친구들과 함께 약속 장소를 결정할 수 있습니다.
- 약속 장소가 결정되면, 카카오톡 push 알림을 통해 약속 장소의 위치와 함께 안내 메시지를 받을 수 있습니다.
- 이를 통해 사용자들은 모임 일정을 등록하고, 등록된 일정에 push 알림을 통해 약속을 잊지 않도록 도와줄 수 있습니다.


## ✏️ 기능 소개
<p>● 아이디 중복 확인, 비밀번호 유효성 검사를 통한 회원가입 및 로그인(회원마다 랜덤 캐릭터 프사 배정)</p>
<p>● 친구(회원) 맺기를 통한 그룹 생성 및 관리</p>
<p>● 카카오 API를 활용한 중간지점 찾기 및 주변 플레이스 조회/찜을 통한 약속 장소 후보 등록</p>
<p>● 투표를 통한 최종 약속 장소 결정 및 이메일 알림 기능</p>


## 📀 ERD
![image](https://github.com/user-attachments/assets/64ad0273-e5ff-4117-a022-aa22dd4ff9c5)
- 요구사항 명세서를 기반으로 ERD를 작성했습니다
- 회원(user)이 약속(promise)을 위해 그룹(prom_group)을 형성하고, 그룹 내에서 약속에 대한 후보(devote_candidate)를 등록하고 투표(devote)하는 시스템
- **회원 관리**:
    - 회원(user)은 이메일, 비밀번호, 주소 등으로 관리됩니다.
    - 회원은 친구 목록(friends)과 그룹 멤버(group_member)를 통해 다른 회원과의 관계를 유지합니다.
- **그룹 관리**:
    - 그룹(prom_group)은 여러 회원이 속할 수 있으며, 각 그룹은 특정한 약속(promise)을 가질 수 있습니다.
- **투표 관리**:
    - 회원은 특정 약속에 대한 후보(devote_candidate)를 등록할 수 있습니다.
    - 각 후보는 가게 정보(place_name, place_address)와 위치 정보(lat, log)를 가집니다.
    - 투표(vote)는 회원과 후보 간의 관계를 나타내며, 투표 상태(devote_state)를 통해 현재 투표의 진행 상태를 추적합니다.
- **약속 관리**:
    - 약속(promise)은 중간지점의 위치 정보(pro_lat, pro_lon), 약속명(pro_name), 약속 일정(pro_date), 약속 내용(pro_desc) 등을 포함합니다.
    - 약속은 특정 그룹과 연관될 수 있으며, 최종 후보(candidiate_id)를 포함합니다.



## 🙍‍♂️ 메인 기능(수정 필요)
### 메인화면

### 회원가입/로그인(로그인)


### 친구 맺기/그룹 생성

### 약속 조회/생성

### 약속 후보 장소 조회/등록

### 약속 장소 투표 진행/마감

### 최종 약속 등록


## 💻 Tech Stack
#### Environment

<img src="https://img.shields.io/badge/intellijidea-000000?style=flat&logo=intellijidea&logoColor=white">

#### Development

<img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white">
<img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat&logo=Spring Boot&logoColor=white">
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white">
<img src="https://img.shields.io/badge/Javascript-F7DF1E?style=flat&logo=Javascript&logoColor=white">
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS-1572B6?style=flat&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/JSP-CC6699?style=flat&logo=Jsp&logoColor=white">
<img src="https://img.shields.io/badge/jQuery-CC6666?style=flat&logo=jQuery&logoColor=white">

#### DataBase

<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white">
<img src="https://img.shields.io/badge/MyBatis-660033?style=flat&logo=MyBatis&logoColor=white">

#### Communication

<img src="https://img.shields.io/badge/Slack-4A154B?style=flat&logo=Slack&logoColor=white"> <img src="https://img.shields.io/badge/Notion-000000?style=flat&logo=Notion&logoColor=white">

#### Design

<img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=figma&logoColor=white">

<br/>

