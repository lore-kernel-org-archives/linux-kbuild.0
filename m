Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:41327 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752190AbYLTOaM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Dec 2008 09:30:12 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 17/26] kbuild: remove TAR_IGNORE
Date: Sat, 20 Dec 2008 15:31:28 +0100
Message-Id: <1229783497-19550-17-git-send-email-sam@ravnborg.org>
In-Reply-To: <20081220142518.GA19390@uranus.ravnborg.org>
References: <20081220142518.GA19390@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Sam Ravnborg <sam@ravnborg.org>

From: Robert P. J. Day <rpjday@crashcourse.ca>

Given that there is no usage of a TAR_IGNORE variable remove it

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/package/Makefile |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index c162409..8c6b7b0 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -1,10 +1,6 @@
 # Makefile for the different targets used to generate full packages of a kernel
 # It uses the generic clean infrastructure of kbuild
 
-# Ignore the following files/directories during tar operation
-TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS
-
-
 # RPM target
 # ---------------------------------------------------------------------------
 # The rpm target generates two rpm files:
-- 
1.6.0.2.GIT

