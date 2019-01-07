Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10078.outbound.protection.outlook.com ([40.107.1.78]:25466
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727369AbfAGTbi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jan 2019 14:31:38 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 1/3] kbuild: Add wilddt function
Date: Mon, 7 Jan 2019 19:31:26 +0000
Message-ID: <7fe1bbe77ddec38678a60e75512dabdd7e97ab1c.1546888138.git.leonard.crestez@nxp.com>
References: <cover.1546888138.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1546888138.git.leonard.crestez@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Many SOCs have very simple naming conventions for all boards using a
certain chip and long dtb lists can be collapsed using wildcards.

Since this applied to many architectures add a wilddt function to
Kbuild.include. Example usage:

dtb-$CONFIG_SOC_ABC123 +=3D $(call wilddt,abc123-*)

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 scripts/Kbuild.include | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 46bf1a073f5d..6b8c0cca07c1 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -197,10 +197,16 @@ clean :=3D -f $(srctree)/scripts/Makefile.clean obj
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.headersinst obj=3D
 # Usage:
 # $(Q)$(MAKE) $(hdr-inst)=3Ddir
 hdr-inst :=3D -f $(srctree)/scripts/Makefile.headersinst obj
=20
+###
+# Return list of .dtb for all .dts matching $1 in current directory
+#
+# Example usage: dtb-$CONFIG_SOC_ABC123 +=3D $(call wilddt,abc123-*)
+wilddt =3D $(patsubst $(srctree)/$(src)/%.dts,%.dtb, $(wildcard $(srctree)=
/$(src)/$(1).dts))
+
 # Prefix -I with $(srctree) if it is not an absolute path.
 # skip if -I has no parameter
 addtree =3D $(if $(patsubst -I%,%,$(1)), \
 $(if $(filter-out -I/% -I./% -I../%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(=
1)),$(1)),$(1))
=20
--=20
2.17.1
