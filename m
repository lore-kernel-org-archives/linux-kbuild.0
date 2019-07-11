Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63639 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbfGKFbH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:31:07 -0400
MIME-Version: 1.0
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
 <20190709042416.27554-9-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1907091332150.4190@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1907091332150.4190@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Jul 2019 14:30:15 +0900
Message-ID: <CAK7LNARsdu_1mqS8CFt4jQsKZjnSaGaK7v=fsnzcqmrds=WMhA@mail.gmail.com>
Subject: Re: [PATCH 08/11] kbuild: create *.mod with full directory path and
 remove MODVERDIR
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, Jul 10, 2019 at 2:37 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Tue, 9 Jul 2019, Masahiro Yamada wrote:
>
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -47,13 +47,10 @@ cat > "$new_ksyms_file" << EOT
> >   */
> >
> >  EOT
> > -[ "$(ls -A "$MODVERDIR")" ] &&
> > -for mod in "$MODVERDIR"/*.mod; do
> > -     sed -n -e '3{s/ /\n/g;/^$/!p;}' "$mod"
> > -done | sort -u |
> > -while read sym; do
> > -     echo "#define __KSYM_${sym} 1"
> > -done >> "$new_ksyms_file"
> > +sed 's/ko$/mod/' modules.order |
> > +xargs -r -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' |
> > +sort -u |
> > +sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
> Did you consider the case when CONFIG_MODULES=y but no modules are
> selected?

I tested it, and worked.

 Also -r to xargs is a GNU extension and there were some
> efforts to remove theur use in the past (no idea if this is still a
> concern).


It worked even without '-r', so I remove it in v2

Thanks.




-- 
Best Regards
Masahiro Yamada
