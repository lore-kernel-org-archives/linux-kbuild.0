Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55742 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758207AbZCaPTE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:04 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 3/7] deb-pkg: bump standards version
Date: Tue, 31 Mar 2009 17:19:28 +0200
Message-Id: <1238512772-21180-3-git-send-email-max@stro.at>
In-Reply-To: <1238512772-21180-2-git-send-email-max@stro.at>
References: <1238512772-21180-1-git-send-email-max@stro.at>
 <1238512772-21180-2-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>

Latest Debian policy is 3.8.1.
Even if we are not yet compliant to it strive for the latest.

Acked-by: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f5c8fa6..35f972b 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -99,7 +99,7 @@ Source: linux
 Section: base
 Priority: optional
 Maintainer: $maintainer
-Standards-Version: 3.6.1
+Standards-Version: 3.8.1
 
 Package: $packagename
 Provides: linux-image, linux-image-2.6, linux-modules-$version
@@ -121,7 +121,7 @@ Source: linux
 Section: base
 Priority: optional
 Maintainer: $maintainer
-Standards-Version: 3.6.1
+Standards-Version: 3.8.1
 
 Package: $packagename
 Provides: linux-image, linux-image-2.6, linux-modules-$version
-- 
1.6.2.1

