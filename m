Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:53064 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPxx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:53:53 -0400
Received: by gwj17 with SMTP id 17so1555732gwj.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:53:52 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 02/15] kconfig: rephrase help text not to mention the internal prefix
Date: Sat, 11 Sep 2010 11:51:09 -0400
Message-Id: <1284220282-3500-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/mconf.c |   10 +++++-----
 scripts/kconfig/nconf.c |   12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index d2f6e05..5c3d0c4 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -232,7 +232,7 @@ save_config_help[] = N_(
 	"leave this blank.\n"),
 search_help[] = N_(
 	"\n"
-	"Search for CONFIG_ symbols and display their relations.\n"
+	"Search for symbols and display their relations.\n"
 	"Regular expressions are allowed.\n"
 	"Example: search for \"^FOO\"\n"
 	"Result:\n"
@@ -249,7 +249,7 @@ search_help[] = N_(
 	"Selected by: BAR\n"
 	"-----------------------------------------------------------------\n"
 	"o The line 'Prompt:' shows the text used in the menu structure for\n"
-	"  this CONFIG_ symbol\n"
+	"  this symbol\n"
 	"o The 'Defined at' line tell at what file / line number the symbol\n"
 	"  is defined\n"
 	"o The 'Depends on:' line tell what symbols needs to be defined for\n"
@@ -265,9 +265,9 @@ search_help[] = N_(
 	"Only relevant lines are shown.\n"
 	"\n\n"
 	"Search examples:\n"
-	"Examples: USB	=> find all CONFIG_ symbols containing USB\n"
-	"          ^USB => find all CONFIG_ symbols starting with USB\n"
-	"          USB$ => find all CONFIG_ symbols ending with USB\n"
+	"Examples: USB	=> find all symbols containing USB\n"
+	"          ^USB => find all symbols starting with USB\n"
+	"          USB$ => find all symbols ending with USB\n"
 	"\n");
 
 static int indent;
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 18a215d..b8a9f37 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -217,8 +217,8 @@ save_config_help[] = N_(
 "leave this blank.\n"),
 search_help[] = N_(
 "\n"
-"Search for CONFIG_ symbols and display their relations.\n"
-"Regular expressions are allowed.\n"
+"Search for symbols and display their relations. Regular expressions\n"
+"are allowed.\n"
 "Example: search for \"^FOO\"\n"
 "Result:\n"
 "-----------------------------------------------------------------\n"
@@ -234,7 +234,7 @@ search_help[] = N_(
 "Selected by: BAR\n"
 "-----------------------------------------------------------------\n"
 "o The line 'Prompt:' shows the text used in the menu structure for\n"
-"  this CONFIG_ symbol\n"
+"  this symbol\n"
 "o The 'Defined at' line tell at what file / line number the symbol\n"
 "  is defined\n"
 "o The 'Depends on:' line tell what symbols needs to be defined for\n"
@@ -250,9 +250,9 @@ search_help[] = N_(
 "Only relevant lines are shown.\n"
 "\n\n"
 "Search examples:\n"
-"Examples: USB   = > find all CONFIG_ symbols containing USB\n"
-"          ^USB => find all CONFIG_ symbols starting with USB\n"
-"          USB$ => find all CONFIG_ symbols ending with USB\n"
+"Examples: USB   = > find all symbols containing USB\n"
+"          ^USB => find all symbols starting with USB\n"
+"          USB$ => find all symbols ending with USB\n"
 "\n");
 
 struct mitem {
-- 
1.7.2.30.gc37d7.dirty

