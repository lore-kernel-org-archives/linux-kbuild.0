Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:40279 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933949Ab3HIPAg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 11:00:36 -0400
Date: Fri, 9 Aug 2013 16:00:31 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130809150031.GE6427@sirena.org.uk>
References: <1376046432-12588-1-git-send-email-broonie@kernel.org>
 <20130809123251.GB5794@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Cp72eN6HUuZZoDF"
Content-Disposition: inline
In-Reply-To: <20130809123251.GB5794@merkur.ravnborg.org>
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>


--4Cp72eN6HUuZZoDF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2013 at 02:32:51PM +0200, Sam Ravnborg wrote:
> On Fri, Aug 09, 2013 at 12:07:12PM +0100, Mark Brown wrote:
> > From: John Rigby <john.rigby@linaro.org>

> > Cross compiling the binaries in scripts/* is not possible
> > because various makefiles assume that $(obj)/whatever is
> > executable on the build host.

> Please explain what problem you are trying to solve with this.
> I do not understand the rationale behind this patch from the above.

OK...  I'd have thought that cross compliation was enough of a rationale
to be honest.

--4Cp72eN6HUuZZoDF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSBQQMAAoJELSic+t+oim9kjoP/jidzAcuxzpGyH9YxrXl2JjJ
93QfFzC9zR/mv70tMAgIIWKIJ1cy5KvYJjT9wUW7BH8XyGC8xiNk8xU4rnyXuZzE
AkQHkordpD1VF/ljw5rSSw+uUD0xMUVAM+LiT4AB7nl/MsD0vJRh4MEg+V1T9/rR
EHYfh0p88dGnl9Zt+GtvuSgrVTgFiKyjcz/F1ayQz1tj+/5fnALbWj067FO1xqqr
JTy02zBvapYkLOzl8GmTNX1wxThipd1A0YCyaXR6a2nhS1/nAMY1hSsuXhe6L1OG
j8IqvRXLA45kanesXfgxqGzgER2TbeTk3OkrUNAeDaTqqToofmB31ny5zsM95Nsz
0LoLoUcJM6VRi7tG6UAWN4n2JFDHY0zHVxvP/3m/daYKmpkUCn1DONWnGkPvN+8x
f+/e5e4eBLSoLZw3Nf1BLz0MKefd5JVS+jQRqCnwaVQXaSCLftD2ZcxlihhwhQB4
8pgRV09uz28XUMHXWOdpxlemCCVKedXD2s0hbCFYV0QJ78BIjZgDJJ3LZh7vLpq2
Wq8haABfNlQqxHMUsWOd1jySL7kAYjlC8hux9Q+KqHG/8JIQdeoyilyYyMHG46QG
O8BMiVlI5244Enbtez0Ke0ZbEGMPUelw21mo0o00FQf8dj7PbqX71OG9h7KlNdzz
pwY+gmbaB6qemTIk2/N3
=JT+p
-----END PGP SIGNATURE-----

--4Cp72eN6HUuZZoDF--
