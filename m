Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342682;
	b=EdffBQA8z2ItVDyTaIuK4GffosVpaGAujUt+364nh3HTudwV2RrfBojtzKBnwcrAYNCV
	 qo7zJUTxWynDMn8cAF+BHEpQ8YocpByx05QoVohQ/tAwxy0lzg1vQIEQbdUUzlRpCg+jk
	 XkVD0CTAGKEw9ZUnN3anzCVBZLKaKlXZMpr2PEVGU9Z26IxDrr5wTXGuZFAn2sWacWKeA
	 zfUmQdKOv2K3rjz+5lnbgPDzYaxnqbMOBLMWumKxhyjzqLB/8BbIGHUEd86dD5i3EZcvI
	 hrnEV8o2aUIENJHuVhxbGDrFCbj/su2ckVLzkLOfRwqh+0i/l2HqeP3IodW/2I92k8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
	b=cOlHjAmaAVfANHtrvTJXcRdQDnaDvR98y7K8pGV6FLbzxNbI3Wf2YraNbqeXDa61thiC
	 o2bTxRmPUGLJjeAiqbuCxDUMtAizixcmlgWew3zw3qzN96pnoYp9CvggBrcsaXyraMf34
	 HPFL74Aqv2tKJWM1ZPSzNSP8JX0KQVNnhadO7Id3PcF5l4uZc0c94+Dw3+g39FtGvNtGj
	 krm2I6CAK1fl9BPAZmLpYH/+vhtJHi1U2M33S7Vjwkb2J++YTMap8kekyS/hSu14Xqif8
	 s7Faqgi490wvVPf+inw1nX9AT3syfQPL72QZ09KXO//rU1MgpvwW1UnoFFp89K4HIIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2tE9abR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451A606C8DF
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 20:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E451A606C8DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2tE9abR
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdd77a90f51so184055a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 12:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342681; cv=none;
        d=google.com; s=arc-20260327;
        b=jYYMZuZ4dBOEQtye975W/+Tnheoi7kssFnh8ri2ohhduER7tkQKV1yReCw/Pq+d72w
         n/VV8GchooXP3m8yGrx9TDheBVqKGpx7hVzD2IegvcC3fGTyhjCCzzST0nFPSWy/4ix0
         uZtfh/emAkfZOxnz4W5FY5J/vukdrx28Ao5OPdKOhbpxJ3/y28HYg2JJmJ3c0QqJvmFA
         /B3WvIIwNNIB3fOwmFWp9xDc39vpC32ZPfeeTDNYAj6fmki8+h4bZI439LNgef0ytFjT
         1FXOPtrHM4b4vrd92D2jgHBLDX4mPhFcypN9a+5gIkG4hYVWLCnSKPp5ygEvmJtPeeaP
         GhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        fh=ggeQ02IMXxPXPTRHNhMy+R/m2bKm08lRDWErE/KTsWU=;
        b=HFzDRYrK+2rg2QuuvIR95EAR1OcN2HOUm8CoVTJJ7kNArClxu2Wn3V/bI/U6JS4xIV
         BePGmLhQfX6K+zLusnzSekHLi6RO/K3F4atIBFKdgpa/frBGWs16H6LsTDCH3+z3hVDN
         VYPVM3WwAhKeA3DCh9UI8vW0T9IMG7Cm8VqxSx2NhrsG+cKqFvhHvpQn5HzPN2wg/vOO
         LRSmL3fa3DFKBobi6obRv5z0BBPO6418h83CevwNlY7CYXEcw8YCXdNDNzVzyavi/Ev1
         HVcivrInIt6oxkFh/SkFL6QA94jhPmFvdKQNrURJKYx5I+1Ue/hFBK2mYpo1adv0w+oi
         zh0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342681; x=1794947481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=k2tE9abRBySKHePpNw1+hoNwrpCgT9c1iMM92CBR/SFMFu9jyXbH2iCcyH+EmTQTiC
         yBLJMfHXGvpr8xfRPVxQgfnzsDthjwfax2/Tnn6lH65+pgpZ0HNuhexFozmuzYNDgx1y
         +ICdy5xZl5sBC6bwvrkn36HKWD07+HHxiPTqxB/C1Omj/my+bOWwBptkbM1GsQUlAwPd
         k5iKPtFQZWvnr7YHFJcpDSPfMwZhKuL+MTgC+TsDNhb2aGfrhumIhozOSJlps1NyLDFl
         5aulmNUtJ6KcGlw54fstXxrfYoWNLogwNTb77YvSuFf2tr3hJNYtNL4UfLVJ9xRwvNJ4
         xX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342681; x=1794947481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=smXx68zzHrBAMegMesYX2Whl//MOQmfsap2EQfAHcGELEeZSpfK/AkWN7HJKbIpM+O
         cKmG8+KvC++aYizBCHN32RZFuvX7Xu5JGPXsazjF4BhBeG9Ky7Qi+58HznbbyaC+63nS
         C0f8/9IGwhzp9J9/K88m3zrWEBSAGCzEHCsk7zLVEI5zfGDQvYcdFhMswemdulMs4kKu
         f25D70AnQ9H74mWUuhWyst4kHHpncoVEbA4PRSbRYojR7djcqBd0jkIzGfUkXjX74EDL
         66ZkdPzqmjGw1rviWkeSl/qDNQXCv59JGzeW6jBdVIV3aKNPuwpxXueXXjJ/Aj4ivs04
         NlKA==
