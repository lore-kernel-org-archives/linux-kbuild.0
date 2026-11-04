Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757206;
	b=d0KbmU4Aj88UoGMFmCT+h2nZxalDeXwixlGJz9NyNNgCyWGIhU4aiZkCzjD8pDdvSuYa
	 E8HyYMvxjKphkjZy7AW1Fqz2BwKCJxg7KrVXiYMwhuiVSNoZr8B9TA7T8x+GrEbq1tM/E
	 FodthR4WIkuwyFRUFAfUZ9+oUJ6bTIfHNwpu/dVskevMFFqA/8Ls/+vM4AXdD2apK00ER
	 5AP7Od8JdYHWO0uZpiFELU3a1WXNYv1R1w7kW/fIBQbhKSAn5jiEdwradgFtCtmtWK0Yu
	 9EuxFzeHuiIbpT6k8gRcyfNeUEVFpaEyg8mMsuW1lZde5QIweWaXYjisF0l6UxEt1rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757206;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sCrEqs1NI3CDLbV1P5Swm4nctk9m1GTHKu2myJ767JY=;
	b=Eyq1JavlByi36lETbQ9nmubp4lcHRURzDM6S5ww1s2VdkUg2CEBMKjXSACVIjYBcviJp
	 aDFQDzjjwzVn4WtDpCxu793LIG8DX24gue12fUx2bQumzkcUTz+lQlgEAevswxSHyd9g4
	 vNnLckck1qUJnWpDTKr/v5FiJtXvYTie0In91WnI4+1f3NxmRvP3Zpem0/msjEl1N19aQ
	 4tfRwLKW6w02Z89et7jem0Q6Dk9Nlh1JTptJnIN0Gaqz+Bez11z9vugwgcMYvIDHatkQQ
	 yHR6pek8n47hRfwEr4qwfchp2x1t0m/cG8PsIgCFDYvrhbQahRM7O2yONF788xQ/NlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VN9diUc5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E77F606A31B
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 01:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VN9diUc5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9061F000C1;
	Wed,  4 Nov 2026 01:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793757205;
	bh=sCrEqs1NI3CDLbV1P5Swm4nctk9m1GTHKu2myJ767JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VN9diUc5hpbMdMh+ekSVxXn5sfyLrS2WtIG2OJiHpfU6NKZ17QuSVyTQXMzLuzS/L
	 Kn64pf87xENTxTUbHseHkTZMUZuZPghf6GbO3F33629DU2zTPeVJP3MD6RjV2lbefC
	 YP80njJQ+u1XIpsjAVhdvVwyLa96TncrUvtFMA7ShPkqiqLh3Twr6efXCkNvXQg6aT
	 hqIi42WIEDow4EYokxDmV9ZO2EEd3H1gYCU8GZWTuDQzNSUQZhsGMoW4Cvg0Ei0K3W
	 yi8NwVmbhO6btNaaq+YRcingOfIiF4MdoUaNBMnx7fesn9Vr1vanENeE82RvMK68qe
	 1VZYlWVn2ds6A==
Message-ID: <sashiko-outbox-196392@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/20] kbuild: unify static coverage instrumentation
 as COVERAGE_PROFILE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: "Alexander Potapenko" <glider@google.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, "Chuck Wolber" <chuck@wolber.net>, "Dmitry
 Vyukov" <dvyukov@google.com>, "Jonathan Corbet" <corbet@lwn.net>, kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, "Marco
 Elver" <elver@google.com>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, "Peter Zijlstra" <peterz@infradead.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <skhan@linuxfoundation.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Konstantin Khorenko" <khorenko@virtuozzo.com>
In-Reply-To: <20261103015238.3780910-3-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-3-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:53:24 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] selftests: rds: enable CONFIG_COVERAGE_NONE when disabling gcov =
in config.sh
--

commit 971a0caf7cd04a84e0c297870980e1998f44b592
Author: Sasha Levin <sashal@kernel.org>

kbuild: unify static coverage instrumentation as COVERAGE_PROFILE

This commit converts kernel code coverage instrumentation into a generic
Kconfig choice block with COVERAGE_KERNEL, COVERAGE_PROFILE_ALL, and
COVERAGE_PROFILE, while keeping the GCOV_PROFILE_* Kconfig symbols as
transitional aliases.

[ ... ]

