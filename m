Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:52597 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1764119AbYBBUqk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:40 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 9CA18E30A7A
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Feb 2008 21:46:39 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] kconfig: ignore select of unknown symbol
Date: Sat,  2 Feb 2008 21:46:39 +0100
Message-Id: <1201985204-26589-5-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>

We have had warnings for a long time about select of unknow symbol
but the warnings does not really makes sense since we may
select a symbol that is relevant and defined in one
arch but not in another arch.
And as long as we do not use a common set of Kconfig files
for all archs lets just ignore this case.

Previously we have used this to find bad uses of
select but we need a more relaible method to do so.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/menu.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index fdad173..606ceb9 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -203,12 +203,9 @@ void sym_check_prop(struct symbol *sym)
 				prop_warn(prop,
 				    "config symbol '%s' uses select, but is "
 				    "not boolean or tristate", sym->name);
-			else if (sym2->type == S_UNKNOWN)
-				prop_warn(prop,
-				    "'select' used by config symbol '%s' "
-				    "refers to undefined symbol '%s'",
-				    sym->name, sym2->name);
-			else if (sym2->type != S_BOOLEAN && sym2->type != S_TRISTATE)
+			else if (sym2->type != S_UNKNOWN &&
+			         sym2->type != S_BOOLEAN &&
+			         sym2->type != S_TRISTATE)
 				prop_warn(prop,
 				    "'%s' has wrong type. 'select' only "
 				    "accept arguments of boolean and "
-- 
1.5.4.rc3.14.g44397

