# AWS Infrastructure (Nagoyameshi)

## 概要

## 構成概要

本システムは AWS 上に構築された Web アプリケーション基盤であり、ECS Fargate にデプロイした Laravel アプリケーションを ALB 経由で公開し、CloudFront および ACM を利用して独自ドメインでの HTTPS 配信を実現しています。

## 構成

* VPC（Public / Private Subnet）
* ECS Fargate
* RDS
* ALB
* CloudFront
* WAF
* Route53

## 特徴

* Multi-AZ構成
* セキュリティ設計（Private Subnet / WAF）
* HTTPS対応（ACM）

## 備考

本構成は学習目的で作成しています。
