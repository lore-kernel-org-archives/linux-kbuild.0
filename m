Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43235 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbeKOKyT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 05:54:19 -0500
Received: by mail-pf1-f194.google.com with SMTP id g7-v6so8767435pfo.10
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Nov 2018 16:48:43 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
Date: Wed, 14 Nov 2018 16:48:41 -0800 (PST)
Subject: Re: [PATCH 0/2] modpost: skip section mismatch warnings on ELF local
 symbols by default
In-Reply-To: <20181020140835.GA3351@ravnborg.org>
Message-ID: <alpine.DEB.2.21.9999.1811141647190.22938@viisi.sifive.com>
References: <20181020131911.22443-1-paul.walmsley@sifive.com> <20181020140835.GA3351@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Jim Wilson <jimw@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Hi Sam,

On Sat, 20 Oct 2018, Sam Ravnborg wrote:

> modpost is not supposed to be used outside the kernel build.
> And therefore if we introduce a new option then the infrastructure
> to enable that option should also be in place.
> In this particular case I cannot see why we should add the possibility
> to include local symbols, in other words do not add the option.
> Wait a few days before you kill it, maybe others see the usefulness of it.

I've dropped the optionality from the patch set.

> I checked if there were any options supported by modpost that
> was not configurable in makefile.modpost.
> And I could see that the -M and -K options in getopt() was leftovers.
> The code that used these option was was dropped in:
> a8773769d1a1e08d0ca15f890515401ab3860637 ("Kbuild: clear marker out of modpost")
>
> Could you add a patch that delete these on top of what you already have.

Done.  This patch is now in the v2 set which should appear shortly.

- Paul
