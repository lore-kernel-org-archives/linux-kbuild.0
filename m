Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC0501F27;
	Fri,  4 Sep 2026 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539707; cv=none; b=PlHJ9l5uGpDCKqnYmsbh0LK/B3K6iMzXFYw8ogzKlKwc75ARyG5I+5hLweXDA2BQFNvtUxVR9Y2Y6kV5y1qrvAR5v+Wbh4pBAJA60PKtEZ0fnIEANzpvaVwQK4SST3fkrKZtLglxvoY6rZfOaPw/8j0GW74fj8G4VLOQn6w2G9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539707; c=relaxed/simple;
	bh=Yrj+hpeTd851TNoAZJLqC56O4lZrGFKD+S3XWoI7bxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rronJ2Qev/v1T9ZTITVig12UwDYMewYbf84ocQz5RxGTA2CIkO73b9+Q9CQr6bg58t+DiyXJxlG4Ahk3o+qauov5+FYfuBhKkY6s7IXZCSaR5dr8QiNf/nzOQ40Kb+Z8d7JVQsdzWY3iFvdRBPjqed0JGE8Wa2ikkji/TGupX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=qy02yK3V; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="qy02yK3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788539385; bh=Yrj+hpeTd851TNoAZJLqC56O4lZrGFKD+S3XWoI7bxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qy02yK3VaN3DXRWeuWB1i9SbMdt7n2HiqKGhH7TS0aLkplN3ZkNRNfbf9E0hNXS4B
	 WO3Si7A/BtWdvjs2Soc3wzHp+XNhLZq2AxLIABJPrLqdCZBu8z9BxnPvt6zCQWZ92S
	 rsY7wwyuq+Mem0MdsCxlDWdQN6vdu++OopISjUPfZ5nJMNdgpOkgGzDfyuzbET2igF
	 jAndKqyvHpKf2Plcw/aKwIJ1oDoCS1O/8XsNZDz8Onc4gsYwQbsyswTaKeNZ2FmuQY
	 d+81bs0OcKPn5DjEi38M2NqwUVveAWjw2c9yeINeYuCP1xRpGRs7QHzesDYv+s86oW
	 Qqp33mVvPuAFg==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9af1f8-2a57-7f0000032729-7f000001a072-1
	for <multiple-recipients>; Fri, 04 Sep 2026 18:29:44 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 18:29:44 +0200 (CEST)
Date: Fri, 4 Sep 2026 18:29:45 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
Message-ID: <20260904-demonic-calm-swift-e7acae@l-nschier-aarch64>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger>
 <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
 <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IPfAD79JDW7zfCpg"
Content-Disposition: inline
In-Reply-To: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788539384-60CA570C-3578E9C3/0/0
X-purgate-type: clean
X-purgate-size: 3674
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: ED0A3A00CB  external: no


--IPfAD79JDW7zfCpg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:56:47AM +0200, Guillaume Tucker wrote:
> Hi Miguel,
>=20
> On 28/08/2026 7:35 pm, Miguel Ojeda wrote:
> > On Fri, Aug 28, 2026 at 7:25=E2=80=AFPM Guillaume Tucker <gtucker@gtuck=
er.io> wrote:
> > >=20
> > > It states Python 3.9 which was already older than the 3.10 minimum
> > > set when the container tool was merged.  Also my understanding is
> > > that it's not a hard requirement for all the kernel tools, only for
> > > building and producing a functioning kernel.  If I misunderstood this
> >=20
> > I didn't check at the moment, but at least back when the "(optional)"
> > tag was removed, it was only required for certain configurations from
> > what I understand (I am not sure why the tag was removed).
> >=20
> > In any case, it is nice if we could just say that it is required -- it
> > is quite useful to have around, especially due to its standard
> > library.
>=20
> OK so I'll leave this part as-is for now unless someone makes a
> strong case for downgrading to v3.9, thanks for confirming.
>=20
> > And regarding the minimum version, it would be nice to eventually have
> > a single minimum for all Python scripts, no? Debian oldstable is
> > already at 3.11, so I think we could perhaps bump the minimum already.
> > And Debian stable is 3.13, which from your list would be enough for
> > everything on your list, right? So we could perhaps set that as the
> > actual minimum for everything in the future.
>=20
> I was wondering about this too, especially since v3.10 is soon going
> to reach end-of-life which means no more security patches.  In
> principle newer, version should be backwards compatible so if we just
> bumped the minimum to v3.13 older scripts that were written for v3.9
> should still work - but it'd be nice to have a way to test that.
>=20
> Well that's beyond this series anyway, maybe something for KernelCI?

If I filtered the repology data correctly, bumping the minimum Python=20
version to v3.11 would be problematic for these (major) distributions:

  * Alpine Linux 3.17
  * CentOS 8
  * Debian 11
  * Devuan 4.0
  * OpenMandriva Cooker
  * OpenMandriva Rolling
  * Slackware 15.0
  * Ubuntu 20.04

With the end of security support for Python 3.10, I think that is=20
acceptable for a minimum version bump.

Bumping the minimum version of a tool used in scattered places in the=20
tree to a version that is just 3-4 years old should not be done too=20
careless, but I think for Python, I'd second bumping to v3.11.

Kind regards,
Nicolas

--IPfAD79JDW7zfCpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmqa8fMACgkQiMa8nIia
bbixyRAAok+TmXbbb6xM1TJU3hJRO9fTlkGyhWWM5VdTj80zDQhhN7hL1K/jlGN8
Hd+zemhopY2iCVibgd5TQHPv8p46VLkRMqhJjiHDkCVujI+5o1MoWOQB9JvMyD5F
AE+kGLQUFIOc4mThtasjotQtE4Ky8+HFTyrVtPZHMJ+y8Skcy8EUnd+UI3hhS7sN
awX0EIePfaIBLx3SZolvKfjYh+ZZLBvjSEnz79yFgfp/8WHsb11mHY1cTViBdQoe
J9aM/b8fXjE39CxoaXZuc9jeNaTSe4YHe+uUvU9lvEuzO9dzb5o6s7jmTZjNbCXu
IlFux9HAIKBLX+/Qs4aBU5hddUDnEml3jpjEtdmSz6cTzGMGjnyOslK0m3pWPbuw
EKQrExRUSBctGzngeX3emFHl5RqVvn6v+OXV4TfutZz0GWYANaAOnbE9HyFNCubi
VcXiA5m0+ZDZrcG+GVeEblyMIJIuwBSjmBubfMHhbsUbUhX/MIdLtxtmrllcAiFu
KXznxCMezZRgySeQQXih1PMlKJCLG7hjA45Eax/vWPLNqXELMxUAva/H07JakPZx
CTHpFfxmz5YK1RLub8aUXJ1mUiM+BO72B3egt45KhWIZ6VHkaFwBYOySJcUVAoO/
MamfX/AX9544UeOipU45hsG+kwkviQwJvUsrLOXyU1MSsglAajM=
=AVIV
-----END PGP SIGNATURE-----

--IPfAD79JDW7zfCpg--
