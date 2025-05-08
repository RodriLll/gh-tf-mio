terraform {
  backend "s3" {
    bucket       = "pin2-2405-grupo8"
    region       = "us-east-1"
    key          = "backend.tfstate"
    use_lockfile = true
  }
}

