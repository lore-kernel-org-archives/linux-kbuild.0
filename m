Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33555 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbcGLTmj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jul 2016 15:42:39 -0400
Received: by mail-lf0-f68.google.com with SMTP id f93so1995612lfi.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jul 2016 12:42:38 -0700 (PDT)
From: Marcin Mielniczuk <marmistrz.dev@gmail.com>
Subject: [PATCH] Fix the Debian packaging script on systems with no codename
Message-ID: <ce356ed3-4bee-6855-6906-a8bee29e7fde@gmail.com>
Date: Tue, 12 Jul 2016 21:42:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org

When calling `make deb-pkg` on a system with no codename (for example 
Arch Linux), lsb_release sometimes outputs `n/a` as the codename.

This breaks dpkg-parsechangelog, which can't process the changelog 
correctly.

Signed-off-by: Marcin Mielniczuk <marmistrz.dev@gmail.com>

---

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 86e56fe..87753f5 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -238,7 +238,8 @@ maintainer="$name <$email>"
  # Try to determine distribution
  if [ -n "$KDEB_CHANGELOG_DIST" ]; then
          distribution=$KDEB_CHANGELOG_DIST
-elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n 
"$distribution" ]; then
+# In some cases lsb_release returns the codename as n/a, which breaks 
dpkg-parsechangelog
+elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n 
"$distribution" ] && [ "$distribution" != "n/a" ]; then
          : # nothing to do in this case
  else
          distribution="unstable"


