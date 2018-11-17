#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

export RUNLEVEL=1

LDAP_ROOTPASS=asdasd123
LDAP_DOMAIN=de-gbi.xyz
LDAP_ORGANISATION=Jorge


  cat <<EOF | debconf-set-selections
slapd slapd/internal/generated_adminpw password ${LDAP_ROOTPASS}
slapd slapd/internal/adminpw password ${LDAP_ROOTPASS}
slapd slapd/password2 password ${LDAP_ROOTPASS}
slapd slapd/password1 password ${LDAP_ROOTPASS}
slapd slapd/dump_database_destdir string /var/backups/slapd-VERSION
slapd slapd/domain string ${LDAP_DOMAIN}
slapd shared/organization string ${LDAP_ORGANISATION}
slapd slapd/backend string HDB
slapd slapd/purge_database boolean true
slapd slapd/move_old_database boolean true
slapd slapd/allow_ldap_v2 boolean false
slapd slapd/no_configuration boolean false
slapd slapd/dump_database select when needed
EOF

dpkg-reconfigure -f noninteractive slapd

#dpkg-reconfigure slapd

ldapadd -H ldap:// -x -D "cn=admin,dc=de-gbi,dc=xyz" -f de-gbi.xyz.ldif -w asdasd123

ldapsearch -H ldap:// -x -D "cn=admin,dc=de-gbi,dc=xyz" -w asdasd123 -b "dc=de-gbi,dc=xyz"

#/usr/sbin/slapd -h "ldap:///" -u openldap -g openldap -d 0

bash