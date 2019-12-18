Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28395 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfLROL7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 09:11:59 -0500
MIME-Version: 1.0
References: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
 <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com>
 <cedbe416-844e-2bb8-5d05-4cd34eae8619@i-love.sakura.ne.jp>
 <CAK7LNATpAbRVbCuHQjq2e493aP0p1F9=Nd8+goQm-JnHzMEesw@mail.gmail.com> <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp>
In-Reply-To: <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Dec 2019 23:11:00 +0900
Message-ID: <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: Add yes2modconfig and mod2yesconfig targets.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>

On Tue, Dec 17, 2019 at 6:42 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Since kernel configs provided by syzbot are close to "make allyesconfig",
> it takes long time to rebuild. This is especially waste of time when we
> need to rebuild for many times (e.g. doing manual printk() inspection,
> bisect operations).
>
> We can save time if we can exclude modules which are irrelevant to each
> problem. But "make localmodconfig" cannot exclude modules which are built
> into vmlinux because /sbin/lsmod output is used as the source of modules.
>
> Therefore, this patch adds "make yes2modconfig" which converts from =y
> to =m if possible. After confirming that the interested problem is still
> reproducible, we can try "make localmodconfig" (and/or manually tune
> based on "Modules linked in:" line) in order to exclude modules which are
> irrelevant to the interested problem. While we are at it, this patch also
> adds "make mod2yesconfig" which converts from =m to =y in case someone
> wants to convert from =m to =y after "make localmodconfig".
>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> ---
> Changelog since v2:
> - Add 'if possible' to help message.
> - Make conf_rewrite_mod_or_yes() void.
> - Don't call check_conf() loop, for conf_write() takes care.
> - Use sym_add_change_count(1) to tell something has changed.
>
> Changelog since v1:
> - Updated the available 'help' targets in Makefile.

Applied to linux-kbuild. Thanks.



-- 
Best Regards
Masahiro Yamada
