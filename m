Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:51809 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751605AbeE3Ojz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 May 2018 10:39:55 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
In-Reply-To: <20180530121922.22122-1-npiggin@gmail.com>
References: <20180530121922.22122-1-npiggin@gmail.com>
Date: Thu, 31 May 2018 00:39:47 +1000
Message-ID: <87o9gxyzpo.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

Nicholas Piggin <npiggin@gmail.com> writes:

> This series of patches improves th powerpc kbuild system. The
> motivation was to to be compatible with the new Kconfig scripting
> language that Yamada-san has implemented here for merge:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=kconfig
>
> I have tested on top of that tree, powerpc now builds there.
>
> To avoid build breakage, the first 3 patches must go before the
> kconfig change, and the 4th patch must go after it.
>
> v5 changes:
> - Patch 4 update to syntax changed since kconfig-shell-v3 release.
> - Patch 4 suggestions from Masahiro Yamada, remove unnecessary "OK"
>   output from check mprofile script, and fold CC_USING_MPROFILE_KERNEL
>   into CONFIG_MPROFILE_KERNEL.
> - Reduce whitespace disturbance in patch 1.

I've put this series in a topic branch.

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kbuild


I'll plan to merge the first three into the powerpc tree.

Masahiro, are you planning to merge your kconfig changes for 4.18? If so
you could merge the whole branch and everything should merge nicely.

cheers
