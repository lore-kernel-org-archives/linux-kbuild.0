Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f65.google.com ([209.85.216.65]:45805 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfLFIKn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 03:10:43 -0500
Date: Fri, 6 Dec 2019 13:40:27 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191206081027.GA1165@ArchLinux>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204150728.GD2734@twin.jikos.cz>
 <20191205032503.GA3981@debian>
 <CAK7LNARdOGfvc_8TMX+KbJQ1DRGy8_xZsdDye1ZrvimSS1VoFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <CAK7LNARdOGfvc_8TMX+KbJQ1DRGy8_xZsdDye1ZrvimSS1VoFQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: dsterba@suse.cz, Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01:08 Fri 06 Dec 2019, Masahiro Yamada wrote:
>   On Thu, Dec 5, 2019 at 12:25 PM Bhaskar Chowdhury
>   <[1]unixbhaskar@gmail.com> wrote:
>
>     On 16:07 Wed 04 Dec 2019, David Sterba wrote:
>     >On Wed, Dec 04, 2019 at 12:10:25PM +0900, Masahiro Yamada wrote:
>     >> On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury
>     <[2]unixbhaskar@gmail.com> wrote:
>     >> > +awk '{print $1}' "/proc/modules" | xargs modinfo | awk
>     '/^(filename|desc|depends)/'
>     >>
>     >> I want to see a good reason (e.g. useful for other developers)
>     for upstreaming.
>     >> This script looks like your custom script, which you can maintain
>     locally.
>     >
>     >I think the verbosity should be added to either lsmod or modinfo,
>     not
>     >some script in kernel git.
>     lsmod and modinfo already are pretty verbose and the one liner is
>     using
>     one of them to cut thing out of it....can you give it another
>     look???
>     Moreover,this is sort and precise and can be parsed by other
>     scripts.
>     The whole point behind this is to give the developers a convenient
>     point
>     without going through all the rigorous details.
>
>   lsmod and modinfo are good.
>   If you are not satisfied with the current format,
>   talk to the kmod maintainer.
>   As a maintainer, I need to avoid the situation
>   where upstream tree is flooded with weird scripts like this.
>   One more thing:
>   Despite advice from Randy over again,
>   you are still not able to submit a patch correctly.
>   (see what you sent as v2).
>   Do not get me wrong. I am not saying you to send v3.
>   I do not like this patch. Please stop.
>   --
I completely get you. I should stop sending this. Thanks for the heads
up.=20

And I was not denying the verbosity of lsmod and modinfo , as I was
pointing out to someone else.

About the V2, this was a mistake , I know once I saw it alas! after
sending it you. So, my apology.=20

One thing get it straight , I am NOT trying to flooding with some airy
fairy script , I know what it takes to maintain that bloody thing.

Your time is precious like mine, never try to gobbles it by sending
garbage.

I was thinking make it easy for others, not sure why you think it's
wired.

Again , thanks for the heads up...above statements are STRICTLY NOT in my
defence not to cover the mistake.

>   Best Regards
>   Masahiro Yamada
>
>References
>
>   1. mailto:unixbhaskar@gmail.com
>   2. mailto:unixbhaskar@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3qDO8ACgkQsjqdtxFL
KRX92QgAjHkoScuG/jGzDUGWVxlstQ/vqjht3c4mVgIpuTQlEnd9GtpLRS6SWsn3
mPlrmdVxYpOWUhdRekIfwPQ3I0bcY/teccY04VkoYqvzCq/UGy0xr72fpUrCkN+m
8nVXztrMDgo5MEiLEmFrpnGIsSPJcOGOekWCotFVu+m14dPPOGzWSTVYm1rCppSn
PZYrHyiJds0dEM93SH1ruLbqQZvbvMt0jXVa3SBARoknRSBQKs2LdEpZCvi+7gJz
dior+esWl0a4ajcWXk0MKyjaDPH/LGTI0m12AwA6Ortkr+h73yccxqt2OvcbOHj/
k4t+Bd44GVymXe/JBKeiPT5vI1Ozlw==
=4dLL
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
