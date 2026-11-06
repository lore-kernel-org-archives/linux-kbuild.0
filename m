Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793989034;
	b=n+aN0fMM5w4DhTck2mkqFpv5hSYvf3N7mP5INnYxIypi21QFWQN9k8WRmcQn7/uFx8D6
	 JyJ9pOt7YgDN5P8NzMv3cDFxAAHbTVvvcQq1Tq9WM0FKf5R0QfkGcZIzyaCNvIAMszfjg
	 gbd9PkyPGhVx+U9cvbbcnoI9wohWpzF8zCgHopvVVT4D7t2IwwVWtoC60uRrdyrEJcs/F
	 hD2zkacK9SUvC8G+yVfb5Nut9/6Qbxqz0lPOMX1USZ496/Xbh0fGt5GVx4zb44pTsjbv5
	 1rcNiexo1ZKRXhv2f8KZMm0mi00k+0WT32L5J5fJOPeqmalBiqt04QwBd8KtidivtLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
	b=QJW7cc/U6EiNDeg4D/k+gaK42ySGc/Hen72wONSk4p1S1P/GzQwoX7eY89L6qJglcwQI
	 mxzbpsw4sy9/9ddOr/B0bg5BklLlpIoJyc0REtvWFwq5i/0EUEuoYs+gx7bVOz20CoM8l
	 9tiGopAMOyiNCyqlKOpQgPNCQXYnwJXtkRGiVA2110daIGwXf+B5ElqZBrZowZ3GTVaXz
	 Og2urim/qyeh5xZLrwjO5Fsvn+QuW8TElRrgr5OXbWRJqEqnIFv3hF4ybpkEEHXjRbCuJ
	 Hmly2U+7tupKouzwoeYmfh9UIIG/5mdGmfOSJQuF980rvna4Y1QwId5Azc38p235CiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dv+v6Zg9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C0606A326
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 18:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dv+v6Zg9
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e4831c028so978672f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 10:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793989032; cv=none;
        d=google.com; s=arc-20260327;
        b=Wf97D+3dsosvQsILdDy8GqiCJzP4P2jx54BEvjof2hoX+Q8To9LE/Z8luJPNzos9zQ
         VMj+gVO9ZopeFrVSMHih1lqjqfkAE3u+Zef7XB79R+qYrzEixnInP9M9gpo4oELGoZHv
         G2YDkUxxKKbfeA7hqIfWRIjtd5zwQ6FTlcpVzkzVJUTkAZ0OTLji4MBEAbfsfu/EzaXr
         yTAdqK7tnS7oTEdkiJxC9xahic+y3n4DRG8wCmjgR5K+yj0WXF08mfFyia8FCoWq9PR5
         hoGACNEfbhrs0FhDrZ6pNl+OkhU8+sDdUpVoz+lp4cvuMtF9GvWdzXIuCYrjIj+owFBQ
         kX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        fh=ObZfvdsFrNLp+bNe7Fy55L80UcBYgGBYztLv1QSIwbM=;
        b=DUmXQ/fk8qg0UxHwNhJWy/YyaQM9gl0ltLxM9Z09aGufoindlj+gpI2ADfyw7qfDbM
         KAPQSBQQj1/nZQIHwQ4qf7VIiQGceY5hJRFigwzUnec6z4bQLL/077eOfprLnV1XEgmy
         K0v8X48Qys5tmFf+pq1iutYHtSCeO4F6MNuwiL1uDGx5PKO3qDQu3qxFNKB38amShVxE
         a97QXI2KqWHu2+UA/KQ95Mll4Jokpof3JocF3nfl2O1Cg17Mq8GEuJ7PQWbXuTdU1XDt
         zO6GkE3/ATmIpfaVNCnEwtJQ8OgKx0BycJFbfRCyow4gi5i3ZO3oEGjkpmHVOzGB17ZO
         De+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989032; x=1794593832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        b=Dv+v6Zg99UqcGdUbBKIP2EUBV/hqcwAN+w/VtCw6nSc1ol7nBmVa87Yz27QCn8Z1hj
         VMhyEjyvCJqw01Mb1VwcqwPLFlHTN849J6pS/XVmqKAt5Yg0qOadOWN6djYCQMCsFtYr
         S+LjhNcFZ5pOiMllseM5lYHHJuHYAeCt5LhuVhh9hycajomSzlr/GeTGmbmVZe9E/k1G
         honjrTkqHAx3UUKSmNxHaQ3vJaQzW7i0k4gILWLcLxPOXBK4ZWUGmJSjK93SpOYn1WPg
         taW+nhs9O0pDWuur28yxFYrBQSGx2mmtXbSD388n9obfFaCPUmD0Eg0sAT7x+nxSayTy
         N35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989032; x=1794593832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        b=e5vnQPls2pxYJfIQ/KGt2492vAOAZ6AR6JRXoq/j6RpI4ZiIgUQDwOtTsL3XrRzl0Y
         JLFLmwHS674Z8FSZxGTyaJgez6qmKjjuS7D1QVMh2uQ/7GZS0F7gEMfM7/tFlJnR215P
         C2+yT3Wbeo1R2ard0FXDZbYqf/79W3LB4YEmXWC1oIzRH93m2DukfUCw7jeSsM+CyYVD
         hO53ME+BUadhKLntOf3hOflopj98s4iUH1UQb6qpVkHLg/MJ3Qnb8KuyXxueZh8soqiq
         /syg/x3uQBBvCFzSMa7wSm/pkGgeX4hneehsZtQCMR2HecxQNlvHCXkSw8q77FfHfxGN
         6BOQ==
