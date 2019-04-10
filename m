Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr40096.outbound.protection.outlook.com ([40.107.4.96]:23810
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729367AbfDJJXU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 05:23:20 -0400
From: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Subject: [PATCH v2] modpost: make KBUILD_MODPOST_WARN also configurable for
Date: Wed, 10 Apr 2019 09:23:15 +0000
Message-ID: <HE1PR0701MB2652D08633C7322BDEABDACBFA2E0@HE1PR0701MB2652.eurprd07.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, "michal.lkml@markovi.net" <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Commit ea837f1c0503 ("kbuild: make modpost processing configurable")
was intended to give KBUILD_MODPOST_WARN flexibility to be configurable.
Right now KBUILD_MODPOST_WARN gets just ignored when KBUILD_EXTMOD is
set which happens per default when building modules out of the tree.

This change gives the opportunity to define module build behaving also
in case of out of tree builds and default will become exit on error.
Errors which can be detected by the build should be trapped out of the box
there, unless somebody wants to notice broken stuff later at runtime.

As this patch changes the default behaving from warning to error,
users can consider to fix it for external module builds by:
- providing module symbol table via KBUILD_EXTRA_SYMBOLS for
  modules which are dependent
- OR getting old behaving back by passing KBUILD_MODPOST_WARN to the build

Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
---
 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 6b7f354f189a..fec6ec2ffa47 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -78,7 +78,7 @@ modpost =3D scripts/mod/modpost                    \
  $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))=
) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
- $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
+ $(if $(KBUILD_MODPOST_WARN),-w)
=20
 MODPOST_OPT=3D$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
=20
--=20
2.19.2
