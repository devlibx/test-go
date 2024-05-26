package infra

import "fmt"

type Input interface {
	string
}

func GetMe[T Input](v T) string {
	return fmt.Sprintf("v2.0.11-Infra-v--%s", v)
}
