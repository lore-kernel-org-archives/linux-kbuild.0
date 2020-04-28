Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:56986 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgD1FPB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 01:15:01 -0400
MIME-Version: 1.0
References: <20200423073929.127521-5-masahiroy@kernel.org> <202004280948.0higRDEI%lkp@intel.com>
In-Reply-To: <202004280948.0higRDEI%lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 28 Apr 2020 14:13:58 +0900
Message-ID: <CAK7LNATNC9ndOMjOUdFbSCpM=P5Tv-M=ZJ-QDN+zRGMU4TQMbA@mail.gmail.com>
Subject: Re: [PATCH 04/16] net: bpfilter: use 'userprogs' syntax to build bpfilter_umh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kbuild-all@lists.01.org, bpf <bpf@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>

On Tue, Apr 28, 2020 at 10:46 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on kbuild/for-next]
> [cannot apply to linus/master v5.7-rc3 next-20200424]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-support-userprogs-syntax/20200426-114001
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: i386 architecture of input file `net/bpfilter/main.o' is incompatible with i386:x86-64 output
> >> collect2: error: ld returned 1 exit status
>

Thanks.
-m32/-m64 is missing in the link time of the bpfilter_umh.
I will fix it soon.



-- 
Best Regards
Masahiro Yamada
