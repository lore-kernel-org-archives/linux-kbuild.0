Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgD3LRU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 07:17:20 -0400
Date: Thu, 30 Apr 2020 13:17:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: bug: Kbuild seems to require "make prepare-objtool" in order to use
 (some) new config vars
Message-ID: <20200430131715.32c1a1f6@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

Hi Masahiro,

Not sure if this was already reported (or eventually fixed) upstream.

While doing a Kconfig reorg on media, I noticed a few weird things,
requiring me to call, on a few situations, "make modules_prepare"
manually after some changes.

I'm now working on a patchset to yet to be merged upstream aiming to
resurrect a driver from staging. It is currently on this tree
(with is based at the media development tree, on the top of 5.7-rc1):

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2

There, I was able to identify a misbehavior that it is probably
what forced me to need calling "make modules_prepare".

The atomisp driver is on a very bad shape. Among its problems, it has a 
set of header definitions that should be different for two different
variants of the supported devices. In order to be able to compile for
either one of the variants, I added a new config var:
CONFIG_VIDEO_ATOMISP_ISP2401.

The problem is that calling just

	./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401

or
	./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401

is not enough anymore for the build to actually use the new config value.

It just keeps silently using the old config value.

I double-checked it by adding this macro at the Makefile:

	$(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) ************)

The Makefile doesn't see the change, except if I explicitly call
"make modules_prepare" or "make prepare-objtool".

Even calling "make oldconfig" doesn't make it use the new CONFIG_*
value.

Thanks,
Mauro
