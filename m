Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:54096 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253AbbACAWN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 19:22:13 -0500
Received: by mail-we0-f179.google.com with SMTP id q59so5113004wes.10
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 16:22:12 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [RFC v4] builddeb: Try to determine distribution
Date: Sat,  3 Jan 2015 01:21:57 +0100
Message-Id: <1420244517-11139-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Thorsten Glaser <tg@debian.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Like in my initial patch [1] lsb_release is a good choice to
determine the distribution name for debian/changelog.
Its installation is no precondition.

Ben gave some helpful information and detailed explanations in [2].
There he also suggested to have an option to explicitly set the
distribution name (see $KDEB_CHANGELOG_DIST variable).

Embed the improvement as suggested by Thorsten (see [3]):

"This is suboptimal: if KDEB_CHANGELOG_DIST is defined,
lsb_release is not necessary. The following snippet
also omits using its output if it fails but still
produces any:"

Dealing with this issue I learned about "The Colon in the Shell."
(see [4]) and refreshed my knowledge about redirecting outputs
with echo command (see [5]).
Special thanks to Thorsten, I enjoyed the IRC session with you.

Cooked together the snippets of Ben and Thorsten (see [2,3]).
Tested against Linux v3.19-rc2.

Thanks goes to Alexander, Ben. maximilian and Thorsten for the vital help.

[1] https://lkml.org/lkml/2012/4/23/516
[2] http://marc.info/?l=linux-kbuild&m=142022188322321&w=2
[3] http://marc.info/?l=linux-kbuild&m=142023476825460&w=2
[4] http://blog.brlink.eu/index.html#i70
[5] http://stackoverflow.com/questions/23489934/echo-2-some-text-what-does-it-mean-in-shell-scripting

CC: Ben Hutchings <ben@decadent.org.uk>
CC: maximilian attems <max@stro.at>
CC: Thorsten Glaser <tg@debian.org>
CC: Alexander Wirt <formorer@debian.org>
CC: Michal Marek <mmarek@suse.cz>
CC: linux-kbuild@vger.kernel.org
Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Suggested-by: Thorsten Glaser <tg@debian.org>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
v4: Embed improvements suggested by Thorsten
v3: Massaged the commit-message
v2: Suppress error messages when lsb_release is not installed.
    (Thanks maximilian and Ben.)

 scripts/package/builddeb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5972624..f631c77 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -217,9 +217,20 @@ else
 fi
 maintainer="$name <$email>"
 
+# Try to determine distribution
+if [ -n "$KDEB_CHANGELOG_DIST" ]; then
+        distribution=$KDEB_CHANGELOG_DIST
+elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ]; then
+        : # nothing to do in this case
+else
+        distribution="unstable"
+        echo >&2 "Using default distribution of 'unstable' in the changelog"
+        echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
+fi
+
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux-upstream ($packageversion) unstable; urgency=low
+linux-upstream ($packageversion) $distribution; urgency=low
 
   * Custom built Linux kernel.
 
-- 
2.2.1

