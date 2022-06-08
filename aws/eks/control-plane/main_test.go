package main

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

var (
	suiteID         = random.UniqueId()
	suitePrefix     = "ttest_eks"
	suiteName       = fmt.Sprintf("%s_%s", suitePrefix, suiteID)
	eks_role        = "arn:aws:iam::145313333597:role/eks_cluster_role"
	cluster_version = "1.22"
	subent_ids      = []string{"subnet-00bfcb759ce838e62", "subnet-009e9b8cf6fdbeafc"}
)

type testCase struct {
	name string
	opts map[string]interface{}
}

func Test_SuccessfulCreation(t *testing.T) {
	terraform.Init(t, &terraform.Options{
		TerraformDir: ".",
	})

	tcs := []testCase{
		{
			fmt.Sprintf("%s_simple", suiteName),
			map[string]interface{}{
				"name":            suiteName,
				"role_arn":        eks_role,
				"cluster_version": cluster_version,
				"subnet_ids":      subent_ids,
			},
		},
	}

	for _, tc := range tcs {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()

			o := buildOpts(t, tc)
			defer terraform.Destroy(t, o)
			terraform.InitAndApplyAndIdempotent(t, o)
		})
	}
}

func buildOpts(t *testing.T, tc testCase) *terraform.Options {
	dir, err := files.CopyTerraformFolderToTemp(".", tc.name)
	require.NoError(t, err)

	return terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: dir,
		Vars:         tc.opts,
	})
}
