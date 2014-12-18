Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from exchange07.timesys.com ([209.114.137.116]:16000 "EHLO
	exchange07.timesys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059AbaLRSNx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Dec 2014 13:13:53 -0500
From: Andy Voltz <andy.voltz@timesys.com>
Subject: [PATCH 0/1]: Setting KCONFIG_CONFIG can break conf_write
Date: Thu, 18 Dec 2014 13:07:51 -0500
Message-ID: <1418926072-10014-1-git-send-email-andy.voltz@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I ran into an issue where if conf --olddefconfig is used to update
a config which is not on the same mounted volume, the conf_write
fails. The final rename of tmpconfig fails to move the file across
volumes.

For example, this fails (on my host /tmp is tmpfs):

$ touch /tmp/test.config
$ export KCONFIG_CONFIG=/tmp/test.config
$ ./scripts/kconfig/conf --olddefconfig Kconfig

This is only an issue when no name is passed to conf_write. When a
name is passed, there is code to determine the directory and write
tmpconfig there.

The following patch uses the same dirname code for the environment
variable, when no name is passed to conf_write.

Let me know what you think.

Thanks,
--
Andy Voltz

