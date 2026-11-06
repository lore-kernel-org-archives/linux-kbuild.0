Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793924426;
	b=riMwTAeJyrceowzSzgWzD1mZ3a3gg0wljMVjGsXq+WuVGgutLEDxYYlFi3K152RvktEe
	 hZWAjNnyDAN4FJq5jy3jmm+IpI5m59BqirgkWfUY+JnTqZNehJpIlcXlr4ZjM50GsVHTv
	 gwuNeHIWMOGJT0+YpHACdil6IG3xvOe42F97F+urNkeuW8HklQNJoQ/wqSLSzjhBChq5C
	 7frEjjgLngY9LGNrjpZb91TlftGQkj5rYk1tv28k8nFGKoY+/SrDdzZaaQtGiL4R5NGqc
	 ipHgnT9iZQeVPRo1ikrdBAnf7SZd7Yc5kDi9yqKuKO8h0HUDUq29393LejxFtkJrfTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
	b=GVs9J/EWtoiyeiG3V+5RVtNT/uKkZfkOJD0JtjId81Ctwkagcx/nIopqdMYojdxpNuxx
	 2p1kph1kVHyIfzGh908SWxf3/5E/3egKUsIukodHsAw6/mdIv0deWVF+fyuV4vLF7P0P4
	 d5ZgH00/DQVZ5Eh7Qm3KYrk/P1N4WVeyoC8CIXAiU4bWgfyEd7zwCgI6ffChVTo7uCK9d
	 qk3S95SML5iHo7OPEzu/hxI3zHIciBCXXd9WTi4iUWa4ZTCnA6Xw1qaoMMfupb1j1KxTG
	 b86gZbM+VklXHHih+d0t3YLFJbib3GPW/i1J4W8Nr43G8thctr2fLtL5aQrVQR0kKXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fay24KIV;
	arc=fail smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE5606A329
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 00:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71CE5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fay24KIV
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4f540ebso55132f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 16:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924425; cv=none;
        d=google.com; s=arc-20260327;
        b=dQQVnpWCZL7hbTqpnQWSuCZgDrfdZSpbdKGhgwOR9uJQDURXqOG8kk8wqASA6AfsY0
         GMOe2Z5D0l6h+EOQze8pfedzhOeNV1NMzSAdIFouMaMVxolPVO2Cl95e817uKCp37x5w
         kdJGBeeDaEAAVwsObyS6kVZDIrmzl63cQllaGdha3tg9zsk21LBcroGlQpBti5pLd3Fz
         PlRVeI3Q82c3pMHmh7d+M5iLgkJvNh38EcgT419FTu5ohn2XJhGIPXpmQUKDfmNEwq98
         EIdH2w8fZ1LOmvdHsH2F2eSjy6GHzUvQXF8X+3lv3rbx0EwAy3vpXAZBUERrXyWu4gA6
         BQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        fh=b4EPLpDL9aN2EIA712DDcT/apKAlepZg2BUalqsrh20=;
        b=WcQ2KoUOvIWNv+iu6ITIBzxzj4eNvqT2nUMlfNmwO8ZdixEe2G9YHTwEP6Dcqg7A7x
         n9zGCIDXhkj9+T5ayFBoGAz8Qj5021XfHGKZC6hoiUrmJhm8V+besCW1XEiqiF+37Dg+
         rvb9JIrJyfLnIh2fGsthzyteTc5oDG+pjaxHKS00z3qTKo68fBehcsfdNsf5AqHvEfiF
         bRsm6pocHHhev6j6NkgCJZlmQNrOMsWas0rAIo/jTYI/KHZHGN2IW7WUo0Ae5sgMYVcD
         B5ojwQt5/DJfwIq97zATA/xFXp3GL0YTe8Q0n0OWYapEQZVx173b14mcx06l3yIo+Mwp
         5qmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924425; x=1794529225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=fay24KIVxX1g2XaFUPj+mSXS0xXbKerfwx/+Af3Za6F+v3KzLCVGFA82hk3eVshmQI
         l5D4k/97mNlDjxYLlOZUaKQc+7NUmJlY2NoX4n9hri/6orTNKUxn8wwxy4cxZ9kYH2Hq
         O+puo6RCbSeCUfhHi3T+TA0HKeQ82eLArpjTIQ+uaFN34+nCb5OSArcPlM/Kv6xMLab4
         1QY5Aw7vRJErWJ+KkwRK6hJ2VW2adTKLDsM13sc7EFcMx3tfROJ5LPQ3c0I1QdtAxW8t
         IymtPLLzIfLeQCUkKKz051D2HX3Yy1Xb6F5Ncs3S3+i+DUxWATCarQ0JUC21JHU/L/hA
         w4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924425; x=1794529225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=vet9F/mxnKsZu3wC/Lj41HNREvnZatjkJF/JC9Fozm5fYwl5wwam7+xtQ9pb8yy6f6
         iURBnRrhzRMkXGN3gXdbC3eirtel75+qNkr+XnJnZXuF1EkZLIMdwZO44VmHMwj0WsMl
         lvf6EzBQIqtw58W+vJDN1KaLhlkPk+ncH81xNMBKu2WIsGZnd2EFTKcFV3cKJCJlCqWv
         3uwPsNRxeH4yHFuGAy+PHl/NeK6LMW/oCdSpbDXBLZZ0dD1MDsbTlzgEyapgsldA1pD9
         RHIeYE9BKYRMuUVVCu+xcOfS2KJlmplS+EhfIqG/iDRbqfZhRiqA1ygLsVFOQZ2UuDo0
         6LPw==
