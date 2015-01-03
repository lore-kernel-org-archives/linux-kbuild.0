Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:50199 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbbACJui (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2015 04:50:38 -0500
Received: by mail-wi0-f182.google.com with SMTP id h11so645503wiw.9
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jan 2015 01:50:37 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v6] builddeb: Try to determine distribution
Date: Sat,  3 Jan 2015 10:50:19 +0100
Message-Id: <1420278619-6637-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Thorsten Glaser <tg@mirbsd.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

lsb_release command is a good choice to determine the distribution
name for the changelog file in the generated Debian packages [1].
Its installation is no precondition.
In Debian it is still not essential or build-essential.

Ben gave some helpful informations and detailed explanations in [2].
There he also suggested to have an option to explicitly set the
distribution name (see $KDEB_CHANGELOG_DIST variable).

Embedded the improvement as suggested by Thorsten (see [3]):

"This is suboptimal: if KDEB_CHANGELOG_DIST is defined,
lsb_release is not necessary. The following snippet
also omits using its output if it fails but still
produces any:"

Dealing with this issue I learned about "The Colon in the Shell." and
possible pitfalls in this area (see [4,5]). Furthermore, refreshed my
knowledge about redirecting outputs with the echo command (see [5]).
Special thanks to Thorsten, I enjoyed the IRC session with you.

Cooked together the snippets of Ben and Thorsten (see [2,3]).
Tested against Linux v3.19-rc2.

Thanks goes to Alexander, Ben, maximilian and Thorsten for the very
vital help.

[1] https://lkml.org/lkml/2012/4/23/516
[2] http://marc.info/?l=linux-kbuild&m=142022188322321&w=2
[3] http://marc.info/?l=linux-kbuild&m=142023476825460&w=2
[4] http://blog.brlink.eu/index.html#i70
[5] https://www.mirbsd.org/permalinks/wlog-10_e20141209-tg.htm
[6] http://stackoverflow.com/questions/23489934/echo-2-some-text-what-does-it-mean-in-shell-scripting

CC: Ben Hutchings <ben@decadent.org.uk>
CC: maximilian attems <max@stro.at>
CC: Thorsten Glaser <tg@mirbsd.org>
CC: Alexander Wirt <formorer@debian.org>
CC: Michal Marek <mmarek@suse.cz>
CC: linux-kbuild@vger.kernel.org
Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Suggested-by: Thorsten Glaser <tg@mirbsd.org>
Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: maximilian attems <max@stro.at>
[ dileks: Reviewed his suggested diff in RFC v4 ]
Reviewed-by: Thorsten Glaser <tg@debian.org>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
v6: Based on RFC v5 with added reviews and acks
v5: Improve commit-message and fix Thorsten's email-address
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

