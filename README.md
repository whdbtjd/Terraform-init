## Terraform 구성 요소

### 1. IAM 사용자 및 그룹

- 총 사용자: `dev-leader`, `dev-staff`, `ops-leader`, `ops-staff`
- 각 사용자 → 아래 그룹 중 하나에 소속:
    - `dev-group`
    - `ops-group`
- 각 팀원에 붙는 정책:
    - 팀장: `s3:GetObject`, `s3:PutObject`
    - 팀원: `s3:GetObject`

각 그룹은 **자기 팀 버킷만 접근 가능** (타팀 버킷 접근 불가)

---

### 2. S3 버킷

- `dev-bucket-whdbtjd`, `ops-bucket-whdbtjd` 두 개 생성
- 퍼블릭 접근 차단
- 버킷 정책은 IAM에 위임 (버킷 정책은 굳이 작성하지 않아도 됨)

---

### 3. VPC 구성

- CIDR: `10.0.0.0/16`
- 퍼블릭 서브넷 2개: `10.0.1.0/24`, `10.0.2.0/24`
- 프라이빗 서브넷 2개: `10.0.11.0/24`, `10.0.12.0/24`

### 포함 구성

- 인터넷 게이트웨이 (IGW)
- NAT Gateway (EIP 포함)
- 퍼블릭/프라이빗용 Routing Table 각 1개
- Routing Table → 각 서브넷에 Association 수행

---

### 4. Terraform Backend 및 Lock

- 백엔드는 S3로 구성: 예시 `terraform-backend-bucket`
- 락 관리는 DynamoDB 테이블로 구성: 예시 `terraform-lock`

### 5. 파일 구조

```
프로젝트 루트
├── init.tf
├── vpc.tf
├── iam.tf
├── s3.tf
├── backend.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```



