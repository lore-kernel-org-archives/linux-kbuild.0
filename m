Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.189]:18588 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758372AbZJONcW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2009 09:32:22 -0400
Received: by gv-out-0910.google.com with SMTP id r4so88608gve.37
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2009 06:30:35 -0700 (PDT)
Date: Thu, 15 Oct 2009 08:39:13 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH v2 2/2] scripts/package: use fakeroot if available
Message-ID: <20091015133913.GC6718@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
 <20091015133139.GA6718@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091015133139.GA6718@progeny.tock>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Unless already running as root, use fakeroot to ensure the files in
the generated binary packages are owned by root.  Without this change,
you have to set KBUILD_PKG_ROOTCMD or become root yourself to run
"make foo-pkg".

With this patch applied, you can run "make oldconfig rpm-pkg" as an
ordinary user to build a binary package for an updated kernel tree and
it should just work.

fakeroot is a bit too zealous by default in pretending files are owned
by root.  Unless directed otherwise, its wrapped stat() and lstat()
set st_uid and st_gid to 0 for all files.  This slows down the Linux
build with CONFIG_LOCALVERSION_AUTO a lot, since git notices that the
owners have changed and has to reread the entire kernel tree to learn
that the content has not changed.  Since "make modules_install" and
"scripts/package/foo" run within the same fakeroot session, we are
free to avoid this by telling fakeroot to use the actual owner and
group for preexisting files, by passing it the -u option.

Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
Changes from v1:
 - rename ROOTCMD variable to KBUILD_PKG_ROOTCMD

 scripts/package/Makefile |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 6997f38..2aa7e8c 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -1,6 +1,15 @@
 # Makefile for the different targets used to generate full packages of a kernel
 # It uses the generic clean infrastructure of kbuild
 
+# How to acquire (fake) root privileges
+ifndef KBUILD_PKG_ROOTCMD
+ifneq ($(shell id -u),0)
+ifeq ($(shell which fakeroot >/dev/null 2>&1 && echo found),found)
+KBUILD_PKG_ROOTCMD := fakeroot -u
+endif
+endif
+endif
+
 # RPM target
 # ---------------------------------------------------------------------------
 # The rpm target generates two rpm files:
-- 
1.6.5.rc1.199.g596ec

