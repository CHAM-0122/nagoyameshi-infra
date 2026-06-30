
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

├── waf.tf               # WAF 関連リソース
├── ssm.tf               # Systems Manager Parameter Store
├── images/
│   └── architecture.png # 構成図
└── README.md
## デプロイ結果

- ✅ Terraform による AWS インフラの構築
- ✅ VPC、Public / Private Subnet の作成
- ✅ ECS Fargate 上への Laravel アプリケーションのデプロイ
- ✅ ALB を経由したアプリケーション公開
- ✅ RDS(MySQL) との接続確認
- ✅ CloudFront + ACM による HTTPS 化
- ✅ Route53 による独自ドメイン設定
- ✅ WAF による Web アプリケーション保護

## URL

**本番環境**

https://chamcham.blog

## 学んだこと

このプロジェクトを通して、Terraform を利用した Infrastructure as Code の考え方を学び、AWS 上にインフラをコードで構築・管理する経験を積みました。

また、VPC・ECS Fargate・RDS・ALB・CloudFront・Route53・ACM・WAF など複数の AWS サービスを組み合わせ、可用性・セキュリティ・運用性を意識した構成を実装しました。

Terraform のモジュール構成やリソース間の依存関係、AWS のネットワーク設計について理解を深めることができました。

## 工夫した点

- Public Subnet と Private Subnet を分離し、セキュリティを考慮した構成としました。
- ECS Fargate を採用し、サーバー管理の負担を軽減しました。
- CloudFront と ACM を利用し、独自ドメインで HTTPS 通信を実現しました。
- Terraform によりインフラ構成をコード化し、再現性・保守性を向上させました。
- IAM ロールや Security Group を最小権限となるよう意識して設定しました。

## 今後の改善点

今後は以下のような構成も取り入れ、より実践的な AWS 環境を構築していきたいと考えています。

- Auto Scaling の導入
- CI/CD（GitHub Actions または CodePipeline）の自動化
- CloudWatch アラーム・SNS 通知による監視強化
- Terraform Module 化による再利用性向上
- ECS Blue/Green デプロイの導入

## 備考

本構成は AWS・Terraform の学習を目的として構築したポートフォリオです。
今後も新しい AWS サービスや IaC のベストプラクティスを学びながら改善を続けていきます。
## 技術スタック

- Terraform
- AWS VPC
- ECS Fargate
- Application Load Balancer
- Amazon RDS (MySQL)
- Amazon Route53
- Amazon CloudFront
- AWS Certificate Manager
- AWS WAF
- AWS Systems Manager Parameter Store
- Amazon CloudWatch
- Amazon S3