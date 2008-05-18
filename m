Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp27.orange.fr ([80.12.242.95]:41082 "EHLO smtp27.orange.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755424AbYERVK0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 May 2008 17:10:26 -0400
Subject: [PATCH 1/1] kconfig: incorrect 'len' field initialisation ?
From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Sun, 18 May 2008 23:10:24 +0200
Content-Type: text/plain
Message-Id: <20080518211024.D1B751C00086@mwinf2714.orange.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: cj <christophe.jaillet@wanadoo.fr>, linux <linux-kernel@vger.kernel.org>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org

From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Hi, here is a patch against /scripts/kconfig/util.c :
	
1) The field 'len' of the 'gstr' structure seems to track the size of the memory 
already allocated for the "growable string". So the value of this field should be
the same as the 'malloc()' just above, shouldn't it ?



Note: this patch is based on 'linux-2.6.25.tar.bz2'

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

---

--- linux 2.6.25/scripts/kconfig/util.c	2008-04-17 04:49:44.000000000 +0200
+++ linux 2.6.25/scripts/kconfig/util.c.cj	2008-05-18 22:56:14.000000000 +0200
@@ -77,7 +77,7 @@ struct gstr str_new(void)
 {
 	struct gstr gs;
 	gs.s = malloc(sizeof(char) * 64);
-	gs.len = 16;
+	gs.len = 64;
 	strcpy(gs.s, "\0");
 	return gs;
 }


