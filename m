Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:40977 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755016Ab2JIWqj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Oct 2012 18:46:39 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/3] kconfig: add a function to get the CONFIG_ prefix
Date: Wed, 10 Oct 2012 00:46:32 +0200
Message-Id: <1349822793-1227-3-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1349822793-1227-1-git-send-email-yann.morin.1998@free.fr>
References: <1349822793-1227-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, we get the CONFIG_ prefix via the CONFIG_ macro, which means
the CONFIG_ prefix is hard-coded at compile time. This goes against
having a run-time defined CONFIG_ prefix.

Add a function that returns the CONFIG_ prefix to use (but keep the
current hard-coded behavior, to be changed in a later patch).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/lkc.h |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index c18f2bd..25862fd 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -36,9 +36,17 @@ extern "C" {
 #define _(text) gettext(text)
 #define N_(text) (text)
 
-#ifndef CONFIG_
-#define CONFIG_ "CONFIG_"
+/* Those two defines copied from include/linux/stringify.h */
+#define __stringify_1(x...)	#x
+#define __stringify(x...)	__stringify_1(x)
+static inline const char *CONFIG_prefix(void)
+{
+	return __stringify(CONFIG_);
+}
+#ifdef CONFIG_
+#undef CONFIG_
 #endif
+#define CONFIG_ CONFIG_prefix()
 
 #define TF_COMMAND	0x0001
 #define TF_PARAM	0x0002
-- 
1.7.2.5

