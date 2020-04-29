Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:38533 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD2Cj0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 22:39:26 -0400
MIME-Version: 1.0
References: <20200423073929.127521-1-masahiroy@kernel.org> <20200425115303.GA10048@ravnborg.org>
In-Reply-To: <20200425115303.GA10048@ravnborg.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 Apr 2020 11:38:22 +0900
Message-ID: <CAK7LNARRxS6nnbBAa495Bh4nCdDAixinpMG1Tn6SV_w38uOzdg@mail.gmail.com>
Subject: Re: [PATCH 00/16] kbuild: support 'userprogs' syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Christian Brauner <christian@brauner.io>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Jonathan Corbet <corbet@lwn.net>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Michal Marek <michal.lkml@markovi.net>, Song Liu <songliubraving@fb.com>, Tomas Winkler <tomas.winkler@intel.com>, Yonghong Song <yhs@fb.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>

Hi Sam,

On Sat, Apr 25, 2020 at 8:53 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro
>
> On Thu, Apr 23, 2020 at 04:39:13PM +0900, Masahiro Yamada wrote:
> >
> > Several Makefiles use 'hostprogs' for building the code for
> > the host architecture is not appropriate.
> >
> > This is just because Kbuild does not provide the syntax to do it.
> >
> > This series introduce 'userprogs' syntax and use it from
> > sample and bpf Makefiles.
> >
> > Sam worked on this in 2014.
> > https://lkml.org/lkml/2014/7/13/154
>
> I wonder how you managed to dig that up, but thanks for the reference.


I just remembered your work back in 2014.

I did not remember the patch title exactly,
but I searched for 'From: Sam Ravnborg' and
'To: linux-kbuild@vger.kernel.org' in my mail box.




-- 
Best Regards
Masahiro Yamada
