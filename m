Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA5231C9F
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771813514; cv=pass; b=tWAkbv6duBLb/XTEINAPmgNWctf3IMWv4R3th2irlCfvloVozlqaHnBHCtdEl7YcQatd6tymfudEW5VzTrDGSw5b39MjTpZNmHWiJBNqbvAm640lLuZOPnBEXvW5i2v3otcFj1JrBGRzbHfRgevwgZxTsUAAWDOfvMZNmj6afjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771813514; c=relaxed/simple;
	bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ0u1l0Q9GLEYOu+/9Svs+Lta/1Yj8fOxbGjEkRkf4YXSiJxOIcwrlUsLh4gdmbHE++M8clx24Met/TEJmslaibe/GYSyETSfEA32iNFSVMy0ypdO6t5RFwJ7qz2DoxGzNBXKkKo/1/QWf+d4klY5FMBTqb5qWb1NGlj3p6DrMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXnTB73J; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXnTB73J"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd6228af6aso203160eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 18:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771813512; cv=none;
        d=google.com; s=arc-20240605;
        b=RIeE4HO1TuOMUpmsm2SJ21221TOGNR2h7at62Ujs81gP5OAwP6ml1pLcnNnTItcCJY
         ql3Plk+X3TC1sWVDUr9OeU9YbFVTTnF30WM/MFFloW/02OdCQOxN4Y/nf8kEDq2YIYt9
         K9x9K/wVNAGF594VLJ2xNGno3CQ2EuRiOnTnuZDF6yzMGCg7i4Q8sJIftpeod4tUQSov
         SP1ncdFWnp0zLMQ9Hu4FG0j1QXthfdrsceBurDfSMAt9DFQV+x6DmqnqW0WoGkwb1oaP
         pmpQXG86mN4LPY/CU2VN8Gf87xsaXtdlM8T2T3gZ7b5lOPIehCnAeeUatByNBR6IKCaK
         gg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
        fh=EvXho2gv1nMOpHIPnUnSxDDa3mP7jAdWXP9uszR1Py0=;
        b=G/ajkiGLd6Bw1W1Et0aEk5pl9ISa0ji2VRrzXodyonEYxd9ASDavP+R1EeMiYoUN3R
         pSz6Hk4FnINv6erJ5O7Skb6/6aGLgI5/MUinX2zSRNpjmPJLaFAVkQ+1xnc3VV6Ry/Tl
         30i9lFHN7X4d4qgXii3wgQHdJHpVC8NdgSNKAdmN59W83wFXZU8w6m5+UWJCSdB3zlR2
         r6tn+Hax7KhGwvyGwcB8OVvY82jrXPmQiVNmSZzXTpy9iNLqMnZ63wqoENJR+dah5Th5
         87bh7XxQvLx13y0eg1ZUuTsASuL9LLgKeOaJhXLWKhFabZh+yhrQmyDAk/QHqnfPX0ZG
         7IPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771813512; x=1772418312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
        b=fXnTB73Jgk+PYqCJ6ZcUIxxqibaRUn/CSpA/tYUj+7rght1yEseqqkO2LFDLG628Jh
         ynh4PHR/MD1n7IsuY9TfUdpbTENRXd7q+sj85T7GKS3b+u9AjEcZWhf/sRCS/tTIHkjr
         ut2ewqhbnC/IcYTYHbm4X1ub71i8vhunHKIbs+Fcqam8F5HnMLwX+DrusxThWh82EFGP
         PpGot3dJNwROCvrOXVQqr6uZQLe3cqVg9lWmDH9cLcQD4AiMjWUxirMcJ9nMzs/J/YEA
         xJ0ftcMzs8EnRpZPOlsbZryVIzNN7Uv9WkMhXpwU3m5cJ0CzqYmV2LBN0p8Mn7GOTfZA
         UwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813512; x=1772418312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
        b=rwyj6a080zjnpwZUllxuAJ4vdccEdxBbnmxIdmfT3QoXF6+SQYohjK56p1vWUZCwMm
         2BHX/z/5LMeqpeFSbwFSPG48Ulzq5MJHHOdyWwSMjewsrsaf9XakBqR5yy1cHyU8qPwL
         Q9XtzK6ATU2ZOjZnUCGEjBKBAwl3HVCUKFbPqPk6Qo+IBtXLbtX1+sJ/lZuRMX5GuKWY
         lDRq6+6tv4pIlbO3TQBzxgTmZ+fof2swyO24eFwnwpKyuCOoIcwQLfF+ZsOd+WdgNLDS
         07EdlzCmFlZ9oi9IO3SRMNRp3JludbWH71BxkDAgY5A3xMrytpoAAeLg8Se7Up36Y7An
         QxJA==
X-Forwarded-Encrypted: i=1; AJvYcCUMxtceDp3uIPZW98aNODv+CDI7NSOMKebREr0YdpPomwr8Tqp1BF0hKAKT4pt40hcEXS/8iaUUbs8wCqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvXtkNQ/kp/bO+O4zzwmQY4gPZqjDvD24Iu/bXDRoYHaj/SzbX
	x0O4uEmbqXZEO0w+ky5GulZtFvbGpmyJQvFr3hftjAeMapVa5jB/COfOgwHWTMzS0TaXgNUR0Zz
	gswfKH2AX5Rtxh09oLiRPKw9EKbn7+9o=
X-Gm-Gg: AZuq6aJ+GT+oNoev/6guUVeYFJ8yZDSGRQ7viKM1CaX8cq0zhvB/tIcCD87aXOvWCSU
	TzDM7q81oKiqR1Rzg/RLIOKSh0kuv8zUjTw7kRJPh65Av+VWc+JUZhNLbYMyLVxOm7t8u7B/RJd
	3gpd+RT11HlxhCJ/yTkKFMNin5EHYglnnyi24Pb6V1vyRYqMqDEZsWP7aIZ9whpqXkuM4soOsGN
	2o0JpviNK57DqBT8OL0fL52IDLTlRSn9iF8KK8dbyIMu/KLQA4tAXy/T4QmLn/TmsnEyDH0awo+
	J/Z4Mj7RuN52gsAE4wPv395jjDq00VoQhbzfF+4l5dhVaSPOSJWlDlMDG/2MYkhPSChYPnd7joy
	8b5K8X8LYOkyFfS+4GXY5Y9Rl
X-Received: by 2002:a05:7300:cc0c:b0:2ba:6f02:2939 with SMTP id
 5a478bee46e88-2bd7b9efccamr1605384eec.1.1771813512092; Sun, 22 Feb 2026
 18:25:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
In-Reply-To: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 03:24:59 +0100
X-Gm-Features: AaiRm50lW9Xl71njyNGUysmdmXECtepW9tM9FUg6Hm0S35zjUK9PXq2xME2Xor8
Message-ID: <CANiq72mKm7TO6RE_cofh=OiSz9sBuZ2EgAiXZHKpcTR0eDgEcQ@mail.gmail.com>
Subject: Re: Rust build speed-ups - please?
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 11:09=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yes, the actual "check that rust is available" part makes sense as a
> prepare phase. The rest? Not so much. Why the heck does it build that
> 'rust/core.o' file when I want to do a test-build of a totally
> unrelated file?

The background is that we need to establish dependencies between Rust
compilation units in order to build them (unlike C). But when Kbuild
descends, the different `make`s do not know what the others are doing,
i.e. there is no easy "treewide dependencies" support due to how
Kbuild descends.

So, for the Rust initial integration, to keep things simple, I added
everything that was not a "leaf" to the `prepare` step, since that
allowed to have simple, normal dependencies in the Rust `Makefile` so
that then the descend can build the rest just like in C.

I discussed in LPC a couple months ago my plans with Nathan regarding
a new system for building the Rust bits, because we need to become
more flexible for other reasons too (e.g. we want to split the
`kernel` into smaller units and allow dependencies between crates
elsewhere in the tree). I am focusing on that now.

Cheers,
Miguel