X-Forwarded-Encrypted: i=1; AL+hErG4vzwhNCB4ceEYNWLxsOkURjrBucxUzOSVZXvBrH8KwqYP1qX8w+TWdZcbN8UUAP61G03m81dzagliicM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PKx87C7CKhVd9UM0kvhzCDTatuYZSFT0NvMjPjQGGbxPQjrG0
	lGkf7+kqsn+upzGqSr0p3IfNZszZeBr4PyIDhSa8Jqo3gI/WzSSke3iiDLKpbSWVoQN55RJ+QZF
	ueghL6Prs6oxOb/mAdrqHJR+iOoastgQ=
X-Gm-Gg: AYBFou1LuurEO0ss3Jo/OGtr1ye6eo3W+KIhhalcbDZpHjaMn8RUv5UNlgAt2YO4phq
	gzXE4fKJoeG30d7zMvQtM4yiTAWRIg1pt7s1h59rpbIDACW/ihJPY4eGKhOU3Rfl0rwQkdZgTzF
	Nh0E8a8VNsTkqaqqozgDGXsV3xqnStWwqVyrFkMu27UyiPOZU2wTkU//nYMnkzNRRur1MGH1bIb
	+HBIzTrgYu1uxZtUkfHAhia9KwUR4KMWmGwhtVn7P0rkK5l1Awey/kLD6x2fc4e//1SB1sK+yAP
	jKFDo6SGvWzqQJSbzSLjGE4oHFAUOv4bZENHm5ARdIOrr0q5YJxb0HDAfU3RgbNkV4gYaZhGccD
	ASE2EVEoAb4FZD5SFl5p+ZmWWfAPi7BFzl8TgmdUhq3ukVT861hdDNLtnYrPxG9naQBUOcWc9CN
	qse/suaSzC9LmDCMM9s+TWd+V/nLg08kv6QgnAZdYLU9OME7AjanlAvaKJiJ2swOHcg1NF4j3bu
	cDqnHDrZzTRketf8NnA90r/pLjb2beBPgPMRPm8/jwMvgGYReIVYH4leA==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id
 98e67ed59e1d1-3b182f3642cmr189775a91.6.1794342681275; Tue, 10 Nov 2026
 12:31:21 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 21:31:08 +0100
X-Gm-Features: AclHuK_uckGpnRQludUiuJa2Hr3E-2Svi5DrMdfVjm-Nu4czLx7g97kWJ04gZ0I
Message-ID: <CANiq72npfiOC2ZCan-zAe-h79kba_5jtWFAeAoigCs_hnO8gJA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:

Any comments on this?

If it helps, then I am happy to take it via one of the Rust trees with
an Acked-by from x86.

Thanks!

Cheers,
Miguel
