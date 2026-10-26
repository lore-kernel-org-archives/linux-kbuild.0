Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793053489;
	b=XWqW9+92VAZeQ6hw/LYkBNwTvDylKRCnmTViYLy+rMhl//snAFqEwK3hkn6ZVOU+7L7L
	 B4NXqfKF/Wx3VBl0g409V/jqjJ/y62Kcogsh74Fs9StlnWJiStgsf027LAp8RqD+7mKsj
	 04FgrBNiQyu3Itd23KKVdvCbUGMDDRcn07KXcjm3vby8obIukWJRfaRaLPedouqSoZVAI
	 Gl7CuE32kD56FKOuXlTcDn2jl/doTfj66XTL9o7/yKiFbfGNnQ4CQmyXUxu4PNhanGVVc
	 JwGE5gC+YCgDKWD+9QfNvGdgzHoMtnrF7AKbjgzo5Gk0Bakv38XrYEca6KwDtU3yG+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
	b=e/plwO2Ad+wCUyJQTKwIwa0Os5LcXiD2bnzMBhO8Myhq+tibI/1RBaWnl/OJh79OgDqr
	 24WXSRVDVAn7AEoVLDoK+mPHdUVBUS+NyHcPzRyntOmrjfuObq3blLWMaiHSoIrjHyRiG
	 w2xWmCV9BE/YJ/ugkUmw3sF6PH/2G58aYjJRgoNa8w6R5t5dsxiK/XoHv3/bSTIrMKccW
	 M1g1w6s58lJUXxhP0K/wynqyvGbjg2txZKILzHO5zOZchICPogs/QkkEl+GqVVXyUlmxD
	 enjCNYgfipA7VKOg5jfDO1/HGCYBN/Qmk7Xl5r5HutCYXuR2faq8wm7q1OE9Z2LABiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c2s7DBsk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA092606A31F
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 22:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA092606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c2s7DBsk
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3454805d50.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 15:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793053488; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/m/2gZc62bVLNxmW2Yi4EiKMt5JEXx13WHahS8QHvmpUMjDPwNkILRhjes8kXqi9Q
         D/Ukc/CW3AroB+7aDE9LhX7Kxb5Y7qyEiVe9Gb0GG5CffopOgeGv7bLPEAVM+G/fjcHr
         +xTwG9IpgRtXY0u4pFbUTYUlwe6E3ONM1MO79jvi+UES13RInyNpE1IGDGz7Wx1DFQiw
         eLrEoAzvsjdEnUdlS1sHSvTAm8/lBlemqXl+1U5HJun8cfDU4PnxospbbVWIaNlBfhyn
         MvecOBzv0cZJWaPS5+XjxaPrrMYL6+iPrripNz6XDwqXbyhV3/MTApLv3hp08yLSKnHg
         vvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
        fh=PNYGJwP2n2OVQAn2QcQlZWdcEay4jPak+yGP8DzXUHA=;
        b=Wf/1qROrkJFB3URXH9smR4S7wCcWKsE//GbGvDmb+kNMmss6QJU+S+AnEy81kIQJSy
         sC/rWpo+gcL2Y5Qj/WLfXbPNOEn0oFiBbO88pdyUR1L/q0ja2LldM0tNYbw14JN27Kl8
         55KoK4IJJA2lCCoGZ+TqhCw34Ja66t0SKibk3RC5EtsPfxB6FCEC1jaPBv5TwN+NBRXT
         WkCzmQkZjwIfPlEgoD23kIyLpo70i9muYXHkdco/rbxF89YU2cjMY+W6WDcu80XGEhes
         Q/ayaixmnU9YUUW42hOe+SgXe1dsXtz4SzAwTFzJdbpsumKgTKKSVZuE92WzPXiHPiiN
         H34w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053488; x=1793658288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
        b=c2s7DBskOhvfJJ61QD/0Zb2RwvTJAtol98X82VPH5bJCdK1jeJCuXYj0R8Pfkd0/6f
         u/+qLRW+SIs6mqZu/qievNAx+5F/Ao0g6vtkvby05zNHa7lRBUYKowCXXR5gjpIzXmri
         Nx4S2Xr1N9sOvPFYuLcs6PGg9Z2COyVbdKAKvgz4Jo6DzJqYdh2WIQlQ3AZAy+Pq/ffO
         zXmFhzkHILnmPBpjImE1OblR0yhc8mAMLf1k3sClKY9JOtz9VGEpg4w9qUDHX2fm71Oc
         Sr5g4JlabkOj1rxnvmiNGF/EXksUCBWTEzI0Z+k/TpNJ0w0t2HLdpm0+i5hVUsolr93i
         5yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053488; x=1793658288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVjafvKaFWiL8zTdM57JrvEcpVYGEcYrmsTnFX/+S2w=;
        b=qohB3gHTjzF3A8QKmdWKq0plhMMbqYlPkcFiZiTOpWkySdeSF8EKVKIYc9uCJuMPUe
         pnoH2cMj/WoMYIRN1qcEpCILJZqMRavTYgwcx7id5iGX+G2Yedjm4mDRSpAOUZ1up0rY
         YcKGg9nP7zMGbK6nZ5ZmpurTTUQcHJOExtYo9aitko0N0R/H/rXLvcvfCSy2vvBInbGI
         pkRJvtBQ2DC7apHKi21wBX9fTWE3BqrE5oHI1txI4vOMeSman4PJ0MGi3k8IJWvQ81DN
         jK6GFi22StRXYwUw21wvRFgI6gtTHf6PDCZQZX41R7LrW2g6tkvRB7ZNDuCtbq7QTXhc
         T5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxJDfRWAGg0yqwFatkXeoP7ESNOcVRbSyK6a+0q56blsIEzR/4jA44hJ9sFW+Xf8XQ4S5CpzsA02gm8y7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeUUjk/V0HtTKAz3H2hMwEy81nsJP4u7Araa+0BIWN2peVjDys
	yEQa7KdAk5+llgSaYeMrzbrR2cedr0YajbCJT7rfq1YhGxqWcn0olSLkBpQJXNu/T/mqtF9DdqN
	RgqeOhxKybMZFVtoZBrYhAifHvTgaoI8=
