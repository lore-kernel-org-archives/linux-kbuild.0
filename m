Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920632;
	b=WR/AzU9DZjWS/4uxYjiKYb8g+quQnM4DcrbQORF9wsAGUGfwKRmakleh08HAe+Y09Q6s
	 OFZbUVOfeA5t5fIV26bqOImmM7eCDWLV/wYIPRAeX52QkzFZKxU6jiuGL/j5+JQFEUwMt
	 2dFYVLDxcizJ/0umLQoxWyeXIISfC0k9P/af5rLk/hWa6y9WvwzH1CqkjkPKWYWt0sZK+
	 RK4MlO2lVxRAOOW36vSfXrp9LJtRl2ddjxjDY02MUW1h4amZZPSSr49HgK86OUtl9OHoB
	 mI01/+JhP1WEOCx6qC18iR+c1jvRnOxjeYu/sr+s3trrjzvnW6T+OSvFRWuxwj2ZkbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
	b=c1caNAWr9cQcUTRkPy49an7nZTkZE4Vko1XvqrXyWsPZNXUCjxHiufyIMDYRv2yXW5wU
	 8gj5VmcWE4nOIheVlJfnd2GZ95DOmh5Yh4X9TeGtBBdGvWOWjIRHDbq6I1Bq1tfgK5xg0
	 CkT0ksyPW5J6SiiUno81gTwYmKtioVwUcb3nMHL2iDTjLk3oBsvaT3q885nTkgdI5Ww+d
	 NKUSiZQceNyAHit4kTzfzNJ1PIqzQFWzJkoeRuWHJdldr9w2M0uuMG3amTYcpieYM6Tcr
	 MvYX+rLpYYh/rccLEKKhv01yXegLVay4lgkD7yXA6d4GSx5jnHUv3LPoSFpeNegbE3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SWo2v8gF;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E783606A31B
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 23:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E783606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SWo2v8gF
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cdc606b47so8529866b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 15:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793920630; x=1794525430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=SWo2v8gFlUyVAE0KR7lxWBgVAwMWpM7q5hI+S7lzyWKWhg4b1g6HCFxlAcvCcE9dOK
         4/4+asczlIXASiGHTCi3EVE0hMwDb5C+ItzmLPu23+3uL3MDBpQPtphu8xRqOZS2Ajmj
         NUIVC2u6ylbk6qQw7KyOqwSIKXAR/td7qWgJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920630; x=1794525430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=r8PYSP3qwxo6+WmEjLXqKx7sPZaCpWkDaU1kBBR/Z+VdYrHk1HlruqCJjHq8JO4EkZ
         EQ42evlL7NMcDzdt74h/3iOxfCg3IIUh0OitoRSCtw6EdpcTVzmv5O7pOXhcNjQP1iak
         4xy27Fdq1hBaWxgnUbPRJ04QZl+TCpSr8egqH0waMqCZmXogl59TZ4HnAuvnggMV/adW
         PQvquA4viLxsp+7Wea/ymOJWIlwG4kAblbDJd2B7L/K2M6YAxxzwU4xZd5cQBlmORkR1
         fsmcXhU96CU2oPexxjjhlJWT63VVmXd5/YvevoWA/CfB5EJj4BQQEfA9+XRH2jqlk2TQ
         uWaw==
X-Forwarded-Encrypted: i=1; AKwUvBxVxfCEDUyrV4ErXTU0eKVbtmoPl0GPJJJfpJaadYlVTflARCKRlYwCa7Mwv5FCOUa0UKXHrLEkHqXV54U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UvPFhxm0Q5Ht95xg9f9StzkMpUzi/24x2DIiV5nJjC/+a4dZW
	vcUq+DlGOmv2fjeHhJy/ELRgduUbJ3kbpy1W20YtoLd2JQnvJbuOcnUBFIVaMVCRVrcAB86C++C
	TVT9krSq1
X-Gm-Gg: AYBFou1GOUjk4Ip0x5zvQv78vM7trnXJ7i3t7Fh1a20eCwMe00TSnJAQvg4jK2L11KP
	iPikj2X12bRpAkirFr/XVyqaZdOMdLa3rhDJYaNENOWm8vHMaFPdCLBoH2hrG77Sq95xCT4TnlO
	wTCbpVfyB0PUX9eqjjESLblfet1ma7QZcMl+3PHICszAhtrASadbomSzkZ0J036S36fx3+YnrBN
	uTyAyLnyrn5YtIHlDh7OH5ouFrKFZuVEA248YLmRVGAQIV59M+Yjjxq5r6eYg/o+UmDI83S1gU4
	no7bYUk7TSdKzh3aiS+RArr2xH/QpKZacg9ghzQNHLteneDl6A2/jTGaKmVYVEtNGqbMnrtdhz+
	zNeKD67VfY3wH1Khy61oBOXYkSXEGZlNFsm74sfuuSxgGRYeTOicxh3M7aq9jnYExkvwFBvfUhc
	FnWUcdLX3ktL9zsVF+GnCc7sUSKouYCwpJS3GKeyFnESz1iVaQxAbu6zlKoEB5p0BoUXGKCHLzS
	z58IrdubpIoSsRvQUOpxT7hR4HH7b+9BDyDif8nkPdfi2K6ru13BVlnwAZa8dPi/asbq7X7gLbU
	jorvpLKYd1yZqUhdXhMtzC+mHsZq5SRn7rC24J+poGe9xNfFW+FKj65liZharvI4GT8=
X-Received: by 2002:a17:907:930e:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c4d3531642amr63165666b.30.1793920629934;
        Thu, 05 Nov 2026 15:17:09 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562ec79sm26867566b.25.2026.11.05.15.17.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:17:08 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso361195e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 15:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2RVLFI+9JRHfqLCtSDUA8uvq7HHrQBcSBsy2a9PdPpfCEmn20jOdYWJTDYMZDv9UJj8xzpXLvIMHe9IM=@vger.kernel.org
X-Received: by 2002:a05:600c:4e14:b0:4a9:18f4:925e with SMTP id
 5b1f17b1804b1-4b6df8c9443mr8848245e9.18.1793920627925; Thu, 05 Nov 2026
 15:17:07 -0800 (PST)
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
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 15:16:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
X-Gm-Features: AclHuK979bKOyfBMwiTt2PX8WJCz_unHupEnRKfbNiYMNWMSzKi0DQ3cEAIAtrs
Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will
> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

I went ahead and posted the patch:

https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1=
bafce6370@changeid

Obviously that patch and this patch conflict because they touch the
same lines of code. If folks think we should still move forward with
both patches, I'm happy to rebase.


> > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > reservations about adding it for the following reasons:
> > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > thoroughly it has been tested, so we should assess it further before
> > enabling it.
>
> FWIW, we did find that Android seems to enable this globally across
> its userspace, which suggests it has been fairly well tested. You can
> see the change here, which landed about 1.5 years ago.
>
> https://android-review.git.corp.google.com/c/platform/build/soong/+/35242=
91
>
> A few notes:
>
> * That change _also_ adds
> "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> been debate about whether adding that would be a good idea, too.

The conclusion of the internal debate is that, yes, we should add
`--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
move forward with this patch, I'll send a v2 that adds that flag as
well. For now I'll hold off until there is consensus. :-)

-Doug
