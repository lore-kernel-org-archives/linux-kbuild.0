Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:26519 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfLQBEP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 20:04:15 -0500
MIME-Version: 1.0
References: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
 <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com> <cedbe416-844e-2bb8-5d05-4cd34eae8619@i-love.sakura.ne.jp>
In-Reply-To: <cedbe416-844e-2bb8-5d05-4cd34eae8619@i-love.sakura.ne.jp>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Dec 2019 10:03:23 +0900
Message-ID: <CAK7LNATpAbRVbCuHQjq2e493aP0p1F9=Nd8+goQm-JnHzMEesw@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Add yes2modconfig and mod2yesconfig targets.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>

On Mon, Dec 16, 2019 at 9:59 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Thank you for reviewing.
>
> On 2019/12/16 20:10, Masahiro Yamada wrote:
> > BTW, I have never contributed to the syzbot bug shooting.
> > So, please teach me if you know this:
> > Is there a a specific reason why the config set for syzbot
> > is close to allyesconfig instead of allmodconfig?
>
> I don't know. But I guess that all-in-one vmlinux file is easier to use
> (e.g. no need to copy .ko files into initramfs nor /lib/modules/ directory
> in the root filesystem image, no need to fetch .ko files when calculating
> locations in the source code from kernel addresses, no need to worry about
> availability of .ko loader program and request_module() dependency).

OK.
I just thought allmodconfig would be more convenient to trim
unrelated code without switching yes/mod back and forth.
Anyway...

> >> @@ -669,6 +684,8 @@ int main(int ac, char **av)
> >>         case listnewconfig:
> >>         case helpnewconfig:
> >>         case syncconfig:
> >> +       case yes2modconfig:
> >> +       case mod2yesconfig:
> >
> > This looks like
> > yes2mod/mod2yesconfig are interactive modes.
> > Why do you need this?
> >
> > I believe yes2mod/mod2yesconfig
> > should work non-interactively.
>
> I worried that simple s/=y$/=m/ or s/=m$/=y/ on tristate config fails to satisfy
> requirement/dependency.

conf_write() calls sym_calc_value() for every symbol
before writing them to the .config file.


> And I assumed that
>
>   /* Update until a loop caused no more changes */
>   do {
>         conf_cnt = 0;
>         check_conf(&rootmenu);
>   } while (conf_cnt);
>
> is the location to make modifications in order to adjust requirement/dependency.

This is not the place to meet requirement/dependency.

This loop requires the user to input his/her preference
for all visible symbols.

oldaskconfig, oldconfig and syncconfig are meant to be
interactive  (it shows a prompt for every new symbol),
that is why they runs this loop.



> But I might be wrong. I just assumed that we should behave as if "make oldconfig"
> after doing simple s/=y$/=m/ or s/=m$/=y/ on tristate config.
> Does some later function automatically adjust requirement/dependency ?

Yes, conf_write().

Thanks.



> If yes,
>
> >> @@ -638,6 +648,11 @@ int main(int ac, char **av)
> >>                 }
> >>         }
> >>
> >> +       if (input_mode == yes2modconfig)
> >> +               conf_rewrite_mod_or_yes(def_y2m);
> >> +       else if (input_mode == mod2yesconfig)
> >> +               conf_rewrite_mod_or_yes(def_m2y);
> >> +
> >
> > For consistency, why not put these lines into the switch statement below?
>
> conf_rewrite_mod_or_yes() should be put into the switch statement.
>
> >> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> >> index 3569d2dec37c..6832a04a1aa4 100644
> >> --- a/scripts/kconfig/confdata.c
> >> +++ b/scripts/kconfig/confdata.c
> >> @@ -1362,3 +1362,29 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
> >>
> >>         return has_changed;
> >>  }
> >> +
> >> +bool conf_rewrite_mod_or_yes(enum conf_def_mode mode)
> >
> > If you do not use the return value of this function,
> > could you make it into a void function?
>
> OK.
>
> >> +{
> >> +       struct symbol *sym;
> >> +       int i;
> >> +       bool has_changed = false;
> >> +
> >> +       if (mode == def_y2m) {
> >> +               for_all_symbols(i, sym) {
> >> +                       if (sym_get_type(sym) == S_TRISTATE &&
> >> +                           sym->def[S_DEF_USER].tri == yes) {
> >> +                               sym->def[S_DEF_USER].tri = mod;
> >> +                               has_changed = true;
> >
> > sym_add_change_count(1); seems the convention way
> > to inform kconfig of some options being updated.
>
> Then, we can do "sym_add_change_count(1);" instead of "return has_changed;".
>


--
Best Regards
Masahiro Yamada
