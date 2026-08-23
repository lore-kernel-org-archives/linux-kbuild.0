Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D03AFAE4
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787523164; cv=none; b=n88QfFGtz46NNKlocHIW1UBNMM1o0NnMozFrxKpiJARL1FfarvXliy+7puHIeQiNPfeK033L5SgH9b7djRVKTj4GT/Dve0azEaxsj6X/ahRN+vCH4Vc6GUx+YIeFm1AFGJFpYovEkEjl8XqSniCSAP1Dt79CG5Sa/dqeCy2tsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787523164; c=relaxed/simple;
	bh=GqPg7liRNMqrm8j4qggfPJWb6w6iifsnP6+v+SgJcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7IcQvQ6L4Dvz7IjxphjUAE6f/LNSgv3rk8RBScC0hQvVAk9jSeZF77cA6/rHiBqwOuWrSUnHsDjmvnE84/xpql+ukqkNMOuX/o/LlXv16STwldbiWJFf+GrjeTDbTeNHt/do5hSeCUXAjB5wwOyFWI6AF7L8ZYw+mbRnGrMqRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HtAiPHmN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HtAiPHmN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso7351997a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2026 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787523160; x=1788127960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//7iEXuM0dwaErrYwlxiIsbco7Xb10BSWAJJRQqIeEQ=;
        b=HtAiPHmN2cDwcdR57+nVPm79Bqmt5EFmrechceL9eOdPqvtm7XlhCdN90EfvrYvC30
         xyiSqLbWFXgRVJ2uF7cDWOuOSFM/OtpL9Jq06wbBN9U7hl0Z1+3VDXlwRWJA1JGakqoF
         GF5k0u5gF97lYRquh2NIOw3Jj6kZTKKJbn9W1dujbFmfFlYKMGyWLz7i98bVU34bfhD9
         FKug+jvyVP1TCFBby0MAFYlfcWF7S2nPMhtwgA1iLzf7NwHw5j3a3vdbQVKQGzaaeqVE
         UAmGHSVqkpdxdl8cqRT18mdu9gBcHZrbPXo/N9A9zPnVIflAQ5qUJyxZlOEMu5wwzbod
         89ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787523160; x=1788127960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//7iEXuM0dwaErrYwlxiIsbco7Xb10BSWAJJRQqIeEQ=;
        b=Xm6Ye/G+An/PQlRffmIH43hhYQsoo9yELmjQQrhOn5E6SE6UcmNsdptQVyNhJZKmYB
         L05+dPaQweLQZzDfiZ38gI0ps9AnHT94S2HhcZuj4LtElXfqYGnHrNNqt01IQ3tMGINm
         NO2J2cPurYUtOPZufbyuFXMqk66cdWkH7NEs3yRiWDrlOc6pB3azyO50fNGmp/xECTFw
         xVsJ7Ao5FePv9r+FsFF1g+sYeR1LDgpelyavbN4XwB7V7uKNskJw1OnLOc2JInGS58q+
         Q7Twum6HpyLCB/PFhD5nGAuFul7ntM5CdQ+Bp2KppLebr/6ek5ilwq8sf0G9LAb+jrZz
         8SXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAn16ag6sSEL04REv2soxgNDieXu/VjRIexNAV06D79AfQ5PADUSKLyBuZZQmgyWE/R0gbuIc3CR5m95c=@vger.kernel.org
X-Gm-Message-State: AFuF++lhhBzxxnoid+pEhmjgfoIBddiZqWvuVRX2MD/ENgsylqAHyXK/
	5PRxsBHq0ocSntaf4yI+LUqjMX4JZtUySzLoiFQCNma9z4hRW18WDLGigkfXz70Sq6Y=
X-Gm-Gg: AR+sD10bYAyrj7eyNhJbot+MH9dV3c+Z5c46BQBeLpIHYpR4/0N/yDb9kgoQU/Nss8g
	flmTLkH+iQj/m8H+AjbS4ZkAGS+Jdl0dF/bAJ2HMLvxaq8DRJRTBNeddIobiLEiVrl7cv7poDS+
	HfeFeIw5UImtaaqrWbSd9YmqbfUulK6JgAgM4ql9Je0pdNP5R5gGGk/ffNlZEHHWGmFDCUgthl0
	T8vxgzNxFxpKMeJPN2c6ujbNyAE9yibtLPJmqV5Fs76B8/8qBVXKHgaEg5EZm42cQ59xqv9LJWZ
	haTgGKGN9lf33d4QKwSWs12OY2B3poTiawsIHAAkaz/SOzSVAnbbd1qLwjxVtadyuZQBYNjJ9xn
	4tx9itoetOghhkcyy6PZ9xDdc3GoT5ric+y730yXx9uQ9F1cgUcfkfhGYtoTQe8NYL8sJLcJV7H
	UfIyRHzyTgWl0canRfLU0I5H38xTduIaEMkjh89fiwRYAbXx9ygvji5xbwXw8/D9/U44KKPvqFc
	Jqx
