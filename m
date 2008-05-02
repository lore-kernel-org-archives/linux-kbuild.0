Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36573 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S936121AbYEBUso (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 16:48:44 -0400
From: sam@ravnborg.org
Subject: [PATCH] kconfig: kill the warning "trying to assign nonexistent symbol"
Date: Fri,  2 May 2008 22:49:18 +0200
Message-Id: <1209761358-6579-5-git-send-email-sam@ravnborg.org>
In-Reply-To: <1209761358-6579-4-git-send-email-sam@ravnborg.org>
References: <20080502204729.GA6534@uranus.ravnborg.org>
 <1209761358-6579-1-git-send-email-sam@ravnborg.org>
 <1209761358-6579-2-git-send-email-sam@ravnborg.org>
 <1209761358-6579-3-git-send-email-sam@ravnborg.org>
 <1209761358-6579-4-git-send-email-sam@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@uranus.ravnborg.org>, Sam Ravnborg <sam@ravnborg.org>

From: Sam Ravnborg <sam@uranus.ravnborg.org>

The warning is only annoying and not used.
So drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/confdata.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ee5fe94..ea44754 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -222,10 +222,8 @@ load:
 				continue;
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 9);
-				if (!sym) {
-					conf_warning("trying to assign nonexistent symbol %s", line + 9);
+				if (!sym)
 					break;
-				}
 			} else {
 				sym = sym_lookup(line + 9, 0);
 				if (sym->type == S_UNKNOWN)
@@ -261,10 +259,8 @@ load:
 			}
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 7);
-				if (!sym) {
-					conf_warning("trying to assign nonexistent symbol %s", line + 7);
+				if (!sym)
 					break;
-				}
 			} else {
 				sym = sym_lookup(line + 7, 0);
 				if (sym->type == S_UNKNOWN)
-- 
1.5.4.1.143.ge7e51

