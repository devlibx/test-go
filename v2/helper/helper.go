package helper

import "github.com/devlibx/test-go/infra"

func Foo() string {
	return "Version v0.0.3 - " + infra.GetMe()
}