> diff --git a/tools/testing/selftests/net/rds/config.sh b/tools/testing/se=
lftests/net/rds/config.sh
> index 2df2226310efe..bb854f49e464d 100755
> --- a/tools/testing/selftests/net/rds/config.sh
> +++ b/tools/testing/selftests/net/rds/config.sh
> @@ -43,13 +43,14 @@ scripts/config "${FLAGS[@]}" --enable CONFIG_RDS_TCP
> =20
>  if [ "$GENERATE_GCOV_REPORT" -eq 1 ]; then
>  	# instrument RDS and only RDS
> +	scripts/config "${FLAGS[@]}" --disable CONFIG_COVERAGE_NONE
>  	scripts/config "${FLAGS[@]}" --enable CONFIG_GCOV_KERNEL
> -	scripts/config "${FLAGS[@]}" --disable GCOV_PROFILE_ALL
> -	scripts/config "${FLAGS[@]}" --enable GCOV_PROFILE_RDS
> +	scripts/config "${FLAGS[@]}" --disable COVERAGE_PROFILE_ALL
> +	scripts/config "${FLAGS[@]}" --enable COVERAGE_PROFILE_RDS
>  else
>  	scripts/config "${FLAGS[@]}" --disable CONFIG_GCOV_KERNEL
> -	scripts/config "${FLAGS[@]}" --disable GCOV_PROFILE_ALL
> -	scripts/config "${FLAGS[@]}" --disable GCOV_PROFILE_RDS
> +	scripts/config "${FLAGS[@]}" --disable COVERAGE_PROFILE_ALL
> +	scripts/config "${FLAGS[@]}" --disable COVERAGE_PROFILE_RDS
>  fi

[Severity: Medium]
Should the else branch in tools/testing/selftests/net/rds/config.sh also
enable CONFIG_COVERAGE_NONE when GENERATE_GCOV_REPORT is 0?

With kernel/coverage/Kconfig converting coverage selection into a boolean
choice block containing COVERAGE_NONE and GCOV_KERNEL, disabling only
CONFIG_GCOV_KERNEL in the else branch causes a few issues depending on the
prior state of .config:

1. In scripts/config, set_var() substitutes existing symbols in place and
appends newly mentioned symbols at the end of .config:

    if test -n "$before" && grep -Eq "$before_re" "$FN"; then
        txt_append "$before_re" "$new" "$FN"
    elif grep -Eq "$name_re" "$FN"; then
        txt_subst "$name_re" "$new" "$FN"
    else
        echo "$new" >>"$FN"
    fi

If config.sh -g is run on a .config that already contains a
CONFIG_GCOV_KERNEL entry (or after a prior config.sh run),
CONFIG_GCOV_KERNEL=3Dy is updated in place earlier in .config and
"# CONFIG_COVERAGE_NONE is not set" is appended at the end. When config.sh
is subsequently run without -g, CONFIG_GCOV_KERNEL is changed to
"# CONFIG_GCOV_KERNEL is not set" in place while
"# CONFIG_COVERAGE_NONE is not set" stays at the end.

When Kconfig reads .config in conf_read_simple(), each choice member moves
to the head of choice->choice_members:

    choice =3D sym_get_choice_menu(sym);
    if (choice)
        list_move(&sym->choice_link, &choice->choice_members);

This leaves GCOV_KERNEL at the tail of choice->choice_members. In
sym_calc_choice(), because COVERAGE_NONE has a user value of n, the choice
default is rejected and list_for_each_entry_reverse() picks GCOV_KERNEL
from the tail, leaving CONFIG_GCOV_KERNEL=3Dy enabled.

2. Even when "# CONFIG_COVERAGE_NONE is not set" precedes
"# CONFIG_GCOV_KERNEL is not set" in .config, both symbols remain explicitly
set to n after running config.sh without -g. Once another coverage choice
member such as LLVM_COV_KERNEL is added, sym_calc_choice() skips
COVERAGE_NONE (since it is explicitly n) and selects the visible,
user-unspecified LLVM_COV_KERNEL instead of disabling coverage.

3. If config.sh is run without -g on a .config that does not yet mention
CONFIG_COVERAGE_NONE, conf_choice() sees !sym_has_value(child->sym) on
COVERAGE_NONE, marks the choice as (NEW), and causes oldconfig or
syncconfig to block waiting for interactive input.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103015238.3780=
910-1-sashal@kernel.org?part=3D2
