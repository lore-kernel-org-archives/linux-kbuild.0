Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50592 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726189AbeIEU01 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 16:26:27 -0400
Subject: [PATCH 09/11] UAPI: ndctl: Fix g++-unsupported initialisation in
 headers
From: David Howells <dhowells@redhat.com>
Date: Wed, 05 Sep 2018 16:55:37 +0100
Message-ID: <153616293757.23468.13765050528392604035.stgit@warthog.procyon.org.uk>
In-Reply-To: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

The following code in the linux/ndctl header file:

	static inline const char *nvdimm_bus_cmd_name(unsigned cmd)
	{
		static const char * const names[] = {
			[ND_CMD_ARS_CAP] = "ars_cap",
			[ND_CMD_ARS_START] = "ars_start",
			[ND_CMD_ARS_STATUS] = "ars_status",
			[ND_CMD_CLEAR_ERROR] = "clear_error",
			[ND_CMD_CALL] = "cmd_call",
		};

		if (cmd < ARRAY_SIZE(names) && names[cmd])
			return names[cmd];
		return "unknown";
	}

is broken in a number of ways:

 (1) ARRAY_SIZE() is not generally defined.  Fix this by defining a label
     in the enum that indicates the number of commands.

 (2) g++ does not support "non-trivial" array initialisers fully yet.  Fix
     this by defining the missing intermediate values.

 (3) Every file that calls this function will acquire a copy of names[].

The same goes for nvdimm_cmd_name().

A better way would be to remove these functions and their arrays from the
header entirely.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Dan Williams <dan.j.williams@intel.com>
cc: linux-nvdimm@lists.01.org
---

 include/uapi/linux/ndctl.h |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
index 7e27070b9440..9c89159f6a0f 100644
--- a/include/uapi/linux/ndctl.h
+++ b/include/uapi/linux/ndctl.h
@@ -117,6 +117,7 @@ enum {
 	ND_CMD_VENDOR_EFFECT_LOG = 8,
 	ND_CMD_VENDOR = 9,
 	ND_CMD_CALL = 10,
+	nr__ND_CMD = 11
 };
 
 enum {
@@ -128,22 +129,29 @@ enum {
 
 static inline const char *nvdimm_bus_cmd_name(unsigned cmd)
 {
-	static const char * const names[] = {
+	static const char * const names[nr__ND_CMD] = {
+		[0] = NULL,
 		[ND_CMD_ARS_CAP] = "ars_cap",
 		[ND_CMD_ARS_START] = "ars_start",
 		[ND_CMD_ARS_STATUS] = "ars_status",
 		[ND_CMD_CLEAR_ERROR] = "clear_error",
+		[5] = NULL,
+		[6] = NULL,
+		[7] = NULL,
+		[8] = NULL,
+		[9] = NULL,
 		[ND_CMD_CALL] = "cmd_call",
 	};
 
-	if (cmd < ARRAY_SIZE(names) && names[cmd])
+	if (cmd < nr__ND_CMD && names[cmd])
 		return names[cmd];
 	return "unknown";
 }
 
 static inline const char *nvdimm_cmd_name(unsigned cmd)
 {
-	static const char * const names[] = {
+	static const char * const names[nr__ND_CMD] = {
+		[0] = NULL,
 		[ND_CMD_SMART] = "smart",
 		[ND_CMD_SMART_THRESHOLD] = "smart_thresh",
 		[ND_CMD_DIMM_FLAGS] = "flags",
@@ -156,7 +164,7 @@ static inline const char *nvdimm_cmd_name(unsigned cmd)
 		[ND_CMD_CALL] = "cmd_call",
 	};
 
-	if (cmd < ARRAY_SIZE(names) && names[cmd])
+	if (cmd < nr__ND_CMD && names[cmd])
 		return names[cmd];
 	return "unknown";
 }
