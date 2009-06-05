Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:36404 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755400AbZFEXlK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 19:41:10 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 12/39] kbuild, deb-pkg: fix generated package name
Date: Sat,  6 Jun 2009 01:42:30 +0200
Message-Id: <1244245377-17441-12-git-send-email-sam@ravnborg.org>
In-Reply-To: <20090605233720.GA13588@uranus.ravnborg.org>
References: <20090605233720.GA13588@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Frans Pop <elendil@planet.nl>, Andres Salomon <dilinger@debian.org>, Sam Ravnborg <sam@ravnborg.org>

From: maximilian attems <max@stro.at>

The binary package that make deb-pkg creates is a linux-image.
To be fixed may also be the addition of $DEB_ARCH.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/package/builddeb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6d3b7e5..1ade570 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -36,7 +36,7 @@ else
 fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
-packagename=linux-$version
+packagename=linux-image-$version
 fwpackagename=linux-firmware-image
 
 if [ "$ARCH" = "um" ] ; then
-- 
1.6.3.rc3.40.g75b44

