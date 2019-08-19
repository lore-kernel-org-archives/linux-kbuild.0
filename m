Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19519 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfHSOx0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 10:53:26 -0400
MIME-Version: 1.0
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Aug 2019 23:52:44 +0900
Message-ID: <CAK7LNATkeM=w2rymdvaqBuVYfRb9=US+FzVqGS6Hr81h5RAbWA@mail.gmail.com>
Subject: Re: [PATCH 00/11] kbuild: clean-ups and improvement of single targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Alexei Starovoitov <ast@kernel.org>, Boris Pismenny <borisp@mellanox.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, Leon Romanovsky <leon@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Michal Marek <michal.lkml@markovi.net>, Saeed Mahameed <saeedm@mellanox.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org, Networking <netdev@vger.kernel.org>, oss-drivers@netronome.com

On Sun, Aug 11, 2019 at 12:55 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
>
> 01/11-09/11 are trivial clean-ups.
>
> 10/11 makes the single targets work more correctly.
>
> 11/11 cleans up Makefiles that have been added
> to work aroud the single target issues.
>
>
>
> Masahiro Yamada (11):
>   kbuild: move the Module.symvers check for external module build
>   kbuild: refactor part-of-module more
>   kbuild: fix modkern_aflags implementation
>   kbuild: remove 'make /' support
>   kbuild: remove meaningless 'targets' in ./Kbuild
>   kbuild: do not descend to ./Kbuild when cleaning
>   kbuild: unset variables in top Makefile instead of setting 0
>   kbuild: unify vmlinux-dirs and module-dirs rules
>   kbuild: unify clean-dirs rule for in-kernel and external module
>   kbuild: make single targets work more correctly
>   treewide: remove dummy Makefiles for single targets


Patch 01-09 applied.

10-11 have been superseded.



-- 
Best Regards
Masahiro Yamada
