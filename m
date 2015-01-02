Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:32776 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888AbbABUjZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 15:39:25 -0500
Received: by mail-wg0-f48.google.com with SMTP id y19so24487836wgg.21
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 12:39:24 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [RFC v2] builddeb: Try to determine distribution
Date: Fri,  2 Jan 2015 21:39:09 +0100
Message-Id: <1420231149-7425-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Thorsten Glaser <tg@debian.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

This is based on ideas of me and Ben.
Thanks goes to Thorsten and Alexander for the vital help in 2012.
Also Thanks to maximilian for the review of my diverse patches.

Like in my initial patch [1] lsb_release is used to determine
the short codename as distribution name for debian/changelog.

Ben gave some helpful and detailed information in [2].
There he also suggested to have an option to explicitly set the
distribution (see $KDEB_CHANGELOG_DIST variable).

I have hardcoded the script-name when the default distribution
is used. This is a bit ugly.

This patch is based on the snippet of Ben in [2] and tested
against Linux v3.19-rc2.

[1] https://lkml.org/lkml/2012/4/23/516
[2] http://marc.info/?l=linux-kbuild&m=142022188322321&w=2

CC: Ben Hutchings <ben@decadent.org.uk>
CC: maximilian attems <max@stro.at>
CC: Thorsten Glaser <tg@debian.org>
CC: Alexander Wirt <formorer@debian.org>
CC: Michal Marek <mmarek@suse.cz>
CC: linux-kbuild@vger.kernel.org
Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
v2: Suppress error messages when lsb_release is not installed.
    (Thanks maximilian and Ben.)

 scripts/package/builddeb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5972624..6918429 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -217,9 +217,21 @@ else
 fi
 maintainer="$name <$email>"
 
+# Try to determine distribution
+codename=$(lsb_release --codename --short 2> /dev/null)
+if [ -n "$KDEB_CHANGELOG_DIST" ]; then
+        distribution=$KDEB_CHANGELOG_DIST
+elif [ -n "$codename" ]; then
+        distribution=$codename
+else
+        distribution="unstable"
+        echo "builddeb: Using default distribution of 'unstable' in the changelog"
+        echo "builddeb: Install lsb-release or set \$KDEB_CHANGELOG_DIST to change this"
+fi
+
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux-upstream ($packageversion) unstable; urgency=low
+linux-upstream ($packageversion) $distribution; urgency=low
 
   * Custom built Linux kernel.
 
-- 
2.2.1

