Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f74.google.com ([74.125.83.74]:43022 "EHLO
	mail-ee0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755381Ab2AJXlQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jan 2012 18:41:16 -0500
Received: by eekd41 with SMTP id d41so4592eek.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2012 15:41:15 -0800 (PST)
Subject: [patch 3/4] merge_config.sh: whitespace cleanup
From: akpm@linux-foundation.org
Date: Tue, 10 Jan 2012 15:41:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20120110234113.C097C2000E4@hpza10.eem.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, dvhart@linux.intel.com, john.stultz@linaro.org

From: Darren Hart <dvhart@linux.intel.com>
Subject: merge_config.sh: whitespace cleanup

Fix whitespace usage in the clean_up routine.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: John Stultz <john.stultz@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/kconfig/merge_config.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/kconfig/merge_config.sh~merge_configsh-whitespace-cleanup scripts/kconfig/merge_config.sh
--- a/scripts/kconfig/merge_config.sh~merge_configsh-whitespace-cleanup
+++ a/scripts/kconfig/merge_config.sh
@@ -21,8 +21,8 @@
 #  See the GNU General Public License for more details.
 
 clean_up() {
-       rm -f $TMP_FILE
-       exit
+	rm -f $TMP_FILE
+	exit
 }
 trap clean_up HUP INT TERM
 
_
