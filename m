Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37464 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758849AbYAXWDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:51 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 01/77] kernel-doc: fix xml output mode
Date: Thu, 24 Jan 2008 23:02:42 +0100
Message-Id: <1201212238-4369-1-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Johannes Berg <johannes@sipsolutions.net>

After Randy's patch fixing the HTML output in DOC: sections
(6b5b55f6c404fa730a09a8254eb19f5a038afcc2) the same bug remained in XML
mode, this fixes it.

Signed-off-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kernel-doc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 1d14018..e4fa8d9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -182,10 +182,10 @@ my $blankline_html = $local_lt . "p" . $local_gt;	# was "<p>"
 my %highlights_xml = ( "([^=])\\\"([^\\\"<]+)\\\"", "\$1<quote>\$2</quote>",
 			$type_constant, "<constant>\$1</constant>",
 			$type_func, "<function>\$1</function>",
-			$type_struct, "<structname>\$1</structname>",
+			$type_struct_xml, "<structname>\$1</structname>",
 			$type_env, "<envar>\$1</envar>",
 			$type_param, "<parameter>\$1</parameter>" );
-my $blankline_xml = "</para><para>\n";
+my $blankline_xml = $local_lt . "/para" . $local_gt . $local_lt . "para" . $local_gt . "\n";
 
 # gnome, docbook format
 my %highlights_gnome = ( $type_constant, "<replaceable class=\"option\">\$1</replaceable>",
@@ -394,7 +394,7 @@ sub output_highlight {
 #	confess "output_highlight got called with no args?\n";
 #   }
 
-    if ($output_mode eq "html") {
+    if ($output_mode eq "html" || $output_mode eq "xml") {
 	$contents = local_unescape($contents);
 	# convert data read & converted thru xml_escape() into &xyz; format:
 	$contents =~ s/\\\\\\/&/g;
-- 
1.5.4.rc3.14.g44397

