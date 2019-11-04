Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19777 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbfKDBwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 20:52:20 -0500
MIME-Version: 1.0
References: <20191009151019.13488-1-mcroce@redhat.com> <CAGnkfhzj-X-R_4toZdJ2eBfhpq1t0dHYq=P+0w-VD30ZAh59qQ@mail.gmail.com>
In-Reply-To: <CAGnkfhzj-X-R_4toZdJ2eBfhpq1t0dHYq=P+0w-VD30ZAh59qQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 4 Nov 2019 10:51:39 +0900
Message-ID: <CAK7LNATcaJeBvzACMW-OxB1D24cYQYdQQwJca-OMe9sb4Q2KWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add make dir-pkg build option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matteo Croce <mcroce@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Nov 4, 2019 at 12:11 AM Matteo Croce <mcroce@redhat.com> wrote:
>
> On Wed, Oct 9, 2019 at 5:10 PM Matteo Croce <mcroce@redhat.com> wrote:
> >
> > Add a 'dir-pkg' target which just creates the same directory structures
> > as in tar-pkg, but doesn't package anything.
> > Useful when the user wants to copy the kernel tree on a machine using
> > ssh, rsync or whatever.
> >
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
>
> Hi,
>
> any comment on this?
>


Sorry for the late reply.
One nit.


> @@ -133,6 +133,11 @@ if tar --owner=root --group=root --help >/dev/null 2>&1; then
>         opts="$opts --owner=root --group=root"
>  fi
>
> +if [ "${1}" = dir-pkg ]; then
> +       echo "Kernel tree successfully created in $tmpdir"
> +       exit 0
> +fi
> +

The 'opts' assignment is unneeded for dir-pkg.
You can exit before the "# Create the tarball" comment line.






-- 
Best Regards
Masahiro Yamada
