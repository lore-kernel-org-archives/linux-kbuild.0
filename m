Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35501 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754879AbdCaUjO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2017 16:39:14 -0400
MIME-Version: 1.0
In-Reply-To: <CAFzeTN3-=a6n-PEKP5ssCUszYYPu5R5_6uf9DEdptPKEuWOsrQ@mail.gmail.com>
References: <20170314213410.3762842-1-arnd@arndb.de> <20170314213724.3836900-1-arnd@arndb.de>
 <CAK7LNARWnDW5GqF_nAy=etwSLfL5XZ4zWB_UEkBdd5M88iS1UA@mail.gmail.com>
 <CAK8P3a101M6u2hjkEh47t5ZWfpGk80uHuFYFgfJi+vCLmvzaQg@mail.gmail.com>
 <CAK7LNASJU0rQ2oiGnoi7knNvqLGvT8FryJJ4-ap+7isHuuBnsQ@mail.gmail.com>
 <CAK8P3a3ph=9f0LV1JoAhP8ZO4-9GGqmSmV6ajXZzw2zJPSXOPw@mail.gmail.com> <CAFzeTN3-=a6n-PEKP5ssCUszYYPu5R5_6uf9DEdptPKEuWOsrQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 31 Mar 2017 22:39:13 +0200
Message-ID: <CAK8P3a0W8q_6Kbm64U501zmbTonx_1g4euSLZS=4rJ5sVnhhfw@mail.gmail.com>
Subject: Re: [PATCH] [SUBMITTED 20170314] [v333kbuild: disable
 -ffunction-sections on gcc-4.7 with ftrace
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Charlebois <charlebm@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung.with.foss@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Mar 31, 2017 at 5:54 PM, Mark Charlebois <charlebm@gmail.com> wrote:
> What is it you need from me? To rebase 03497934e21, test (on what ARCH) and
> resend (to who)?. Let me know if Arnd forwarding the patch isn't sufficient.
> I'm not set up to test this at the moment, but could if needed.

I've just send it, I think that's sufficient and will keep the the
patch attributed
correctly.

        Arnd
