Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986984;
	b=uYdS4yirr6ThlSBi1nIBeWY3PwDAnGa2cMEYjWyQQ3kLnkVG8lWvqUYC9i2uwbiIeS+R
	 TZJUfOk6gl3TTSvztojUiPzZ9lZamKkTyQedtZptBxNiTpZrV72zj3pZoUTLsKKPT98Gj
	 D0xUNn4k+NAC3cr/5It7HDuY58ox7I60sH876XL4ikKuVtxNmMLpiRZns0cWIAKPdSXj2
	 PCFySGyx3PKGlEBUk78mB+IdwGIhd0vTjdg6E1YxTxg1g90JZzyV32D0GCN4dEkE8QduZ
	 fZCvrnpZf0yhD6xZu3VA1SfKl11m/4uzvICyEmkuv/n6TRQnJsKFiDUYhCO7GJZ7WRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
	b=UdET9w2PKrKcs2AswH4nMZt3zBxYkub+fot/JvkPg8mVs/8ZXTjWUPAF0f5g1HJyJ8Bq
	 7TWnAI075Axt54peRtqQpW2lLZ2RlKcLq9iuz2aqcwbPCHq/0XOCVXXPnx0hvlqhlGN9d
	 vBqCXfUlMpNAFWdyKflLDavDXUckMrJ5J3r+sspyrk0WdnXFMOlVE3jxsQmI1TxsoQVvU
	 HDd0EbJbTaeAe3QOjDN76oYQbGoEVbt85e8FJCVmKJD+fL+dhz0QpubuUQ8pXQRXIe7zo
	 uCalNobdIPb95D1jhg2Bnd16awarW/zJrCj2hbBYdNd+dkYdEW7rNmPKL0HibJpMchQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2ro5fQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C1606D803
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109C1606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2ro5fQr
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so620a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 09:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986982; cv=none;
        d=google.com; s=arc-20260327;
        b=qxBnWyrg32Udtr0DYUgkBsP3X7wpOLyvtmrJs8XqZKdh5+VYh75Rf5uTEWI6ilYJmo
         JUjDJi+i7IhKy7f2I3ShHklQGAMyrgnwp3KxJ3mfIA0Lu8BBTeWaGXxmdYJKasIwmR21
         BLu6NUPIUWhmBy61K4WkBPZFFBunkLHpLhC4r0k/7WxsuCfgOP7GedwBqc1BVxYC/V5S
         FFqFH2uPtWhRIZ49dkjLLPiicwNvActDpWvOjzArrs1Vv9Ls/KOxDV1h1wwvJsbRZ481
         3V4uH37HynWXYdJ0SiC23cBmqNf/6UvwoF8IXOLliP+D60TB2PqCPabxY++AcoukuzFf
         B/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        fh=Q+GzwLKHMFKBhLY+NPRV4ZzUWV8+bSHW9h/CKtVu1MY=;
        b=jUnS7Q7mBdtclmUDGKiV3N9pZL3bCP1WMpNviNlj4W3yCOBnbcNy8qVB9axtLdTqtD
         mtohoK/Lq6H9S2q2NHWkNXmTDF96CwRgMJ1ahjyTwuitcYhMx6nJrcu/dbBD5ZysRJ2N
         ZY2Gfxh6kf7w0sDdmI61bAjMjxb/+V8IBLDQg56qPm7wMxyBSINhczBWEAfSw5RQ3edx
         DaE2CzzPlM3DdhGnWCLmxEl45HLrnGSSYbZkC3oP/anEVeTQ+15jlxSQnyw2MvqYXlh/
         T/XrUPQ5+psLR8/1LA9H6PzHgiYBji9N0Hcla9UyqI6BTnIRClXdeTbd0h25OQY7bQqO
         1bNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986982; x=1794591782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        b=l2ro5fQrGF8ThcmBTRuXeAQRtbC/ARC1ruTiblsIEn2TfppdJiydYhKAM4Pfr6JIQM
         LmzWSYpfeCkYvybW5XzERjWOO+6ggOGxW1b5Q0S1/5Nwphf11n5Zyqi0o+WmhZ18AL34
         bu7QEScxPJWzlU3+4nw+SDW0gHa7ujBtgCU3EL78GwCPlLGAQai4bYGevl3WnHpN4cFc
         aAGG0P0bjrCebkNJmEzrz2n3jrEKJqdTDq7fSg32FrEga3uAMZa8+0fctC922fgiezc9
         SmB1SAE0rxRy8hRrjFof1/beFTpbeXVK3rmbPxIStIUohKKEazLHCMUOR3keloElEMN5
         chXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986982; x=1794591782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        b=x+/Ud7Nt4WoGCp6vXlPSW7rqjUSUGQc8h5yMpb54Co239mgowCzHTbotSwPV/WEvwr
         03NVOHNg/LUmY1FYPJ2p3ejDbIunPtp0naZLor7psxdjauyIl1CW/gQSeFG9LSXhZjh+
         nlZze2I9I1bb3JYZ2Up0RY6S9O9I7By2LFvmtH8G5bbdvC5Zt/MDu0YphTw9V27M8ZZ4
         JC3X1t05xUgLH5pTjRxQp4xph9bWg+u+RTfM74c/XxUbLnBht5DIfOp21Efj5HmW48DZ
         xHFAEr/jPG4w/72yLVcnqrF6Ro6QVSCNK+vcd9hO/bhP4wykAuXkw75fglRbU6SLt5XL
         0Cfg==
