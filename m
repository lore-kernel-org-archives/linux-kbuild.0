Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59831 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLg4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:36:56 -0400
Date: Thu, 26 Jul 2018 11:20:45 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102045.GV14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZUxj+kVYsk1YKJSS"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 02/12] builddeb: Change architecture detection fallback to
 use dpkg-architecture
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--ZUxj+kVYsk1YKJSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We currently use dpkg --print-architecture, which reports the
architecture of the build machine.  We can make a better guess
than this by asking dpkg-architecture what the host architecture,
i.e. the default architecture for building packages, is.  This is
sensitive to environment variables such as CC and DEB_HOST_ARCH,
which should already be set in a cross-build environment.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 434f0b4d5231..389bf983879d 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -42,13 +42,13 @@ set_debarch() {
 		fi
 		;;
 	*)
-		debarch=$(dpkg --print-architecture)
+		debarch=$(dpkg-architecture -qDEB_HOST_ARCH)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
 		echo "" >&2
 		echo "Your architecture doesn't have its equivalent" >&2
 		echo "Debian userspace architecture defined!" >&2
-		echo "Falling back to using your current userspace instead!" >&2
+		echo "Falling back to the current host architecture ($debarch)." >&2
 		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
 		echo "" >&2
 		;;


--ZUxj+kVYsk1YKJSS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mgfOe/yOyVhhEJAQrGzQ/+I9EBECXMQM60ryB57f2PojFECZvIE/gU
JDbc7CdeQ9HrKVZxpi90VLbhre7RWw2nU7k/SuKP/RfWBrLK7DeYQYlU+//EKAfN
bFao0Op1+f2CkozaTp7dTj7uDnZv4zt5HE00rAFJ7hiHZpScuOxk4uuX856w0DPu
za0F2RValaBX/FrSg0q4zijlK+beiKujkGGA59e+npZIxC7NSUp3xtonmnBLEGfn
2JSmYR7s3/84ARKhG5yMj48vEv547sNzeOJCWiUlKcXBhmIo/K8TzMmYdpTS1RRR
7SHB1OLmLeyP4EgdtYOUr6g56ous679NuFmSZh1AGsdTkBwgynsW7PPuBcEIJWlP
PEBl0BsJSXNt5Vy1F4zfjbMg0F+8sS48qZWIU/wcCEvtQ/j1zd+642xO0NkwDPIl
fKMfa9AQxL4I7Bkn8T6VZ1qpRvvmzSgkhOYmRZF4ONJWz6dHpEN6BsDL19+Lg9Ao
JFmTdf8WrKLjY90stG6gAIPK3V4wtsp5B2nnclTw0jxNVWP3bU+q7ihlOeKz+lcp
0tlZcU5faiRJYxoQWlfKcWuIJv6wPJUyJulRO/oQVIGvid2AYTrUCgzaL+f73xWQ
6czfRw9Q6RLD7/BljHQfOQzsPAxyZ3hATGgl0HF2vhFamyERbknNArZctLKSyH4b
7PM2oLg5Oc0=
=KPWt
-----END PGP SIGNATURE-----

--ZUxj+kVYsk1YKJSS--
