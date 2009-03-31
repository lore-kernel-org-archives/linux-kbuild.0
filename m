Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55722 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757213AbZCaPTE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:04 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 2/7] deb-pkg: Fix Provides field
Date: Tue, 31 Mar 2009 17:19:27 +0200
Message-Id: <1238512772-21180-2-git-send-email-max@stro.at>
In-Reply-To: <1238512772-21180-1-git-send-email-max@stro.at>
References: <1238512772-21180-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

kernel-image naming has been dropped for the Lenny release
and was only transitional for Etch.

as it builds modules it provides linux-modules-$version

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index dd61591..f5c8fa6 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -102,7 +102,7 @@ Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -124,7 +124,7 @@ Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
-- 
1.6.2.1

