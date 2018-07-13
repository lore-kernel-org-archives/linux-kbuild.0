Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34098 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731329AbeGMUOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jul 2018 16:14:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so7668172ljk.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jul 2018 12:58:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <33f65453-5b6d-0684-8a91-7e9940846143@redhat.com>
References: <20180713150701.GA3049@arm.com> <20180713153033.20540-1-olof@lixom.net>
 <33f65453-5b6d-0684-8a91-7e9940846143@redhat.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 13 Jul 2018 12:58:44 -0700
Message-ID: <CAOesGMj6m8q1aRz0k3qPTo2-Fur66nSsBaVNxcDnrrmWbUxe-Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: build with baremetal linker target instead of
 Linux when available
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Kocialkowski <contact@paulk.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>

On Fri, Jul 13, 2018 at 12:21 PM, Laura Abbott <labbott@redhat.com> wrote:
> On 07/13/2018 08:30 AM, Olof Johansson wrote:
>>
>> Not all toolchains have the baremetal elf targets, RedHat/Fedora ones
>> in particular. So, probe for whether it's available and use the previous
>> (linux) targets if it isn't.
>>
>
>
> For the Fedora toolchains:
>
> Tested-by: Laura Abbott <labbott@redhat.com>

Thanks!


-Olof
