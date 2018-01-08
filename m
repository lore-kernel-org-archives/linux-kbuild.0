Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:43410 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753223AbeAHRYp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jan 2018 12:24:45 -0500
Received: by mail-pg0-f68.google.com with SMTP id f14so3393494pga.10
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jan 2018 09:24:45 -0800 (PST)
Subject: Re: [PATCH 1/1] tools: fix cross-compile var export
References: <20171223210641.24588-1-martin@martingkelly.com>
 <20171223210641.24588-2-martin@martingkelly.com>
 <2512a330-1d30-d977-c635-233492da903a@martingkelly.com>
 <011d91f4-5410-eac4-ebbb-7777fbd6519a@martingkelly.com>
 <20180108113912.3eqyooxlpuqwr4zc@mwanda>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <287b0a7d-1c4d-0faa-eafb-5d17d0d9063b@martingkelly.com>
Date: Mon, 8 Jan 2018 09:24:42 -0800
MIME-Version: 1.0
In-Reply-To: <20180108113912.3eqyooxlpuqwr4zc@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-kbuild@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On 01/08/2018 03:39 AM, Dan Carpenter wrote:
> On Sat, Jan 06, 2018 at 12:17:40PM -0800, Martin Kelly wrote:
>> On 12/23/2017 02:16 PM, Martin Kelly wrote:
>>> On 12/23/2017 01:06 PM, Martin Kelly wrote:
>>>> From: Martin Kelly <martin@martingkelly.com>
>>>>
>>>> Currently in a number of Makefiles, we clobber the CC, LD, and/or
>>>> STRIP env vars
>>>> when cross-compiling, which breaks any additional flags that might
>>>> be set (such
>>>> as sysroot). This easily shows up by using, for instance, a Yocto SDK.
>>>>
>>>> Fix this by more carefully overriding the flags in the way that the perf
>>>> Makefile does.
>>>>
>>>> This patch does not fix cross-compile for all the tools (some have
>>>> other bugs),
>>>> but it does appear to fix it for these:
>>>>
>>>> - cgroup
>>>> - freefall
>>>> - gpio
>>>> - hv
>>>> - iio
>>>> - leds
>>>> - spi
>>>> - vm
>>>> - wmi
>>>>
>>>> Signed-off-by: Martin Kelly <martin@martingkelly.com>
>>>> ---
>>>>    tools/cgroup/Makefile            |  1 -
>>>>    tools/gpio/Makefile              |  2 --
>>>>    tools/hv/Makefile                |  1 -
>>>>    tools/iio/Makefile               |  2 --
>>>>    tools/laptop/freefall/Makefile   |  1 -
>>>>    tools/leds/Makefile              |  1 -
>>>>    tools/perf/Makefile.perf         |  6 ------
>>>>    tools/power/acpi/Makefile.config |  3 ---
>>>>    tools/scripts/Makefile.include   | 18 ++++++++++++++++++
>>>>    tools/spi/Makefile               |  2 --
>>>>    tools/usb/Makefile               |  1 -
>>>>    tools/vm/Makefile                |  1 -
>>>>    tools/wmi/Makefile               |  1 -
>>>>    13 files changed, 18 insertions(+), 22 deletions(-)
>>>>
> 
> Hi Martin,
> 
> This stuff needs to be broken up into one patch per directory and sent
> to the individual maintainers.
> 
> Unfortunately, a lot of people haven't filled out MAINTAINERS properly
> for their tools/ directory so get_maintainer.pl doesn't always select
> the correct mailing list.  Keeping track of the tools/ director is
> actually a good task for kernel-janitors btw.
> 

Hi Dan,

I'm very confused at this point, as I am hearing different things from 
different people. This patch is a bit unique in that it spans multiple 
subsystems but is a single, logical bugfix (see 
https://marc.info/?l=linux-kernel&m=151534992512934&w=2 for details). 
This means that to follow the one-patch-per-logical change rule, I have 
to break the patch-for-subsystem-X-goes-to-maintainer-of-subsystem-X 
rule, and vice versa.

Given that this is a single logical change, Paul Gortmaker suggested 
that I CC each maintainer and try to get Andrew Morton to pick it up:

https://marc.info/?l=linux-embedded&m=151535195113321&w=2

I did this and got an Acked-by from Mark Brown, the SPI maintainer:

https://www.spinics.net/lists/kernel/msg2691424.html

It seems like we have conflicting patch rules here.
