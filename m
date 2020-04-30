Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26111 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbgD3Nwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 09:52:44 -0400
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan>
In-Reply-To: <20200430131715.32c1a1f6@coco.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 Apr 2020 22:51:48 +0900
Message-ID: <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
Subject: Re: bug: Kbuild seems to require "make prepare-objtool" in order to
 use (some) new config vars
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

Hi Mauro,


On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Hi Masahiro,
>
> Not sure if this was already reported (or eventually fixed) upstream.
>
> While doing a Kconfig reorg on media, I noticed a few weird things,
> requiring me to call, on a few situations, "make modules_prepare"
> manually after some changes.
>
> I'm now working on a patchset to yet to be merged upstream aiming to
> resurrect a driver from staging. It is currently on this tree
> (with is based at the media development tree, on the top of 5.7-rc1):
>
>         https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
>
> There, I was able to identify a misbehavior that it is probably
> what forced me to need calling "make modules_prepare".
>
> The atomisp driver is on a very bad shape. Among its problems, it has a
> set of header definitions that should be different for two different
> variants of the supported devices. In order to be able to compile for
> either one of the variants, I added a new config var:
> CONFIG_VIDEO_ATOMISP_ISP2401.
>
> The problem is that calling just
>
>         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
>
> or
>         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401


scripts/config does not take the dependency into consideration
at all.

You need to enable/disable other options that it depends on.


./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOMISP
-d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
VIDEO_ATOMISP_ISP2401

allows me to enable VIDEO_ATOMISP_ISP2401.


It is painful to debug such complicated dependency graph, though.


>
> is not enough anymore for the build to actually use the new config value.
>
> It just keeps silently using the old config value.
>
> I double-checked it by adding this macro at the Makefile:
>
>         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) ************)
>
> The Makefile doesn't see the change, except if I explicitly call
> "make modules_prepare" or "make prepare-objtool".
>
> Even calling "make oldconfig" doesn't make it use the new CONFIG_*


I do not know.

I cannot look into it without detailed steps to reproduce it.



-- 
Best Regards
Masahiro Yamada
