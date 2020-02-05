Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42954 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgBEQmH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 11:42:07 -0500
Received: by mail-qt1-f196.google.com with SMTP id j5so2023859qtq.9
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2020 08:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
In-Reply-To: <20200205160250.GG142103@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 5 Feb 2020 08:41:55 -0800
Message-ID: <CAEXW_YTxcqdqTC_+-n_Zqvn1sfDX04Y=CVgqMvPc_27qUMw=HA@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexei Starovoitov <ast@kernel.org>
Cc: Olof Johansson <olof.johansson@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Howells <dhowells@redhat.com>, Patrick Bellasi <patrick.bellasi@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kbuild@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Feb 5, 2020 at 8:02 AM Joel Fernandes <joel@joelfernandes.org> wrote:
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

Sorry to call it CONFIG_KHEADERS, obviously I mean CONFIG_IKHEADERS.

thanks,

 - Joel
