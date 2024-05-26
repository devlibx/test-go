package helper

import "github.com/devlibx/test-go/v2/infra"

func Foo() string {
	return "Version v2.0.3 - " + infra.GetMe("This is go 21")
}
