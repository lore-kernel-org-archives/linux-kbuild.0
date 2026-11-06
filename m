Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987586;
	b=z97Fvh33MGH0aSCWgF/AZZ7DymrlbFIhLIvCVY+CN6OUcIkEeS/ELLNlIscVMUX9M6nJ
	 /UOLCmEp0/NvJkVbRe+ofoaZkbwts6TD124j9z+3gpKIdBswsEp6nvXsPkH0K8VSqVy0o
	 tLZX7X08EDf9tLaOiIZ9h3btFkoxRhygLd0wspOcqk6w1SBGcMJMdUDiVws7TjeEpfINL
	 es+ZCayGXOfqsNSX9n2Hh6UEXblWTy7pLncZf0TSZWNyB5T3eGKz83wizkjnxve2C9PYp
	 TG+ohPE57sVylaEjBOdZyhSc1xc7JVbLIpFsmaq8WEcXaF+BGg6trd4NWmPnf/SfD2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
	b=jx2CTl0a3oVW12CMNVtrHwSb+9yUO24QHv4kkbtxstRIr3JKyDAdZb5DeKHys7c8zw3t
	 t+UmZDVugSPGJ9SNwl7Mf1bZsqqfasm0xgDGjoGa5+oWJ3BEn4phnOccHEalKWQ590HfJ
	 rIJ+GD0EhtQEjeNw5a1uKdy2lquem4bg+0jTsK6+vq9aeZeou+D3TzFcdXLK8Z7HCsZOt
	 6z+ayTPImmtm5pRQp9R/oOiR/HLsn4eRnGzlCVU5p+en9H4K9RoVS3wH7yqJx279Ke7c6
	 xad/CQghqaAcyuIrI3LLIucPfBfrrqqlcEBtXt3RN4Z0Qt3QzvtcKEpXiUvsnhIU2Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NW8uuGdo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB76606A333
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB76606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NW8uuGdo
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7683605e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 09:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987584; cv=none;
        d=google.com; s=arc-20260327;
        b=fVxWf2Edv7IiUKFm7c8PIoa0+PIbEGfh9Fkx5ddAhBItKSTTrOs8jD7A0H1wNujtus
         BLtWUAi6V/FlRZmjM97UqXdrrcAtq6lGEUir0ZZXzGs2/HpCbAIvml6dNanD2DwE5nha
         zNrAw26JhP24ZrHvR0hkiC0Elp/D0M5BWb+C8GGzDUSeAWK/kCNk31TF6FuBx92qwk4Y
         y5vKYOerEMz9b+ChZAs76e7izU3O5bGZmIohJtOMChsIFxwzbFef6CkzELbwkqQe1j16
         GrOApmyfcJPtm7TrElhDPK7V62ub6GR17MSuxsxGD34LXNW9exVTHF7wHWg6j//nxhzw
         RPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        fh=rgiitU2Gv/Mb5zLuQkH7dZwFNECJOh/PMZaoT5YqdG4=;
        b=TprGaODDrtPf3YpcL9p6ChNbYwLFC5Qkzkh5Y2CepHNSSMh8HLnl6vJJstmPId9SGT
         HCIkFqqhJKXvDBYzG9pD48p+R3+ihzByNFV4+OV+Hpy/pkMw/55LsDA9Ld5Y29quqOb3
         bEQ5GrmskxrvkPk6sBdzP91dWPLZn/4vdScEOHClwwXgDIb1K6s0Gr2x6EpE8xbSnmej
         NknppepXS3azbmoA2hMPacE0xTHlp28ckPIBYN1UsmP590dWXNvJr1fHULaP6FIN4D63
         BJEuB8mBVBbtsTP2G0xZKu232GNdHgp2fF77u8ARH00ur/8zfZ5IXIGMw57k8pPPvNrc
         y+jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987584; x=1794592384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        b=NW8uuGdomYzmuDtrXAWjZ1gtLZzmP/KNhlvC6gK50mW7XxvuKLLOP7EtsCLtPqcsjr
         CVhVoqc/CQmnXOg48fJnD/JELJAgh4f17SX+kNmO+Swc+gsoVLoszlZRfBN9BT/HYA1Y
         pT0aN7LyWPUNYf6+pfUM4omNBOYoHsgyvTFoj9xnJMSx305fiCvitTUSnTMK+hwxYgJF
         8X/qVB0ZP36kaX7C1IBDUGacr/M84c8WJU7AAUqSsSFBymFezWmF3SGZ+dLclXmyfNYp
         /hkKQ/z7Z0+SBl7ZAXfJHodjznt2X7lj8z6XBADnHfKKdxjOaUQIAGL22I30sDPxKhWT
         AzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987584; x=1794592384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        b=WfR5kvY9Te2iod2O0rWS9ncIjhN2VajQjoNHfrkECcAFJhqjSKErBLT9qsIUARtnR2
         pIk9qa1RYib6KejT+vnX61bpKM4whe0N6QiFHMQA+RnCrKHX053Zj/293sGhAmjerDfz
         LUZRHdKhRUcQS5k+V6jM03So0OmYq8oob5heze5Z5mtSS0tON3TbXdYwDyRJo7waJ+ka
         7E277fcQJWO9sB8L+Qj4uoocK/Qb3AikOqz4qU6FK2TN/+blOrE0QzWHTXYMF6VsGG0Z
         +k5vH9qgGqbRO1DWFKQSrRid7VopY8yy93CJQIPhamhU/wxykxom3h8Ga0SnKLc9WHZa
         JIZw==
