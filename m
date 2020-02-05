Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f66.google.com ([209.85.166.66]:40654 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgBEQzv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 11:55:51 -0500
Received: by mail-io1-f66.google.com with SMTP id x1so2902933iop.7
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2020 08:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
In-Reply-To: <20200205160250.GG142103@google.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 5 Feb 2020 16:55:39 +0000
Message-ID: <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexei Starovoitov <ast@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Howells <dhowells@redhat.com>, Patrick Bellasi <patrick.bellasi@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kbuild@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 5, 2020 at 4:02 PM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Wed, Feb 05, 2020 at 03:46:29PM +0000, Greg Kroah-Hartman wrote:
> > Now that BPF does not need a copy of the kernel headers anymore in order
> > to build programs, there's no real need for putting the kernel headers
> > into a kernel module.  So drop the feature quick, before someone starts
> > using it :)
>
> Temporary Nack. Adding Alexei to the thread.
>
> I believe at the time of this going in, the BPF's BTF feature was not fully
> ready or able to support the usecases. Especially because BPF programs can
> call or use macros in kernel headers as well.
>
> Also, now BCC project does depend on this and so does bpftrace. Have both
> of these tools migrated to use BTF and don't need CONFIG_KHEADERS to be
> compiled? Sorry if I lost track.
>
> Just last week someone was using CONFIG_KHEADERS for BPF tracing purposes at
> Google and pinged me as well. There are several others. This would at least
> them some amount of pain.
>
> I'd suggest let us discuss more before ripping it out. thanks,


Greg, please use olof@lixom.net on the patch, I try to keep LKML out
of my non-upstream inbox. :-)


Alexei was part of the discussion, and from others in the same room it
sounded like there are no users of the upstream version of this
feature. Posting this patch is the obvious way to find out if that is
the case.

I.e. even if there was a version of bcc that required this, it sounds
like the BTF approach is significantly better and said users are
hopefully moving forward to it quickly, and if they can't move
forward, then they're likely also not going to move forward to newer
kernels either?


-Olof
