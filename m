Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795040335;
	b=uiXK1QELhuY++YL2iP+sT5WM0FoPAhIqYXHjcjUIJKHMUAQ3ozeWIVY3IqCzyxp/F9C9
	 FeM6CV2H+eGVCN4SZMg5LQOJ+aj7QGMZF/EDaM273CxuGojG6QaADDZPO5ZFSG33iav8S
	 EjTfScrtTE3fXiJ4lSeSCwsdDr/TdLnbHmepymMaSSHOoZaUnDUO94ZbJVB25pzqfkjoE
	 kryI7p/97b13GukyqL9SxIAgsi9zV/HVcR0jdAV6sNhctmQjEkRU7qjXQ0el7jHx6MPxQ
	 wDiAr+xRJZxjgDnlyAhy98LdZra1Fr7uaStWjbEHp6hOF4+JuyPAt5zH6OjjofwRQtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
	b=gOeTWHKFGBaxwS7NJEfHOYzRsfBS/2lKxseK2JvWkpGPedDlXIh68eBHagUE5vIJNioC
	 wKbjqlbxzsHw3b8NQVxpM0pr+WPDEV7hixXK8r3uEja7N4PooUfAaf2aaY/8ewqBcA1Mr
	 f4uS2J46COMeeU2j+Qd8jFSLIBIZYpKt6DlKMcdl6uM1Y4GX2rj2six2RutJFP0LbgBep
	 RV6qqmW2aziFkAssb+5r2Wv0MF1snfJSv0CwfCH1aJDJFb7QDn3OSiMJ8DkEiTlV8elHS
	 tBzlNkCLRIr+4BWMDTHrjVoJ8Nq/uFXhforb1NNEVSX7CGhNTHYr4DUrqYumNEYwfMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DhwrPv4G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B8606A325
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 22:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3B8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DhwrPv4G
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018493d57so20215e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 14:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795040333; cv=none;
        d=google.com; s=arc-20260327;
        b=cQYBmvw+CWCmSHwbj1xFQ4kdd9mzIAAJA/pG48E01Ffo6DEQ9ygZ9s6/SPr3NrQGIN
         wrNM89wWea1qnZy4iutpwTPqHLj3QeabFpu/FoUtMzn9N2ybMd6ZksOS6T8JxyyJVNkk
         TlTV3zkunnIVLJJuptOqQYo7TY8KazUF4HRzyI3rVtngrMU6x4qkE3wwpqxuTXWt4RDx
         XG0XflrdGgv296EWBA0deEhhK/o58TpaNmCaXWWl8YNC2lGGZRIpv0t6x3atnWPbISGc
         oWFcbH8y18LrxGEKZ4Zibp3YvN3oKaF3tOvqk8b7x2YqA5hPubjK2YLwbJk3RymW9Zlj
         i/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        fh=p1uVo9cb08wB24dyYTH8C2CSa+NV6xLTERLHv6xkzyo=;
        b=W83NJpT6fihe4+SrgvPtpC/b5SO0w5X96nZo6TOPpnk/ft0MLinlegxb5wOHlP+Kac
         U1AVr79MtdzonnNkV++ohjhXntI9v7QDCKwQgqszxmWuDkfgLDKK9+LXtD7KDYRlCy66
         rQIMNGP1gVjfALAbXdqHIAE1UbEflL+J7KhI2EI9FW0mfhKjk/xCyRNBhEr2JrndTAaY
         +woQZvayY0I4wGFaPTOwIzFOgB6Depv3IPAPZ2WcOAbIvS+C62FI4cYRn5rnh8KRf1pD
         RdGY1qgFGcopGGBLjFx76bT1skU78lSd5g5VqFsgM772FSy3f+uw+Tv9TJp9JTIJ4PEM
         2/3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795040333; x=1795645133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=DhwrPv4GGFiOVke3X6njuMQROCZZTT+xdWguHN9Ve4ls24tJInBkCDQToNg2sTOH/7
         9fkhOJ7HqD7c58NdQDY7sym37Km0fntvXNnHSLiComuANprVK86/akMKEQtOmRk1K9xO
         JES0ONp3tAzKlLidLptHk3TFMkYlZ1Hvyx5PdcqkASrzNWnsmeIBpBPXdjrilkGx/6cD
         K+L5mYzqtqK2/8ulA2EwqsRtFXiw30sGQybhL4DTr6C9ZWTA47PRumYSiqWHNmNcZW+C
         Byy1W1ngeI4hePMxMzk+5U3fmHmoAzAy7yzhoofr7fZIleSiMd01npReSTAdbkh1M6ZN
         KBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040333; x=1795645133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPh8uj9XpZA6e+Lv41Z3C0qJdEEXOaN7sStIO34U/iw=;
        b=2ffpInGk9YMyuTUMnDTWqAOmD0usyGQ59u+euCfFfZoRrW7Bw4eA8rflt4fnRsgSod
         Ncm4BCgghdG6GmOzNCRvLWvY+FqeBFiVPhaR/T6gcGI9amSbEQDftizK9D+CrrfKi++a
         233CL5DTxKexcTsykMgOyPX7N+TCpQxmcMIemyns8KJuhDrFasZeOxP2PX1x0GuGsSC+
         +zR0cwnmDvekSlScUQ4J6GyJlAIeZKjgFMJyceKGxFNH2xT8D7LpZgUcU//d331D544V
         EuCcYNBBZmZZdJyHMb44DGvdcCThaCXAqsvrSIlLiF2HWHLWZYjUrTY4zpSNHqFivKUo
         cCBA==
