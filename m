Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from thoth.sbs.de ([192.35.17.2]:59789 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750810AbeCUFPi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Mar 2018 01:15:38 -0400
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] builddeb: Fix header package regarding dtc source links
Message-ID: <c6e11bd4-3d22-f8aa-c905-d06b16b1f5e2@siemens.com>
Date: Wed, 21 Mar 2018 13:15:28 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Since d5d332d3f7e8, a couple of links in scripts/dtc/include-prefixes
are additionally required in order to build device trees with the header
package.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b4f0f2b3f8d2..13fabb1f81db 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -313,7 +313,7 @@ fi
 
 # Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
+(cd $srctree; find arch/*/include include scripts -type f -o -type l) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
 if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
-- 
2.13.6