X-Forwarded-Encrypted: i=1; AL+hErHhtkYVmL8BTaekCvcirCpuq6mZy/sVN88jC1DKxujs2CNFZnoRZjldX5qZqUd/axeLsmlEwisKiQ5Z67Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S1Y+CuRooOgxY+91kNagGay3XIcWCSSWSgxv4nq1nddeilW17
	7ytAln/vK2M5kw9VH7y3/iGeebSfo5uWdorl8dq0m7CXrPP8R7LT1AxfPClH1DcxuC8kYJADrpz
	wHzDRIaFdp2ur/kmBndkcWqW3qsd7Daz1Ur4uUvoG
X-Gm-Gg: AYBFou3IDiO4eXlblPaKav8/4Xrf51tNTwpp0bxceGsAx0MIRipxCZslN9r5HKWpNWD
	VEjnxbaDVd+ZdUDQt35fqXIkNECYl8jLMrIPCBk9+QV6Btow5LgG1JgoKX/dmkZ2UwC7spJuk3P
	TKK3CVkUod2aMZVOXE1UkrZRtLy8qjlW3CvBimbRQgcsUY2nviV74Sw27T1YikIojmTrZXwIv/s
	X4XdpGJHHrC5Tkdbp9jw52IKhYkekx73j6cuUcNCX2IFrxt/jij735DJN/eY6ss6MjCwCTXgz4t
	0eyDuPTmdW2vUcHy+6UUPHYH5upjHfhccm48+DpBxhjgc+o5HCyoFhCcNKwYCWNws+UlZx1gGZ9
	pALcOYJZdoUbStW3v5UOT1tHBV9BtFigf9bvt1n7UmW1GQ0rxgQLSYuLs0yx00w9lvhRPz7ua+G
	77hEmV04lMlFK8ZbwG47JUkbPVQsBwqAUy0caclkusoCSXs5UrQDzqcZxow3yWdhOfm/6aTL6tY
	xEiFKTrM733isIz6CoK9hSkvIX2Y7AX0/B/74VriwMQpTJbAW4Lhbi05p0=
X-Received: by 2002:a05:6000:2892:b0:48d:c186:dcc6 with SMTP id
 ffacd0b85a97d-492777dbb54mr6867359f8f.57.1793989031973; Fri, 06 Nov 2026
 10:17:11 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
 <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com> <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 10:17:00 -0800
X-Gm-Features: AclHuK9SWyCEYtuJGMl-fJhTBaGxGHpWXefZx7LtX8R0YzDCJePA2Pf99_IEKbE
Message-ID: <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>, Doug Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Han Wang <nesthanwang@google.com>, Snehasish Kumar <snehasishk@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> As far as I know, Profi is enabled in the Clang front-end initially. I
> remember reviewing a patch that enabled Profi for the Rust front-end,
> though it's possible that has already been merged.
>
> It seems strange that these flags diverge between C and Rust. Could we
> add a comment to indicate that Profi is currently not enabled in Rust?
>
> Rong
>
> On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > Just one thing: I think we should also have this flag for Rust so Rus=
t
> > > and c are consistent.
> >
> > Please see the commit message, which says:
> >
> > > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes becaus=
e
> > > SampleProfileUseProfi remains false by default in the LLVM backend an=
d
> > > is only enabled by the Clang driver.
> >
> > Is that incorrect?

Probably better to be explicit, rather than rely on the implicit
default value, which sounds like it may be changing over time.

> >
> > -Doug



--=20
Thanks,
~Nick Desaulniers
