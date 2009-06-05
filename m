Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:45064 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755352AbZFEXlJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 19:41:09 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 13/39] kbuild, deb-pkg: fix Provides field
Date: Sat,  6 Jun 2009 01:42:31 +0200
Message-Id: <1244245377-17441-13-git-send-email-sam@ravnborg.org>
In-Reply-To: <20090605233720.GA13588@uranus.ravnborg.org>
References: <20090605233720.GA13588@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Frans Pop <elendil@planet.nl>, Andres Salomon <dilinger@debian.org>, Sam Ravnborg <sam@ravnborg.org>

From: maximilian attems <max@stro.at>

kernel-image naming has been dropped for the Lenny release
and was only transitional for Etch.

As it builds modules it provides linux-modules-$version.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/package/builddeb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1ade570..e1dd189 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -154,7 +154,7 @@ if [ "$ARCH" = "um" ]; then
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -171,7 +171,7 @@ else
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
-- 
1.6.3.rc3.40.g75b44

