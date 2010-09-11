Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:53064 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPx7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:53:59 -0400
Received: by mail-gw0-f46.google.com with SMTP id 17so1555732gwj.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:53:59 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 05/15] kconfig: allow PACKAGE to be defined on the compiler's command-line
Date: Sat, 11 Sep 2010 11:51:12 -0400
Message-Id: <1284220282-3500-6-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/lkc.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 1b966bf..5d5f187 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -31,7 +31,10 @@ extern "C" {
 
 #define SRCTREE "srctree"
 
+#ifndef PACKAGE
 #define PACKAGE "linux"
+#endif
+
 #define LOCALEDIR "/usr/share/locale"
 
 #define _(text) gettext(text)
-- 
1.7.2.30.gc37d7.dirty

