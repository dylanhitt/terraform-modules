package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

var (
	suiteID      = random.UniqueId()
	suitePrefix  = "ttest_iam_assumable"
	suiteName    = fmt.Sprintf("%s_%s", suitePrefix, suiteID)
	policyString = `{
		"Version": "2012-10-17",
		"Statement": [
		  {
			"Effect": "Allow",
			"Principal": {
			  "Service": "eks.amazonaws.com"
			},
			"Action": "sts:AssumeRole"
		  }
		]
	  }`
)

type testCase struct {
	name string
	opts map[string]interface{}
}

func Test_SuccessfulCreation(t *testing.T) {
	terraform.Init(t, &terraform.Options{
		TerraformDir: ".",
	})

	file, err := ioutil.TempFile("tmp", "prefix")
	require.NoError(t, err)
	defer os.Remove(file.Name())

	tcs := []testCase{
		{
			fmt.Sprintf("%s_simple", suiteName),
			map[string]interface{}{
				"name":                    suiteName,
				"aws_iam_policy_document": file.Name(),
			}},
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

	opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: dir,
		Vars:         tc.opts,
	})

	return opts
}
