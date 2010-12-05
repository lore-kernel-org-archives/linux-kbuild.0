Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:34444 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186Ab0LEGmJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:42:09 -0500
Received: by gxk19 with SMTP id 19so5953686gxk.11
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:42:07 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/5] kbuild/gconf: add dummy inline for bind_textdomain_codeset()
Date: Sun,  5 Dec 2010 01:41:15 -0500
Message-Id: <1291531278-7395-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

This symbols is used by gconf.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/lkc.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 3633d5a..16eb416 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -14,6 +14,7 @@
 static inline const char *gettext(const char *txt) { return txt; }
 static inline void textdomain(const char *domainname) {}
 static inline void bindtextdomain(const char *name, const char *dir) {}
+static inline char *bind_textdomain_codeset(const char *dn, char *c) { return c; }
 #endif
 
 #ifdef __cplusplus
-- 
1.7.2.30.gc37d7.dirty