X-Gm-Gg: AYBFou39HwVJoteIy2KsMFUAjZk6b0poJAtx5OvMws4MAmwFDKq0mvMwsthzHnMPQPx
	Y22q62pmLIFDZOrF0hm2bi/Of5fVBxWkGc+k6/bNKpAmDNkFJT68zwo9gvLQWlFktOh0hg5B3La
	XmfneOwTHFynDU7jxOy8U7ZbatjwC0emi6gP7dQL0hK6Kq/1AdE1aQuV9FZRBK5aCDiUjK5naGf
	VOznZk35A2jtdac9CAB1zxPXPLfAWCBn4iM5hVoiGGfyb8seOJYWrQwlObsyQ5nkKhEVPdnA55l
	+AY3WWyayu5WsZyRmx689EUIoOAM8cuTPTEVA6FR6lm48PvTf71r9Pb5DZBgYMp8Q4B73V46dV1
	X16p2e7xmv1KfTv3Y6f9tJXvGr3eINO3I1D9xHWU0vaxF+pnhieubWn4XawTudPd7/B4fiUMn7w
	W7Sxt84OOj7WijjB7Bz6Z4JYfksdbrp70TtaMS
X-Received: by 2002:a05:690e:dc5:b0:677:cbe8:4fce with SMTP id
 956f58d0204a3-67a45500fcemr5471600d50.79.1793053487746; Mon, 26 Oct 2026
 15:24:47 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-1-3c8cc5725def@gmail.com> <sashiko-outbox-170708@kernel.org>
In-Reply-To: <sashiko-outbox-170708@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:24:20 -0600
X-Gm-Features: AclHuK8NnuLVLON4lfx7cNxK26K-bWlrdBylLKsqpFu-v1Gz5G-bY8ivxELQPKw
Message-ID: <CAJfuBxzw4jWufuQhgstnYFtkC=+VyV9nNLi9R3xTuJEVsWbuNQ@mail.gmail.com>
Subject: Re: [PATCH v12 01/40] selftests/dyndbg: Add kselftest script to
 verify dynamic-debug
