Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55750 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759477AbZCaPTJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:09 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 4/7] deb-pkg: Fix Section and Source field
Date: Tue, 31 Mar 2009 17:19:29 +0200
Message-Id: <1238512772-21180-4-git-send-email-max@stro.at>
In-Reply-To: <1238512772-21180-3-git-send-email-max@stro.at>
References: <1238512772-21180-1-git-send-email-max@stro.at>
 <1238512772-21180-2-git-send-email-max@stro.at>
 <1238512772-21180-3-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Base section has been removed, the base is defined by Priority field.
Source is linux-2.6.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 35f972b..9d21ec5 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -84,7 +84,7 @@ fi
 maintainer="${name} <${email}>"
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux ($version-$revision) unstable; urgency=low
+linux-2.6 ($version-$revision) unstable; urgency=low
 
   * New upstream release
 
@@ -95,8 +95,8 @@ EOF
 if [ "$ARCH" == "um" ]; then
 
 cat <<EOF > debian/control
-Source: linux
-Section: base
+Source: linux-2.6
+Section: admin
 Priority: optional
 Maintainer: $maintainer
 Standards-Version: 3.8.1
@@ -117,8 +117,8 @@ EOF
 
 else
 cat <<EOF > debian/control
-Source: linux
-Section: base
+Source: linux-2.6
+Section: admin
 Priority: optional
 Maintainer: $maintainer
 Standards-Version: 3.8.1
-- 
1.6.2.1

