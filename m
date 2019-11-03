Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20287 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727624AbfKCPLz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 10:11:55 -0500
Received: by mail-lf1-f69.google.com with SMTP id x21so2710009lff.13
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Nov 2019 07:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20191009151019.13488-1-mcroce@redhat.com>
In-Reply-To: <20191009151019.13488-1-mcroce@redhat.com>
From: Matteo Croce <mcroce@redhat.com>
Date: Sun, 3 Nov 2019 16:11:15 +0100
Message-ID: <CAGnkfhzj-X-R_4toZdJ2eBfhpq1t0dHYq=P+0w-VD30ZAh59qQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add make dir-pkg build option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Wed, Oct 9, 2019 at 5:10 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add a 'dir-pkg' target which just creates the same directory structures
> as in tar-pkg, but doesn't package anything.
> Useful when the user wants to copy the kernel tree on a machine using
> ssh, rsync or whatever.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>

Hi,

any comment on this?

--=20
Matteo Croce
per aspera ad upstream
