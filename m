Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f74.google.com ([209.85.161.74]:34090 "EHLO
	mail-fx0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755381Ab2AJXlO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jan 2012 18:41:14 -0500
Received: by faar15 with SMTP id r15so7892faa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2012 15:41:12 -0800 (PST)
Subject: [patch 2/4] merge_config.sh: use signal names compatible with dash and bash
From: akpm@linux-foundation.org
Date: Tue, 10 Jan 2012 15:41:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20120110234111.2B8532000E4@hpza10.eem.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, dvhart@linux.intel.com, john.stultz@linaro.org

From: Darren Hart <dvhart@linux.intel.com>
Subject: merge_config.sh: use signal names compatible with dash and bash

The SIGHUP SIGINT and SIGTERM names caused failures when running
merge_config.sh with the dash shell.  Dropping the "SIG" component makes
the script work in both bash and dash.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: John Stultz <john.stultz@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/kconfig/merge_config.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/kconfig/merge_config.sh~merge_configsh-use-signal-names-compatible-with-dash-and-bash scripts/kconfig/merge_config.sh
--- a/scripts/kconfig/merge_config.sh~merge_configsh-use-signal-names-compatible-with-dash-and-bash
+++ a/scripts/kconfig/merge_config.sh
@@ -24,7 +24,7 @@ clean_up() {
        rm -f $TMP_FILE
        exit
 }
-trap clean_up SIGHUP SIGINT SIGTERM
+trap clean_up HUP INT TERM
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
_
