Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sonic316-54.consmr.mail.gq1.yahoo.com ([98.137.69.30]:38108
        "EHLO sonic316-54.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727115AbgBVOYV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 09:24:21 -0500
Date: Sat, 22 Feb 2020 09:24:14 -0500
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
        <20200222003820.220854-1-alex_y_xu@yahoo.ca>
        <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
        <1582341758.yo66djba3t.none@localhost>
        <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Message-Id: <1582381271.1karmgahx0.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org, michal.lkml@markovi.net

Excerpts from Nathan Chancellor's message of February 22, 2020 3:01 am:
> I used hyperfine [1] to run a quick benchmark with a freshly built
> GCC 9.2.0 for x86 and aarch64 and here are the results:
>=20
> In both cases it seems like performance regresses (by 1% but still) but
> maybe it is my machine, even though this benchmark was done on a
> different machine than the one from my commit back in 2018.
>=20
> I am not sure I would write off these results, since I did the benchmark
> 25 times on each one back to back, eliminating most of the variance that
> you described.
>=20
> [1]: https://github.com/sharkdp/hyperfine
>=20
> Cheers,
> Nathan
>=20

What kernel version are you running? Do you have the 5.6 pipe reworks?
