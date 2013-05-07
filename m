Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:48955 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757503Ab3EGPrs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 11:47:48 -0400
Received: by mail-wi0-f180.google.com with SMTP id h11so806432wiv.13
        for <linux-kbuild@vger.kernel.org>; Tue, 07 May 2013 08:47:46 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v4 4/4] deb-pkg: add a hook argument to match debian hooks parameters
Date: Tue,  7 May 2013 17:46:51 +0200
Message-Id: <1367941611-12223-5-git-send-email-anisse@astier.eu>
In-Reply-To: <1367941611-12223-1-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>, Ben Hutchings <bhutchings@solarflare.com>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com

We now provide the installed image path to the kernel hooks.

This should allow the package to better integrate with debian hooks, and
should not be too disruptive of hooks supporting only one parameter.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 73bb551..fa084c6 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -182,7 +182,7 @@ set -e
 # Pass maintainer script parameters to hook scripts
 export DEB_MAINT_PARAMS="\$*"
 
-test -d $debhookdir/$script.d && run-parts --arg="$version" $debhookdir/$script.d
+test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
 exit 0
 EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
-- 
1.8.3.rc1

