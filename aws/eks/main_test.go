package main

import (
	"fmt"
	"os"
	"strings"
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
	cluster_version = os.Getenv("CLUSTER_VERSION")
	subnet_ids      = parseSubnetIDsFromEnv()
)

type testCase struct {
	name string
	opts map[string]interface{}
}

func Test_SuccessfulCreation(t *testing.T) {
	t.Parallel()
	terraform.Init(t, &terraform.Options{
		TerraformDir: ".",
	})

	tcs := []testCase{
		{
			fmt.Sprintf("%s_simple", suiteName),
			map[string]interface{}{
				"name":            fmt.Sprintf("%s_simple", suiteName),
				"role_arn":        eks_role,
				"cluster_version": cluster_version,
				"subnet_ids":      subnet_ids,
			},
		},
		{
			fmt.Sprintf("%s_oidc", suiteName),
			map[string]interface{}{
				"name":            fmt.Sprintf("%s_oidc", suiteName),
				"role_arn":        eks_role,
				"cluster_version": cluster_version,
				"subnet_ids":      subnet_ids,
				"oidc":            true,
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

func parseSubnetIDsFromEnv() []string {
	s := os.Getenv("SUBNET_IDS")
	return strings.Split(s, ",")
}

func buildOpts(t *testing.T, tc testCase) *terraform.Options {
	dir, err := files.CopyTerraformFolderToTemp(".", tc.name)
	require.NoError(t, err)

	return terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: dir,
		Vars:         tc.opts,
	})
}
