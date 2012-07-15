Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:19719 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713Ab2GOUpb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Jul 2012 16:45:31 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] scripts/config: fix double-quotes un-escaping
Date: Sun, 15 Jul 2012 22:37:35 +0200
Message-Id: <1342384655-7769-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

When reporting a string value, only the first double-quote was un-escaped.
We need to un-escape all escaped double-quotes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/config b/scripts/config
index f65a44a..ee35539 100755
--- a/scripts/config
+++ b/scripts/config
@@ -156,7 +156,7 @@ while [ "$1" != "" ] ; do
 				V="${V/#${CONFIG_}$ARG=/}"
 				V="${V/#\"/}"
 				V="${V/%\"/}"
-				V="${V/\\\"/\"}"
+				V="${V//\\\"/\"}"
 				echo "${V}"
 			fi
 		fi
-- 
1.7.2.5

