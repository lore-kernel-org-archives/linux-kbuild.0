Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42779 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758794AbYAXWDt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:49 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 05/77] kernel-doc: use no-doc option
Date: Thu, 24 Jan 2008 23:02:46 +0100
Message-Id: <1201212238-4369-5-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Johannes Berg <johannes@sipsolutions.net>

When asked by a template to include all functions from a file,
it will also include DOC: sections wreaking havoc in the generated
docbook file. This patch makes it use the new -no-doc-sections
flag for kernel-doc to avoid this.

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/basic/docproc.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/basic/docproc.c b/scripts/basic/docproc.c
index 0e4bd54..7eae534 100644
--- a/scripts/basic/docproc.c
+++ b/scripts/basic/docproc.c
@@ -65,6 +65,7 @@ FILELINE * entity_system;
 #define DOCBOOK       "-docbook"
 #define FUNCTION      "-function"
 #define NOFUNCTION    "-nofunction"
+#define NODOCSECTIONS "-no-doc-sections"
 
 char *srctree;
 
@@ -231,13 +232,14 @@ void docfunctions(char * filename, char * type)
 
 	for (i=0; i <= symfilecnt; i++)
 		symcnt += symfilelist[i].symbolcnt;
-	vec = malloc((2 + 2 * symcnt + 2) * sizeof(char*));
+	vec = malloc((2 + 2 * symcnt + 3) * sizeof(char *));
 	if (vec == NULL) {
 		perror("docproc: ");
 		exit(1);
 	}
 	vec[idx++] = KERNELDOC;
 	vec[idx++] = DOCBOOK;
+	vec[idx++] = NODOCSECTIONS;
 	for (i=0; i < symfilecnt; i++) {
 		struct symfile * sym = &symfilelist[i];
 		for (j=0; j < sym->symbolcnt; j++) {
-- 
1.5.4.rc3.14.g44397

