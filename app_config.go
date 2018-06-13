package main

import (
	"errors"
	"os"
)

type AppConfig struct {
	pg_dbname string
	pg_user   string
	pg_pass   string
}

func NewAppConfig() (*AppConfig, error) {
	ac := new(AppConfig)
	err := ac.init()
	if err != nil {
		return ac, err
	}
	return ac, nil
}

func (ac *AppConfig) init() error {
	ac.pg_dbname = os.Getenv("PG_DBNAME")
	if ac.pg_pass == "" {
		return errors.New("Missing app_config env var PG_DBNAME")
	}
	ac.pg_user = os.Getenv("PG_USER")
	if ac.pg_user == "" {
		return errors.New("Missing app_config env var PG_USER")
	}
	ac.pg_pass = os.Getenv("PG_PASS")
	if ac.pg_pass == "" {
		return errors.New("Missing app_config env var PG_PASS")
	}
	return nil
}
