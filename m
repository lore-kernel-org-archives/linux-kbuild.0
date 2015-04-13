Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:32948 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754721AbbDMUR3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 16:17:29 -0400
Received: by wiax7 with SMTP id x7so73296411wia.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2015 13:17:28 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 13 Apr 2015 15:17:28 -0500
Message-ID: <CAL3kL1vV-aYF+Hokm+nbivS689cTvO=JmUbpGeSKe19CdH=VPw@mail.gmail.com>
Subject: difficulties with KCONFIG_ALLCONFIG miniconfigs
From: Jeff Weber <jwamsc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I am unable to pass required kernel config items via KCONFIG_ALLCONFIG
to kbuild.
I originally encountered issues with the
scripts/kconfig/merge_config.sh tool, but I've
isolated some of my issues to the examples below.  Kernel = 3.18.11 .
Help appreciated.

Case 1: Attempt to enable EXT4_FS using allnoconfig target.
Per ./fs/ext4/Kconfig, config EXT4_FS has no other dependencies.

$ cat ext4.cfg
CONFIG_EXT4_FS=y

$ KCONFIG_ALLCONFIG=ext4.cfg  make allnoconfig

$ grep CONFIG_EXT4_FS .config || echo not found
not found

Why was CONFIG_EXT4_FS not set?


Case 2: Attempt to disable SLUB_DEBUG using alldefconfig target.
Search of Kconfigs shows no other configs select SLUB_DEBUG .

$ cat no-slub-debug.cfg
CONFIG_SLUB_DEBUG=n

$ KCONFIG_ALLCONFIG=no-slub-debug.cfg make alldefconfig

$ grep SLUB_DEBUG .config
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set

Why was CONFIG_SLUB_DEBUG not disabled?

TIA,
Jeff
