Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607718;
	b=2uqXVRKDNgMlyKMBeskJq9jEduJVj6T7hCOQG/uH7Nl0TNXs/LNEwjINgcXag8G1kH+q
	 hOTGJhGTqQNoetUFOqyfpTDZAM6LFc7bUGAqt7BFoKwSzq8QuoPtNeCAAQOhhwR23x2ZO
	 0WJggV76YWLpQez/9ZZ0QbqSthhe4ApqCnKcj/9SwWoz8hrywYMcUTUi7J7BKA29jeJcB
	 +EW8pYnfGqi6FljnYaXyanUTcCrslvGAFLAG0I1uX3A1YuAHzRgONYiQpwDQQ85KqET65
	 CWR3WxHdD0xhSENzACPYbFBOX8/2iny8OoMhDncW9cbXQ9sWuZBJlJ9qEZrB0E9+W+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607718;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pSBrr3W6vsQ8Ghatr4Uc3i27nNZbHbK6ravDLl8PYtw=;
	b=kDeLze3yFuLfikxVZ9vfsrrWHmtbrrOw3YcVmgQqWobjvtI2uq8w/wvZxwJdHFxIxHtm
	 /UiQTvmt+F5RGJub52JGU7w9J84cRezb1/XmHXLvG2UBjz3wTG24iKEnRgPLKb9b61ubW
	 mgkw27jdRpAH1OUiz1ru810tz/FEdtR+wj5/uZ0k8R0c0CG1z2XbiNx+AB4Pl5h/ifhOT
	 BiAOxD/SBrODLo5tfDdP/DNdQ4S52jTcsQqj3e+58RUzUJQsPrA73nZ+BCB6sjb4viACf
	 WdztqCBTZz+aSqY6n42Pn5WXv/aifeNUZM8w+hN+xz+8EujeSmmzWnqXza8U1C3TMGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HBwU1J4C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 69CB6606A333;
	Mon,  2 Nov 2026 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HBwU1J4C
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7BA071F000C1;
	Mon,  2 Nov 2026 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793607718;
	bh=pSBrr3W6vsQ8Ghatr4Uc3i27nNZbHbK6ravDLl8PYtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HBwU1J4CaRUQMbgZL0NugqUMlG83pEO6VfV0qXArpxAYxOl8AUaqM80zI4N5rGpQ+
	 lTwfAnVerZgW/FqCY40R733ruXA9Y57c2o7jz1U99WQ/VhRrdSR9h/ZFHV8DrAgvTV
	 etNY8aU359ZhZjDn0FeR+UF5fYnXEv6SdSImtyN/btuWfdamzDJhJ4u2Mpevrfh6Kb
	 l10CnvVzo5y+WRxxpJ1VTTIGHqvP/DkEWX9ND/zpZzNRcwJvSP2/noUGZVhZuXzpN+
	 NozZgfKQpBG1c/Jcbb2rWsYbPXkPQ7Fn9AYhVfnXwLP2DewtgL1LVTB9LMds0aCJ//
	 LuQ3gHxnS3SGQ==
Date: Mon, 2 Nov 2026 07:53:27 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Speed up KConfig - fix hashtable confusion
Message-ID: <augzZ-iDU-WA7rZw@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
 <9c21c5f5-355e-4520-b48e-acd355c7fc6d@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O/lgowdIW52wEdIz"
Content-Disposition: inline
In-Reply-To: <9c21c5f5-355e-4520-b48e-acd355c7fc6d@gmail.com>


