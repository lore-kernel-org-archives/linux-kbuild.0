Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937961;
	b=hrb+Nzg/bccXRsGl+rGU1c5ZX3tBKoE1M4Zl5kd4xImM24QUH3OzaROWb9AeEfIrvsGe
	 LbMF7NHUKJBVNGf7TzGILqhawLjfY/pPr69R8SYWBhrk8d9NnwlMdXQwTUlugfmoWpAvb
	 WRoviw7E8LNykQ3possAcJzpDheG1knz7KVtJ5FQkx9P7mjc3DVFpvLIMbW5I2ffkt5Go
	 Y4JXr/BEB3JggaziYvFx2vrGTZlhi194k2GQJXaGkt5hZfMFFFdG9mvvZRIfGRLD2KMu0
	 Wwr7iAFLQWsnYiQHxNZnI4EO6ghnSLevep7kO0KTcKn3B41jq6ZfZJlQ99OD+1BoIYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sEfJ42+HnxzAnYZSzoM/1XTEMd9X+k/VBV2shMzwNJE=;
	b=acRJ9xvz6k/uch6ZTfGhOOvOvE6BJD8uQyTaOVXMmEGpuQz6nDIwajLGNGlCnODhlK8F
	 olT4cl/13Z2OIJwsDQwfbzsgLkRnWqpLzmWfwB2gI6qAbsIfXqqhzmRFwlWUoZM+VWA75
	 v6GdP9YmiDcZTTdmn1tW0hC4njcx0GjWP5o8IjOR0hDUPpmr0vXKkrZ41jHtMgVhfX5v4
	 b2SMwMyNIrxc0JcMnyvAI2l3nZHAK9nMihneGuirEdlichDrZ4W8ngL7LByBsFNzS73vW
	 MF/fVyhiMP4iBEJ8DyvPSWDvTLxtBIzl4Sn7KBgoXhJ1j7nXXlrE1YUhFX7sqzhb9hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJWnN4Q+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D94606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJWnN4Q+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A645F1F000C4;
	Tue, 17 Nov 2026 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937961;
	bh=sEfJ42+HnxzAnYZSzoM/1XTEMd9X+k/VBV2shMzwNJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJWnN4Q+VvwDpidIRihjeRe7cYQ7b4no1VgaM75DKLlK7edRFYHV1FAUJloZMnNVt
	 JU8J67AMNmvIoj2l04pSNXJqTee2tNGEvmqgILEyyhShLtuGoaf7EkfjxJWEpihtJb
	 mrIkHU5HJwXYi6NanT8IVYHbb+w8/jweMRHbVPL/OvZTITRtaJ/7ZWcQRnUwgBozSi
	 3MfzE13hwrTJxNPMsM2MVM1fUPDJ/7azXKoaZ7pvIgUfbqdM/3+KKQb7Wg207czb6X
	 BKyhTW9EP0pw0i+FSJNrQi/2hTZoN8iytwwEcj64U5ZvGBt250XquZDo0VustaeEDc
	 tdE73QdT+w45w==
Message-ID: <sashiko-outbox-219281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] kbuild: record cmd-prereqs in .cmd files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luis Augenstein" <luis.augenstein@tngtech.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, maximilian.huber@tngtech.com
In-Reply-To: <20261116175215.1337416-5-luis.augenstein@tngtech.com>
References: <20261116175215.1337416-1-luis.augenstein@tngtech.com>
 <20261116175215.1337416-5-luis.augenstein@tngtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:52:40 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] kbuild: './'-prefixed deps leak into make_prereqs in
  print_make_prereqs()
- [Low] kbuild: cmd_gen_objtooldep leaks objtool into make_prereqs on
  rebuilds
--

commit 013a791546dd17e4abcec9c63932e5f18a7cbcc6
Author: Luis Augenstein <luis.augenstein@tngtech.com>

kbuild: record cmd-prereqs in .cmd files

This commit records Make prerequisites (excluding depfile dependencies) in
a new make_prereqs_<target> variable in .cmd files via cmd_and_savecmd and
fixdep.

Link: https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtec=
h.com

> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e246..7790519f92ffe 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -181,6 +181,9 @@ endif
>  # (needed for the shell)
>  make-cmd =3D $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(c=
md_$(1)))))
> =20
> +# prerequisites to record in .cmd files, excluding those covered in deps=
_*
> +cmd-prereqs =3D $(call escsq,$(filter-out $(deps_$@), $(real-prereqs)))

[Severity: Low]
Does cmd-prereqs include tools/objtool/objtool on incremental builds while
omitting it on clean builds?

In scripts/Makefile.lib, cmd_gen_objtooldep appends a standalone rule to
the .cmd file after cmd_and_fixdep or cmd_and_savecmd runs:

scripts/Makefile.lib:
cmd_gen_objtooldep =3D $(if $(objtool-enabled), { echo ; echo '$@: $$(wildc=
ard $(objtool))' ; } >> $(dot-target).cmd)

On a clean build, $(dot-target).cmd does not exist yet, so $(real-prereqs)
and make_prereqs_<target> do not include $(objtool).  On an incremental
rebuild, Make includes the previous .cmd file and adds tools/objtool/objtool
to $^ and $(real-prereqs).  Because it is neither in $(deps_$@) nor in the
compiler depfile, neither cmd-prereqs nor fixdep filters it out, leaving
make_prereqs_<target> inconsistent between clean and incremental builds.

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
> +
> +	printf("make_prereqs_%s :=3D", target);
> +
> +	while (*p) {
> +		const char *start;
> +		int len;
> +
> +		while (*p =3D=3D ' ' || *p =3D=3D '\t')
> +			p++;
> +		if (!*p)
> +			break;
> +
> +		start =3D p;
> +		while (*p && *p !=3D ' ' && *p !=3D '\t')
> +			p++;
> +		len =3D p - start;
> +
> +		if (!in_hashtable(start, len, seen_prereqs_hashtab))
> +			printf(" %.*s", len, start);
> +	}

[Severity: Medium]
Do './'-prefixed header dependencies fail to match in both cmd-prereqs and
print_make_prereqs() on incremental builds?

Kbuild passes include paths beginning with './' (such as -I./include and
-include ./include/linux/kconfig.h), so the compiler depfile and
deps_<target> record paths with a leading './'.  When Make parses
'<target>: $(deps_<target>)' on an incremental build, it strips leading
'./' from target names when populating $^ and $(real-prereqs).

As a result, $(filter-out $(deps_$@), $(real-prereqs)) in cmd-prereqs and
the seen_prereqs_hashtab lookup in print_make_prereqs() compare './'-prefix=
ed
strings against stripped tokens in prereqs.  Every './'-prefixed header in
deps_<target> (including headers removed since the previous build) then
leaks into make_prereqs_<target> on incremental rebuilds.

Stripping leading './' when normalizing deps_<target> in cmd-prereqs and
when inserting or looking up entries in print_make_prereqs() would allow
both filters to match the paths in $(real-prereqs).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116175215.1337=
416-1-luis.augenstein@tngtech.com?part=3D4