X-Forwarded-Encrypted: i=1; AKwUvBxfDliREbBxSy81vvKDRZ9q6gI4N+gWPt6U2nkThxADupmWt3dZhfjTTCW1gK/feI7yZvJa9IITTp+UGUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EQNcUmAFDkCBWvTgZK5/geDZHtcyavrAmPm9bnjriVuSUILm0
	15aFKjxU/zDX9RUG5xeGm3D9SQZzhswdZx3pYc1N78x3b7ATOiTDJ9T9+4EOXBY0V/vHqnEr1yx
	GdRo5Wxprdc3sqiwkuYsibNnYmZhQae+TVCM+mN4PperVLA9wQ+D8zvQ0pV0=
X-Gm-Gg: AYBFou1qCCuJJTdQ/hQCA0Oa+N5e6yP3H9vcOizhktK6exhZcnT8JzMYPEoIEzSQcRn
	XQS/0tGcv84wpePftFBkhsb/Swupjsk9uPT2pxBbVvPI+53zGDR/4pmwf/eDjMgkM6SMQNnH1Ye
	6H4gq8c7IRdC9K9+16qyOIo4FAJiSWOMfMmec262iZj7U3RYvLg5mRA5cpF+fVPMMiO7iom0Pfr
	zVEa74cIryAutuQNsSjt0GZ1PBjdhTMDpUS3VEvjgRJTHfqb+PZ0b1t2n7ZUBICprX7pf4ZZA3G
	boj6fRW/e1oIRYYnqdIBLtHQ9AoxZNIHiyw8yqBbvVnWc8Pl7gTlhnFSGbH89d86LA8WmdEJFWJ
	m9uSHkfWRu7CtlhYS5/5ukyxyYQJdVEJIsu+aBEmIt3aWlL/aYOkyFdogIA==
X-Received: by 2002:a05:600c:6387:b0:4a7:9025:5c3b with SMTP id
 5b1f17b1804b1-4b6de1c6450mr56262855e9.19.1793987583819; Fri, 06 Nov 2026
 09:53:03 -0800 (PST)
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
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com> <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
From: Snehasish Kumar <snehasishk@google.com>
Date: Fri, 6 Nov 2026 09:52:27 -0800
X-Gm-Features: AclHuK9INR2TnwJM3Zpn1cFZ_averI8IiQe0rbAuzb--L9go7NViW8h1McGlP0Q
Message-ID: <CA+aGii5ZbLRMsvOZ=Xk_gS10O_WgjEc=oW9vJ2yYPrRdwpZbZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Just one thing: I think we should also have this flag for Rust so Rust
> and c are consistent.
>
> Rong
>
> On Fri, Nov 6, 2026 at 9:38=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > This looks good to me. Thanks!
> >
> > Reviewed-by: Rong Xu <xur@google.com>
> >
> > -Rong
> >
> > On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > >
> > > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > > automatically passes -mllvm -sample-profile-use-profi whenever
> > > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > > inference algorithm (Profi) by default.
> > >
> > > However, as Rong Xu noted [2], the kernel's AutoFDO implementation us=
es
> > > flow-sensitive discriminators (FS-AFDO), and Profi has known issues w=
ith
> > > FS-AFDO that degrade runtime performance compared to LLVM's original
> > > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > > solver (applyFlowInference) can hit pathological compile times (30+
> > > minutes or hangs) on certain kernel control-flow graphs when profiles
> > > drift slightly or when combined with GCOV [3].

LGTM. I've seen degradations without FSAFDO too, reproducible on SPEC
workloads 531.deepsjeng and 502.gcc while controlling for profile
drift with newer versions of clang.

Reviewed-by: Snehasish Kumar <snehasishk@google.com>
