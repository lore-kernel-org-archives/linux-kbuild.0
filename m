Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:34033 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751005Ab2KJC1C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Nov 2012 21:27:02 -0500
Date: Sat, 10 Nov 2012 10:26:59 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [digsig:dmi 20/39] WARNING: security/built-in.o(.text+0xb43ac):
 Section mismatch in reference from the function integrity_init_keyring() to
 the variable .init.data:chosen_lsm
Message-ID: <20121110022659.GC6486@localhost>
References: <509d3c29.gB8n+wTWMkx5wadt%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509d3c29.gB8n+wTWMkx5wadt%fengguang.wu@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@intel.com>, Chris Zankel <chris@zankel.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Mimi, Dmitry,

Sorry please ignore this and the following Section mismatch warnings,
they are likely false ones:

        On 11/07/2012 03:31 PM, Chris Zankel wrote:
        >
        > Looking a bit into it, I think modpost is broken. I'm working on a fix.

        This is specific to Xtensa. Symbols are stored in a separate '.lit'
        section, but modpost doesn't seem to currently resolve it correctly.

Chris: it also happens to ARCH=sh builds.

Thanks,
Fengguang

On Sat, Nov 10, 2012 at 01:23:53AM +0800, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kasatkin/linux-digsig.git dmi
> head:   62d02cdf591eea161bc78c2430ba08b6d138eae5
> commit: 3868ad2d648d8abd7a645d101ff53e5b369c632b [20/39] integrity: create and inititialize a keyring with builtin public key
> config: make ARCH=sh allyesconfig
> 
> All warnings:
> 
> WARNING: security/built-in.o(.text+0xb43ac): Section mismatch in reference from the function integrity_init_keyring() to the variable .init.data:chosen_lsm
> The function integrity_init_keyring() references
> the variable __initdata chosen_lsm.
> This is often because integrity_init_keyring lacks a __initdata
> annotation or the annotation of chosen_lsm is wrong.
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
