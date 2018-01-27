Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34672 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752575AbeA0W2x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jan 2018 17:28:53 -0500
MIME-Version: 1.0
In-Reply-To: <20180125114740.076b7583@cakuba.netronome.com>
References: <20180122134607.00d77101@cakuba.netronome.com> <CAK7LNAT9_fB_NaZzT3fLsaoJhMmKeb3=m98w_=oLGN3Y9uSz=w@mail.gmail.com>
 <20180125114740.076b7583@cakuba.netronome.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jan 2018 07:28:04 +0900
Message-ID: <CAK7LNASkApBQS+AwJpQvQuCuAnfjHrfC3NCNc83Ntu=k8A0pWQ@mail.gmail.com>
Subject: Re: Mutli-directory module Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jakub Kicinski <kubakici@wp.pl>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

2018-01-26 4:47 GMT+09:00 Jakub Kicinski <kubakici@wp.pl>:
> On Thu, 25 Jan 2018 22:08:34 +0900, Masahiro Yamada wrote:
>> 2018-01-23 6:46 GMT+09:00 Jakub Kicinski <kubakici@wp.pl>:
>> > Hi!
>> >
>> > in drivers/net/ethernet/netronome/nfp there is a module which is built
>> > from C sources in 4 directories.  What is the best way to handle that?
>> >
>> > Currently we just add all the objects in one Makefile:
>> >
>> > nfp-objs := \
>> >             nfpcore/nfp6000_pcie.o \
>> >             nfpcore/nfp_cppcore.o \
>> > etc.
>>
>>
>> I recommend you to refactor the Makefile,
>> adding Makefiles into nfpcore, nic, flower, bpf sub-directories.
>>
>>
>> Also, ifeq is ugly,
>> can you rewrite like follows?
>>
>>
>> nfp-$(CONFIG_NFP_APP_FLOWER)    += flower/
>> nfp-$(CONFIG_BPF_SYSCALL)       += bpf/
>> nfp-$(CONFIG_NFP_DEBUG)         += nfp_net_debugfs.o
>
> I tried that, but what do I build inside the directories?  I tried
> adding the objects to nfp-objs, building a lib.a, or trying to build a
> separate object, but it's either ignored or dependency is not obeyed
> and nfp.o complains that the subdirectory object doesn't exist yet
> when the build of subdirectory finishes later :(
>
> Sorry for not spotting your response earlier!  It went into Spam for
> some reason :S
>

Sorry, I was misunderstanding.

The notation I suggested
is not supported for composite objects (like nfp-objs, nfp-y).

The only solution is to move all files to the same directory,
as Sam pointed out.




-- 
Best Regards
Masahiro Yamada
