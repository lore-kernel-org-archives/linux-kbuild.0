Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43220 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752489AbYIQU6B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:01 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: bump standards version
Date: Wed, 17 Sep 2008 22:09:51 +0200
Message-Id: <1221682195-26809-3-git-send-email-max@stro.at>
In-Reply-To: <1221682195-26809-2-git-send-email-max@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at>
 <1221682195-26809-2-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

Latest Debian policy is 3.8.0.
Even if we are not yet compliant to it strive for the latest.

Acked-by: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8c69b9e..19d933e 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -96,7 +96,7 @@ Source: linux
 Section: base
 Priority: optional
 Maintainer: $maintainer
-Standards-Version: 3.6.1
+Standards-Version: 3.8.0
 
 Package: $packagename
 Provides: linux-image, linux-image-2.6, linux-modules-$version
@@ -118,7 +118,7 @@ Source: linux
 Section: base
 Priority: optional
 Maintainer: $maintainer
-Standards-Version: 3.6.1
+Standards-Version: 3.8.0
 
 Package: $packagename
 Provides: linux-image, linux-image-2.6, linux-modules-$version
-- 
1.5.6.5

