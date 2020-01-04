Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rere.qmqm.pl ([91.227.64.183]:17501 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgADJz7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 04:55:59 -0500
Date: Sat, 04 Jan 2020 10:55:56 +0100
Message-Id: <081640c81d3c89707fdbb8869ae5f54aaea5064e.1578131485.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
References: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/2] builddeb: make headers package thinner
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Remove a bunch of files not used during external module builds:
 - foreign architecture headers
 - subtree Makefiles
 - Kconfig files
 - perl scripts

On amd64 system this looses a third of the resulting .deb size.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d289c4ebc891..fb68916d5898 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -165,8 +165,8 @@ EOF
 done
 
 # Build kernel header package
-(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find arch/*/include include scripts -type f -o -type l) >> "$objtree/debian/hdrsrcfiles"
+(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > "$objtree/debian/hdrsrcfiles"
+(cd $srctree; find include scripts -type f -o -type l) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
 if is_enabled CONFIG_STACK_VALIDATION; then
-- 
2.20.1
