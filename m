Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:50186 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726316AbgCJLbG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 07:31:06 -0400
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] kbuild: Disable -Wpointer-to-enum-cast
Date: Tue, 10 Mar 2020 11:31:01 +0000
Message-ID: <c2a687d065c1463d8eea9947687b3b05@AcuMS.aculab.com>
References: <20200308073400.23398-1-natechancellor@gmail.com>
 <CAK7LNARcTHpd8fzrAhFVB_AR7NoBgenX64de0eS2uN8g0by9PQ@mail.gmail.com>
 <20200310012545.GA16822@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200310012545.GA16822@ubuntu-m2-xlarge-x86>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Nathan Chancellor' <natechancellor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, stable <stable@vger.kernel.org>

From: Nathan Chancellor
> Sent: 10 March 2020 01:26
...
> Sure, I can send v2 to do that but I think that sending 97 patches just
> casting the small values (usually less than twenty) to unsigned long
> then to the enum is rather frivolous. I audited at least ten to fifteen
> of these call sites when creating the clang patch and they are all
> basically false positives.

Such casts just make the code hard to read.
If misused casts can hide horrid bugs.
IMHO sprinkling the code with casts just to remove
compiler warnings will bite back one day.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
