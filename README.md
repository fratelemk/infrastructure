# Infrastructure

This repository contains Terraform configuration to provision infrastructure in the DigitalOcean cloud.

## Prerequisites

- [Terraform](https://www.terraform.io/)
- [DigitalOcean API token](https://docs.digitalocean.com/reference/api/create-personal-access-token/)

## Provider

This project uses the official DigitalOcean Terraform provider:

https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs

Refer to the documentation for available resources, arguments, and configuration options.

## Configuration


- `token` (Required): Your DigitalOcean API token.

Alternatively, you can set the token using environment variables (in order of precedence):

1. `DIGITALOCEAN_TOKEN`
2. `DIGITALOCEAN_ACCESS_TOKEN`

