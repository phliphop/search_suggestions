package main

import "fmt"

func main() {
	// Initialize with app config and ensure all required environment variables.
	app_config, err := NewAppConfig()
	if err != nil {
		panic("\n\tUnable to parse appconfig env variables. Are you sure you've sourced the env file?\n\t\t" + err.Error())
	}
	fmt.Println(app_config)
}
