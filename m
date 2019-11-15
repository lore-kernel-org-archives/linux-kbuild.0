Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24350 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfKOB6w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 20:58:52 -0500
MIME-Version: 1.0
References: <20191102063036.28601-1-unixbhaskar@gmail.com> <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org> <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org> <20191106044223.GA18076@Gentoo>
 <20191106193010.GG17669@fieldses.org> <20191106223918.GB1852@Slackware>
 <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com> <20191109111335.GA1198@Gentoo>
In-Reply-To: <20191109111335.GA1198@Gentoo>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Nov 2019 10:58:10 +0900
Message-ID: <CAK7LNAR9PrnXWhA6CCvgexpwVfeZxvHiXp_JtKH7Xb1OZDGusw@mail.gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Nov 9, 2019 at 8:14 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> On 16:25 Sat 09 Nov 2019, Masahiro Yamada wrote:
> >On Thu, Nov 7, 2019 at 7:39 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> >>
> >> On 14:30 Wed 06 Nov 2019, J. Bruce Fields wrote:
> >> >On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
> >> >> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
> >> >> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
> >> >> >>BTW.
> >> >> >>Bruce,
> >> >> >>Does the current script expect RHEL or something?
> >> >> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
> >> >> >
> >> >> >I test on Fedora.  Looks like on recent Fedora that's only provided by
> >> >> >an rpm "grubby-deprecated", which is an inauspicious name....
> >> >> >
> >> >> >I think maybe you're supposed to use "grubby" itself now.  Do you have
> >> >> >that?
> >> >> >
> >> >> >>It would still work with 'new-kernel-pkg: command not found'
> >> >> >>warning.
> >> >> >>
> >> >> >>We could bypass it if we like.
> >> >> >>
> >> >> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
> >> >> >
> >> >> >Looks like it's what updates the grub configuration, which is probably a
> >> >> >nice thing to do if you can.
> >> >> >
> >> >> >--b.
> >> >>
> >> >> Bruce,
> >> >>
> >> >> Two things,
> >> >>
> >> >> If the system doesn't run grub , how the fallback policy???
> >> >>
> >> >> This binary "new-kernel-pkg" also missing in other systems too...I can
> >> >> confirm that... i.e gentoo,slackware,
> >> >>
> >> >> So , you are only targeting the rpm based system????
> >> >
> >> >It's just what I happen to use.  If someone wants to make it work
> >> >elsewhere that'd be great, as long as we don't break what already works.
> >> >
> >> >I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
> >> >dunno.
> >> >
> >> >--b.
> >>
> >> Okay , thanks for the input. I was trying to write something in
> >> generalize way , that is why my code spins off.And if you see the
> >> subject line of my very first attempt to patch written was "removing
> >> old kernels and modules dir in selective way"... that was it.
> >>
> >> Now, there are plenty of distros around, not only rpm based one(yes I do
> >> agree that ,you wrote it while using and testing on it, but that is
> >> limited in nature),the broader user base might be using something else.
> >>
> >> we simply can not restrict it to certain packaging version or several
> >> packaging versions of selected distros. We are making and building this
> >> (worth an effort) to make it as generalized as possible.
> >>
> >> Importantly I was only thinking of people who put the stuff in standard
> >> places in the FSH and use it. I might be wrong.
> >>
> >> As I have said it before, I was no way trying to bypass your work ,but
> >> it seems very limited in nature to adopted. So trying to widen the
> >> spectrum.
> >>
> >> I am trying to incorporating both the pole, different kind user base in
> >> mind, like you , who don't like to be prompted for this operation and
> >> assuming things should go well, and you are right.
> >>
> >> On the other hand , I am kinda guy , sometime I need to know what is
> >> going on, so the prompting.
> >>
> >> Well, I have never taken into account about modifying the bootloader
> >> config by looking at your work. Had I been, I would have done it already
> >> and it would be extremely trivial in nature.
> >>
> >> Now, Grub, no doubt it's fantastic piece of software, but complexity
> >> is paramount with it. Don't you think so???  I HAVE NOTHING AGAINST
> >> GRUB!
> >>
> >> I have personally stops using it for years and using something very
> >> rudimentary and simple and useful. That is because I know what I am
> >> doing and my system well.
> >>
> >> Caveat emptor: that was me, not every one else in the wild. Grub is used
> >> by the most distro by default,everybody knows it,but certainly not the
> >> norm.
> >>
> >> I would love to give it a stab again and if you better people feel it is
> >> necessary, but I need some concrete understanding from you,Masahiro and
> >> Randy(who is helping me actively).
> >>
> >> Say, You people might come up ,
> >>
> >> We need these :
> >>
> >> a)
> >> b)
> >> c)
> >>
> >> and we don't need these:
> >>
> >> a)
> >> b)
> >> c)
> >>
> >>
> >> My two cents! kindly, flame me with your thoughts.
> >
> >
> >Honestly, I did not even know this script
> >before you submitted the patch.
> >
> :)
>
> >I prune stale kernel/modules with my own script,
> >and I guess people do similar to meet their demand.
> >
> I do the same.
>
> >I am not sure how many people are using this.
> Only people who look up in the kernel source scripts directory , nobody
> else for sure.
> >If somebody is passionate to improve this script
> >in a simple way, that is fine, but
> >I do not want to see messy code for covering various use-cases.
> Agreed. That is why need guideline from you people(You, Randy and Bruce
> needs to tell me clearly), like what I mentioned, we can do
> these and we can not do these. I am asking because you people have had more
> exposure ,so might come up with some valid points to build up.
> >

We have two topics here.

[1]  add the interactive option
[2]  do nice things for non-rpm systems


They should be done by separate patches.

I think [1] is easy to do in a few liners.


For [2], I am not sure how well it goes
until I see an actual patch.

-- 
Best Regards
Masahiro Yamada
