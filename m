Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f74.google.com ([74.125.83.74]:43022 "EHLO
	mail-ee0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755381Ab2AJXlS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jan 2012 18:41:18 -0500
Received: by mail-ee0-f74.google.com with SMTP id d41so4592eek.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2012 15:41:17 -0800 (PST)
Subject: [patch 4/4] merge_config.sh: fix bug in final check
From: akpm@linux-foundation.org
Date: Tue, 10 Jan 2012 15:41:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20120110234116.7845A5C00F9@hpza9.eem.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, john.stultz@linaro.org, dvhart@linux.intel.com, lacombar@gmail.com

From: John Stultz <john.stultz@linaro.org>
Subject: merge_config.sh: fix bug in final check

Arnaud Lacombe pointed out the final checking that the requested configs
were included in the final .config was broken.

The example was that if you had a fragment that disabled
CONFIG_DECOMPRESS_GZIP applied to a normal defconfig, there would be no
final warning that CONFIG_DECOMPRESS_GZIP was acutally set in the final
.config.

This bug was introduced by me in v3 of the original patch, and the
following patch reverts the invalid change.

Signed-off-by: John Stultz <john.stultz@linaro.org>
Reported-by: Arnaud Lacombe <lacombar@gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/kconfig/merge_config.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/kconfig/merge_config.sh~merge_configsh-fix-bug-in-final-check scripts/kconfig/merge_config.sh
--- a/scripts/kconfig/merge_config.sh~merge_configsh-fix-bug-in-final-check
+++ a/scripts/kconfig/merge_config.sh
@@ -104,8 +104,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $ALLTAR
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 
-	REQUESTED_VAL=$(sed -n "$SED_CONFIG_EXP" $TMP_FILE | grep -w -e "$CFG")
-	ACTUAL_VAL=$(sed -n "$SED_CONFIG_EXP" .config | grep -w -e "$CFG")
+	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
+	ACTUAL_VAL=$(grep -w -e "$CFG" .config)
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"
_
