Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:25892 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbdEJUyi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 16:54:38 -0400
Date: Wed, 10 May 2017 23:53:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: sparse on scripts/kconfig/*.c
Message-ID: <20170510205357.xshdaack6mwku5np@mwanda>
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
 <20170510101838.c5nwzaraeybyypwj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170510101838.c5nwzaraeybyypwj@mwanda>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, smatch@vger.kernel.org

I have created some new tools to make this process easier.

1) First you still have to edit the Makefile:

-HOSTCC       = gcc
+HOSTCC       = ~/progs/smatch/devel/cgcc

2) Build the data with this command:

	~/progs/smatch/devel/smatch_scripts/build_generic_data.sh --target scripts/

The --target scripts/ is because we want to run smatch on the scripts/
directory.

3) Run smatch:

	~/progs/smatch/devel/smatch_scripts/test_generic.sh --target scripts/

I just wrote this code today so it might be a bit rough perhaps.  Let me
know if you have any issues.  It doesn't find anything like I said
before, but hopefully this can help other people who want to run Smatch
on user space code.

regards,
dan carpenter


