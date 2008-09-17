Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43221 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752848AbYIQU6D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:03 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Fix Provides field
Date: Wed, 17 Sep 2008 22:09:50 +0200
Message-Id: <1221682195-26809-2-git-send-email-max@stro.at>
In-Reply-To: <1221682195-26809-1-git-send-email-max@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

kernel-image naming has been dropped for the Lenny release
and was only transitional for Etch.

as it builds modules it provides linux-modules-$version

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 9889a73..8c69b9e 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -99,7 +99,7 @@ Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -121,7 +121,7 @@ Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
-- 
1.5.6.5

