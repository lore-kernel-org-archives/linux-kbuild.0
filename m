Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:36172 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753398AbbI1AJQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Sep 2015 20:09:16 -0400
Message-ID: <1443398942.2517.12.camel@decadent.org.uk>
Subject: [PATCH v2 1/2] Documentation: Avoid creating man pages in source
 tree
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 28 Sep 2015 01:09:02 +0100
In-Reply-To: <1443398870.2517.11.camel@decadent.org.uk>
References: <1443398870.2517.11.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Mn4xCTm+b+cc1k5uwDjF"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?ISO-8859-1?Q?J=E9r=E9my?= Bobbio <lunar@debian.org>, reproducible-builds@lists.alioth.debian.org, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>


--=-Mn4xCTm+b+cc1k5uwDjF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Currently kernel-doc generates a dummy DocBook file when asked to
convert a C source file with no structured comments.  For an
out-of-tree build (objtree !=3D srctree), the title of the output file
is the absolute path name of the C source file, which later results
in a manual page being created alongside the C source file.

Change the title to be a relative path.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/kernel-doc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 9a08fb5..8c47afa 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2391,12 +2391,13 @@ sub process_file($) {
     my $descr;
     my $in_purpose =3D 0;
     my $initial_section_counter =3D $section_counter;
+    my ($orig_file) =3D @_;
=20
     if (defined($ENV{'SRCTREE'})) {
-	$file =3D "$ENV{'SRCTREE'}" . "/" . "@_";
+	$file =3D "$ENV{'SRCTREE'}" . "/" . $orig_file;
     }
     else {
-	$file =3D "@_";
+	$file =3D $orig_file;
     }
     if (defined($source_map{$file})) {
 	$file =3D $source_map{$file};
@@ -2640,7 +2641,7 @@ sub process_file($) {
 	    print "<refentry>\n";
 	    print " <refnamediv>\n";
 	    print "  <refname>\n";
-	    print "   ${file}\n";
+	    print "   ${orig_file}\n";
 	    print "  </refname>\n";
 	    print "  <refpurpose>\n";
 	    print "   Document generation inconsistency\n";
@@ -2654,7 +2655,7 @@ sub process_file($) {
 	    print "   <para>\n";
 	    print "    The template for this document tried to insert\n";
 	    print "    the structured comment from the file\n";
-	    print "    <filename>${file}</filename> at this point,\n";
+	    print "    <filename>${orig_file}</filename> at this point,\n";
 	    print "    but none was found.\n";
 	    print "    This dummy section is inserted to allow\n";
 	    print "    generation to continue.\n";

--=20
Ben Hutchings
All extremists should be taken out and shot.
--=-Mn4xCTm+b+cc1k5uwDjF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVgiFHue/yOyVhhEJAQp0+RAArrKp+j1jTe/v4g2a6OOWcs2LUuByn+gP
W6goNBxY6K6HoLlR6QLKN2Wp3m1p4s/6amTfMI0zkpwuCCD4DWfNJfFudjYRGEOh
hGWtgmDLOTdrR7vZ/679lVJxfUqaHWwGjTHsO2sU8FI11RNX9Vtyq7dh9u49EcBm
cob5iiICf14UtZ3AzidEN5D0kiRuUHYOOwqqaIP5JhX/4jma3NldOLVVKJr8Dj0F
KNz998psyvUTwMyoNOE/gJUIbZgaU5StFca7degQ4OVgZ1CBCwFmnYZ4VeKAGCAr
HJGbAEphl5pcSpc6sR8kziuYjFioOidqes1LtL9DNrrek6MtRxqPLwGnLLL6K+UY
4aXSO8CereaHwiT8obVr9iLjPZ52wWitEQmEm89VuNF/3AvaL2kN/g5Ym71BEtr4
Z33HSMoofcQUKmvPha30GqDf7FyU5CuvgmdVItDheR08DTUdZUTsNIjadmmaAI5H
wRp04a95dxb2kvw3cTv5MvmEYfMOSs68YH+COwZYh8VYLYGPWbGfN5xyP/WOIor+
4jCY18YazuLvWzBq02yRfBanCrG4ny1qKurtETiPQVTQ1WBOOkWfFvS8BdEWcQv0
t/W1OBtq4hokLbHtlTHS0Uc+oncdHhq/bFWgo4EA9LkFXejBhJoBYRl9W8Amh2x4
iWZupa3XG7Q=
=v81l
-----END PGP SIGNATURE-----

--=-Mn4xCTm+b+cc1k5uwDjF--
