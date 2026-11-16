Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857811;
	b=1jWhWZcCNLSHoaYsuk0ZQ1EICPjzafw9kf+Z9b6W/6uhGzg6R58Gs0C3gC+G6yQY5Mnj
	 WPvm0oGtSV8NGuCUVZgUNpM47ProH/VFOKiwGjDY9IZm76Zf7aB//tAteae9GWRTaOmVs
	 ZemI0QyaCdJ7b/TB58RGYnsscSWu/DnmIM4wbndd7ONYiQ4KuaqpoMDV1KV+kJRINQzuc
	 d+SupV3mAJHquiHod+d3uhnve6bGSXUipkMtPKl0gnNukQCCSNoGalKz05lgrTkbSprKF
	 zNZRg5sKo8wN63ZCwLyizNaI/wDp/K+0xIMH7u61Vy/3stJvnnvN9+8x0MfGAaCcxrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
	b=UWbOabduk+eKp0qMsxBBKY6Rr3CuJwQfMjHU+9R6ldspydrjg595alXmY5XLi2GnYMLn
	 +Ncx5OTsqwGIp5fMwpwPpNHK4360+bU1zenqGkq2Lb7IaYkwHsCeq8SoKO0YY1Hzidp1g
	 qno8omi2NvsHkDaLHVJuXkwm/YuS5kIBF8BHxenTxs8ga0CE42EMlI5hx2XLDuHFtD1bX
	 HknZvKI8n6yGZyImFseYT6gkg3mzm43HMzciWPDEhQuwX23jYYUp3MxXPhPHaJjxC1nns
	 fsaLUx5iZ8KWnUDJCoq4WDw3DtHQKh5gqAGM2+ERSWtj5VnpLPIOPj5tzlboLeUAD9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SYNZl2Ef;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD868606A31C
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 19:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD868606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SYNZl2Ef
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so5982364a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 11:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794857809; x=1795462609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
        b=SYNZl2EfcohOjgYfFyDUm8RItgm9j1+3XfKs641/mEXRv3Ym8cwj6cWfHT1ys8+Lln
         xZhNOL8TmRwIOiJLBrJf2Mzv9A63qKlGftTyMTWqlv1+RKasb87hACGzfqoSStMKOKne
         P518i6cM7i8charUx5DGAQMjWsND8vkdAhpeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857809; x=1795462609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
        b=hVge0Umm7WO4Ckg+9wVuIxW8JcT57epZaCs2a0Ds9Ip+jG1uVVNP0AsFVsJOnSCVOU
         59vdwIoIhw1QscaIJXdzxZohKoQnUcZxaxldVL2oyGb6jLwgM+ZHCHLd/ACWRJNvgpqW
         RZE/1CbP4M1b1lc+FA64SopK7yk6aa6E+sT0W1NH/68gwNrnJmIgpwrdibqZ+5oifsb+
         QQEZPvcMx+tPOUKqSW4cpyfnUiehWJ2y9JC1Tn0UMLhQUvG1dfmpvJbmnsZaiR6HVKnk
         9hHP1a7KClDHZQHfUnfJrl3SllL0QeU14ayLHRkzSi/X0BqztJJDNuyki0vvw5/6g2m+
         w1oA==
X-Forwarded-Encrypted: i=1; AL+hErHrZI/1617q120EAR6bReJP05wFZNcgIYU4oW0fny/f589LDKujq0Lgqqoh5+8k3u92HIIjsJTz8abySUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LHWietKftIHGATVIMEaocaIgvmtnUDkKsHg4kixAwZe7GZGND
	8NyKWTIVeFNuD2/GnlmYuRR+yRnBv3dpfNs0voDGf+QP/xl6rde4Wvw5sITA47JRVpN8IMsmSZ9
	3AsAcgTRN7g==
