# AWS Infrastructure (Nagoyameshi)

## 概要

本リポジトリは、Nagoyameshi アプリケーションのために構築した AWS インフラ環境（Terraform）を管理するものです。

## 構成概要

本システムは AWS 上に構築された Web アプリケーション基盤であり、ECS Fargate にデプロイした Laravel アプリケーションを ALB 経由で公開し、CloudFront および ACM を利用して独自ドメインでの HTTPS 配信を実現しています。

## アーキテクチャ

* VPC（Public / Private Subnet）
* ECS Fargate（アプリケーション）
* RDS（MySQL）
* ALB（Application Load Balancer）
* CloudFront（CDN）
* Route53（DNS）
* ACM（SSL証明書）
* WAF（セキュリティ）

## 主な特徴

* Multi-AZ 構成による可用性向上
* Private Subnet を利用したセキュアな構成
* ALB + ECS によるスケーラブルなアプリケーション実行環境
* CloudFront + ACM による HTTPS 配信
* WAF によるアクセス制御

## デプロイ結果

* ECS Fargate 上にアプリケーションをデプロイ
* RDS と接続しデータ取得を確認
* ALB 経由で HTTP 通信を確認
* CloudFront + 独自ドメインにより HTTPS（HTTP/2 200）を確認

## URL

* 本番環境: https://chamcham.blog

## 備考

本構成は学習目的で構築しています。
