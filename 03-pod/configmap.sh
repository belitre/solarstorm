#!/bin/bash

kubectl create configmap nginx-template --from-file=default.conf --dry-run -o yaml -n miguelsantiago