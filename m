Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726788AbfLRNve (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 08:51:34 -0500
MIME-Version: 1.0
References: <20191218114625.28438-1-frank-w@public-files.de> <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
In-Reply-To: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 18 Dec 2019 07:51:21 -0600
Message-ID: <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, DTML <devicetree@vger.kernel.org>

On Wed, Dec 18, 2019 at 7:37 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> (+CC: DT maintainers)
>
> On Wed, Dec 18, 2019 at 8:55 PM Frank Wunderlich
> <frank-w@public-files.de> wrote:
> >
> > With this Patch we are able to change cpp-preprocessor options
> > (e.g. -D...) for using conditions (#ifdef) in devicetree files
> > and dynamically add include searchpaths
>
> I think this is questionable
> since DT is supposed to describe hardware.
> Does it depends on #ifdef or some external defines?

NAK. #ifdefs and complex macros in particular are features we don't
want in dts files.

Rob
