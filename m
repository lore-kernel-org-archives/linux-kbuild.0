Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:51400 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1762693AbZD2WhR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Apr 2009 18:37:17 -0400
Received: from ::ffff:71.182.83.218 ([71.182.83.218]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2009 15:37:12 -0700
Message-ID: <49F8D6EC.1090800@xenotime.net>
Date: Wed, 29 Apr 2009 15:38:36 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: error when using KCONFIG_ALLCONFIG?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, samr <sam@ravnborg.org>

Hi,

I often use
make KCONFIG_ALLCONFIG=filename allnoconfig

and it works fine.  However, when I use O= with that:

make O=xx64 KCONFIG_ALLCONFIG=filename allnoconfig

I get an xx64/.config file that is the same as

make O=xx64 allnoconfig

I.e., the KCONFIG_ALLCONFIG=filename part was ignored.

Is this new?  expected?  known?

Not what I expected...

Thanks,
~Randy
