Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804945;
	b=T2GbwX1lRTALS/TM5/22alGw933JNZgqm1bMVr/Vim3w1sE01X93scm3hQ1ducfekczp
	 AxZ4nmb6cAc0a+SbBlFfvBViWjlK69e/2etv9crZXEC6IlMAFIv14mE+TPqhUTynEbFK0
	 JwIfdFxSZHlJ+djGbni+VYKFZaOKA0UfsL/vuGa+NG1QA+oC4NSXjcLVQbaTlXFBhA1jS
	 J/Dvf9fGQ4QeCgOts8bVS8toFK3NYyj3hO+Ujoc5QTKszhcS1qZmiWuxEwIV63EOjiKtm
	 oadKYiiEF1GBI+Xk9mKm1SP/xEVeul43rnhnWlkylipjYq0bx1xATIYMgxsjjXN/Yjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804945;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RF/lxF/GRrAX1+vgdrPdo1YknDf4bwTDp5A5QjxjO+A=;
	b=YPTsG7iKHD32fWsawr/C4IWWIcNa5RDkIq6tE6xchMabZA1Y3QwQE1USDTiG/b7Rgxrd
	 NbWOhyGFkFG88Mz5XT0yjznLA/NJRZjEPX/ZYrPfVVzcMP3x9mftRM9m/53sjGSz33qDV
	 Sebkjcq54eMWI4ptA659Z6uY9Q+DdN2iVl9W40wEy/yJ312ZfeivVsxiKkUXOg/atLGOk
	 Bu6KY8wJWXxoCaszywxT4J0XfS6Hq/P844iszCOd3MveUcjTE5+ytbfJXSCrA147/9cbZ
	 Wb60/zxxTrRWxTqH5PVTwbWbZ6ym/cLhEAHfRElj/NOjjaqe/h7gkVSTZXXQZN2IcYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFOA+52x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18313606A326
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFOA+52x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723901F000C1;
	Wed,  4 Nov 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804944;
	bh=RF/lxF/GRrAX1+vgdrPdo1YknDf4bwTDp5A5QjxjO+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFOA+52xpMrsmG0R4g0ATrkeIv+TqTxOHCxIKl7h9EStj6WOMP4HMoUVihcmRWew/
	 cYtKnifkTQrMy/FotwLUsw2hdorLomneBiqHbc2cO+hGSgUZNes0+mQwIGNvGeQOkI
	 PAQcgX1iWxihNHVcwU3IOOrOFpieALG8eI2KiTdRyWBm3r7nmNg2spLGdcoM3Ml12Y
	 jdxTBCoKk74B1X2/T/CSCjiBqloKdBNWJaacme51v5K8rRnN/Vgxe9OmGMwztjs0y6
	 XK/5DvmumEF2CksS+EYdlwZg9RTPsNRVe5SQcclMNWtKS1OgTVpsLUQsDcY0A6B7Rp
	 Yn5X79Hx12rmg==
Message-ID: <sashiko-outbox-197487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation: admin-guide: Add kernel minimization
 guide
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matthew Weber" <matthew.l.weber@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, "Thorsten Leemhuis" <linux@leemhuis.info>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, linux-kbuild@vger.kernel.org, "Dmitry
 Vyukov" <dvyukov@google.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
In-Reply-To: <20261103150845.13008-4-matthew.l.weber@gmail.com>
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
 <20261103150845.13008-4-matthew.l.weber@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:09:03 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Documentation: admin-guide: kernel-minimization.rst references none=
xistent scripts/kernel-sloc
- [Low] Documentation: admin-guide: kernel-minimization.rst cites nonexiste=
nt workload-tracing sections
--

commit 0e6d4d6be9381b61780fc4af63f1b4ba2d519ab3
Author: Matthew Weber <matthew.l.weber@gmail.com>

Documentation: admin-guide: Add kernel minimization guide

This commit adds Documentation/admin-guide/kernel-minimization.rst to expla=
in
how to trim a Linux kernel for a single known workload running as PID 1 und=
er
QEMU arm64 with CONFIG_MODULES=3Dn, and how to measure the resulting build.

> diff --git a/Documentation/admin-guide/kernel-minimization.rst b/Document=
ation/admin-guide/kernel-minimization.rst
> new file mode 100644
> index 0000000000000..f9bab60ac6d2c
> --- /dev/null
> +++ b/Documentation/admin-guide/kernel-minimization.rst
> @@ -0,0 +1,413 @@

[ ... ]

> +Deciding what to remove
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Follow :doc:`workload-tracing` for syscall and kernel-path collection. U=
se its
> +"Tracing a minimal user space" section with the program from
> +`A minimal workload`_, and its "Mapping observations to configuration" s=
ection
> +for source and Kconfig analysis. Re-test each removal with the same PID 1
> +workload.

[Severity: Low]
Are the "Tracing a minimal user space" and "Mapping observations to
configuration" sections missing from Documentation/admin-guide/workload-tra=
cing.rst,
or were those sections meant to be added in a companion patch?

Currently Documentation/admin-guide/workload-tracing.rst does not contain
either of those sections.

[ ... ]

> +Counting kernel SLOC
> +--------------------
> +
> +Install ``cloc`` for compiled-source counts and ensure ``python3`` is av=
ailable
> +for generating the compilation database. On Debian/Ubuntu::
> +
> +    sudo apt install cloc python3
> +
> +Use ``scripts/kernel-sloc``; ``scripts/kernel-sloc --help`` lists its mo=
des,
> +requirements, and tool overrides. Successful runs print one integer on s=
tdout
> +and a human-readable summary on stderr. Errors exit non-zero without a c=
ount.

[ ... ]

> +.. code-block:: sh
> +
> +    # debug-info estimate: distinct source lines represented in vmlinux
> +    scripts/kernel-sloc --report linked.json dwarf vmlinux > sloc-dwarf.=
txt
> +
> +    # regenerate the database only after completing this clean build
> +    python3 scripts/clang-tools/gen_compile_commands.py
> +    scripts/kernel-sloc --report compiled.json kernel . > sloc-compiled.=
txt

[Severity: Low]
Is scripts/kernel-sloc missing from the tree?

The Counting kernel SLOC, Reducing the user space, and References sections
instruct readers to run scripts/kernel-sloc, but this script does not exist=
 in
the repository and is not added by this patch, so those commands will fail =
with
a missing file error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103150845.1300=
8-4-matthew.l.weber@gmail.com?part=3D1
