Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B09C433EF
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Apr 2022 19:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238045AbiDXTNo (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 24 Apr 2022 15:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237850AbiDXTNl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Apr 2022 15:13:41 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184272AC4;
        Sun, 24 Apr 2022 12:10:11 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 23OJ8o6C019069;
        Mon, 25 Apr 2022 04:09:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 23OJ8o6C019069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1650827342;
        bh=V46C7hNoSC3dq/1A/6IyIkhULaKBN7SdX3Bqg3MVSi4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YtUsxM1YDdn18ie0G+pVK/aaU7BNzQ0btX2Xa80A/gQbXhlJmJZwOoTjtsNiOwt2R
         IuSKDh401fi8qHBEXvsljZMwo8tTTj8AfZ0u0BOJkBbAyV+cxHI2APrUqJJGwfSgbZ
         Hh9wBQH7+QlP88pqFD+ItBDlfX+MG5JiKJDZDlalGM0jfzZ8vRRGLEj18J7WXhHUDB
         V4QOEL2HgSe1JqsJ9MJDXKQJrKRz8UMW4tgfxfZcTt6mfEQYVR8t9y/lv3c1/4EAb8
         RXKWGXly2yOhlXIckzIMl/W88BEiv39rclskRe+WGKtyjAE/nXyS4yWDKnMBuz7aVG
         Z6xYkad79CpIA==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 18/27] modpost: make sym_add_exported() a void function
Date:   Mon, 25 Apr 2022 04:08:02 +0900
Message-Id: <20220424190811.1678416-19-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220424190811.1678416-1-masahiroy@kernel.org>
References: <20220424190811.1678416-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, sym_add_exported() returns the pointer to the added symbol
just for doing:

    s->is_static = false;

in the read_dump() function.

I noticed it was unneeded because sym_add_exported() can know the proper
default for the 'is_static' member by checking mod->from_dump.

This makes the code slightly simpler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4f0b2b23516a..fd710aa59bda 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -243,7 +243,7 @@ static struct symbol *alloc_symbol(const char *name, struct symbol *next)
 	memset(s, 0, sizeof(*s));
 	strcpy(s->name, name);
 	s->next = next;
-	s->is_static = true;
+
 	return s;
 }
 
@@ -401,8 +401,8 @@ static void sym_update_namespace(const char *symname, const char *namespace)
 	s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
 }
 
-static struct symbol *sym_add_exported(const char *name, struct module *mod,
-				       enum export export)
+static void sym_add_exported(const char *name, struct module *mod,
+			     enum export export)
 {
 	struct symbol *s = find_symbol(name);
 
@@ -414,9 +414,9 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 
 	s = new_symbol(name, mod, export);
 	s->module = mod;
+	s->is_static = !mod->from_dump;
 	s->export    = export;
 	list_add_tail(&s->list, &mod->exported_symbols);
-	return s;
 }
 
 static void sym_set_crc(const char *name, unsigned int crc)
@@ -2419,7 +2419,6 @@ static void read_dump(const char *fname)
 		char *symname, *namespace, *modname, *d, *export;
 		unsigned int crc;
 		struct module *mod;
-		struct symbol *s;
 
 		if (!(symname = strchr(line, '\t')))
 			goto fail;
@@ -2442,8 +2441,7 @@ static void read_dump(const char *fname)
 			mod = new_module(modname);
 			mod->from_dump = true;
 		}
-		s = sym_add_exported(symname, mod, export_no(export));
-		s->is_static = false;
+		sym_add_exported(symname, mod, export_no(export));
 		sym_set_crc(symname, crc);
 		sym_update_namespace(symname, namespace);
 	}
-- 
2.32.0

