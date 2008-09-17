Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43225 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbYIQU6I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:08 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Fix generated packagename
Date: Wed, 17 Sep 2008 22:09:54 +0200
Message-Id: <1221682195-26809-6-git-send-email-max@stro.at>
In-Reply-To: <1221682195-26809-5-git-send-email-max@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at>
 <1221682195-26809-2-git-send-email-max@stro.at>
 <1221682195-26809-3-git-send-email-max@stro.at>
 <1221682195-26809-4-git-send-email-max@stro.at>
 <1221682195-26809-5-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

The binary package that make deb-pkg creates is a linux-image.
To be fixed may also be the addition of $DEB_ARCH.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ed33624..01964f4 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -15,7 +15,7 @@ set -e
 version=$KERNELRELEASE
 revision=`cat .version`
 tmpdir="$objtree/debian/tmp"
-packagename=linux-$version
+packagename=linux-image-$version
 
 if [ "$ARCH" == "um" ] ; then
 	packagename=user-mode-linux-$version
-- 
1.5.6.5

