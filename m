Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:56421 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbeJTW0G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Oct 2018 18:26:06 -0400
Date: Sat, 20 Oct 2018 16:08:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/2] modpost: skip section mismatch warnings on ELF local
 symbols by default
Message-ID: <20181020140835.GA3351@ravnborg.org>
References: <20181020131911.22443-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181020131911.22443-1-paul.walmsley@sifive.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Jim Wilson <jimw@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Hi Paul.

> modpost: skip section mismatch warnings on ELF local symbols by default
> 
> modpost, by default, reports section mismatch warnings on ELF local
> symbols.  This caused false positive warnings to be reported for a
> local symbol name that would otherwise be elided by matching against a
> name pattern.  This was observed using a RISC-V toolchain that generates
> section anchors.
> 
> To avoid this noise in the common case, this patch series disables
> section mismatch warnings on ELF local symbols by default.
This part is fine.

> It also
> adds a modpost command line switch to re-enable these warnings, since
> I wasn't able to convince myself that section mismatch warnings on ELF
> local symbols were completely useless; just mostly useless :-)
modpost is not supposed to be used outside the kernel build.
And therefore if we introduce a new option then the infrastructure
to enable that option should also be in place.
In this particular case I cannot see why we should add the possibility
to include local symbols, in other words do not add the option.
Wait a few days before you kill it, maybe others see the usefulness of it.

I checked if there were any options supported by modpost that
was not configurable in makefile.modpost.
And I could see that the -M and -K options in getopt() was leftovers.
The code that used these option was was dropped in:
a8773769d1a1e08d0ca15f890515401ab3860637 ("Kbuild: clear marker out of modpost")

Could you add a patch that delete these on top of what you already have.

	Sam
