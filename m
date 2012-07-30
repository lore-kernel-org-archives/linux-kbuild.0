Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:27969 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754857Ab2G3TpE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jul 2012 15:45:04 -0400
Message-Id: <20120730194503.137910183@goodmis.org>
Date: Mon, 30 Jul 2012 15:43:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 4/4] localmodconfig: Add debug environment variable LOCALMODCONFIG_DEBUG
References: <20120730194316.768288008@goodmis.org>
Content-Disposition: inline; filename=0004-localmodconfig-Add-debug-environment-variable-LOCALM.patch
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="00GvhwF7k39YY"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

--00GvhwF7k39YY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Steven Rostedt <srostedt@redhat.com>

If the environment variable LOCALMODCONFIG_DEBUG is set, then debug output
will appear in the make localmodconfig. This will simplify debugging what
people get with their output, as I can just tell people to do:

  LOCALMODCONFIG_DEBUG=3D1 make localmodconfig 2>out.txt

and have them send me the out.txt. I'll be able to see why things are not
working as they think it should be.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streaml=
ine_config.pl
index fcfcb30..2fbbbc1 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -45,6 +45,16 @@
 use strict;
 use Getopt::Long;
=20
+# set the environment variable LOCALMODCONFIG_DEBUG to get
+# debug output.
+my $debugprint =3D 0;
+$debugprint =3D 1 if (defined($ENV{LOCALMODCONFIG_DEBUG}));
+
+sub dprint {
+    return if (!$debugprint);
+    print STDERR @_;
+}
+
 my $config =3D ".config";
=20
 my $uname =3D `uname -r`;
@@ -389,6 +399,7 @@ foreach my $module (keys(%modules)) {
 	my @arr =3D @{$objects{$module}};
 	foreach my $conf (@arr) {
 	    $configs{$conf} =3D $module;
+	    dprint "$conf added by direct ($module)\n";
 	}
     } else {
 	# Most likely, someone has a custom (binary?) module loaded.
@@ -412,6 +423,8 @@ foreach my $line (@config_file) {
=20
 my $repeat =3D 1;
=20
+my $depconfig;
+
 #
 # Note, we do not care about operands (like: &&, ||, !) we want to add any
 # config that is in the depend list of another config. This script does
@@ -440,6 +453,7 @@ sub parse_config_depends
 		# We must make sure that this config has its
 		# dependencies met.
 		$repeat =3D 1; # do again
+		dprint "$conf selected by depend $depconfig\n";
 		$configs{$conf} =3D 1;
 	    }
 	} else {
@@ -473,15 +487,18 @@ sub parse_config_selects
=20
 	    # Make sure that this config exists in the current .config file
 	    if (!defined($orig_configs{$conf})) {
+		dprint "$conf not set for $config select\n";
 		next;
 	    }
=20
 	    # Check if something other than a module selects this config
 	    if (defined($orig_configs{$conf}) && $orig_configs{$conf} ne "m") {
+		dprint "$conf (non module) selects config, we are good\n";
 		# we are good with this
 		return;
 	    }
 	    if (defined($configs{$conf})) {
+		dprint "$conf selects $config so we are good\n";
 		# A set config selects this config, we are good
 		return;
 	    }
@@ -506,6 +523,7 @@ sub parse_config_selects
     $repeat =3D 1;
     # Make this config need to be selected
     $configs{$next_config} =3D 1;
+    dprint "$next_config selected by select $config\n";
 }
=20
 my %process_selects;
@@ -526,6 +544,7 @@ sub loop_depend {
 	    }
=20
 	    $config =3D~ s/^CONFIG_//;
+	    $depconfig =3D $config;
=20
 	    if (defined($depends{$config})) {
 		# This config has dependencies. Make sure they are also included
@@ -546,6 +565,8 @@ sub loop_select {
     foreach my $config (keys %process_selects) {
 	$config =3D~ s/^CONFIG_//;
=20
+	dprint "Process select $config\n";
+
 	# config has no prompt and must be selected.
 	parse_config_selects $config, $selects{$config};
     }
--=20
1.7.10.4



--00GvhwF7k39YY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQFuQ/AAoJEIy3vGnGbaoAKYkQANbEbmY+bIZFI5ywGlJ6mJqN
M9t0pnoXsIxw7S36IwuJxE2o82avrGhOoI7mPRxmukhYD6LcS6aHJ2e5YdnGHeKq
tnq8D1Kh7Vn85bLuzJN0sxvqCCgTKiX0SJhDhmi/mT2kDCdVeB2iO8jHwdJF+xGf
uJE4+rqjxQ16T/s1WAxQCWFi0Q8icxfWhIxVpgwOyZwAzkOT3JdoxmEzSnzKaGi9
YTbMiW5BVM6RXMm/8OO6Ulo0s4HqBZlOu0UbL80P3InpQS90b5/jTrnquEC7kyiA
gM/0bLXZU7dAVm4syCvFqf2lhywwVDStHoBQSWxep28iawAgvSB3IqDqXYRjNt0a
oXs/b4jDMj4hrdkkeKBjCD9GIvdwLiUsYGYioEyZnbdQwQWaNdDXRmL5mPoR1CCy
lppEhzvL2jLO/HCVGHWOXsEJz7VUVY9SSuxVr0DNQfWzrmIWyqOgCCyoHaD7Ys6Z
E2ihy/v2JwZHXibiEzTy/lki8vuLLlT4+dfl+g16CiGvKlyIostHe2uJ1mpnbTKl
IOkpKmNEiodX/UYETplIuynqqLcQsigjPpfIvbxyZg1vO/9yRJp749M8odr3ATA4
kNvSyCNCC/qBW8A1J2REQWe1/kG/baYKbqH7GHd6LvEMc0xV/ftOVPYUULY/8Vhy
2CtlnV4sMzVvSGqpVi9J
=u+f+
-----END PGP SIGNATURE-----

--00GvhwF7k39YY--
