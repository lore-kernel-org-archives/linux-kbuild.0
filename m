Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35815 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab1GBFKu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jul 2011 01:10:50 -0400
Received: by mail-iw0-f174.google.com with SMTP id 6so3288158iwn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2011 22:10:50 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/5] kconfig/conf: reduce the scope of `defconfig_file'
Date: Sat,  2 Jul 2011 01:10:37 -0400
Message-Id: <1309583440-4795-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1309583440-4795-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
 <1309583440-4795-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

This variable is not used outside of main() so there is not much reason keeping
it global. Ensure it is initialized as gcc has no way to know that normal
execution path expect only one option switch to be given on the command line
(except when we request help). As a result, we always initialize
`defconfig_file' before using it.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 08c05bc..6431f5c 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -34,8 +34,6 @@ enum input_mode {
 	oldnoconfig,
 } input_mode = oldaskconfig;
 
-char *defconfig_file;
-
 static int indent = 1;
 static int valid_stdin = 1;
 static int sync_kconfig;
@@ -462,7 +460,7 @@ static struct option long_opts[] = {
 int main(int ac, char **av)
 {
 	int opt;
-	const char *name;
+	const char *name, *defconfig_file = NULL /* gcc uninit */;
 	struct stat tmpstat;
 
 	setlocale(LC_ALL, "");
-- 
1.7.3.4.574.g608b.dirty

