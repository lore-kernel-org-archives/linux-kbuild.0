Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C13BE645
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901593; cv=pass; b=uPaoN9EdTiFgG1PGoZSEt2pxS6BFKiAMGQ5eJTaf4XmW6n8LWq4rCgwqmtcSqTFMLwDPMbRc+Qo75pKpLbyQ9zE1YpVLwFWFXOS4l0W1v59drpiQ3gOt80FLmEwNwxerCinFlItpsGtqG9BQjw8FKKhB4OM/NtE+6wMTZfAVmXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901593; c=relaxed/simple;
	bh=cIOFXtCuNna/zYNDEeDAmAkgX9xNg/vNmHFdct8PtpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoG5nZf+Tafp2FecC9fy6rLLKsOV70AqILfKP2QaCqrOmuT1vO/NxtaVLvET7jKa3QY/yByHaEYmy/d3UzE52N4BeYu8ZkGrS/ht0MHTPXXZU1+iFmGp6FlElmqjJHzNJ/eZKcFZEOTQeMsQp6mx77KwM04dlmdxEph4wpI22RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otsf6b66; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otsf6b66"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so71998955e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901590; cv=none;
        d=google.com; s=arc-20260327;
        b=B8GPCysoyst0VwRPSgP9RE0p0htxYrNfWyWxXEdZZbKCcBh+D+UTMSitzxArcFweX0
         qvdxS1Bl+A7wZCyn1cewrIBqM1+5Dm+AxxsUuBRFlNzL4gsY/zf9h6LXGzvsTNmZ/J75
         9aRAK6Ye7omy3Oa4ihRjbtGMd2OkxZsL3I0+Iumc2896Qlyw1nHm8ZP3JOz7YgQ9STcr
         VWVFkBZiU7V1AieyzweovZZ8WiBMx90TFIj6rSYuIN28VR7RIG2QW3a1WR+e9ptvwxKn
         sRrENZakADuvnaQrh7kL/q1MX72uRsJkFK9Z8y77rn3/xNAHicjLGex5FUX9tyJrz1Kx
         8Rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        fh=e9sUDJkUrBCio4KmC5IaoVQqMkhPwgwxsdo/SjFV0UA=;
        b=hnkoo3HhumHEqy1nNKCTpumQau5F9VF6JsVe6m716s2WtG2RcRpnClqNIEcodB/5G1
         YuCmnWrB/tpRoTCfpJNLXmM6s3ciRV1Ug0VQenATDhkTEVErwc87QKjkOWFGbM1/wLgX
         U5zqUVO/Ww5q4AEiVItpEkJxkOxDuiuoh29navqaBRvDvYfRoV0d/VlO5nrNEa1Q1sPd
         uGqrwTEtq/AmAwso2BHvhqBZlBHAtd5y6OZnaZVBM4bdANs/yXPQSJxoHXXKTJ4t83g/
         EXCIkt4k/6XWSGSAJBkKN4SkOZGFQ8xDnjBjy4X6NcRUUvwEYwJUtb0sm4qf7G2xEI1U
         tSZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901590; x=1789506390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=otsf6b66eLyN+62lzguVV+VBMlATv6z+svgDrA31hnA5b3fBV3bwYCqshPtnmsyGmv
         QDNDZwx7N31zA+x89VYITcROT5ZRN8TP4ggK6R9uMannUm/MUJSMRZGWkbAMzCuOqlSY
         H6biXYN3dL5DiY2yXed6Ky4yh4BVxXR56j5VYoNJgh5pu6nlbLx8ul8LTxw6ojhP81mJ
         6JTXwtflQYVkO/SfV7yVBVRWnh5SQfasm8wlbFkY625Bkt4jmQ2QbNf1ssWLfzh6NMk7
         l1RjM2KYlCGn6nKE0yFuTlHEHgKavdGE6I5+Sqelz5oi5Z+IpMaKNlUCqzRnSjeVC5x7
         BuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901590; x=1789506390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=cOcxDZBLi1ZUJSNbu0KgBiglsgyFFHQ80LsOBlCMmFRANbxFEXdku3RBCSzHdh5lRN
         PRYOJQOGLjbxpy9VxjxsCqAFfgxkUFX59JoJmteIe3PykA7rxPymyK6PQa7jtqiUv7Rq
         4q87TlTuTynTZfTvj+YQ2DHx1Fu+wQtDfG78PLxEDlwUd0I6VzWSxYTeP/EmovnkA8zB
         0pRlXXPTcVy7G54uu2E2EUZD0655qpYqvh3YgCdJF1+9rw+bIsEhe4ZZbcCegnvj2g7M
         iUKxGqi+qfWt/koA8YNLvNK9MdY0/wxc8u8lT4Fy798/JWKA3y3HsejeIAR2rVNwecbM
         TzYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUg0zogGuVgFUjyqb7Pkv176XQoNYYVLGTtRSKBpgJSvBm7sZepdzMhr4XYuKJs5eF6cPSsUigNWjFpeg=@vger.kernel.org
X-Gm-Message-State: AFuF++keuSfiphioNNpwXxEoZNMhxZqnclzx8JX+A7Wvmrlq7goLd2UC
	cHY+92A3pr8hcRpcAwAk42dsGHQ8PU8Mwa6NemqQ7Uhik5zV6crdGYG7DisBU1JveKk5UiPZOUG
	kPYEq97zwwCIllWTVO9Agv04caNntBDTK7cIWms2u
X-Gm-Gg: AYBFou2xVUKsUZNDl4VadhtDaHEgro5MUl6li7mxwUYcpruBIDjHbIPEv3Hrg5DXzz2
	vD3C8SrJ9ZD3NffKOA6hDR05IrBk01sK7HvM/foLiprnGeoMdEe71dxEKTCAQamZXfcAPX3Cmn2
	wwFIqf3EfesBhFYAGgOR5PECAWXyG7tsywwWeEqBWofwGw9VuU/7PTDx94Mz3irt0sP/uPU48U8
	Zd2vO/addOjx4ubGiHCz9vCTKzKBMAFxsVHQidHf8Cq/DShs8x6pYP/gWBZ4CHl1y0YCGlWKJ7N
	/wvU5gGNpTfcJ0VKcOmOc4EA/yr1/Y8HgdvBWHrTfJ415EhwjWiEJcmjxKh0UpjWgUt7C/8s5+7
	vH2RzxtXoZeXSmeANYFr+gg82vHFcXKMLhlgGkVT8OwxLQ9GQQQPCR5Bh
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id
 5b1f17b1804b1-49cf8252497mr286154405e9.8.1788901589479; Tue, 08 Sep 2026
 14:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Sep 2026 14:06:18 -0700
X-Gm-Features: AcwNN1Vne6n6eJi0vjoX52mygVY2Bf7Bhttyek2fKXqRHQxDJ8Lg5WpFcLyZtjc
Message-ID: <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:55=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
>
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.


> Fundamentally the series improves build times by parallelising
> single-threaded tasks as much as possible and improving the efficiency of
> code used in the build process.

Cool!  I have not reviewed this patch series, but am supportive of
solving the problem, since I do recall this being an issue;

i.e. it always annoyed me that despite have a 128 core machine, much
of the build is sequential!  Having all those cores and not saturating
them during a build was always something I noticed (usually have
system monitor always showing system load, always) but never had time
to look into.

It would be cool if your LLM could generate any visualizations of
what's going on during a build? Seeing what's serial vs parallelized
in perhaps useful. Particularly when you can compare the before vs
after.
--=20
Thanks,
~Nick Desaulniers
