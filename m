Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45020 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964779Ab3HIP1w (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 11:27:52 -0400
Date: Fri, 9 Aug 2013 16:27:48 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130809152748.GF6427@sirena.org.uk>
References: <1376046432-12588-1-git-send-email-broonie@kernel.org>
 <20130809123251.GB5794@merkur.ravnborg.org>
 <20130809150031.GE6427@sirena.org.uk>
 <20130809151346.GA6021@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jmfxxgLgPT+fSo7V"
Content-Disposition: inline
In-Reply-To: <20130809151346.GA6021@merkur.ravnborg.org>
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>


--jmfxxgLgPT+fSo7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2013 at 05:13:46PM +0200, Sam Ravnborg wrote:
> On Fri, Aug 09, 2013 at 04:00:31PM +0100, Mark Brown wrote:

> > OK...  I'd have thought that cross compliation was enough of a rationale
> > to be honest.

> The way I understand cross compilation is that for example you
> build for arm - on your x86 box.
> This is supported today.

> So you need to explain your interpretation of cross compilation
> and why this patch is needed.
> Because I do not get it.

I thought that was covered by:

    Cross compiling the binaries in scripts/* is not possible
    because various makefiles assume that $(obj)/whatever is
    executable on the build host.

ie, we can cross build the kernel but not fixdep, conf or mk_elfconfig
since those are assumed to be runnable for the kernel build, meaning
they can't be deployed onto a target system without hoop jumping.

--jmfxxgLgPT+fSo7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSBQpwAAoJELSic+t+oim9fa8P/2imTBo8AIltBzOPMUyHKPR8
kOben0yyzs3a7HCW60HFr5mSRrz7AahEwByqjgvz7Ful58KAEVgszHtY/P1ZDAXg
7m2ZdVKjvAAHo/CAJO+SbSxcdQAP63ZiWcC941btlwkJxuMxsRn4wnXxozZhbJOn
meT4wc1Rs7CY+ui8BKEikAZ+XcAPN3rWIt+pUVk1QIS5ca/VkTSvDcC3jmCYjwmh
FBOR/I/nyaGn0e/sSXkkAO8aEkUaio0e/oQexSCRZWXZlpzZmiqS69I3BlGrxrho
FRhYDteiAMBvKkxfdy2H4BYoM0NBHub2Vm5lKK4lyhgHYiIseVGuFy2k8zfefE4m
PuIol65QYGxX11TNiR/MIJs5RamQb8B768yMyH2FtSdCk9ihrIIOIYz3GdwMrmzj
RxCNVno0Y+rAlGgO3ak5YXq6jLks91OWnx/Is4sWUOA01z3ac/MMqIxClsVM2W2S
9nbf2AoFFwbyxDQM+AfT3QYq9recZolM8Si3C7sebLwrACSlQUF5mesT3Osr+JPN
GmwiSG2x9V6HSdhq1gF1P1+PZ7tebcQX6SpkviFIx1tKopumw1fzf8XfKFB0mM1b
D2pLU5X8DuGYkqL2wiSrZKUrgEhvZsbnL1iBFcRl4NOxjnFwnIQ9q3rCgZxRYDG/
nIs1vwqKtXPAqB+ss/uI
=ykF7
-----END PGP SIGNATURE-----

--jmfxxgLgPT+fSo7V--
