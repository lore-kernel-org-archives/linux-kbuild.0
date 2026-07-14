Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E71047CC82
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038627; cv=pass; b=lvqIF2LTVKobMzm94uIlAYhHeXjwCX36sWjQSIi1tF3hKxubZqYU/y9mlNMmCPdwCBFwSXfpkgWTGKIyrSds7TFRZ1cBl4Cx36qo10fViEzf26BtSAuBOzhzGyyyWgabojJjdw4mY2Yq4m1eJfSQ60t68fmfTs32nZNPMOXXcG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038627; c=relaxed/simple;
	bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxL8kLLps0jPv2fG1wpMgUNn4reWMDLmLzNWE94OtiTr8SS7jV1yK8jiSaOeIjOrzSALQoGls9BrD+xcYa9vPuictqrMPKIVvjER/tLVcJmdZQcRCB4tkuIi0m3J9oalB2YxYAlGAm7WsZIWorRi5n2hjpmpOBj4V/kPGgb5LSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWtt+BcX; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWtt+BcX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381d656c36eso342259a91.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 07:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038626; cv=none;
        d=google.com; s=arc-20260327;
        b=V+t733A4/RNjVZUoPUzc7GESWro0wVZbDkqvCVxV+ZD/Gkpqxjv1kaLSnU0uPojfiu
         Zbxtkfvu9unPSVFXhnBAx7O41Eqlr2j5e02VetWDW2zq9sMSLZHdppMjPSwtIqamvHSo
         5F96ZUUexvmg9BomaNWpNc+nr6WAeUO+ZSB2Zg7AaSw0eoaSArWilMPux/IXGcHSXAq1
         ipWYwwkqUDcYfWyvyLyu2y8rK8E02UjuQ5AXyLy2wrfhLW/TF1Lz8WFUFsltxPMO2Vxn
         biwbaNzvZAYHwxGN6bf87auWbZShfQ1wdZLlGI/rEDreB44fvvkLwL+5t18uqimvL1jS
         f7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
        fh=2v46Gf9E09FDwTj+G2/pHQEbBXZH6HP1wfmlRM2JKiI=;
        b=hxPkAV3me7V7Qo9MnHWRzLVU4FrktKn5W3+SVTRTuzNVvh7j48255P9hr0V08D7aOd
         gLJVrWXnQhnLGe4Bi2CeFC+v1S3paYpeooBAtig9d/LJLwlj23mzUscrkPw0uFCecIPm
         ah67ivcpm35W/ui869k//VMOfP5zPWv63gsInGA8SsrvuoUcULOvsr1tzRJyV7+nrXrr
         9ifkRtkMzYPNCD7JMRJ9piQP7WzKwv2sw3rzFJ9vpO6/bETUE/M5KCMP+p0p5AR6orBJ
         ooeNdwOD7t4FIxKj+ifA9sD4+jUu02reIUdiIQ2Wh5SL+2CENQFx+e2E3zOa7cGa7gdt
         uqbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038626; x=1784643426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
        b=gWtt+BcXhKLzsCbQ5S4HP98wQurfRJLkwGhecBxa6BoNDhwgONWqe0sD/9vmBiD8b8
         sXYoj1DB+O1s0DZr4AhirazwzsGmTe3DksJGRj0mk5rbV0MrotPVx+rhL2xu810xFNG8
         1KRhHoJABZbeZu2J5/1SUYBT6A7udOZhCeDHnrqskMEkuxRlL2eFybDZrLOVEzI1gxa5
         pdqSJwBia58jVBXR7rNAY5ItMc8731cuVTowM0JLC0tUKi4lQU5SdXq7sxeD2EBbdrd2
         1K8xir1KT0bsn+ELhfqqYdXvLtPACwrvsZTOxIn7uo9GJ3iFrYViUNVl1NU5EgcyM8ZL
         FUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038626; x=1784643426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
        b=b+41DxB+EuwsRe9k81yTlR99qyyKqvvWJ2i3A9RZHQX4Otisr750rBSH0pPF4APCOb
         3jrc41EbMAQxcqm1TaM4PY0u/ta11zorqT7QOX1yPXw/nE2D7iBRR+CKbP4YtfZwWWER
         1lLX/sdxxRvXScNNgOFbPTtLHr2Cwx++KSLtr/1XOZjZ/ne6UikWIdER7Q4jopheNKkO
         rf+H674CboloDzaTxu2SYJClr9XEXOPcRGa+diH0dxWzzMWq1THmGF6HN+CnW7bZu90i
         8D9+IdEv/DodLA+a6sUfsX1GhsNcWKlZMgXU99aOBzP29N0GxG7EyjNwRFNbVEI5iJkB
         OEug==