X-Forwarded-Encrypted: i=1; AKwUvBzgZrU9Pfy8Ij3LzGiojVzgI/S/2w7DejtSslYcnENbnWcN6NgvhDNm6oqmNyveYbEy3NR8PAcJBO0GFtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QNYsF+nzGWj900XHipPL+NfxCh1tBuWDf5Y93EkBACEN8zimo
	0or8bnP9ic6SJW0urqLt0B279YUpIP6lLRhGVDicqGgRk+mRCvj2++AVgbMscfalOHQVLtTKlTG
	G71cMU6Pq2gTr4fMnjgHCupUrNUXy6CsnBPa42fcP
X-Gm-Gg: AYBFou15xNs40YNd5NUxkug4srBWXc5sw/7rXxzdVf/sHMpkAelfY9gKT6XwiO0KVu8
	kqEzMLXQJqcLKjBHlIAJZqHnaWG2yW7UynZoECEjGSg1UTmfKQ/iJoNnVWuq3Gd4sDz7cSa3VUp
	MOwUf4/udtne4uwWjff2dmW47tWnTAjYxIL1/Tmyh5B/peKy767on86cOtxmuTt3MLCs7NcpLr4
	DKS3CrF5QEtWnVLjyA+epKXE7EoaZN1m8vFq53flVYPSb4MfgZVUCnF4hl3t8H0rSlDAv6Pf8c6
	ZYLhduM3ypL90GYiTX93JxeiAWPSGaPpwFMuYMdusXKWUrItBFExHMQ8swaC8PyIvusZLXJ9tsD
	3caOx4YkLL+JBIX511OkloVr50fhhMik4791UCKDgl9Kzkan+v01jwQ3WRefd86PhPzQEaQtOCT
	O1htqWfNQdjQdzhYv58J+UQfcM9vKlIpSY+NWnNzHKOsxqdCT6WiKewm7huZ6ZrvTjK+0vCIMuT
	QNXG8OMdRHpy3pZV3LcCxbak6729SzSIv9X
X-Received: by 2002:a05:6000:4a03:b0:48e:412:3829 with SMTP id
 ffacd0b85a97d-492764aede3mr2311906f8f.15.1793924423911; Thu, 05 Nov 2026
 16:20:23 -0800 (PST)
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
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
In-Reply-To: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 16:20:12 -0800
X-Gm-Features: AclHuK9ycOqos5AEuWbFkVouFGAMYO4MjJByfnQj2RCd2P8bwTy6_fG6ZmWTcd0
Message-ID: <CAKwvOdme+2Lrm7Ds8vp71WVzDXfW61o2eFRjjtTptpskLTuyeQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>, Rong Xu <xur@google.com>, Yabin Cui <yabinc@google.com>, 
	Yi Kong <yikong@google.com>, Han Shen <shenhan@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, "Sriraman (Sri) Tallam" <tmsriram@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:17=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
> > restore the old (tested) behavior.
> >
> > Should I send a patch adding that flag?
>
> I went ahead and posted the patch:
>
> https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2=
e1bafce6370@changeid
>
> Obviously that patch and this patch conflict because they touch the
> same lines of code. If folks think we should still move forward with
> both patches, I'm happy to rebase.
>
>
> > > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > > reservations about adding it for the following reasons:
> > > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > > thoroughly it has been tested, so we should assess it further before
> > > enabling it.
> >
> > FWIW, we did find that Android seems to enable this globally across
> > its userspace, which suggests it has been fairly well tested. You can
> > see the change here, which landed about 1.5 years ago.
> >
> > https://android-review.git.corp.google.com/c/platform/build/soong/+/352=
4291
> >
> > A few notes:
> >
> > * That change _also_ adds
> > "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> > been debate about whether adding that would be a good idea, too.
>
> The conclusion of the internal debate is that, yes, we should add

After Doug sent this email, him, I, Yabin, Rong, and a few others met
and decided we probably want

-fno-sample-profile-use-profi

...but then I stepped out of that meeting and ran into Yi who
extensively tested AutoFDO for Android userspace and suggested _the
opposite_.

i.e. Rong suggested:
yes: -fno-sample-profile-use-profi
no: --mllvm=3D-salvage-stale-profile

Yi suggested:
no: -fno-sample-profile-use-profi
yes: --mllvm=3D-salvage-stale-profile

Yi, can you share with the list why you hold that opinion?

I suspect we'll want to disable "profi" for now, but likely will end
up revisiting these pairs of flags in the near future.

> `--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
> move forward with this patch, I'll send a v2 that adds that flag as
> well. For now I'll hold off until there is consensus. :-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers
