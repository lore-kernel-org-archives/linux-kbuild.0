Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:47682 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751702Ab3FNJrS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 05:47:18 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq4so112833wib.6
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2013 02:47:17 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v5 4/4] deb-pkg: add a hook argument to match debian hooks parameters
Date: Fri, 14 Jun 2013 11:46:57 +0200
Message-Id: <1371203217-19572-5-git-send-email-anisse@astier.eu>
In-Reply-To: <1371203217-19572-1-git-send-email-anisse@astier.eu>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>

We now provide the installed image path to the kernel hooks.

This should allow the package to better integrate with debian hooks, and
should not be too disruptive of hooks supporting only one parameter.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0dbada8..06cd0c7 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -184,7 +184,7 @@ set -e
 # Pass maintainer script parameters to hook scripts
 export DEB_MAINT_PARAMS="\$*"
 
-test -d $debhookdir/$script.d && run-parts --arg="$version" $debhookdir/$script.d
+test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
 exit 0
 EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
-- 
1.8.3.rc1

