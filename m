Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:51402 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S934047Ab1D2WjW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 18:39:22 -0400
Message-ID: <4DBB3DED.1060508@verizon.net>
Date: Fri, 29 Apr 2011 18:38:37 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 7/7] kbuild: move docproc from scripts/basic to scripts
Content-Type: multipart/mixed;
	boundary="------------060505030808060802080608"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

--------------060505030808060802080608
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This patch moves docproc from scripts/basic to scripts.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/{basic => }/docproc.c |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{basic => }/docproc.c (100%)

diff --git a/scripts/basic/docproc.c b/scripts/docproc.c
similarity index 100%
rename from scripts/basic/docproc.c
rename to scripts/docproc.c
-- 
1.7.5.rc1



--------------060505030808060802080608
Content-Type: text/plain;
	name="kbuild-move-docproc-from-scripts-basic-to-scripts.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-move-docproc-from-scripts-basic-to-scripts.patch"

From 0fa8bd8df499aa949f105408530fe06c96669d05 Mon Sep 17 00:00:00 2001
From: Peter Foley <pefoley2@verizon.net>
Date: Tue, 26 Apr 2011 19:25:31 -0400
Subject: [PATCH 7/7] kbuild: move docproc from scripts/basic to scripts


Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/{basic => }/docproc.c |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{basic => }/docproc.c (100%)

diff --git a/scripts/basic/docproc.c b/scripts/docproc.c
similarity index 100%
rename from scripts/basic/docproc.c
rename to scripts/docproc.c
-- 
1.7.5.rc1



--------------060505030808060802080608--