X-Gm-Gg: AYBFou25O6mb/oqcKGcDn/Y935EDHmcsMloaocTiru/Pfb4iqiYoJgkppVbjsjYK1DU
	1a0eSsI6kEfSDr/24MFV+jPPjDwoeYD6SgLpoZq2zZhoeHc1qdZiTQOXBhEunT5O6S4oz5vHspC
	EV4GMieEMN8ukAwUxGHfHsRMjRXuy0OLZ78KOxkVGmknrHL94g7BrLNj01WE1tFHkwZz9Gz8aOr
	rYdM+zBb5E2kHnKm6YOPBdYSOhcVozGcQQcb71NpLrTHdBgkVZMwzVX9pPrVEbAPx92k0QzuEKD
	vTi+DAa8Mp/2w7NNPb/YXT4t9hP//v7/Q9J/LD32bWteCLfQ6GjSxPErNZsBbmpC6rj5p5YTUMS
	k1a0jyAy6herYYfyMLaeEoYI/x0dMYq1RHzUzlR2LaySVDMozI2xerJjWDHunYnaYoPRCSYRmKw
	gkMfdDI3OJ6FAOG8x+6gfcYpOjM0f4JX4MV2FxLxJ9UthUn7v/gEx21CyPVN5Hu4bMMibtoSRhN
	lGY+Cg/TgezFhptNcBMiTbve6oCZLlP10ObFuTP2A3gKPXKoYKbOx+9uuvAHugSKnpYiSz2l6XS
	ybm/ekNrg9ifAhfDRSDHxjkpoLiqpy+bvIAymrt7+sMBWsk9d2AvKIOynQmjUpbkNV+7Q8GC6XD
	I6MtR5ycP5G8gtF5we6CrZc3g
X-Received: by 2002:a05:6402:440b:b0:6b5:90b5:f609 with SMTP id 4fb4d7f45d1cf-6b7c0c568f6mr9142868a12.28.1794857809256;
        Mon, 16 Nov 2026 11:36:49 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23d6ffbsm5041480a12.21.2026.11.16.11.36.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:36:49 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so624121666b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 11:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGec0UpZv2Hb6X5P3pcTdmll7qJF429O93RvQMdNDU9EJ25MP/UwFg4U2z1JeY0Q8N61LMNkXIeBDILd+s=@vger.kernel.org
X-Received: by 2002:a17:907:d86:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c5096372173mr926077766b.15.1794857808907; Mon, 16 Nov 2026
 11:36:48 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org> <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
In-Reply-To: <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 11:36:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
X-Gm-Features: AclHuK9wFvPLbk2hT2Jt-YCf9KvKeXcURMdq1CAih03odFDrPYf2QaCfvYcr5qU
Message-ID: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 10:14, Sasha Levin <levinsasha928@gmail.com> wrote:
>
> Ping?

So honestly, I really don't like it. I don't think *any* of this
should be inside the kernel. I don't think the in-kernel side helps at
all: the comments are too big, nobody will read them, and the whole -
and only - real use of them would be outside validation, not at
run-time.

IOW, I see only downsides to polluting the kernel source code with
comments that aren't useful to humans.

If this was a spec that is maintained in some automated format - not
in C comments in source files that aren't useful as comments anyway
purely inside something like tools/kernel-api/ (or Documentation, or
even an outside repository entirely), together with the scripts to
then validate it, that would be one thing.

But polluting source code with huge comments that aren't for humans is
right out. Particularly when it clearly is a "first step" and the
intent is to make those comments bigger and more extended in the
future.

And I see *no* upside to any /sys/kernel/debug/kapi interface. Nobody
cares, and any excuse to make it dynamic ("We might update the API in
the future") is actually the complete opposite of the whole point of a
stable API and not something I want to make easier or support in any
way what-so-ever.

So all of the in-kernel side to me looks like actively detrimental to
the whole idea.

What I think *can* work is an external spec that is written so that
tools (read: AI) can actually then verify it against kernel sources,
and that can be used to also drive automated testing. But putting any
of it inside the kernel is bad.

                  Linus