To: sashiko-reviews@lists.linux.dev
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] selftests: test flakiness from unfiltered dmesg temporal slici=
ng
> - [Medium] selftests: test failure coupled to unrelated kernel/params.c p=
r_debug churn
> --
>
> commit 56bb89808ed29ee403a2b674106329de27cb9b06
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> selftests/dyndbg: Add kselftest script to verify dynamic-debug
>
> This commit introduces a dynamic-debug selftest script and a reusable hel=
per
> library for baseline-change-verify testing. It uses spatial control-file
> slicing and temporal syslog slicing to verify valid syntax, error handlin=
g,
> and basic queries against the built-in kernel/params.c file.
>
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > new file mode 100755
> > index 0000000000000..c1475c7555429
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
>
> [ ... ]
>
> > +function FT_basic_queries {
> > +    v_echo "${GREEN}# BASIC_TESTS ${NC}"
> > +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > +     echo "SKIP - test requires dynamic_debug built into kernel"
> > +     return
> > +    fi
> > +    local f=3D'kernel/params.c'
> > +    ddcmd =3D_ # zero everything
> > +
> > +    ddcmd "file $f +mf" "$f"
>
> [Severity: Medium]
> By strictly validating the exact state of kernel/params.c and hashing the
> normalized text, won't this test break if an unrelated upstream commit
> legitimately adds or removes a pr_debug() in kernel/params.c? Does this
> inadvertently couple the selftest to unrelated core kernel changes?
>

Yes, there is a certain amount of dependency / brittleness
IF kernel/params.c is changed in certain ways.

That said
1. kernel/params.c is one of the most stable / unchanging parts of the kern=
el
2. tests that change flags and verify the changes are needed for
adequate coverage
3. tests against builtin pr_debugs work even when test-modules are not buil=
t
4. line numbers are excluded from the verification, eliminating that
source of breakage




> > +    ddcmd "file $f +l"  "$f"
> > +    ddcmd "file $f -m"  "$f"
> > +    ddcmd "file $f =3D_"  "$f"
>
> [ ... ]
>
> > diff --git a/tools/testing/selftests/dynamic_debug/syslog_hash_validati=
on.sh b/tools/testing/selftests/dynamic_debug/syslog_hash_validation.sh
> > new file mode 100644
> > index 0000000000000..8c6e91f5d9c27
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/syslog_hash_validation.sh
>
> [ ... ]
>
> > +function verify_dmesg_slice {
> > +    # Slices dmesg, computes its hash, and verifies it against the dat=
abase.
> > +    # $1 - unique test key (e.g. normal_513)
> > +    # $2 - optional start marker (defaults to ${APP}_START_${label})
> > +    # $3 - optional end marker (defaults to ${APP}_END_${label})
> > +
> > +    local label=3D"$1"
> > +    local app=3D"${APP:-DYNDBG}"
> > +    local start_marker=3D"${2:-${app}_START_${label}_$$}"
> > +    local end_marker=3D"${3:-${app}_END_${label}_$$}"
> > +
> > +    # 1. Capture the log slice (exactly once!)
> > +    local log_slice=3D$(dmesg | sed -n "/$start_marker/,/$end_marker/p=
" | \
> > +     grep -E -v "$start_marker|$end_marker" | \
> > +        sed -E -e 's/^(\[[^]]*\][[:space:]]*)+//' )
>
> [Severity: Medium]
> Since verify_dmesg_slice captures all kernel logs between test markers an=
d
> hashes the entire block without filtering for test-specific messages, cou=
ld
> concurrent unrelated kernel subsystems (like networking or RCU) emit prin=
tk
> logs that alter the MD5 hash and cause false positive test failures?
>

All my testing has been done on VMs, they are well isolated from
unrelated subsystems.
ISTM most CI-CD testing is done that way.
If needed, we could easily add grep filtering later to select only
relevant messages,
but it adds its own maintenance burden; it doesn't seem like a blocker to m=
e.

> > +
> > +    # 2. Compute its fingerprint
> > +    local fingerprint=3D$(echo "$log_slice" | tr -d '\r' | md5sum | cu=
t -d' ' -f1)
> > +
> > +    # 3. Verify
> > +    verify_fingerprint "$label" "$fingerprint" "Dmesg Log" "$log_slice=
"
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D1
