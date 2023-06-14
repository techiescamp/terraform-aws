package main

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestVPCModuleExistence(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../environments/dev/vpc",
	}

	terraform.InitAndApply(t, terraformOptions)

	defer terraform.Destroy(t, terraformOptions)

	vpcID := terraform.Output(t, terraformOptions, "id")
	assert.NotEmpty(t, vpcID)

	awsRegion := "us-west-2"
	assert.True(t, aws.VpcExists(t, awsRegion, vpcID))
}

func TestVPCModuleSubnetExistence(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../environments/dev/vpc",
	}

	terraform.InitAndApply(t, terraformOptions)

	defer terraform.Destroy(t, terraformOptions)

	publicSubnetIDs := terraform.OutputList(t, terraformOptions, "public_subnet_ids")
	appSubnetIDs := terraform.OutputList(t, terraformOptions, "app_subnet_ids")
	dbSubnetIDs := terraform.OutputList(t, terraformOptions, "db_subnet_ids")
	managementSubnetIDs := terraform.OutputList(t, terraformOptions, "management_subnet_ids")

	subnetIDLists := [][]string{
		publicSubnetIDs,
		appSubnetIDs,
		dbSubnetIDs,
		managementSubnetIDs,
	}

	awsRegion := "us-west-2"
	for _, subnetIDs := range subnetIDLists {
		assert.True(t, aws.SubnetsExist(t, awsRegion, subnetIDs))
	}
}

func TestMain(m *testing.M) {
	exitCode := m.Run()
	os.Exit(exitCode)
}