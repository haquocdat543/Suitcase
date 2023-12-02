#!/bin/bash

read -p "Enter your sql command [SHOW DATABASE]: " sqlcmd
sqlcmd=${sqlcmd:-SHOW DATABASE}

psql -c "$sqlcmd"
