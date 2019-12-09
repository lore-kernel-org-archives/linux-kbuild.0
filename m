Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39903 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbfLINxu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 08:53:50 -0500
Received: by mail-oi1-f169.google.com with SMTP id a67so6338826oib.6
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Dec 2019 05:53:49 -0800 (PST)
MIME-Version: 1.0
References: <CAN19L9G-mFN-MTmw0FS3ZX4d1MjeoL2U+s-Fk7Qw9UYWn5Q1YA@mail.gmail.com>
 <CAK7LNAR2bJW8BMq3xbt2FuuC_=uGqFrDsL9jEw6H1B78wHG_yg@mail.gmail.com>
In-Reply-To: <CAK7LNAR2bJW8BMq3xbt2FuuC_=uGqFrDsL9jEw6H1B78wHG_yg@mail.gmail.com>
From: Martin Galvan <omgalvan.86@gmail.com>
Date: Mon, 9 Dec 2019 10:53:38 -0300
Message-ID: <CAN19L9Hbo_uthS3OYfu4oOjGrOoiZpq9MpKMrbM=f-t=LMec1Q@mail.gmail.com>
Subject: Re: Some header files being ignored when calculating srcversion
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>

El lun., 9 dic. 2019 a las 3:05, Masahiro Yamada
(<masahiroy@kernel.org>) escribi=C3=B3:
> I also wondered about this design
> when I looked into this code for the first time.
>
> In my understanding, this is based on the assumption that
> headers file from the same or sub- directories are highly
> relevant to the module in question, while the header
> files from other locations are less related.

If we all agree that this behavior is not correct, I'll send a patch
to remove that check.
