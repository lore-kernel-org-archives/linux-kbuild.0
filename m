Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55148 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfJOGtS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 02:49:18 -0400
From: Denis Efremov <efremov@linux.com>
Subject: [PATCH] modpost: add NOFAIL to strdup call
Date: Tue, 15 Oct 2019 09:49:06 +0300
Message-Id: <20191015064906.13833-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Denis Efremov <efremov@linux.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Add NOFAIL check for the strdup call, since the function
allocates memory and can return NULL. All strdup calls in
modpost are checked with NOFAIL.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 936d3ad23c83..8e8975065cbc 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -384,7 +384,7 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 		}
 	}
 	free(s->namespace);
-	s->namespace = namespace ? strdup(namespace) : NULL;
+	s->namespace = namespace ? NOFAIL(strdup(namespace)) : NULL;
 	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
-- 
2.21.0