X-Forwarded-Encrypted: i=1; AL+hErGZwn6aTBIE8h71NBdaaxOndEm6/NIwbw6byDmhfirAWPfS/PKs5xfSK8t4YiGstAaIOPjK60dk6XU0zVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xEZCKrQWkHipTkBdjm5LEmeMdeTWKnH7bQiQ9ZneU1zguxx1B
	Sk6xGjPavTg7V63hOJvmvGCx2zd3CAhA7tQLPJqPSSLGwWsgvA2A+ffnmDTSmdEcNRGufLf1Dhf
	ZyGDbk20EOINQHC63UnAKT/9hBj9hW/h2SOvOOwKQ
X-Gm-Gg: AYBFou2KT+YiatzN2sNzBCpAvyy2gtMaVxN24XD0xczDZ3047OQrJWS7MdxjaG6aCP7
	wbm8HTGOJ2XxY1yw0YSG1v6Br0QxmOHX9eNfnkTI0sahLRI+eD0JmgzTFtyq9lDqadmFXMhnUw0
	v/xSdXl2DCq47iXsiJJovxvHUj5veIQa19rrSyY7lAdtvtBXWwmdAWo6dVUr9SSmoyuPqBd+1sy
	1uEWGyHd5QKwCjkt/gieuTZzETpi7yEUPs3Os1+++24SfGKDHHHAVZXvkCeAwJRJGlieXftfB8R
	bB3GzU98SvAv7fyc1OTWRXd/eQrTUghNb2ZK3hs3TUWd0SuZP0vOtyY/LNrgq3RytOqzKlkA2I8
	r6N5E+TyK4s/S+HOzY809AVODFwyNnk763Z11TyFF3oypIUsV/63DUxC8WcrkutE6SffT6GeKpS
	bOrlCcr7yFSLBf
X-Received: by 2002:aa7:d790:0:b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b6f841a8e9mr5248a12.7.1793986981869; Fri, 06 Nov 2026 09:43:01
 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
In-Reply-To: <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 09:42:50 -0800
X-Gm-Features: AclHuK-wkGWa84CFDmjnSjcaCwRdnzfHPz195HdzeZhErhZwgCS6NVR4XJm0nNw
Message-ID: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just one thing: I think we should also have this flag for Rust so Rust
and c are consistent.

Rong

On Fri, Nov 6, 2026 at 9:38=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> This looks good to me. Thanks!
>
> Reviewed-by: Rong Xu <xur@google.com>
>
> -Rong
>
> On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > automatically passes -mllvm -sample-profile-use-profi whenever
> > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > inference algorithm (Profi) by default.
> >
> > However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> > flow-sensitive discriminators (FS-AFDO), and Profi has known issues wit=
h
> > FS-AFDO that degrade runtime performance compared to LLVM's original
> > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > solver (applyFlowInference) can hit pathological compile times (30+
> > minutes or hangs) on certain kernel control-flow graphs when profiles
> > drift slightly or when combined with GCOV [3].
> >
> > Pass -fno-sample-profile-use-profi to disable Profi and restore the
> > original profile propagation behavior that kernel AutoFDO was tested
> > with. Guard the flag with clang-min-version 210000 since it was
> > introduced in Clang 21 alongside the default change, whereas
> > CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> > used to probe for the flag because cc-option invokes Clang with -Werror
> > but without -fprofile-sample-use, causing Clang to fail the probe with
> > -Werror,-Wunused-command-line-argument.
> >
> > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> > SampleProfileUseProfi remains false by default in the LLVM backend and
> > is only enabled by the Clang driver.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> > Suggested-by: Rong Xu <xur@google.com>
> > Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48=
ef25522aa17c2a71003 [1]
> > Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMA=
oWh-dqLHii3Nig@mail.gmail.com [2]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  scripts/Makefile.autofdo | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 57a3aba6ffc2..8754b60ad2ab 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -13,6 +13,7 @@ endif
> >  ifdef CLANG_AUTOFDO_PROFILE
> >    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -ffunction-sections
> >    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> > +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno=
-sample-profile-use-profi)
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_=
PROFILE) -Zfunction-sections=3Dy
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> >  endif
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
