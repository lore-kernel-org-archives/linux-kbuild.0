Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:32812 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751988AbbH0NOA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Aug 2015 09:14:00 -0400
From: Felipe Contreras <felipe.contreras@gmail.com>
Subject: [RFC/PATCH 0/2] A simpler way to maintain custom defconfigs
Date: Thu, 27 Aug 2015 08:08:43 -0500
Message-Id: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Linus Torvalds <torvalds@linux-foundation.org>, Felipe Contreras <felipe.contreras@gmail.com>

Hi,

For several years I've used a trick to be able to maintain a simple defconfig
that works across many versions, and requires little maintenance from my
part:

% cat arch/x86/configs/x86_64_defconfig ~/my-config > .config && make olddefconfig

I'm sending a proposal to integrate it on the build system so that many people
can do the same in a simple manner.

The interesting part is how to generate this simplified defconfig. In a
nutshell; you want to take your .config, remove everything that is the default
in the Kconfig files (what savedefconfig does), but also removes anything that
is in the default defconfig (e.g. x86_64_defconfig)

I've been doing this by hand, but today I gave it a shot to automate this. The
result is a bit crude, but it works.

Thoughts?

Felipe Contreras (2):
  kconfig: add KBUILD_USERCONFIG option
  kconfig: add KCONFIG_BASECONFIG option to savedefconfig

 scripts/kconfig/Makefile    |  6 +++
 scripts/kconfig/conf.c      |  3 ++
 scripts/kconfig/confdata.c  | 89 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/lkc_proto.h |  1 +
 4 files changed, 99 insertions(+)

-- 
2.5.0

