Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30117 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbeLKNAO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 08:00:14 -0500
MIME-Version: 1.0
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com> <20181206150325.GA2726@infradead.org>
In-Reply-To: <20181206150325.GA2726@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 11 Dec 2018 21:59:26 +0900
Message-ID: <CAK7LNAS7hh4f8mYoZc7RUWStnchhftUN0nU5MJ_trjyNJx50Lw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory
 headers are missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Hi Christoph,


On Fri, Dec 7, 2018 at 12:04 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Dec 05, 2018 at 08:28:05PM +0900, Masahiro Yamada wrote:
> > Some time ago, Sam pointed out a certain degree of overwrap between
> > generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)
> >
> > I a bit tweaked the meaning of mandatory-y; now it defines the minimum
> > set of ASM headers that all architectures must have.
> >
> > If arch does not have specific implementation of a mandatory header,
> > Kbuild will let it fallback to the asm-generic one by automatically
> > generating a wrapper. This will allow to drop lots of redundant
> > generic-y defines.
> >
> > Previously, "mandatory" was used in the context of UAPI, but I guess
> > this can be extended to kernel space ASM headers.
>
> How useful is it to keep the generic-y behavior around at all vs making
> everything useful mandatory?


What I can tell is not all architectures
support kvm_para.h, ucontext.h

I guess they will stay as arch-specific generic-y,
but I am not an expert in this area.


kvm_para.h is missing csky, nds32, riscv.

ucontext.h is missing in alpha, arm, m68k, parisc, sparc, xtensa



bpf_perf_event.h could be promoted to mandatory-y ?
All architectures have it.


-- 
Best Regards
Masahiro Yamada
