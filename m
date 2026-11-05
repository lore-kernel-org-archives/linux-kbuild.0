Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914228;
	b=qv8FWslX7oBrHjDj1pjVb5IdlQNxK9seacQOoVLMwb+A5UgP+uFytMC9grDtXlVt1skn
	 5Oxf/6tYokqmboKqExKSnm8oGYJtzfgQP0sbXJKOH47WWxSF9b5m6WfJvDUA+MNKctKU1
	 TEj6y4vwBoeq5vYGol/YE1nDNRi7OnxY+Td4EVBE582xzhONfiARBIgJdH4XvlJ1NyyOz
	 wNZyFKbQW/uWsbdMJCbQ7aukL2J07jYTMkUP0A6WLML8GYZlzXjURq7qHfaw5DmytDFf+
	 kNQXlId6v8C999hmwdk5PIuXH9P4AENmGlSs8lSozZeHFxZUAEtDpSID4WR4cOiB+CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
	b=cIsRxXVHsy4DHU0pmepG4gpM+usXTyYX7GSgLU9tRaEd7/Ea7jDjK6/LYcKyok1DKPSs
	 us2l7Zt7TXdXZGY2q0VjhqPJKA0F6c9zeBGeTec0ls/U9vVAdniTKUZ8DC1zVQ+kjYllJ
	 TEXIHgMfWFq/UT9pD5C3fDQ6MY6qDh7yfJacOYha8OhGl5NgzVybfwtEnypG9QVxbrxp/
	 LSZWUl3pTqTKInoJttrQTxL/95A4NfVsg4L3OG+rq4JVTgKVgUis4I3PtcnNlIt5y5gRR
	 eAXRJJcFScoW5r+XjDEDFDOgOLSgVTjwVoN2tWLM4zkpfC5dz4Dct3IIF8Hr5MxE9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nw1knge0;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18992606A326
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 21:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18992606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nw1knge0
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1121455a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914226; x=1794519026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=Nw1knge0nhEFA8gsYszATY9lYv73HXnE+4ZtZd3jKXeSrV+BySP4Y3oqu51n+G130G
         xsrqf2eUBirRDRprjKO+J5UstZTIIXiIUEhgqFqdRdniL7sLtUgAjstPUz975KENxXn8
         GKZpAZCNx3UOerUXDO0iZ3GUQUtJ9hJNs6qpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914226; x=1794519026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=t56tXLL6FXUEZNQFe58VK1EuP8whlobcP7M+PlmN1AQUW15/tuimQ+6dDrA9G3yZLd
         eqP7TTR6d+ktlq37zf+TQKclSyq87+SlDyeB9eJePEPYhkuICPR+VkNZ9UZGl7OatnqL
         njT2jvSuzuqHc4MIry2gNrlRTcQVb1cV/nI2YifTBErSikMB3Rm9s2tHYC04dQwjE+nc
         jXMZqPZBAG3gPKULGt2MEk3ez3OIQJZ6Tzklq9VikQ01OjDcLKdN64F2ZI83f9in2LGQ
         jVifm1h3VPxp1gaASPmQeyU9MR77bEAFmbZ9g4szoozJMiZGymB5nEPNj/DX1fBddIpS
         SI4w==
X-Forwarded-Encrypted: i=1; AKwUvBwrarWLWEDvaQ5EcZj1K1zL/mn0PbYkOBvrfz9K3ig8G+4IDW7FS7UmAIONXtA1NlRPndh7lks8rER9HNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H1Fe9Tg80bKU248a/rxKhcxq+JwhCwjm+CNkhrRwuYnyrsCsk
	0nuKr7RZ8s7suCgSjTYvei9gJjer/lTAIWVIFzczEPpkNiUsKWapvFqExCHkR1JP2VCjOXiI4FC
	rgRzcScD0
