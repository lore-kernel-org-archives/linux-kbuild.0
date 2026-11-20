Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207533;
	b=ZSbw5BYVUvB9TGkiwcSziXGDPE02iB7NzcbAWaqmSyg3xH9ZTSn8D60HtcLB6EJQIuIy
	 bLs9hS3ypSpn1NCJgdFBdQ4a4bWwrOwKEuyxoKYMbHxmQOpAz63CeXr9R6+Jj3kYB43wD
	 xEUcZ6ph5oNKUXxKAdEEGDy9Slfelf1vpNP75gpmS91qJZlvKKq+MUc2bp2rno56tVU9N
	 J+vqS3/puML6r5h+alWShsl4YHiGVXc494Tahxb4SWEoYJM9KhP0g+Vp7yf8FUEhd2+24
	 dketT+AjwsxaASvYwiG57ficxD6p70JgR2AnWhTp9ufYkWOpuxiX5xLHMBBAGiJDAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207533;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=As7wgnuaTDmdzucyAyvtnzrGfDzLFSOkyHn3nxH5xv0=;
	b=t7er0ymPdUk3iTYbpYMaAS/FoK4CBm+1SEmQ2hGeec3JamGo+0NUadsknG+U2YisL7wH
	 9fIr/EP5eH36BihSDFnLLnLYbbTVrYvUHC2PKc/TFjJSD0kdQlVyNXINdpuwqMtc7iM53
	 2hY0KozfbTVsEv1vpU1C0HjK8sK/KKA4lncw7G5821bjHnf7AWypTEnIzYtl3woshTO+4
	 kUidJ4y13O/AA5oJoNi6eNoKcCat+lGg+ZQuiWVGvnxH6wY8/yPhvK9HZ7+S78cDb1Ryc
	 9yu4FHFyTkY/vx+XpGMp0v83k2kU58Ta7b9uL/5oHfAj/iMZ1FFB/gJ3VKDHgbpSEkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMjT760m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2A606A8E9
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMjT760m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1591F000CF;
	Fri, 20 Nov 2026 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795207532;
	bh=As7wgnuaTDmdzucyAyvtnzrGfDzLFSOkyHn3nxH5xv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IMjT760mDBdwo8JHxbCq2fSXeON7OwrWRUfrVM5a5qjCO91yQlej4cocdhdhUr4o7
	 bdPjBninZPb4EFusrzmerhloZw7lkiAqMaRkhsz/BXVaKTqt1Gu33WD9QrToGNt8rU
	 QrNP6J4fw8Wki2YiRV1oCxq3uNRJ/5vTMhoW/ik1IYxfC7LDoh8kS5J6E3JNuzLvCk
	 dDIB/AzpS0GOb5mlmt2EFwNk/dOYla7E3g4C9Zt2fCklkaJWFZa9OVvEOT0qFSm12V
	 Go7h7Or/UjYS2TejZMg4WagnDHM4VKghLn8AK1IHYei6O5T5Gbx4j6Pt/hi42+dgmo
	 bdE7TQpU7ArYg==
Message-ID: <sashiko-outbox-226092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] kbuild: record cmd-prereqs in .cmd files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luis Augenstein" <luis.augenstein@tngtech.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, maximilian.huber@tngtech.com
In-Reply-To: <20261119204457.9968-5-luis.augenstein@tngtech.com>
References: <20261119204457.9968-1-luis.augenstein@tngtech.com>
 <20261119204457.9968-5-luis.augenstein@tngtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 20:45:32 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] kbuild: fixdep: strip leading ./ from dep->name in
  print_make_prereqs()
--

commit 893f80d84c71797a734bc7704bb47fc515aee146
Author: Luis Augenstein <luis.augenstein@tngtech.com>

kbuild: record cmd-prereqs in .cmd files

This commit records prerequisites not covered by deps_<target> as
make_prereqs_<target> in .cmd files and teaches fixdep to filter out
dependencies from the current depfile.

Link: https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtec=
h.com

> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e246..94a0711b66934 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -181,6 +181,9 @@ endif
>  # (needed for the shell)
>  make-cmd =3D $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(c=
md_$(1)))))
> =20
> +# prerequisites to record in .cmd files, excluding those covered in deps=
_*
> +cmd-prereqs =3D $(call escsq,$(filter-out $(patsubst ./%,%,$(deps_$@)), =
$(real-prereqs)))
> +
[ ... ]
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index f514ef606ec63..005c1c3df494a 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
[ ... ]
> @@ -478,23 +480,63 @@ static void print_dep_file(const char *target, cons=
t struct dep_info *info)
>  	printf("$(deps_%s):\n", target);
>  }
> =20
> +/*
> + * Print make_prereqs_<target> from prereqs, excluding the deps listed
> + * in info.
> + */
> +static void print_make_prereqs(const char *target, const char *prereqs,
> +			       const struct dep_info *info)
> +{
> +	struct item *seen_prereqs_hashtab[HASHSZ] =3D {};
> +	const struct dep_item *dep;
> +	const char *p =3D prereqs;
> +
> +	for (dep =3D info->deps; dep; dep =3D dep->next)
> +		in_hashtable(dep->name, strlen(dep->name),
> +			     seen_prereqs_hashtab);

[Severity: Low]
Should print_make_prereqs() strip a leading "./" from dep->name before
inserting it into seen_prereqs_hashtab?

Make strips leading "./" from prerequisites in $(real-prereqs), whereas
compiler depfiles record paths under -I./include (and similar flags using
$(objtree) or $(srctree) when set to ".") with a leading "./".  On a clean
build, those dep->name entries will not match the tokens in prereqs and
will be recorded in both make_prereqs_<target> and deps_<target>, while an
incremental build filters them out via $(patsubst ./%,%,$(deps_$@)) in
cmd-prereqs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119204457.9968=
-1-luis.augenstein@tngtech.com?part=3D4
