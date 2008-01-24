Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37400 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758744AbYAXWDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:48 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 06/77] kernel-doc: new P directive for DOC: sections
Date: Thu, 24 Jan 2008 23:02:47 +0100
Message-Id: <1201212238-4369-6-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Johannes Berg <johannes@sipsolutions.net>

The !P directive includes the contents of a DOC: section
given by title, e.g.
!Pfilename Title of the section

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/basic/docproc.c |   40 +++++++++++++++++++++++++++++++++++++++-
 1 files changed, 39 insertions(+), 1 deletions(-)

diff --git a/scripts/basic/docproc.c b/scripts/basic/docproc.c
index 7eae534..35bdc68 100644
--- a/scripts/basic/docproc.c
+++ b/scripts/basic/docproc.c
@@ -30,6 +30,7 @@
  *		!Ifilename
  *		!Dfilename
  *		!Ffilename
+ *		!Pfilename
  *
  */
 
@@ -57,6 +58,7 @@ FILEONLY *symbolsonly;
 typedef void FILELINE(char * file, char * line);
 FILELINE * singlefunctions;
 FILELINE * entity_system;
+FILELINE * docsection;
 
 #define MAXLINESZ     2048
 #define MAXFILES      250
@@ -289,12 +291,36 @@ void singfunc(char * filename, char * line)
 }
 
 /*
+ * Insert specific documentation section from a file.
+ * Call kernel-doc with the following parameters:
+ * kernel-doc -docbook -function "doc section" filename
+ */
+void docsect(char *filename, char *line)
+{
+	char *vec[6]; /* kerneldoc -docbook -function "section" file NULL */
+	char *s;
+
+	for (s = line; *s; s++)
+		if (*s == '\n')
+			*s = '\0';
+
+	vec[0] = KERNELDOC;
+	vec[1] = DOCBOOK;
+	vec[2] = FUNCTION;
+	vec[3] = line;
+	vec[4] = filename;
+	vec[5] = NULL;
+	exec_kernel_doc(vec);
+}
+
+/*
  * Parse file, calling action specific functions for:
  * 1) Lines containing !E
  * 2) Lines containing !I
  * 3) Lines containing !D
  * 4) Lines containing !F
- * 5) Default lines - lines not matching the above
+ * 5) Lines containing !P
+ * 6) Default lines - lines not matching the above
  */
 void parse_file(FILE *infile)
 {
@@ -328,6 +354,15 @@ void parse_file(FILE *infile)
 						s++;
 					singlefunctions(line +2, s);
 					break;
+				case 'P':
+					/* filename */
+					while (*s && !isspace(*s)) s++;
+					*s++ = '\0';
+					/* DOC: section name */
+					while (isspace(*s))
+						s++;
+					docsection(line + 2, s);
+					break;
 				default:
 					defaultline(line);
 			}
@@ -374,6 +409,7 @@ int main(int argc, char *argv[])
 		externalfunctions = find_export_symbols;
 		symbolsonly       = find_export_symbols;
 		singlefunctions   = noaction2;
+		docsection        = noaction2;
 		parse_file(infile);
 
 		/* Rewind to start from beginning of file again */
@@ -383,6 +419,7 @@ int main(int argc, char *argv[])
 		externalfunctions = extfunc;
 		symbolsonly       = printline;
 		singlefunctions   = singfunc;
+		docsection        = docsect;
 
 		parse_file(infile);
 	}
@@ -396,6 +433,7 @@ int main(int argc, char *argv[])
 		externalfunctions = adddep;
 		symbolsonly       = adddep;
 		singlefunctions   = adddep2;
+		docsection        = adddep2;
 		parse_file(infile);
 		printf("\n");
 	}
-- 
1.5.4.rc3.14.g44397

