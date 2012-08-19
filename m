Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48688 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753986Ab2HSC5p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:45 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 57/74] lto, workaround: Add workaround for LTO build problem in pvrusb2-audio
Date: Sat, 18 Aug 2012 19:56:53 -0700
Message-Id: <1345345030-22211-58-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Making this visible fixes some missing symbols with gcc 4.7 LTO.
This is a workaround for a compiler problem.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 drivers/media/video/pvrusb2/pvrusb2-audio.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/video/pvrusb2/pvrusb2-audio.c b/drivers/media/video/pvrusb2/pvrusb2-audio.c
index cc06d5e..aaa6420 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-audio.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-audio.c
@@ -32,7 +32,7 @@ struct routing_scheme {
 	unsigned int cnt;
 };
 
-static const int routing_scheme0[] = {
+__visible const int pvrusb2_routing_scheme0[] = {
 	[PVR2_CVAL_INPUT_TV]        = MSP_INPUT_DEFAULT,
 	[PVR2_CVAL_INPUT_RADIO]     = MSP_INPUT(MSP_IN_SCART2,
 						MSP_IN_TUNER1,
@@ -49,8 +49,8 @@ static const int routing_scheme0[] = {
 };
 
 static const struct routing_scheme routing_def0 = {
-	.def = routing_scheme0,
-	.cnt = ARRAY_SIZE(routing_scheme0),
+	.def = pvrusb2_routing_scheme0,
+	.cnt = ARRAY_SIZE(pvrusb2_routing_scheme0),
 };
 
 static const struct routing_scheme *routing_schemes[] = {
-- 
1.7.7.6