X-Forwarded-Encrypted: i=1; AHgh+RqsIXfEGTl/uXSPg+g5WxtKeVCb+vn30QOPnoSiyB8+a6gkMLFjY/k652SKDy0n7gRBBGZ8m4rMW0fWu6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLORErKbsIShr+3lPMS+1Sl6QcpyTabdsW7Z8KItybuyCB4rM
	8kG4jfZpBl8E69lc7W6EE10t2cjJSjDziZc93+rifrtZLcJLMgXNqPXnVpv9cQKmtfCwxNkgMqf
	i2TkfXkugGUdHZc9i80UjPpDvLoVbv+w=
X-Gm-Gg: AfdE7cnIKsMBR5D3+n+SynqScLsdr/M0lJZ8shrqWAGkwNs5Vavc02YqkMNMFAM1jYu
	8asvG4induds5PVzMxns9dqhL1HgeyCiDu4MyeJW8xOUzWqxn/i96NnD+xK2KyGNmrhwqN3oudi
	MA2ojd4wHF6V/MMvtt6WEqIr8oxCn+4mTSipX4VkXQg7wzxaeF0thl7L3be8Kia5SFmksZEy9U8
	DS8+oBZHDu1z7TKbvusCV3UWdofFiaZ5DHHWJ6LUEgiQIFsmLv/VKa6m5i5TApeueyXqzdPhD0R
	5N1U0Rs4XUJ60p7nkBe8u7XbAEso4cvDXu48Hb5S+hdiS20kSkXRuTJ+kO/V/i25DTdsK4ZcPJZ
	cwBdsxJcsC6DXqntlcWGaKsE=
X-Received: by 2002:a17:90b:3d87:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38dc7848a6amr11189317a91.7.1784038625887; Tue, 14 Jul 2026
 07:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714122441.78158-1-litvindev@gmail.com> <20260714125259.78824-1-litvindev@gmail.com>
In-Reply-To: <20260714125259.78824-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 16:16:51 +0200
X-Gm-Features: AUfX_mzFPZk9PpHhv7x9B2f9p_GTrtCF9Xo7PNZ0-FE2xRr9i92ya4ea_fGHoP4
Message-ID: <CANiq72nW+oPbmXpahnRAAz-tBD0RK1qAU9FP1=v467JUCX4toQ@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/tags.sh: Add support for rust source files
To: Sergei Litvin <litvindev@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, nsc@kernel.org, 
	nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 3:01=E2=80=AFPM Sergei Litvin <litvindev@gmail.com>=
 wrote:
>
> - Fixed list of "Cc:" tags

Just to clarify, I meant to Cc in the header, rather than add everyone
as an explicit Cc tag -- the Cc: tag is (usually) meant to be a more
explicit Cc to indicate in the commit message that the particular
person had a chance to comment etc.

[ Some people do use it for every single Cc, but that is a minority
last time I took a look at it. I think it may make things easier for
some tooling, but it adds a lot of noise and reduces the signal of the
tag. ]

In any case, no need for a new version to change that! :)

Thanks!

Cheers,
Miguel
