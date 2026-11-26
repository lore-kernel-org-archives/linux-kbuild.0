Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795668789;
	b=lDEz64xwJTzMhGSSrvbtftkRnbr/BxARcBAc4JDmIeRqEE7rWwL0OehLizO+ZQM+IQXH
	 /gxdqa+nw8vi8HMwj13MqO//GOOzJzzkU5ILuW94q5uFH4NECxzFUpnWzYWkF7TcurAHV
	 a+tDdYGehkVGO64IMvcKIwHcnbr3jUAsh36x2lvvPYYLvBl34A42keZHTvT4e/msoTBUK
	 5asCLgguq0VWvKQNPRfbmft2fsKItubOXLJFDj8iEBEeFRGx9BI7XctOHbE3amDxZkGgH
	 5+8S2JnclDZMU2M/HFWH+iRaTC4Vh+5u9pn/0K9Gs5hTlMGvlbMzMiDGNaj21E9eoFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
	b=Vg5n7W//B84G21kXxChWS7VD++2RDyDnzdAx/wT6G0uQqO+7qcAtEJFvpkryPiLRFoNo
	 YpbwupXGSn+IdukwLrrLTIbzYUWcQK7Hs/dsV2k7ksXFiMW/Hlqh2f++nBU4Qqp+v00RG
	 sGwAKshP5Mn/tX7o4EoJJ3/eGRU1IR98Ax8/0DGwik8wL82cbmxLB6D3s9aLZT7xmKfey
	 meKSDWjrdK92bEcEjufD736q+UhvrIuZ2Ma53/iFFd7+Mn2qyHekhUj1ePqioxD1lw++3
	 OF8O3TzJDjAwwQFKXfFf4KDUpb8L8BkKEGZF2T96METsIV5I5lJJxc4TQU9GheAuX3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Wt/H8uEX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA4606A326
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 04:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wt/H8uEX
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so1599671cf.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=INYXJ3svBWE2E8VYPgWV+Ob1ZAVF2F/zbPm7kHFMh19VRmr+tx4Du8XEjG7yGrIJCa
         xERTcv9rOrJH0x6/F+kg9OGRBZgfHS29z2XWdhI3cEbsIO4U6PxlxqoCyJu4BBN/ojRZ
         B7i62VLxJytrPMwUR+2GI3yWWwkkZnxTu8R9PhtigTybTlDq40lMjLVduosK2z5hVd5m
         3iBwZ2D7QeKKgEKKQpogdpGZY54Vrz9u1lEKZvfAkTYWBVUSeancaOVmW3FWpAsrmylT
         8zzNbHFi72VYPEsYYxDxgFcNS5R/iZvRWcXDmHOyieBUOmgFhsziMLjkl19lvSiOibbT
         CsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=+9s58tU+IYq2wriU8qeOHveIBsqvKDtrfZBkspmOjJk=;
        b=EBrB8KHDwe7G2UyKfPhCg+A46dBcny7ZJ5rV3ILWOQhpkbJXbHe0VrMT1cFPTMXS+2
         lZmY83GYGhYgpajGxQ9qglufpDP8wt99Mb/BciT0EE03qNC00GQZaXqUW0I8OAWtDJBr
         YKt+sKa5Iz4jPrSvpLSHPFvNGBuf58ZqaKHfqYy7oFB5bnPv1dMkrZm65rqS/kiAr8FY
         lBnWxotz2HtBOx0wzB2Wa/MpiR445+j0WfRCWvPjAazIAlSI3byZltPHGV0DT2916EII
         sBrdYgmsB/Vrois1WchrWkWalyY90qNgOTcbsWJvUXoVKmcooa0aae+1ODfeHLuTHhVF
         g7tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=Wt/H8uEXeygfnRJXsnha4ogYR4WFdKKtucv0h74Hl9SvZ7ZVOZ8pyveIu/m+bbBuqU
         7pLEkyr5FS02oSIkkEdcPGP7aMYZHs2eR8ZbSslwbXiv4nig66Yw9zXIl5pT+EHlNoMU
         cQHBNyntCt6+GiY4hESZ00/HEKXKxMOneQnWVqwJdquEVsZ01fF3oKFb+IYLDHDd97P1
         5iwuBre8QUjJjwbIhiuIlmYLUamd902f2vsDR98ELoNLHrtAN91EmUr8k1YyhoPYh3J/
         v+aNlL3NNgtJeSDZE4JVJM46ZiSMrhfEMHEAp3euRyiB3I6N1f0aZKatBbawmZwgSrYV
         rmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=VwhX3s5KxZ/u+w+czkvlxVGW2wFifk2n0+DfhwBAnJz83DBKpacmN4a6DgBukgrH6M
         kSfseaSyvmPwE4EYRMNFnZkiCYuMc3md9c+crUd+P2dNXdkKlnSb5xtLteadoOuaSb6J
         QA+aVyueLQMS4UNCi7tHj6SHYVlPCr3ogGrTcrEzzEWIRKkhGZt9qXRxytwbAHwdTXNI
         ii4gxdbmy5luds2cK4Qb8ZPwSDxuD/GFx8PgX5vmvhUea815eVQBsKsfEybGxuAgTPL0
         LfFv6GfLh08RgxIIoyHgu/x8sImD4PvdrFbmpdPmpjzPLdWZsOWN72Fnt/lft0vVkudj
         96ag==
X-Forwarded-Encrypted: i=1; AL+hErHIb8Y/F8CWmIi/q5NXeD2XV0R0ymeXrB5/2FQhh8yU3kGw2dQ1qmFccydad41uzxsDyDDyV7ZyGTYpKAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z89YZ4n70HmrHmFdkRVHRvblcg3wz24cy5Q225Ry1lYZl/wOHi0
	m773EkBa+4lg5hTuWdzFaMMF8e8E+cNMIWrJwS7rJ75T8Ij929bPMJqdq8p/l/ZX7yFS5r7wyBU
	TbjdNnC4Aiyf/Pcpfesf5OUcDZ2q3BcfEXIVvSdQF
X-Gm-Gg: AZFdTZdWYThqOut2iWMv8uUFq4Z45Ab4RVCfBcMZqB8KYNe3Zt58vsdoqSLGIMQhDZG
	BEQel4LA7rrrAbeno0VJ83iQY8N/cVwuR87h278USsPyGpNk9hQ0Dn+WvNpw1dWJu64xi1oZM9s
	mDumC4HuCDfJh4rEu++iskLzZtFQkSzw1lmtbSgY24eDEF5G1ZPxUGIJpFs/A09OuFgt22GULJ8
	aQ0sJG+D9kKW7PgNEc7gSSHXeSb2pcKrc5+SIUPU7OlUYTYPghOuSAzY8f/WcaqDLW3jTpl4nbQ
	VrDPf+jQypJN5iqsfCb+PopwUZpN5gTvz2XMyLReHRjvCCer8tLmH2rcsRIfNcqGoO5bI0e3Rjq
	zMRuhlhs1j2SV8J8WNGgpSq0VoyxwptP3bNUlmf67NohaWICDS2GVDjOGXA==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Wed, 25 Nov 2026 16:28:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
> > A quick question: how do you plan to get this working on 32-bit ARM whi=
ch has
> > its own EHABI?
>
> Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least no=
t
> adding new features.

There has been recent work on both MIPS and Alpha for perf events, so
supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
(according to https://endoflife.date/raspberry-pi ). It is
out-of-scope here, but extending the kernel and verification
infrastructure shouldn't be hard.

Thanks,
Ian

> -- Steve
