Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:52217 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932425Ab3GCOCU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Jul 2013 10:02:20 -0400
Received: by mail-wi0-f176.google.com with SMTP id ey16so5268742wid.15
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jul 2013 07:02:19 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v6 4/4] deb-pkg: add a hook argument to match debian hooks parameters
Date: Wed,  3 Jul 2013 16:02:06 +0200
Message-Id: <1372860126-8909-5-git-send-email-anisse@astier.eu>
In-Reply-To: <1372860126-8909-1-git-send-email-anisse@astier.eu>
References: <1372860126-8909-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>

We now provide the installed image path to the kernel hooks.

This should allow the package to better integrate with debian hooks, and
should not be too disruptive of hooks supporting only one parameter.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index aebc66e..de89923 100644
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

