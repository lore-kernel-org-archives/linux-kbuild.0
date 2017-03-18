Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:51036 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751207AbdCRWjb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Mar 2017 18:39:31 -0400
Date: Sat, 18 Mar 2017 21:58:23 +0000
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20170318215823.GS4152@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4NxgPrvSrIDR5b4"
Content-Disposition: inline
Subject: [PATCH] Kbuild.include: addtree: Remove quotes before matching path
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: stable@vger.kernel.org, 856474@bugs.debian.org


--T4NxgPrvSrIDR5b4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

systemtap currently fails to build modules when the kernel source and
object trees are separate.

systemtap adds something like -I"/usr/share/systemtap/runtime" to
EXTRA_CFLAGS, and addtree should not adjust this as it's specifying an
absolute directory.  But since make has no understanding of shell
quoting, it does anyway.

For a long time this didn't matter, because addtree would still emit
the original -I option after the adjusted one.  However, commit
db547ef19064 ("Kbuild: don't add obj tree in additional includes")
changed it to remove the original -I option.

Remove quotes (both double and single) before matching against the
excluded patterns.

References: https://bugs.debian.org/856474
Reported-and-tested-by: Jack Henschel <jackdev@mailbox.org>
Reported-and-tested-by: Ritesh Raj Sarraf <rrs@debian.org>
Fixes: db547ef19064 ("Kbuild: don't add obj tree in additional includes")
Cc: stable@vger.kernel.org # 4.8+
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -207,7 +207,7 @@ hdr-inst :=3D -f $(srctree)/scripts/Makefi
 # Prefix -I with $(srctree) if it is not an absolute path.
 # skip if -I has no parameter
 addtree =3D $(if $(patsubst -I%,%,$(1)), \
-$(if $(filter-out -I/% -I./% -I../%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(=
1)),$(1)))
+$(if $(filter-out -I/% -I./% -I../%,$(subst $(quote),,$(subst $(squote),,$=
(1)))),$(patsubst -I%,-I$(srctree)/%,$(1)),$(1)))
=20
 # Find all -I options and call addtree
 flags =3D $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o))=
,$(o)))

--T4NxgPrvSrIDR5b4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWM2tf+e/yOyVhhEJAQqLQg//T7eiKpfHTcYDydv4yOIQff/SiyV4CzpC
X4WwOLFKD1T+WXnjbHXv4xpgFPPtroBcYwVDT/EWgMKpzmqnyPLct5wW3pV2huBK
FUaODbnsVxJmXexekxw/UZXC9hCVbTqbXMgBT/S+LZRbmFcIEXM2JZhb61NH/p6/
98JrPKnRzjfWTXywFZflpQJPtHtN3E9xnYeiPIWQRpcvR+fEjXUsM1o/2FzzZQEG
4YNwrzPi/esVK2zQdXo5VwgP0ShSkAY5XvDB9Cy0J+WWk1p41dt2N+0asYfLtUy2
4S5X+7p5k2jsQNhLbApNAz/jBz5yJfNKhbrntku30NiracqnDw22UlyNfhF/3DUd
FzDAvCSKaRze/Olt7GNPxAoCWmzTGxuk33tnafTfY6Wt37TggbUqPvORBwd+wDBA
Q7rjgsww6AH4MMNrBScDU5fYLpN6GVOq2L+scWwrV9ZRWK48YpCH16d/jZ111agQ
Wa1+xlulfFlfisFRh2x16hH6FoA/f7MMu8SpLj+Kk3PIa1i/QYLQmmupGVUNVrey
JI6yoV3SB3ehs5bUdYY63nQ2hhAY4v8d4xN3EwDqBALhmsZX9gioHKwakdmLZ4MR
i/IDyMXGslH0wgiFGuXp1qtrifOyfDS4hmtaqQknm0NYzH6Z3YkfYSZRnn4TYqR4
0Op2swXqMvc=
=Q2zP
-----END PGP SIGNATURE-----

--T4NxgPrvSrIDR5b4--
