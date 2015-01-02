Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:54692 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbbABVRA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 16:17:00 -0500
Received: by mail-wi0-f174.google.com with SMTP id h11so162459wiw.13
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 13:16:59 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [RFC v3] builddeb: Try to determine distribution
Date: Fri,  2 Jan 2015 22:16:45 +0100
Message-Id: <1420233405-23121-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Thorsten Glaser <tg@debian.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Like in my initial patch [1] lsb_release is a good choice to
determine the distribution name for debian/changelog.
Its installation is no precondition.

Ben gave some helpful and detailed information in [2].
There he also suggested to have an option to explicitly set the
distribution name (see $KDEB_CHANGELOG_DIST variable).

I have hardcoded the script-name into the outputs when we fallback
to the default distribution name. This is a bit ugly.

Based on the snippet of Ben (see [2]). 
Tested against Linux v3.19-rc2.

Thanks goes to Thorsten and Alexander for the vital help in 2012.
Equally thanks to maximilian and Ben for the comments on my patches.

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
v3: Massaged the commit-message
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

