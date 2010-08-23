Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:44537 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753308Ab0HWQDw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Aug 2010 12:03:52 -0400
Received: by fxm13 with SMTP id 13so3051934fxm.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Aug 2010 09:03:51 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC] kbuild: use getopt_long(), not its _only() variant
Date: Mon, 23 Aug 2010 12:01:24 -0400
Message-Id: <1282579284-20102-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

NetBSD lacks getopt_long_only() whereas getopt_long() works just fine.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5b7c86e..ecb16c0 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -466,7 +466,7 @@ int main(int ac, char **av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
-	while ((opt = getopt_long_only(ac, av, "", long_opts, NULL)) != -1) {
+	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
 		case silentoldconfig:
-- 
1.7.2.30.gc37d7.dirty

