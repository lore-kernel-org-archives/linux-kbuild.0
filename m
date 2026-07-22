Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C82475CF
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jul 2026 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784732687; cv=none; b=DegRcBcYPTyH3Y4SRtx8LGniRr1nY1r/xp0is9WjWGRjqB8iVxaAHeJqHeIVbhz0SJ6QyCX/qcaaf5hNdiS3GH1XmPM+nbjkv7yB8m7YnwKRNSWsTvnVhm8jNJlde0wHoideGVIYSGuvGW3dIn13crFALJB0MZqJCzWAI5zFdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784732687; c=relaxed/simple;
	bh=5b3t2jd82pDJBxB3LQmpWHNM5J9DEvyH4yo7JL2z6i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okaPUsa+XyHxC2d9SXEeWsiChWb9RCgUttXmUEx1A9ih/K4O0DIlGUjnmhnBK5BtcKJnn1q/x8OrjwHY2kwSv7KNSOo4Vy1yaiFktSxrj9pFqI/Yhz9i/5t/JT6EPe5Dd8xQhthPee6KEO7qn8B3Jeirj4QENsuZpNffETjr684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a60daa3-4fae-7f0000032729-7f000001e8e4-1
	for <multiple-recipients>; Wed, 22 Jul 2026 16:58:43 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 22 Jul 2026 16:58:43 +0200 (CEST)
Date: Wed, 22 Jul 2026 16:58:41 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Anish Rashinkar <rashinkar.anish@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: MO flag not working properly for building out-of-tree modules,
 tries to replace the Makefile in the kernel's source.
Message-ID: <20260722-conscious-petrel-of-acumen-cdac27@l-nschier-aarch64>
References: <CAOESE2Q2-0KUDaM0mUo+c_F-tMaUsBZ-gpnhdoe0rmYdgnnuJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CL/9tG32dE/i5dGo"
Content-Disposition: inline
In-Reply-To: <CAOESE2Q2-0KUDaM0mUo+c_F-tMaUsBZ-gpnhdoe0rmYdgnnuJQ@mail.gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1784732323-EE41E258-4708A336/0/0
X-purgate-type: clean
X-purgate-size: 3674
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: queueID: 827D2A0434


--CL/9tG32dE/i5dGo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc: nathan]

On Thu, Jul 16, 2026 at 11:04:23PM +0530, Anish Rashinkar wrote:
> I have a few projects in which I am writing kernel modules. I use the
> MO flag to put the build artifacts in a separate directory. A simple
> make command with MO would look like -
> make -C /lib/modules/$(uname -r)/build M=3D$PWD MO=3D$PWD/build/ modules
>=20
> This used to work for me, and still works for me if I boot into the
> 6.19.10-300 kernel that Fedora preserved. I was on 7.0.X for a while
> on Arch Linux and it worked there too. I am not sure but I might have
> tried compiling my projects (if so, compiled successfully) on Fedora
> Atomic that I was trying out, which should have been on 7.0 or 7.1. As
> of the latest kernels on both Arch Linux and Fedora (7.1.3-201 on
> Fedora), I encounter an error when using the MO flag.
>=20
> make -C /lib/modules/7.1.3-201.fc44.x86_64/build M=3D/home/anish/temp
> MO=3D/home/anish/temp/build modules
> make[1]: Entering directory '/usr/src/kernels/7.1.3-201.fc44.x86_64'
> make[2]: Entering directory '/home/anish/temp/build'
> /bin/sh: line 1: /usr/src/kernels/7.1.3-201.fc44.x86_64/.tmp_Makefile:
> Permission denied
> make[3]: *** [/usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile:705:
> /usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile] Error 1
> make[2]: *** [/usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile:248:
> __sub-make] Error 2
> make[2]: Leaving directory '/home/anish/temp/build'
> make[1]: *** [Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/usr/src/kernels/7.1.3-201.fc44.x86_64'
> make: *** [Makefile:6: all] Error 2
>=20
> If I grant root privileges to make, it will replace the Makefile at
> /usr/src/kernels/7.1.3-201.fc44.x86_64/Makefile with its own Makefile
> wrapper.
>=20
> If I don't use the MO flag, then the build succeeds and all the build
> artifacts are stored in my source directory.
>=20
> I am new to Linux programming and especially bug reporting like this.
> I had raised this issue on Fedora Discussions with no one to properly
> respond that helps the problem. This issue should have appeared
> relatively recently. Please let me know if this is a bug or something
> changed with how it should be used, because the official guides state
> the same way I mentioned in writing a Makefile and using the MO flag.
> And with what I can comprehend and with what all LLMs are saying, this
> is a bug.

Thanks for the report!  This is definitely a bug and I can reproduce=20
this.  I'll have a look at it tomorrow.

Kind regards,
Nicolas

--CL/9tG32dE/i5dGo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmpg2psACgkQiMa8nIia
bbiJFw//eotunoDJjVU9BuxHQSfWre0+knH9OVLfYeqxuayv9Sl/DYqT2EEWif1E
5yLbilagQ3Z5NvI7d4AzQXIje5ij4xcQuFcDuf6S6xSepr1TYQzZ++an2CbznD7J
kb7Mu4mykwZrACTTETQ/b5FVxADkN2uz6cdIX+CbDJipIBexCJZvBBqHmPj/bOdX
gyeBOjgy7OGEI89nY0LqS5ZKRATkPOJskoBn7kPLmZZdP88JYuoTvkAnsVEua76F
XUGnE8NedDvg/UWs5k69kYw3yciGvLZ0fcrO6p+i/1TR4iLZQ8joTZAe8eQgIKe2
EI5M9Yzu3Ce2ePOdMSLmIoJd/RYioL0y+yn3PcWGaMJT/bt4uKz/wQj3HM6mtUmj
ha8GdBrVGFm5nulPk8EO3YWj76Vhe2ekhQG1ylqPajpyhdWiED/30UACzHfP8FNM
/cCH5GqK/4ob682r3bzTMHBp8D0Bll1t4kRDGbsIrdGNUBhJIz2uW/BWmYQ7G7oR
F5RxRgrGFd7mjd4QqzEwePAau8V1CFFGb7tXHYGj/8bb2DelUMn9QlDuj6+6Ybl6
HwlWjDarICcPWbM4HM3JsIq07fifkuywoQvuwZxi8iR0DAyivzwx7MLtcYdmmjzS
jq8gYStshSwzyLlu7T4gbMrFM9Z4HnldCzIWnX1y0GkiOkaZeTc=
=BXtC
-----END PGP SIGNATURE-----

--CL/9tG32dE/i5dGo--