X-Received: by 2002:a05:6402:505b:b0:69c:811f:8f5 with SMTP id 4fb4d7f45d1cf-6a42f1b9325mr25356134a12.6.1787523160405;
        Sun, 23 Aug 2026 15:12:40 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6a59e00108asm7547158a12.2.2026.08.23.15.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 15:12:39 -0700 (PDT)
Date: Mon, 24 Aug 2026 00:12:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	kernel-dev@igalia.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	fsverity@lists.linux.dev, keyrings@vger.kernel.org, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wpan@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-sctp@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, bridge@lists.linux.dev, mptcp@lists.linux.dev, 
	rds-devel@oss.oracle.com, virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
Message-ID: <aotteDcc588iwC6g@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
 <aomlfGJM61qZKxx2@monoceros>
 <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dsww6grbwx7uy7i"
Content-Disposition: inline
In-Reply-To: <4e3eaf1d3419e808be046035f114bf6c@igalia.com>


--6dsww6grbwx7uy7i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
MIME-Version: 1.0

Hello Mauricio,

On Sat, Aug 22, 2026 at 01:57:24PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-08-22 10:41, Uwe Kleine-K=F6nig wrote:
> > On Wed, Aug 19, 2026 at 03:16:16PM -0300, Mauricio Faria de Oliveira wr=
ote:
> >> The MODULE_SYSCTL_TABLE macro emits a struct module_sysctl_table varia=
ble
> >> with pointers to a sysctl table's path and entries, and table/entry si=
zes.
> >=20
> > That new struct doesn't seem to contain any pointer?
>=20
> The struct module_sysctl_table fields .path and .table are pointers,
> although with kernel_ulong_t type so that the same 32/64-bit size is
> used in file2alias.c based on KERNEL_ELFCLASS (and not on the host,
> which might differ with CROSS_COMPILE).

Cross compilation isn't an issue for the already existing device id
structures; many of them also contain pointers.
(While modpost doesn't use the pointers, the size of the structures must
be known to correctly interpret the arrays.)
Also sizeof(long) differs between architectures and I can compile for
arm(32) just fine on amd64.

Additionally there is hardware out there that has sizeof(void *) =3D 16
but sizeof(long) =3D 8. Up until recently I worked on mainlining that (and
it has business reasons only I stopped, so I guess and hope I will
continue at some point in the future). See
https://lwn.net/Articles/1037974/ for some details if you're interested.

I would be great if your series didn't introduce a new obstacle for
that.

> >> That symbol will be handled by file2alias.c (modpost) with the changes=
 in
> >> mod_devicetable.h and devicetable-offsets.c.
> >>=20
> >> The option macros MODULE_SYSCTL_TABLE_{DISABLE,UNIQUE_ID} can be used =
on
> >> a per-file basis to disable the macro and change the symbol name patte=
rn.
> >>=20
> >> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> >> ---
> >>  include/linux/mod_devicetable.h   |  7 +++++++
> >>  include/linux/sysctl.h            | 42 ++++++++++++++++++++++++++++++=
+++++++++
> >>  scripts/mod/devicetable-offsets.c |  6 ++++++
> >>  3 files changed, 55 insertions(+)
> >=20
> > Please put the new struct in a separate header. Apart from not being
> > about a device table, I'm currently work on removing
> > <linux/mod_devicetable.h>. See commit
> > ad428f5811bd7fb3d91fa002174de533f9da94d7 for more details.
>=20
> Sure; I looked at that earlier (thanks for the instructive commit
> message, by the way) and found the new struct to be similar to "struct
> cpu_feature isn't really a device_id struct" (not moved), but apparently
> missed the trailing "fow now", which is clearer now. Fixed for v4.

Yeah, I didn't move that because it was an outlier in the header as it's
not a device id. IMHO it should go to something like
include/linux/cpu_feature.h.

Best regards
Uwe

--6dsww6grbwx7uy7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqLcFMACgkQj4D7WH0S
/k74fgf+L2E+C5s7/Uv60MggM8SluqqYOIYVRQMrJ0YZ292Po2lSpcrxuhUuQU2B
oXhO4fsc1HgZsK331x/O/bMuTOPLltQaKOsxLiMi24UglNQqmujyzSUFLnsr9NlL
1xjI1icd6tMaie8k1PK7ynotnvtfYE9Fbl/52MAUgNFbTbWqnaXhNv+fzm/C72Cc
xjp+GuDi0DimbriiFBYP3aUccUEUCgsrwh3Zwss3iQSaV2gZ3Y+jYlUBB3YlBSZQ
+m5a8ZWC4FeqCD+8NXyqc01adbOF9gkilqmoa2KsUhRY9+jPqn0pQhpfPxEl6Lf9
/YNG96sk855Er0BHcQ1R8Pg+AcsRrg==
=t37g
-----END PGP SIGNATURE-----

--6dsww6grbwx7uy7i--
