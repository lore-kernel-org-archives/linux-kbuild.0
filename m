Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50522 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727101AbfJUOy6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Oct 2019 10:54:58 -0400
Date: Mon, 21 Oct 2019 16:55:13 +0200
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 3/3] firmware/dmi: Report DMI Embedded Firmware release
Message-ID: <20191021165513.24e24d53@endymion>
In-Reply-To: <20190918094323.17515-3-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
        <20190918094323.17515-3-e.velu@criteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Erwan Velu <e.velu@criteo.com>, Changbin Du <changbin.du@intel.com>, Boris Brezillon <bbrezillon@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 18 Sep 2019 11:43:21 +0200, Erwan Velu wrote:
> Servers that have a BMC encodes the release version of their firmware
> in the "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.
> 
> This information is useful to know which release of the BMC is actually running.
> It could be used for some quirks, debugging sessions or inventory tasks.
> 
> This patch extract these 2 fields in DMI_EMBEDDED_FW_MAJOR_RELEASE & DMI_EMBEDDED_FW_MINOR_RELEASE
> 
> A typical output for a Dell system running the 3.75 bios is :
> 
>     [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release_major
>     3
>     [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release_minor
>     75
>     [root@t1700 ~]#

Same comment here as for previous patch, obviously.

Additionally, please run scripts/checkpatch.pl on your patch before you
resubmit, and address all the problems reported.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
