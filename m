Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55736 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758160AbZCaPTE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:04 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 6/7] deb-pkg: Fix generated packagename
Date: Tue, 31 Mar 2009 17:19:31 +0200
Message-Id: <1238512772-21180-6-git-send-email-max@stro.at>
In-Reply-To: <1238512772-21180-5-git-send-email-max@stro.at>
References: <1238512772-21180-1-git-send-email-max@stro.at>
 <1238512772-21180-2-git-send-email-max@stro.at>
 <1238512772-21180-3-git-send-email-max@stro.at>
 <1238512772-21180-4-git-send-email-max@stro.at>
 <1238512772-21180-5-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

The binary package that make deb-pkg creates is a linux-image.
To be fixed may also be the addition of $DEB_ARCH.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c9ff47e..5be141a 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -16,7 +16,7 @@ version=$KERNELRELEASE
 revision=`cat .version`
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
-packagename=linux-$version
+packagename=linux-image-$version
 fwpackagename=linux-firmware-image
 
 if [ "$ARCH" == "um" ] ; then
-- 
1.6.2.1

