Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud6.xs4all.net ([194.109.24.31]:46943 "EHLO
	lb3-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750833AbbDMUzD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 16:55:03 -0400
Message-ID: <1428958499.3868.31.camel@x220>
Subject: Re: difficulties with KCONFIG_ALLCONFIG miniconfigs
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 13 Apr 2015 22:54:59 +0200
In-Reply-To: <CAL3kL1vV-aYF+Hokm+nbivS689cTvO=JmUbpGeSKe19CdH=VPw@mail.gmail.com>
References: <CAL3kL1vV-aYF+Hokm+nbivS689cTvO=JmUbpGeSKe19CdH=VPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeff Weber <jwamsc@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, 2015-04-13 at 15:17 -0500, Jeff Weber wrote:
> $ cat ext4.cfg
> CONFIG_EXT4_FS=y
> 
> $ KCONFIG_ALLCONFIG=ext4.cfg  make allnoconfig
> 
> $ grep CONFIG_EXT4_FS .config || echo not found
> not found
> 
> Why was CONFIG_EXT4_FS not set?

A search of EXT4_FS in make menuconfig inspired me to add
    CONFIG_BLOCK=y

to ext4.cfg.

> Case 2: Attempt to disable SLUB_DEBUG using alldefconfig target.
> Search of Kconfigs shows no other configs select SLUB_DEBUG .
> 
> $ cat no-slub-debug.cfg
> CONFIG_SLUB_DEBUG=n
> 
> $ KCONFIG_ALLCONFIG=no-slub-debug.cfg make alldefconfig
> 
> $ grep SLUB_DEBUG .config
> CONFIG_SLUB_DEBUG=y
> # CONFIG_SLUB_DEBUG_ON is not set
> 
> Why was CONFIG_SLUB_DEBUG not disabled?

Seeing that the Kconfig entry for SLUB_DEBUG reads
    config SLUB_DEBUG
        default y
        bool "Enable SLUB debugging support" if EXPERT
        depends on SLUB && SYSFS
        help
          [...]

I guessed that this no-slub-debug.cfg might work:
    CONFIG_EXPERT=y
    # CONFIG_SLUB_DEBUG is not set

Please don't ask me to explain why.


Paul Bolle

