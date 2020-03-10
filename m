Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41403 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgCJSwx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 14:52:53 -0400
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Tue, 10 Mar 2020 15:52:48 -0300
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
Message-ID: <20200310185248.GM15931@kernel.org>
References: <202002242114.CBED7F1@keescook>
 <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
 <202003031301.083CF048C2@keescook>
 <CAEf4BzbX-Eo3+DCG4zBMhJtLSZrtp48Z-8SvA8qy-WXA5kjR6A@mail.gmail.com>
 <202003031758.AE8FEB7@keescook>
 <CAEf4Bza31J_3Puwf7gnq0jDYRH2_JkRM9L+PO8dFrCzp+==8Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4Bza31J_3Puwf7gnq0jDYRH2_JkRM9L+PO8dFrCzp+==8Lg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Em Tue, Mar 03, 2020 at 08:29:39PM -0800, Andrii Nakryiko escreveu:
> On Tue, Mar 3, 2020 at 6:11 PM Kees Cook <keescook@chromium.org> wrote:
> > On Tue, Mar 03, 2020 at 01:50:52PM -0800, Andrii Nakryiko wrote:
> > > On Tue, Mar 3, 2020 at 1:06 PM Kees Cook <keescook@chromium.org> wrote:
> > > > On Mon, Mar 02, 2020 at 10:55:04PM -0800, Andrii Nakryiko wrote:
> > > > > On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
> > > > > >         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> > > > > >
> > > > > >         # dump .BTF section into raw binary file to link with final vmlinux

> > > > BTW, in looking at BTF generation, why is this cut up into three steps:
> > > > pahole, objcopy, objcopy... shouldn't pahole just gross an output method
> > > > to dump the final .o file? That would be MUCH nicer. Especially since
> > > > the first step ends up rewriting (?!) the original ELF. This is a lot of
> > > > needless IO...

> > > Just mostly historical reasons, that was the interface pahole already
> > > supported. I agree that it's a good idea to teach pahole to just emit
> > > a binary BTF section dump.

> > /me adds it to giant TODO list ;)

Mine is giant as well, but adding it anyway...

:-)

- Arnaldo
