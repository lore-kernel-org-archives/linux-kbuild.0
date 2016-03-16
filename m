Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:58289 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965768AbcCPKxo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 06:53:44 -0400
From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH 1/2] kconfig: add chomp like helper function
Date: Wed, 16 Mar 2016 11:53:38 +0100
Message-Id: <1458125619-28093-1-git-send-email-pebolle@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Add a helper function that strips trailing new lines and carriage
returns from strings. Call it chomp, after the perl function that
inspired it.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
 scripts/kconfig/confdata.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0b7dc2fd7bac..51904c423411 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -248,6 +248,28 @@ e_out:
 	return -1;
 }
 
+/*
+ * Return newly allocated copy of string "in" with all trailing new lines and
+ * carriage returns removed.
+ */
+static char *chomp(char *in)
+{
+	size_t last = strlen(in);
+	char *copy;
+
+	copy = malloc(last + 1);
+	if (!copy)
+		return NULL;
+
+	strcpy(copy, in);
+	if (last)
+		last--;
+	while (last  && (copy[last] == '\r' || copy[last] == '\n'))
+		copy[last--] = '\0';
+
+	return copy;
+}
+
 int conf_read_simple(const char *name, int def)
 {
 	FILE *in = NULL;
-- 
2.4.3