X-Forwarded-Encrypted: i=1; AL+hErE27Ilrk/42FttWbGqY2apG26t7HcKpPKViGxbQEm8uI9+9U0clh7cX7fp2kOy7TlMIOx7sM1xzmI3cGGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LxXbzTtg/TfmDX/MLzGrbTMmb0oWbh0XY0dk6e8LwvIrc9Qqq
	RUA0zZ6vvD4/pyPDxUy4mLMgdtWbEyYQH0zBlyj10LrVWeA0T6CXmAj3Qq22ZmwLQBBKK9L9GZP
	ku/yVvFEnKiZmU6OPsEud3+HYJ7Jha50ryrwWUtTQ
X-Gm-Gg: AYBFou3VX6RAZY5fFNO8YO0CJmxxwwQvnvqNo5I0EZnn4ybJ/msJ/L8FVeO5UMfOw+8
	fcIt4b0bFLtzDRAbUpIaCqTIgMyoavEgUbDLpXxjEPv6pd/tWbxibwubRJVFoHhhn4USKr8OyKB
	P8vYD+4iCZTeJdo/ZdmsqN8kNZrGt7HeAQdBDUXFVnL53MoBfwFPP1+SDPjhL85TToSC3n4GaUj
	Uk8paiYrPZkQWLzNDqBIYtdWQzFx4+WY+maqmQVEWvo+jzGBf61Ln+OLPF5x4ItnUEkmnDCrfz6
	Skar6LGpSE1bMupfZVA7iIJW6qIemq0d9UUmVDt/lPtiVbH3STjasiZhhbITQVkxGSIeJQP5Hp1
	5eruIBYhmXhF3y/oCiqKkCQrCfJS0MLgI9A==
X-Received: by 2002:a05:600c:c083:b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4bb840fdcf6mr76245e9.12.1795040332631; Wed, 18 Nov 2026
 14:18:52 -0800 (PST)
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
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 14:18:15 -0800
X-Gm-Features: Aa3M54qrYLCi1kdI6tOsVZ4Mm-8YCYtqxNVjxhU4bWLFHJjIpemXwQLKhaF114s
Message-ID: <CABCJKucCD8RTVTg=_PuWTDLVaV+h8T7=whx+kLuxKq1Bpi3NrQ@mail.gmail.com>
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
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
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
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
