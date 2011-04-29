Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:51371 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S934024Ab1D2WjM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 18:39:12 -0400
Message-ID: <4DBB3DE4.8080207@verizon.net>
Date: Fri, 29 Apr 2011 18:38:28 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 4/7] kbuild: update scripts/.gitignore in preperation for
 moving docproc
Content-Type: multipart/mixed;
	boundary="------------080409070404070809020903"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

--------------080409070404070809020903
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This patch updates scripts/.gitignore in preperation for moving docproc.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/.gitignore b/scripts/.gitignore
index e2741d2..105b21f 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -8,3 +8,4 @@ bin2c
 unifdef
 ihex2fw
 recordmcount
+docproc
-- 
1.7.5.rc1



--------------080409070404070809020903
Content-Type: text/plain;
	name="kbuild-update-scripts-.gitignore-in-preperation-for-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-update-scripts-.gitignore-in-preperation-for-.patch"

From a4e4700107451f9d207be0edc5e768e24a8027ad Mon Sep 17 00:00:00 2001
From: Peter Foley <pefoley2@verizon.net>
Date: Tue, 26 Apr 2011 19:20:12 -0400
Subject: [PATCH 4/7] kbuild: update scripts/.gitignore in preperation for moving docproc


Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/.gitignore b/scripts/.gitignore
index e2741d2..105b21f 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -8,3 +8,4 @@ bin2c
 unifdef
 ihex2fw
 recordmcount
+docproc
-- 
1.7.5.rc1



--------------080409070404070809020903--
