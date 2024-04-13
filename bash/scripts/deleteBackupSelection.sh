#!/bin/bash

aws backup delete-backup-selection --backup-plan-id $1 --selection-id $2
