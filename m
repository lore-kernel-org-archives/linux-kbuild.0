Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:53042 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932633AbeAHTX6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jan 2018 14:23:58 -0500
Date: Mon, 8 Jan 2018 22:23:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/1] tools: fix cross-compile var export
Message-ID: <20180108192343.ws5miawbslafclzw@mwanda>
References: <20171223210641.24588-1-martin@martingkelly.com>
 <20171223210641.24588-2-martin@martingkelly.com>
 <2512a330-1d30-d977-c635-233492da903a@martingkelly.com>
 <011d91f4-5410-eac4-ebbb-7777fbd6519a@martingkelly.com>
 <20180108113912.3eqyooxlpuqwr4zc@mwanda>
 <287b0a7d-1c4d-0faa-eafb-5d17d0d9063b@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <287b0a7d-1c4d-0faa-eafb-5d17d0d9063b@martingkelly.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Kelly <martin@martingkelly.com>
Cc: kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-kbuild@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Mon, Jan 08, 2018 at 09:24:42AM -0800, Martin Kelly wrote:
> On 01/08/2018 03:39 AM, Dan Carpenter wrote:
> > On Sat, Jan 06, 2018 at 12:17:40PM -0800, Martin Kelly wrote:
> > > On 12/23/2017 02:16 PM, Martin Kelly wrote:
> > > > On 12/23/2017 01:06 PM, Martin Kelly wrote:
> > > > > From: Martin Kelly <martin@martingkelly.com>
> > > > > 
> > > > > Currently in a number of Makefiles, we clobber the CC, LD, and/or
> > > > > STRIP env vars
> > > > > when cross-compiling, which breaks any additional flags that might
> > > > > be set (such
> > > > > as sysroot). This easily shows up by using, for instance, a Yocto SDK.
> > > > > 
> > > > > Fix this by more carefully overriding the flags in the way that the perf
> > > > > Makefile does.
> > > > > 
> > > > > This patch does not fix cross-compile for all the tools (some have
> > > > > other bugs),
> > > > > but it does appear to fix it for these:
> > > > > 
> > > > > - cgroup
> > > > > - freefall
> > > > > - gpio
> > > > > - hv
> > > > > - iio
> > > > > - leds
> > > > > - spi
> > > > > - vm
> > > > > - wmi
> > > > > 
> > > > > Signed-off-by: Martin Kelly <martin@martingkelly.com>
> > > > > ---
> > > > >    tools/cgroup/Makefile            |  1 -
> > > > >    tools/gpio/Makefile              |  2 --
> > > > >    tools/hv/Makefile                |  1 -
> > > > >    tools/iio/Makefile               |  2 --
> > > > >    tools/laptop/freefall/Makefile   |  1 -
> > > > >    tools/leds/Makefile              |  1 -
> > > > >    tools/perf/Makefile.perf         |  6 ------
> > > > >    tools/power/acpi/Makefile.config |  3 ---
> > > > >    tools/scripts/Makefile.include   | 18 ++++++++++++++++++
> > > > >    tools/spi/Makefile               |  2 --
> > > > >    tools/usb/Makefile               |  1 -
> > > > >    tools/vm/Makefile                |  1 -
> > > > >    tools/wmi/Makefile               |  1 -
> > > > >    13 files changed, 18 insertions(+), 22 deletions(-)
> > > > > 
> > 
> > Hi Martin,
> > 
> > This stuff needs to be broken up into one patch per directory and sent
> > to the individual maintainers.
> > 
> > Unfortunately, a lot of people haven't filled out MAINTAINERS properly
> > for their tools/ directory so get_maintainer.pl doesn't always select
> > the correct mailing list.  Keeping track of the tools/ director is
> > actually a good task for kernel-janitors btw.
> > 
> 
> Hi Dan,
> 
> I'm very confused at this point, as I am hearing different things from
> different people. This patch is a bit unique in that it spans multiple
> subsystems but is a single, logical bugfix (see
> https://marc.info/?l=linux-kernel&m=151534992512934&w=2 for details). This
> means that to follow the one-patch-per-logical change rule, I have to break
> the patch-for-subsystem-X-goes-to-maintainer-of-subsystem-X rule, and vice
> versa.
> 
> Given that this is a single logical change, Paul Gortmaker suggested that I
> CC each maintainer and try to get Andrew Morton to pick it up:
> 

That's actually a good idea.  Do it that way.

regards,
dan carpenter


