# AWS Infrastructure (Nagoyameshi)

## 概要

本リポジトリはAWS上に構築したWebアプリケーション基盤のTerraformコードです。

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
