Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:52941 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751177AbbABO6O (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 09:58:14 -0500
Received: by mail-wg0-f43.google.com with SMTP id k14so6410266wgh.30
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 06:58:13 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [3.19-rc2] builddeb: Update year and git repository URL in debian/copyright
Date: Fri,  2 Jan 2015 15:57:52 +0100
Message-Id: <1420210672-12712-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org

Happy new 2015!

I have combined two patches which I had already sent to linux-kbuild ML.

Today, I prefer "builddeb" as a label for such patches.

[1] http://marc.info/?l=linux-kbuild&m=133521955904706
[2] http://marc.info/?l=linux-kbuild&m=133521955004705

CC: Michal Marek <mmarek@suse.cz>
CC: Ben Hutchings <ben@decadent.org.uk>
CC: maximilian attems <max@stro.at>
CC: linux-kbuild@vger.kernel.org
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5972624..2c68c8b 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -233,10 +233,10 @@ This is a packacked upstream version of the Linux kernel.
 The sources may be found at most Linux ftp sites, including:
 ftp://ftp.kernel.org/pub/linux/kernel
 
-Copyright: 1991 - 2009 Linus Torvalds and others.
+Copyright: 1991 - 2015 Linus Torvalds and others.
 
 The git repository for mainline kernel development is at:
-git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
+git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
-- 
2.2.1

