Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:37639 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754311Ab2DXNLG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Apr 2012 09:11:06 -0400
From: ebiederm@xmission.com (Eric W. Biederman)
References: <m1aa22rllb.fsf@fess.ebiederm.org> <4F96705C.5030901@suse.cz>
Date: Tue, 24 Apr 2012 04:57:39 -0700
In-Reply-To: <4F96705C.5030901@suse.cz> (Michal Marek's message of "Tue, 24
	Apr 2012 11:20:28 +0200")
Message-ID: <m1aa21nxzg.fsf_-_@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [PATCH] kbuild: Add error handling to KCONFIG_ALL_CONFIG
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org


- Only try to read the file specified if KCONFIG_ALL_CONFIG is set to
  something other than the empty string.

- Don't use stat to check the name passed to conf_read_simple so that
  zconf_fopen can find the file in the current directory or in SRCTREE
  removing a extremely confusing failure mode, where KCONFIG_ALL_CONFIG
  was not interpreted with respect to the directory make was called in.

- If conf_read_simple fails complain clearly and stop processing.
  Allowing the simple discovery and debugging of command line typos.

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 scripts/kconfig/conf.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 28910ea..af6a2db 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -579,8 +579,13 @@ int main(int ac, char **av)
 	case alldefconfig:
 	case randconfig:
 		name = getenv("KCONFIG_ALLCONFIG");
-		if (name && !stat(name, &tmpstat)) {
-			conf_read_simple(name, S_DEF_USER);
+		if (name && name[0] != '\0') {
+			if (conf_read_simple(name, S_DEF_USER)) {
+				fprintf(stderr,
+					_("*** Can't read seed configuration \"%s\"!\n"),
+					name);
+				exit(1);
+			}
 			break;
 		}
 		switch (input_mode) {
-- 
1.7.2.5

