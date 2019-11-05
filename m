Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54539 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390885AbfKETZE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 14:25:04 -0500
Received: by mail-lj1-f198.google.com with SMTP id d5so4541023ljj.2
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Nov 2019 11:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20191104131144.14333-1-mcroce@redhat.com>
In-Reply-To: <20191104131144.14333-1-mcroce@redhat.com>
From: Matteo Croce <mcroce@redhat.com>
Date: Tue, 5 Nov 2019 20:24:23 +0100
Message-ID: <CAGnkfhzdHWS8-FLPpAsma8ZeszkAujKAtfDcqLvNY7n__fz=4Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add make dir-pkg build option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Nov 4, 2019 at 2:11 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add a 'dir-pkg' target which just creates the same directory structures
> as in tar-pkg, but doesn't package anything.
> Useful when the user wants to copy the kernel tree on a machine using
> ssh, rsync or whatever.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>

Hi Masahiro,

here there is the v2 with that nit addressed :)

Regards,
--=20
Matteo Croce
per aspera ad upstream