X-Gm-Gg: AYBFou3bqe+U0eznAiN+hANaMac+1y5lnJA4DeoHJ3VKI1BVu5uqgGgh9JhJcrAlSak
	p8DCLk8mEPdLh4N4k5BXLLWBClSTKO5kJ1G9LJuwQhkOC+p6K9/Ia4WwX++Ppha0qVN2pzccL3Z
	bOkUxML0iZJcC9poymzV17AlAP12e9dZygN+VZbevQ/P1vUV5chbgSuKZVIoSNI9Ok+lon3OCfC
	jlyRZ4+Hn23nl4QqTThWQpQyQWZKM3aAFzabqlbDSQ4DfHTzyDaWzzLdWQwD8YWhPOhBNY6pDkY
	819jlQDrjs8I0gqL6G3uNCoA62975feIgdCmZmNpDEVGv4C58QHyWHombSXoz4UEusjhvXmqYRJ
	/2ajJdSjRdpRjcgJxel4wLWj9Ywa1r4YRsZB8fy62VgPdMU04N70Q+AyVhT6SyE7tAvgQDj4dSt
	ekCGi1ZO+rmpJdrydA3GoLaKXbCHb1oXw2mzGWTLPxwh4dY0ovAdMCLjEiBUKS7kFRxWY8M7mtg
	d7aXRbD/oumJ0lmSTHwAmcsrALv+tA8PjibFZo//i5AihDGtRF/KOreYPLzCn1fCuJBx762b4m0
	MUWFD7W+hbYQ7dDR2cwBooNYT2v83yd0NDkwnQyWlTWmESxkkKZtY3f/NpqjaWaAXAM=
X-Received: by 2002:a05:6402:2b8b:b0:6b4:1d53:5185 with SMTP id 4fb4d7f45d1cf-6b5977d251fmr298510a12.16.1793914226414;
        Thu, 05 Nov 2026 13:30:26 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5719cd68dsm1333141a12.37.2026.11.05.13.30.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:30:24 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so18973f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 13:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxRY9qbSk1FpFmTBTkd8kw9zO/LhDyIUVVlopHrOgTATnPyzXrlZMOPCPSRdQH1avy7mt13xJv9mSrSV28=@vger.kernel.org
X-Received: by 2002:a05:6000:46cc:b0:492:a72:92fc with SMTP id
 ffacd0b85a97d-49277e91d94mr899867f8f.44.1793914223349; Thu, 05 Nov 2026
 13:30:23 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
In-Reply-To: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:30:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
X-Gm-Features: AclHuK8NeWv7Eqboity3c_xvquX4Ve8KJUxgkkfaa6zSURNg96EK107B0KPq_54
Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> The issue you mentioned regarding excessive time in applyFlowInference
> comes from Profi.
>
> The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> FS discriminators). There are known issues when using Profi with
> FS-AFDO; enabling Profi actually degrades performance compared to
> original profile propagation. When we tested and worked on AutoFDO for
> the kernel, we did not enable Profi.
>
> While I haven't looked into this specific bug yet and am unsure if it
> is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> to disable Profi for now.

Interesting. I can suggest that to the team digging into it and see if
it solves the problem. My AI agent says it will though. It claims that
the default flipped recently and "-fno-sample-profile-use-profi" will
restore the old (tested) behavior.

Should I send a patch adding that flag?


> Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> reservations about adding it for the following reasons:
> 1.  It is heuristic-based and not enabled by default. I am unsure how
> thoroughly it has been tested, so we should assess it further before
> enabling it.

FWIW, we did find that Android seems to enable this globally across
its userspace, which suggests it has been fairly well tested. You can
see the change here, which landed about 1.5 years ago.

https://android-review.git.corp.google.com/c/platform/build/soong/+/3524291

A few notes:

* That change _also_ adds
"--salvage-stale-profile-max-callsites=3D2000". Internally, there has
been debate about whether adding that would be a good idea, too.

* This kernel change _also_ adds the flag to rust compiling.


> 2.  The recommended usage model for kernel AutoFDO (as documented) is
> to use the same source. While it might help in an iterative build
> model, I don't see a strong reason to use it if there is no source
> drift.

Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
for the exact source. ...but from my experience, that's not what
happens in reality. If nothing else, developers locally working on the
kernel still want to keep the AutoFDO optimizations so they're testing
as close to what's in the field as possible. However, the act of
working on the kernel will touch _some_ of the source. Keeping AFDO
working as much as possible seems nice to me. Of course, I'm by no
means an AutoFDO expert and mostly just got dragged into this issue,
so happy to defer to the experts. ;-)

-Doug
