Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793298232;
	b=XlTDrFYzr6XHmP2+6XH+6du3l16Dsr8HiOvwcNHjJ0kVN0c2prDtKc1wcNtVHfiPdlOP
	 wyJKiTk1roGH3Sx5THgO/8NpvWcA1a7N9Pf1QvZ0zdgincnpKQyphZASOsEjRIivj4zIJ
	 yjHJ/9yEU4NlJH7lki9RxQc0c4f7FUTaVygfwCiWqn19Ag3eLXwGJz1YF20/qD3HBjmi6
	 ES0+I8hFRm62riLQ0el+FqYa2k9clfDkTIbHBtbKoP73kln4clkAyDOdJR1FNHnYP+UwA
	 eLsliffSHNmnOiK39Ditzt1wFGOZpC53WuotKReRi3iTMRSQ7zl5ZJSRF+i9I5j3ZNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
	b=aegxArTSK5baPQhbabYKRvnQAneU6yFcKkOHBitYp8mKL5dmU5jg4bFnkBbl6aSE6Spw
	 vDAhZ82qErpZ061dmLOQ5KNFsfd9g+GGV6pWqPojd/0wEY60xZVL4TzuNjTQfz+4/SsK7
	 MKDXN+nGE+w8PR5X/utjzJ7IwfvLrkWWbCsZQG+ghzlYGwJX3YtPp2TWYma13SugG24wn
	 scmbQXSNtja17a/IiZjdwEursAUSfqfY84UFuj9pfaEBo7SGk7jkXXRIALVtHlS34y6qI
	 8NrXu+DVY27ZNgspktPF+CmsjV489mDIlu0/gQi0l2DHHAZK4A/vpbCHRQMaaR3ryAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DxY9NYue;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7D606A31C
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 18:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DxY9NYue
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so46231cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 11:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793298231; cv=none;
        d=google.com; s=arc-20260327;
        b=lnrEAlozoyGfEb5C6IQo/kys+ggape+AJlhf+3CRkY7jfb3Ppr7MGF+5MTYXPq5wQQ
         +LzjmwX7+f/mUvZw9nvNqgwmh3CZAHAlFDNJAXOk9NBHl3QFjd3aSAXSsJiyYe1FNueo
         SehchlCWLN3Vgl4Lz0fBB7SoRggxC6Ed4Rwg9m0T8dAduSd9FzTA6aq4zuU+6QH9F/Ez
         fSA9NbDIhMPfV69UQA1z9o/Vc+ll4lcc035gnjfIs9GuaU2YfyyV/Iiq86/vsaLFQTMX
         HzckAzLkXW0MgDNVIoJo+wNQuBJvbereXgLRmF/zrlDcqoG0Nh3H6NSuc+uc8cl5WSOG
         vomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        fh=+QX1lWSsVbyeOfItszum3mRv0K69AMcc/tL2YVX8aJI=;
        b=azBeNcdv6M8YczLLjw71iq9RcxF9y98ShYYbOt1YrgUHJfTC2eNED7fA6xlxvtzESD
         30WmJrGBd3AO0+uhBswxSJGGA3/pyqpaKGs8t2YTuoN8ppIVo9w/wwdCQ5PsQ6j+/uNu
         vrlS4tpRYQzIZzuIfzS2k8Ud/eXnu5PVxYabFVFXM7iFN4sFeT9fU2mexIBy/26XvNOt
         B6tOElprBRlFLgRZxwRog2dZG0uYZ0gJ2JGss2X3LUPsV31m4eI3LKIu/YOOmIjwm9rK
         ETn3Kbn0zSB6bewbH7tuWnRkvD4F6lFJ3FrIoYpcvq5k62BWbXu/dEg7yGabeYgdnBAd
         daSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793298231; x=1793903031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=DxY9NYueYpPUw54/1LuKABfDp60AROnzubbbXy7OzS6fWMrILGyAPx+k/TBUzTDoQf
         0+estVcf3DGr+NqskgZltpKjiTwBj0vHxfiZlAv1hdCBqEV+qUGB+fKraqRqaZGJI9Ad
         aHuqa1XDAyOvsrzYt4e2fwVCkmevUnXplUQksj+fp6M1ZkXl+zkUCRvmoFsMOA3v0kwz
         Qz991YYvpNKWfDlgqHmAUX1bJTSVeq5mbReuEAT3YssNt+yd0jN+OmcLTEbZqe3twO31
         DfUU2J0jeNSxbzemGGGlU75TQqjY6sTlc87Wxa++VyWhSCCSHud20YoCA1co6FakOgHn
         lsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298231; x=1793903031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=uSJN+ibYNb1ECF2doP/2BECJN4LUTojPoB0+UdAwx/Zi6fINFMEDUpbWiUcKkNfseM
         lfd90peStEZl5GETTjdnm5bMqFlfbLETyjy2B9t8VO39aO2tut42u/XvDp1nigJ8MeUR
         m3rxkFKGg/thOZvUB8TVxe9zsZDe7RhRbyDXrLtroQZVMZxYRcUfFz+6OyQqfqvIM3Gl
         4HQGj2TjimnMEG4ecyQjl7OncM6Po5+9qxoQV5PJErRrtn/j0Of9BFCxDABS57mEeW/B
         EtKeBJBHYAgSlvRctOJyQQuqXEnWtTWJ6oCoXS1VUcV3/zUlXj3P2eYPYH9UXmbffDli
         8dfw==
X-Forwarded-Encrypted: i=1; AKwUvBx3oOT2p15TlSbHWikC+b6ZkF7SSjk8NX92JfXkWXzm3Rd9Ymu1+uCTSM69yWM54RpvZFx+mOvU7AAqk6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtD1b32MVTBFKzYMPL48jk92mwkaSt5HZqB5RBRD+1If51txmX
	yvawtc2OsmYPxKuJiZ5TNjvO/wRqN9NanpB1cd8PMWoLQIZMaLFiApDlBmM4sA9H+hUpvwcEf//
	DoKXBst5pJZkMvQWB+W/KaQyw2AySs1Q3bxZHAcGy
X-Gm-Gg: AYBFou04UTw6mX6UW8ovB4Jns7ZIQ8zdF/sS8VEXSwTjm5EusFZcYuxoUiqr2UYk+aV
	kzOeWcSLRRD+0lXaEZDTXnUfSVw8xtHLoTpQQgICiYEmzmgI0CGKpobj0xolTzRhY+KqJyoXvM9
	kFqrQ45JQEaBFKeqDxANiabfHqiS4CvJxz5LReH2NvcAY9lVJs27BqnceJ594TVRbosZYPzWJ9a
	XjJ/r0JeXmpkduWbNqnaT3ppznM1V3nJ2Pik1E5XGirS3yOq7luAOMywOxJu3YNL/pQit2zXB6G
	a/tRlR9APDJTqaUrAPSRVno6rHxVAdLKWRqVm+RwwE9BqtfAAmHN1YTS0P8JSJ0I9yULbUjnbk+
	+FcX2O70m5ucV1ztmde+MygVd/I/1/Wx4zqMLuUueY53GtpQaHvBJXJHah9fx76Ypfg==
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr23748491cf.14.1793298230692; Thu, 29 Oct 2026
 11:23:50 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com> <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
In-Reply-To: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 11:23:39 -0700
X-Gm-Features: AclHuK8I2R6ZBL0M8gpXX54gY1Y2jQq5EjXVV3xSH1Vs5_u0FZ2MTRQeP10WsJs
Message-ID: <CAP-5=fU8K4as51_Vi2vKAC-kGMVEFn1LDjCg1WvP8R0Y=8SbcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > 1. **tools build: Add Rust library build infrastructure and zlib-rs fea=
ture test**:
> >    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crat=
e
> >      sources in distro (`/usr/share/cargo/registry`) or local Cargo
> >      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites =
to
>
> When we were discussing whether to vendor crates for the normal build
> or whether to fetch them locally from the registry a couple years ago,
> we discussed approaches like this one, i.e. picking a version from the
> registry by folder name etc.
>
> But that doesn't work too well. For instance, the graph of
> dependencies may change, there may be several versions available (and
> the highest may not be the proper one to pick), there may be different
> major versions available (i.e. not backwards compatible), they may
> change the build scripts, etc. Even picking the highest major wouldn't
> always be correct, from what I recall.
>
> I also asked a few distributions how they felt about it, and they
> indeed said that it wasn't a great idea without querying properly the
> registry.
>
> So one should really ask Cargo for the right information about the
> local registry (i.e. offline). It has been a while, so Cargo (or maybe
> `pkg-config` or whatever) may have better support for querying it
> nowadays too -- I would suggest checking that first (e.g. `cargo
> metadata`).
>
> I think depending on Cargo for this, especially nowadays and for
> `tools/`, should be fine (we were considering even back then and for
> the normal build).
>
> By the way, checking Cargo's cache sounds very strange to me: that
> means the version that gets picked is even more "uncontrolled".
>
> I hope that helps!
>
> [ In the end, for normal kernel crates, we decided to vendor for other
> reasons, e.g. we wanted to pin the versions, to customize sometimes,
> and most importantly to avoid any possible user misconfiguration that
> could lead to a subtly incorrect kernel. But for `tools/` it makes way
> more sense, of course. ]

Hi Miguel,

This is great feedback, and it's why I thought this was an RFC series,
rather than a full blown series intended for immediate merging. I
think the other obvious point of contention is preferring zlib-rs over
zlib. I'll incorporate your feedback into v2 along with addressing the
large amount of feedback Sashiko has given, which may become
irrelevant if we trust in Cargo more.

Thanks,
Ian

> Cheers,
> Miguel
