# AWS Infrastructure (Nagoyameshi) 🍜

![Terraform](https://img.shields.io/badge/Terraform-1.12-7B42BC)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900)
![ECS](https://img.shields.io/badge/ECS-Fargate-FF9900)
![RDS](https://img.shields.io/badge/RDS-MySQL-527FFF)
![CloudFront](https://img.shields.io/badge/CloudFront-CDN-8C4FFF)
![Route53](https://img.shields.io/badge/Route53-DNS-8C4FFF)
![WAF](https://img.shields.io/badge/WAF-Web%20ACL-DD344C)

## 概要

本リポジトリは、Nagoyameshi アプリケーションのために構築した  
AWS インフラ環境を Terraform で管理するものです。

ECS Fargate にデプロイした Laravel アプリケーションを ALB 経由で公開し、  
CloudFront および ACM を利用して、独自ドメインでの HTTPS 配信を実現しています。

## アーキテクチャ

<p align="center">
  <img src="images/architecture.png" width="1000">
</p>

## 使用 AWS サービスと役割

| サービス | 役割 |
|---|---|
| Route53 | 独自ドメインの DNS 管理 |
| CloudFront | コンテンツ配信 CDN |
| WAF | Web アプリケーション保護 |
| ALB | アプリケーションへのトラフィック振り分け |
| ECS Fargate | Laravel アプリケーションのコンテナ実行環境 |
| RDS MySQL | アプリケーション用データベース |
| NAT Gateway | Private Subnet からのアウトバウンド通信 |
| ACM | SSL/TLS 証明書の管理 |
| CloudWatch | ログ管理・監視 |
| S3 | 静的コンテンツの保存 |

## 主な特徴

- Multi-AZ 構成による可用性向上
- Public / Private Subnet を分離したセキュアなネットワーク構成
- ECS Fargate によるコンテナベースのアプリケーション実行環境
- ALB による負荷分散
- CloudFront + ACM による HTTPS 配信
- WAF によるアクセス制御
- Terraform によるインフラのコード管理

## ディレクトリ構成

```text
nagoyameshi-infra/
├── main.tf              # メイン設定ファイル
├── variables.tf         # 変数定義
├── outputs.tf           # 出力定義
├── vpc.tf               # VPC 関連リソース
├── alb.tf               # ALB 関連リソース
├── ecs.tf               # ECS 関連リソース
├── rds.tf               # RDS 関連リソース
├── cloudfront.tf        # CloudFront 関連リソース
├── route53.tf           # Route53 関連リソース
├── acm.tf               # ACM 関連リソース
├── waf.tf               # WAF 関連リソース
├── iam.tf               # IAM ロール・ポリシー
├── ssm.tf               # SSM パラメータ
├── images/
│   └── architecture.png # 構成図
└── README.md