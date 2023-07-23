# EC2 Instance Variables
region         = "eu-north-1"                    
instance_name  = "Instance"                      
ami_id         = "ami-0989fb15ce71ba39e"         
instance_type  = "t3.micro"                      
key_name       = "techiescamp"                   
instance_count = 1                               
subnet_ids     = ["subnet-07fab58fa9620dfb9",    
                 "subnet-051fbcbaa925b8c44", 
                 "subnet-0c46e29a23c5ba3b8"]

# EC2 Security Group Variables
sg_name             = "Instance_sg"              
vpc_id              = "vpc-07d73d0c9081754d0"    
ingress_from_port   = [22, 80]                   
ingress_to_port     = [22, 80]                   
ingress_protocol    = ["tcp", "tcp"]             
ingress_cidr_block  = ["0.0.0.0/0"]              
egress_from_port    = [0]              
egress_to_port      = [0]              
egress_protocol     = ["-1"]                     
egress_cidr_block   = ["0.0.0.0/0"]              

# Tag Keys
name        = "Instance"                        
owner       = "Techiescamp"                     
environment = ["dev"]                           
cost_center = "project"                         
application = "web-app"                         

