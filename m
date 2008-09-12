Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:40025 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753724AbYILT2j (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Sep 2008 15:28:39 -0400
From: Trent Piepho <tpiepho@freescale.com>
Subject: [PATCH v2] kbuild: tag with git revision when git describe is missing
Date: Fri, 12 Sep 2008 12:26:24 -0700
Message-Id: <1221247584-15039-1-git-send-email-tpiepho@freescale.com>
In-Reply-To: <Pine.LNX.4.64.0809121209250.3610@t2.domain.actdsltmp>
References: <Pine.LNX.4.64.0809121209250.3610@t2.domain.actdsltmp>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Trent Piepho <tpiepho@freescale.com>, Jan Engelhardt <jengelh@medozas.de>, Sam Ravnborg <sam@ravnborg.org>

setlocalversion used to use an abbreviated git commit sha1 to generate the
tag.  This was changed in commit d882421f4e08ddf0a94245cdbe516db260aa6f41
"kbuild: change CONFIG_LOCALVERSION_AUTO to use a git-describe-ish format"
to use git describe to come up with a tag.  Which is nice, but git describe
sometimes can't describe the revision.  Commit
56b2f0706d82535fd8d85503f2dcc0be40c8e55d addressed this, but there is still
no tag generated.

So, generate a plain abbreviated sha1 tag like setlocalversion used to when
git describe comes up short.

Signed-off-by: Trent Piepho <tpiepho@freescale.com>
CC: Jan Engelhardt <jengelh@medozas.de>
CC: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/setlocalversion |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 83b7512..0de5a99 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -9,11 +9,13 @@ usage() {
 cd "${1:-.}" || usage
 
 # Check for git and a git repo.
-if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 	# Do we have an untagged version?
 	if git name-rev --tags HEAD | grep -E '^HEAD[[:space:]]+(.*~[0-9]*|undefined)$' > /dev/null; then
 		if tag=`git describe 2>/dev/null`; then
 			echo $tag | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+		else
+			printf '%s%s' -g $head
 		fi
 	fi
 
-- 
1.5.4.1

