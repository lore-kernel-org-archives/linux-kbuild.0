Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084555;
	b=vuqlsV2DYvE1QPTPTk6Qe0VYcTdp4UwHNpsPOcb0HqxftnT4Naq3yZv6Wrp0qB1uTFyB
	 4CXVbHiNCMYi8XP4kZOfod70/5J6lml62CXK/saVSi8tWHm2aWTZusMAMbUkoYky8n/W4
	 98pphA/wniBS0X8DvmEmBIu/KpeBVn7AzLiqb8xv9d+g5y5v89uV/UiLdZ3YZYhCHnw6E
	 GDin6M2cS5sibn54Jb+Hs+gH7PNKsfD/YXc0KQ+RQEfm6GpcmKZ5WgGGv92pvJRf2LdLI
	 b/s8FMns7VkD09gi/rJZ76buSpGATU+JWucEs5f5+lRAyigAr2j0YJK8aUpd6OM5vFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
	b=HSvOevO14HL9ou1inegjZEQ/g/jCwstjOvBzLrWtgIekOcud8cHaqkEkEveHCerIaJ8u
	 bzOtt6j1KaE268CVS7nHbKaXUUm/iCQCXAWU4y3JkhCYS8m/az7m6hqHbl69RmUr9SNUr
	 tvhjyBL5bhJ4zC2D6M7f9x17doP2FzCCGs1rVsp7JpkGLTu1bBZK7yooURPJY6oi6b59i
	 Ll76W3vsKClrKeg0p961kzwRqwAYCb+0VSsK61Hy1sMoFVR3KWjktoZZDOHgP/6wZ2teX
	 kq0QUZ2lLJK4W7pRiEzUYhQ+H/z6iMlo4w/dA/Dbgwq3aYIxIa1ci3pS8vX3eWl6JJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndNtRwto;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE7606A324
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AE7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndNtRwto
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so105507e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2026 02:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084553; cv=none;
        d=google.com; s=arc-20260327;
        b=r9zOMvxQX2Lh14+a8ljM5WPwMDReM3X5n6BZ+WENtD1v1PwPSb2YkJksZbVl9OwVAB
         c6W9rQMSN2ZuIBq0sooSNrFb5QbzIPesqRz+k5xH2XgZT7nfV1H7F59y34uR3ONDT2St
         gx5o3jWUJLIKpF56onorsxG/k1jXoZ8NA+M9m5EybdW4YpRT1vk9dZsl7QMQj7aVOHQ+
         jJE37yoUto5nYtnD4ng1l7BTdxeHz9ODpGULIVfn6FXZlgEy18EUMJbYzZqa4BRQpfPA
         AEgVLgPJOy8OTbF4qBi6yHa8EDqyZw5ha0MSSA5p0GUwgrJbpPN4j1klsx7Lrc8wSeqS
         jtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        fh=wjS1o6qABV4wy3Ze3s2p34Nc0VLZtUYx42gRlSQ0uck=;
        b=Yz/Zm3/9fd/+tBU9MeUp2Gc676M2t9ZpKKbo6AN9BE3eRaKr2LduUX/Jq9lB6sL2Ou
         N7ODGxrLPC/9oGfZ5syFah59T2LoW9y3kCWftvQYKIflqLreq8cy/xASnyNVG15VkGAw
         Z2EQNvr8rrwvcP6ibJNq+R+JEgjNDG1Bndovj72aaQi/rQG6z9CIi3PILthL1DduVyNh
         PkVkzG4neXPu8NQk1It8WPecWhTBWw9iSPSqvrj7Ljl4XtxibLakUnjQ+QmXh9L/IBfG
         kfJ+O2Vbwe89Jqt1MPpjDVPawcQ+l3k5PM7RxUwoCOn0w4PCbb1p8jwkSqKVtFGUoqP/
         d2rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084553; x=1795689353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=ndNtRwtomifqkf55G94YIgPKmDQUiD1m8EZ0+rvEQ5fkWplEwCT3vrhuUg0TybVOFc
         FDFhMom0dL9XIOE8MwORLs3b0sX2v1NcddjdZy61EQI1R+b+77xyN7bQMdYLzPEQcUeA
         GbHDXy1p6acrSdRhEeh5KCPm/a0R4nREHWcqmHYS8rggx0IEtnl3xzZFq5mo4la95cxg
         09VZAgLtvaU3CWng6N+vH0dxl16QWS9xS+ATMjZZiov4ZKGz0nw8A1UYvZFV/N5To0mT
         6wEpigqmx+96yWAIwqBmSPS7X2ChmDnmqaLIJXgL1SspyBHFL96vSQveV7KWzfymuCZ2
         BJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084553; x=1795689353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=dioUmqMrEcaGRSl/j5XSHauRUUqDwmcxDf+LyjAEU4MNnSmbBndCdqK1VIEZGb4pvl
         cocG8SaLZBLJPZOgovI7BcLy1iCFQqhpa2iYBqSDw3T5bRA3WOoR/XuKAz2eDjZ/9ViJ
         FMhyY68rNgbk4JysSjKUqhKdnzxf/eZeFbjN4Nqc9U0zo1TtR15VomMdKtYKRTA1RVMN
         Ki5NsoxtsjeEPkIPC2LzqigPvNFjEb6Pt3Vx/02ugHahamUYqBwWq+4iyVhFdR4CUMn6
         H3zsU1efzzIFRMEaHuviaGAUiGszphuhaYbYaOXruIisgTUHo1zXIp7C0bRQWeGW9sVX
         I7SQ==
