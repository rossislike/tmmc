resource "aws_db_subnet_group" "tokyo_rds_subnet_group" {
  provider = aws.tokyo
  name     = "tokyo-rds-subnet-group"
  subnet_ids = [
    aws_subnet.tokyo_prv_subnet_db.id,
    aws_subnet.tokyo_prv_subnet_1a.id,
    aws_subnet.tokyo_prv_subnet_1c.id,
  ]

  tags = {
    Name    = "tokyo_rds_subnet_group"
    Service = var.main_service
  }
}

resource "aws_rds_cluster" "tokyo_aurora_rds" {
  provider               = aws.tokyo
  cluster_identifier     = "tokyoauroracluster"
  engine                 = "aurora-mysql"
  engine_version         = "8.0.mysql_aurora.3.05.2"
  database_name          = "TMMCDB"
  master_username        = "testAdmin"
  master_password        = "AdminTest4321"
  vpc_security_group_ids = [aws_security_group.tokyo_sg_db.id]
  db_subnet_group_name   = aws_db_subnet_group.tokyo_rds_subnet_group.name
  storage_encrypted      = false
  skip_final_snapshot    = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  provider            = aws.tokyo
  identifier          = "tokyoaurorainstance"
  cluster_identifier  = aws_rds_cluster.tokyo_aurora_rds.id
  instance_class      = "db.r7g.large"
  engine              = aws_rds_cluster.tokyo_aurora_rds.engine
  engine_version      = aws_rds_cluster.tokyo_aurora_rds.engine_version
  publicly_accessible = true
}