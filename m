Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:53064 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:13 -0400
Received: by mail-gw0-f46.google.com with SMTP id 17so1555732gwj.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:13 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 13/15] kconfig: expand file names
Date: Sat, 11 Sep 2010 11:51:20 -0400
Message-Id: <1284220282-3500-14-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

This will allow to use the following construct in source files:

config FOO
    string
    default "foo"

source "$FOO/Kconfig"

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/util.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 78b5c04..584390d 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -12,15 +12,18 @@
 struct file *file_lookup(const char *name)
 {
 	struct file *file;
+	const char *file_name = sym_expand_string_value(name);
 
 	for (file = file_list; file; file = file->next) {
-		if (!strcmp(name, file->name))
+		if (!strcmp(name, file->name)) {
+			free(file_name);
 			return file;
+		}
 	}
 
 	file = malloc(sizeof(*file));
 	memset(file, 0, sizeof(*file));
-	file->name = strdup(name);
+	file->name = file_name;
 	file->next = file_list;
 	file_list = file;
 	return file;
-- 
1.7.2.30.gc37d7.dirty

