/*provider "kubernetes" {
  load_config_file = "false"
  host = data.aws_eks_cluster.myapp-cluster.endpoint
  token = data.aws_eks_cluster.myapp-cluster.token

  client_certificate     = base64decode(data.aws_eks_cluster.myapp-cluster.client_certificate_authority.0.data)

}

data "aws_eks_cluster" "myapp-cluster" {
 name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "myapp-cluster" {
    name = module.eks.cluster_id
}*/

/*provider "kubernetes" {
  config_path = "~/.kube/config"
}*/

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.7.0"

  cluster_name = "myapp-eks-cluster"
  cluster_version = "1.24"
  subnet_ids = module.myapp-vpc.private_subnets
  vpc_id = module.myapp-vpc.vpc_id

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = true
  enable_irsa = true

  tags = {
     environment = "development"
     application = "myapp"
  }
  eks_managed_node_groups = [
    {
         instance_type = "t2.micro"
         name = "worker-group-1"
         asg_desired_capacity = 3
    }
  ]


}