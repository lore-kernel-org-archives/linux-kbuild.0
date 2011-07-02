Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35815 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800Ab1GBFKs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jul 2011 01:10:48 -0400
Received: by iwn6 with SMTP id 6so3288158iwn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2011 22:10:47 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 0/5] Random kconfig patches (second iteration)
Date: Sat,  2 Jul 2011 01:10:35 -0400
Message-Id: <1309583440-4795-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

You'll find hereafter a another serie of relatively trivial (I hope) patches
concerning kconfig. Some missing bits of the previous serie, scope reductions,
proper description of `conf' usage...

You may want to diretly merge it from my git repo on github if you find those
acceptable:

 git://github.com/lacombar/linux-2.6.git kconfig-trivial

Regards,
 - Arnaud

Arnaud Lacombe (5):
  kconfig: use calloc() for expr allocation
  kconfig/conf: reduce the scope of `defconfig_file'
  kconfig/conf: add command line options' description
  kconfig: remove pending prototypes for kconfig_load()
  kconfig/conf: mark xfgets() private

 scripts/kconfig/conf.c |   43 +++++++++++++++++++++++++++++++++++--------
 scripts/kconfig/expr.c |   12 ++++--------
 scripts/kconfig/lkc.h  |    6 ------
 3 files changed, 39 insertions(+), 22 deletions(-)

-- 
1.7.3.4.574.g608b.dirty