X-Forwarded-Encrypted: i=1; AL+hErGw5uyf3RNDceg0n6UaoMuuKrhReyWtQ1P2qW/zPtyGoTkuYBE0dGnGPfmjDPL+Nfi90bYUf1hYGLUg2iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gaHLV0h0QTYqCHTX9xZB69bMuH8fMVYdMgA2qMLy6xN+pWCbU
	3F1aiutxlKBN+Hk7XpHihgElOBcUBim2dgD01rmVZ0xi7AiWe/iHQIn40gnvz/8g6Fy/TDE3Y3k
	0zsConuC77UAUbS2zvU6m3B6jr5TNvbg=
X-Gm-Gg: AYBFou2ztlR4tR3glQ1cRPkjloEkGxNU7IUPrJPP3eiV1NBFZ7se8bVziOM+ocyDiRC
	VkNr+v5OaiEBc1M852NMFt+CyDvkUID2AIy9QDtPiV5/zRd86eA4SGSSO8Ju4HZIGaC0HRyi31P
	gKoNXRfWTNDUjYx19rkY7ud5wOvQ0MOXEJfC6zkeGvQwMnTc754lWBVgmIfpWU0PyJannH2Q8Uf
	nyUKBgXYEgJKQbDVudS3ZKy+CEX+mdH2CMmFjbzLuHr6bADkclL+Klaj/7qpLynOgN7/wj41A62
	qBRqnFUYeaxNYDBnsiLrdYgHyVv1vmc9Al1KBnZj2NP96MEVunBvOLf0ua6TtWPtlr5u+cMGl0h
	Ng8UbXniZHGd13WNhFDylLvI5KO8A0FeYuDO5y346D6fQUDJfVFPdXs+lb8v5Z+PnqpYZX5mpTV
	66FPP2UrHR8VzVm4ISjvRpSiLQ/GwiMRglRp+CyGV0A/KvI/foSPHQtzEC1siM66rljsqG5JnSE
	xbTTpSACQwvUEX+STCfA5E6HqnGJVzu9X5hZDbdR+JwxhGH3rj8Txv6CKiOahr4FKPAEaOF
X-Received: by 2002:a05:6512:6201:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1aa04086amr2064153e87.4.1795084553237; Thu, 19 Nov 2026
 02:35:53 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Nov 2026 11:35:41 +0100
X-Gm-Features: Aa3M54oL5-b8rD0ZNwQf4CmOodKRTjORBepmsgS7qWBa91ie7LuuwJN18wbz1S0
Message-ID: <CANiq72m0uZRVWG=SwzUUzHo1nPX=2Q3npz-9jU_ORBSdcoAGeA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

I also added Cc: stable@

    [ The LLVM bug is tracked at [1]. Nick asked what function merging
      refers to here, and Alice writes [2]:

        No, this isn't linker ICF. rustc doesn't pass --icf, and in any cas=
e
        kbuild invokes rustc with --emit=3Dobj and does the final link itse=
lf, so
        rustc's linker arguments never come into play.

        What I'm referring to is LLVM's MergeFunctions IR pass
        (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of th=
e
        optimization pipeline, within a single codegen unit, before any obj=
ect
        file is emitted. Clang only enables it with the cc1-only flag
        -fmerge-functions, which the kernel never passes, so C code in the
        kernel never sees it.

        rustc, however, enables it by default whenever optimizing for speed=
 or
        size (opt-level 2, 3, s or z), which covers both kernel configurati=
ons.
        It uses the "aliases" mode: when two functions have identical bodie=
s,
        one is deleted and its symbol becomes a GlobalAlias to the other. Y=
ou
        can turn it off with -Zmerge-functions=3Ddisabled.

          - Miguel ]

Cheers,
Miguel
