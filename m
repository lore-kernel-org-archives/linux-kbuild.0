Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:28304 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261Ab0LOXTE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 18:19:04 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: [PATCH] Documentation/kbuild: add info that 'choice' can have a symbol name
Date: Thu, 16 Dec 2010 00:19:00 +0100
Message-Id: <1292455140-5869-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>, Arnaud Lacombe <lacombar@gmail.com>

Changeset 5a1aa8a1 added the possibility to name a choice,
and to have the same choice be defined multiple times.
But the documentation was forgotten, so this updates it accordingly.

Thanks to Arnaud Lacombe for pointing it to me in the first place:
  http://www.spinics.net/lists/linux-kbuild/msg03940.html

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>
---
 Documentation/kbuild/kconfig-language.txt |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 2fe93ca..a4bbaaf 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -268,7 +268,7 @@ separate list of options.
 
 choices:
 
-	"choice"
+	"choice" [symbol]
 	<choice options>
 	<choice block>
 	"endchoice"
@@ -282,6 +282,10 @@ single driver can be compiled/loaded into the kernel, but all drivers
 can be compiled as modules.
 A choice accepts another option "optional", which allows to set the
 choice to 'n' and no entry needs to be selected.
+If no [symbol] is associated with a choice, then you can not have multiple
+definitions of that choice. If a [symbol] is associated to the choice,
+then you may define the same choice (ie. with the same entries) in another
+place.
 
 comment:
 
-- 
1.7.1

