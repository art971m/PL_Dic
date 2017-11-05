export ORACLE_BIN=~/Oracle/Middleware/asinst_1/OUD/bin
export ADMIN_PORT=4444
export BINDDN=cn=Directory\ Manager
export PASSWORD=password
export PASSWORDFILE=/tmp/pf
export BASE=c=pl
export DBNAME=pl_db
export WORKFLOW=work_flow_pl
set -x


echo $PASSWORD > $PASSWORDFILE


$ORACLE_BIN/dsconfig create-workflow-element \
          --set base-dn:$BASE \
          --set enabled:true \
          --type db-local-backend \
          --element-name $DBNAME \
          --hostname localhost \
          --port $ADMIN_PORT \
          --bindDN "$BINDDN" \
          --bindPasswordFile $PASSWORDFILE \
          --no-prompt

$ORACLE_BIN/dsconfig create-workflow \
          --set base-dn:$BASE \
          --set enabled:true \
          --set workflow-element:$DBNAME \
          --type generic \
          --workflow-name $WORKFLOW \
          --hostname localhost \
          --port $ADMIN_PORT \
          --bindDN "$BINDDN" \
          --bindPasswordFile $PASSWORDFILE \
          --no-prompt

$ORACLE_BIN/dsconfig set-network-group-prop \
          --group-name network-group \
          --add workflow:$WORKFLOW \
          --hostname localhost \
          --port $ADMIN_PORT \
          --bindDN "$BINDDN" \
          --bindPasswordFile $PASSWORDFILE \
          --no-prompt

rm $PASSWORDFILE