Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38057 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732298AbeGLW2z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 18:28:55 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fdjto-0007jf-7G
        for linux-kbuild@vger.kernel.org; Thu, 12 Jul 2018 23:17:20 +0100
Date: Thu, 12 Jul 2018 23:17:20 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180712221720.GJ14131@decadent.org.uk>
References: <20180712221619.GH14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aznLbwQ42o7LEaqN"
Content-Disposition: inline
In-Reply-To: <20180712221619.GH14131@decadent.org.uk>
Subject: [RFC PATCH 2/3] kbuild: Add $(run-cmd) macro for running and maybe
 echoing command
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


--aznLbwQ42o7LEaqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

$(run-cmd) replaces a sequence of two macros that is used several
times in Kbuild.include.  This should be a no-op change, but the
following commit will change the definition to be more complex.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/Kbuild.include | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index c8156d61678c..8778ae4a3476 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -224,8 +224,10 @@ flags =3D $(foreach o,$($(1)),$(if $(filter -I%,$(o)),=
$(call addtree,$(o)),$(o)))
 echo-cmd =3D $(if $($(quiet)cmd_$(1)),\
 	echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
=20
+run-cmd =3D $(echo-cmd) $(cmd_$(1))
+
 # printing commands
-cmd =3D @$(echo-cmd) $(cmd_$(1))
+cmd =3D @$(run-cmd)
=20
 # Add $(obj)/ for paths that are not absolute
 objectify =3D $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
@@ -262,7 +264,7 @@ any-prereq =3D $(filter-out $(PHONY),$?) $(filter-out $=
(PHONY) $(wildcard $^),$^)
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed =3D $(if $(strip $(any-prereq) $(arg-check)),                  =
     \
 	@set -e;                                                             \
-	$(echo-cmd) $(cmd_$(1));                                             \
+	$(run-cmd);                                                          \
 	printf '%s\n' 'cmd_$@ :=3D $(make-cmd)' > $(dot-target).cmd, @:)
=20
 # Execute the command and also postprocess generated .d dependencies file.
@@ -273,7 +275,7 @@ if_changed_dep =3D $(if $(strip $(any-prereq) $(arg-che=
ck) ),                  \
 ifndef CONFIG_TRIM_UNUSED_KSYMS
=20
 cmd_and_fixdep =3D                                                        =
     \
-	$(echo-cmd) $(cmd_$(1));                                             \
+	$(run-cmd);                                                          \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
 	rm -f $(depfile);                                                    \
 	mv -f $(dot-target).tmp $(dot-target).cmd;
@@ -296,7 +298,7 @@ ksym_dep_filter =3D                                    =
                        \
 	esac | tr ";" "\n" | sed -n 's/^.*=3D=3D=3D __KSYM_\(.*\) =3D=3D=3D.*$$/_=
\1/p'
=20
 cmd_and_fixdep =3D                                                        =
     \
-	$(echo-cmd) $(cmd_$(1));                                             \
+	$(run-cmd);                                                          \
 	$(ksym_dep_filter) |                                                 \
 		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
 			> $(dot-target).tmp;	                             \


--aznLbwQ42o7LEaqN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW0fTb+e/yOyVhhEJAQrPGQ/+JuqFyIms33Ywj2qGR2Wzmpji/lWEkQvE
s/b1WZYWJXLAiMGJB+Gk0d7NRhTYzk69S5o4zjrRNaq2+FCJPguy91aaNT9Qi/VO
qw66WMY7mqqPHNyNnOosjUcQkvRyjc2apDvun5HC76oIUUvd3vhc0/NtlqtKzTGB
qb/FEaOyi5RauH7aAEHvJu5WsKT7IXohCXQ/uhMETyTHEytdc6y0dpeIQQgNqDHY
L822dlhrDPooGONQwAqxaqhzXWRMA94QRKrtVIuycsXFLuWXHV2o4MR/k5wTH0v6
gBAzcSw2XijNj9oNBSSmJ9po/iMtUduz7mhBv40kAGSwbf1I3jYgP7buK0FDoTJ8
8m2B5zSaF0jLczz+pYqPfOkQcG320+uEumJTiroUAJWTjVVD83DNN07pOr8kqlVq
QC8W9NakLwV9y64fxU+GQuX1gHa1ZgZVJBfJvzilabRG40XreI242eGqv27LFpqc
It5ZT6SXTf42E9s0fXESA/DRF92n559ZZ9blstL9til26qgn2nO8oOmzwcpaPChx
15j/ZTqHoQq78RRZFQBWw+bIrOeraD+wZxZAfHZfZVuv1e3kq29yInuMBHtcYpE6
6Zpu3HONeN+1bBw8tqgss6J57kWSLBYK8OPtiuO5KspcFWpxwGyx1RjJuBV8JneI
1hwC1UnOycY=
=/VY3
-----END PGP SIGNATURE-----

--aznLbwQ42o7LEaqN--
