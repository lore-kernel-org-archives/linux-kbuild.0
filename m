Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46258 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758312AbdJQUEq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 16:04:46 -0400
Date: Tue, 17 Oct 2017 21:04:43 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Message-ID: <20171017200443.uarsg56gcfv7o2fg@sirena.co.uk>
References: <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
 <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
 <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
 <CAK8P3a3fHWdgH23LjACzM+htGCY-bHgM5Y6uB8J6K5XgfT8e+g@mail.gmail.com>
 <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
 <CAK8P3a2N+QW9JjOAdp3tHsXLFU3Cmy7yR3Mr3vZvi4Vy5VbOYw@mail.gmail.com>
 <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
 <20171017185206.dquho5wtr5f6pwmv@sirena.co.uk>
 <CAGXu5jL1bYxHTOAFvO7O=a+3NP1zU8rOisF0WBoX6Sg0EyvQ6g@mail.gmail.com>
 <20171017125645.3f8f6c4516fc641bbf94ed09@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kv6qyhk6ojv5d3ql"
Content-Disposition: inline
In-Reply-To: <20171017125645.3f8f6c4516fc641bbf94ed09@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


--kv6qyhk6ojv5d3ql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 12:56:45PM -0700, Andrew Morton wrote:
> On Tue, 17 Oct 2017 11:53:10 -0700 Kees Cook <keescook@chromium.org> wrote:

> > Until we sort this out, yes, agreed. Andrew, can you pull the patches?

> Sure.  All these?

> sh-boot-add-static-stack-protector-to-pre-kernel.patch

That one is still there as I'd already done the drop (after a
conversation with Kees and Arnd on IRC).

> makefile-move-stackprotector-availability-out-of-kconfig.patch
> makefile-introduce-config_cc_stackprotector_auto.patch
> makefile-introduce-config_cc_stackprotector_auto-fix.patch
> makefile-introduce-config_cc_stackprotector_auto-fix-2.patch
> makefile-introduce-config_cc_stackprotector_auto-fix-3.patch

> Mark, can you please drop those from -next also?

Hrm, I've got a horrible feeling I'm missing an update as I didn't drop
or seem to have -3.  Perhaps just a race with when I did the fetch.  In
any case none of those patches should be in there today assuming I've
not gone and done yet more stupid stuff.

--kv6qyhk6ojv5d3ql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnmYloACgkQJNaLcl1U
h9A0+Af+OFo2LiXXWbJyXvNmcwZkIEcSTuGMOy6JGdvTwqWtMoRy56E1T2nKsz+z
P3Ksrq6Kqb/7wQxzQDh2tt9/lyIUHDYMEvD/h6OVZyDo6B4f2EXsbgcEOISK9q2V
qJ4rtVnTLTSv1TEUP4cJiQ/XMykukwqy6pB16YFeMdEklvNtEZQ0/+Yoz5qtzu5g
qCyxGdPsYE4OGC5As8CGmYF4pahyEqaYjpVUkqrpdSh7u9ixKx7YShj5n04+3GbM
QdkLe5S5RSwvqfryPtmxFs5nSYk2pdh1Wigl49UwemhIPOucTv93aIMJMul5mttX
TCaB65mNzj5RnRRuuoT4nUYnB0wZHg==
=96oJ
-----END PGP SIGNATURE-----

--kv6qyhk6ojv5d3ql--