--O/lgowdIW52wEdIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 11:44:39PM +0000, Julian Braha wrote:
> On 11/1/26 20:08, Linus Torvalds wrote:
> > So the Kconfig 'expr_lookup()' function is criminally slow and takes
> > over 10% of the time of "make oldconfig".
>=20
> My own pet peeve is the occasional slowdowns in menuconfig search...
> >=20
> > The reason is that it's called just a lot, but it *really* doesn't
> > help that the scripting versions of the hashtable functions has not
> > understood the subtler issues of the hashing code that it took from
> > the kernel side, and in the process got things very very wrong.
> >=20
> > The "hash_32()" function is a perfectly fine hashing function - there
> > are better ones around, but it's fast and "good enough". But when you
> > use it, you need to understand that it puts the significant bits in
> > the *high* bits of the result.
> >=20
> > The kernel uses a model where you give it the number of bits you want,
> > and it will pick out those high bits, which makes it all work right.
> >=20
> > But the simplified hashtable code for the host code didn't use those
> > high bits of the key. It just did
> >=20
> >     (key) % HASH_SIZE(table)
> >=20
> > to pick the hash table entry, and that's basically pessimal. When
> > hashing an address that typically has the low bits clear, the low bits
> > of "hash_32()" will *also* be clear. So the hash table ended up being
> > mostly empty! So even though the hash table was sized appropriately,
> > it wasn't being very efficient. And while making the hash table larger
> > mostly hides the problem, it's the wrong solution, because the cache
> > footprint gets worse.
> >=20
> > Teach "hash_head()" to use the high bits of the key. Because the users
> > don't pass in the number of bits they want, this is pretty hacky:
> >=20
> >     #define HASH_KEY(key,size) \
> >         (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))
> >=20
> > but at least this improves on things.
>=20
> It would be a bigger change but IMO the host-side implementation should
> not differ much from the kernel's -- like the rest of the data
> structures in scripts/include/. In other words I'd prefer to revert some
> of the "simplifications" that caused this and adjust the callers
> accordingly.
>=20
> Nathan or Nicolas, do you feel differently? This is also used by some
> other tooling outside Kconfig. If not then I'll send out my version.
>=20

I have no strong opinion on that, yet.  But probably it's better to take
a working speed-up fix now and think about the long-term maintenance
stuff later on.

[...]
> > Somebody needs to double-check this. I don't love my HASH_KEY() macro,
> > but it should work for power-of-2 sizes. And as far as I can tell, all
> > the hash tables are powers of two.
> >=20
> > Comments?

Thanks for spotting!  Patch looks good to me and the use of the hash
table significantly better distributed.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

Kind regards,
Nicolas


--O/lgowdIW52wEdIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmroM2cACgkQB1IKcBYm
EmneNBAAyJir/4UIBI6f1U8zm5isTcfVvFy5Cafw5rrchTka5eVSqMIwnpM0lHb2
KC6+MNS45sd84pEmBzy360+7/Bkt+fRPeBLO+hVVAkBTE9Vi1fLuZNStjOLvX93I
BOAVct461dtR2+WFDvv6fs4JHYJUo/5Tyfg0EaDphB6syu39Un+HiYH8ZWXV6QxG
3DNPwIfbB3JZmDTMP/AfBZnHP3PsErvf/Or1tWwoW33Db7MLOD4K9q4bk9VnMe/k
5hSfnbhIgn3HNPDrO8AVfR8eTKT3ntc/LbpGI+9g/tC1ybdqA0n1yMKRiLlIHHlI
Ydxn4lZqsUf0IJ/wrRWxNs/YcxOkb3ldbQhdXehBu7N1JT6KgBo1KCAl7+5KFJ1w
33ANDIaGjsZO9jaDtbGqQiTCFR8VqYB/Mui9jdIa3xZB7EkV899AmEWmCzDaY0k3
pmGDspbOwJ/LRHpRx+JCrcvtvbqBr9jUXxlprB4XZHH33HmlDpfPCbH0LOz/M/VC
mZ0kM0MmcDe7baDUnIlxhJdWXiEqkLQDwBhSJIKwh7hEdAuf87UhJ9fFu1nUFsqf
cFjVapRybs052e7i2AG22p8HotJoi2vMOqQpl9WFuLwU1zXwWO1vACui7Ja9rcpI
nttymQSmnZwKoIF5ruW5r1nYKdfSy0pRFn7IH0M1eDbHDDmlqow=
=ugZf
-----END PGP SIGNATURE-----

--O/lgowdIW52wEdIz--
