Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D40383984
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2026 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790658378; cv=pass; b=e4g5Uyfg+/wrXWT12LiRmXhL2UMUjcCEtev30zdDiPvWC5YriNSFUJuBljZ56ppWq3Ln2n7y+5BbEQLHW3nx+TJL0Q9jPQJi16TMGIElmu5cWU/6gWnTt3L/bIQJyNrLRm2OB/+Hz3x7KxacfmmOzq+aXCNq3uaT/NN9RraumqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790658378; c=relaxed/simple;
	bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xhj+917yWddunmtIi5K2SVJ98StoZgdZ7iEyziVY221fiH/q72qRoCje0iyVDFMOBymVJeALEkCBbLZiO0eEocTpnBTB2DzBBUpvBKb32SI8Uy1OEkrjrrXYcUA0cYjNu0StJT1fWqkbWTc7oLvMpoch0t8lrj/dOvr0X/MPbFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dH8X+HqO; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dH8X+HqO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso2924020f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 22:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790658374; cv=none;
        d=google.com; s=arc-20260327;
        b=GFqBMeBipJhgPZUKVi8DlIk/kogMZpy8J1Aebxu/r1NC2KHJV98Tb/B7iaENlGj5XR
         Byb1IUd4+WctGIjxdRE3PC7PEn7YRVNlIfAe9jneLWnIvywjtxl6UKjOSfTeDGXxlgwJ
         OqPRtsTekoli57HrIXc5K3Osrvt6TR+E9ED847tYGANZDmpfc/5Szfz3dHjawwQ2+p4u
         YDrdz6DhxnvVy1TNdXZHoVbtG9sUE4e1nOb2NVqVswnMl45cAEXL+J9h4ZaaMUaQwY0d
         VJyCRt7Bd7kpdKgiZQ6lqO3+kGPgklGPA9qYmyXNoGfuf2JaEjJgQpYGtRWbSKbCeDX5
         eNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        fh=qlPzKJSt8cGZ1tz4VxgDj95KTp6z8VzJvGUba9d2Fbg=;
        b=Bzx/h9PmuKaAxqtVm5vhmmt57j8gVCkf4SkTNF+La+Lv6jGytlCrJ4tkrscayXlDbH
         +09vPLWM/GhyXC8LP07FuyNRfQEHPtALJ2zBmZlDZxzza3b1GqsYXgeVdYle37gbu4ZP
         kJFy6+OPe83kmSJuAHic8k/yfTFTlvoJCYDNX/pmm4eJmFWXxq/QUXmZ1jadt3rRDXdO
         fEKwtMemXo0E6J9FsBCjPV16W+T8tC7XBQaQUf7STmDbuTGCDlhgTQQAJ7VoUTvwsqYe
         MoYIqBsA1tCAlH5DvC/PYnlaD7JZwdoTnvsluv02gtEFQGAjmnIzqTecA/Ng2RjupLrQ
         bUaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790658374; x=1791263174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        b=dH8X+HqOmR0IvbDT3tIprREFfd7UakbWfvHedWGe9PpLIqTg5vckNEEePwwCGcPD0M
         ygfw5qglrqFmQiO4hTm+lUolpPQBmyFHjAjIbjlvLh1rx5RIQfSl4q9rhCzKLoC2ZcNt
         4sr/sw4ez/5wgkK30tpb39a3Ud9AOHp1pmQPUeSZW9bMXWDKWUaif9orpQe1WWH4An/U
         4Dxg5f9cwNgb1tWK3Nn2PrP2TbcbQMl5qwZ+tuuJvvm5XO2uTEM/OGa6fng5cMSFy+aN
         Dvcr7fdW/e3lkO58SZ8UyErX9caXOYtmWQvfFrto7R+uiUnIx1WyAxWF4ZnGYD9DeeMM
         KUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790658374; x=1791263174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        b=txh3MTc9RUjdhsQxVwkxvk7npCEmJsI1a31SIpvyZiNrTEvauyX/yA2yHYLVwA7DVG
         U4b8taPZHyfikH55ih3WahrP9xn3cYM6YxKuAKS9qh+UxWW/gI1G7kF/VFNpQqwveLQg
         V39zcaPzNtoDDRE50QYI/I/bivbG70akFfXKXfljCcF8A7xUpIriCaygNVv4bY87Vocu
         5W6wExn2Jowu4JAPxOk7kt3r4sRWUtuOmS1YTS6fFmmgksELB8+pp6Ad64VO/hGFo860
         rJN60fU2UN1+xYek7ALMaA5S651BktOUChsAyZWBgd1JCMxCZiAdp+2Y6aKpxnQIss/S
         aNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAnHal64PpblBywwrGJXHeQStksCYj3DQn3Ymbw8mAoT0SoEwI36NI9b/avSO5+vr+gNYlNR/2W2SeMOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCzQagBeBB/RbfS5qG9N42MXBWwc8yUH0CEc8XYDMN9PKSlReX
	Vxczoa91RG94GWtsyjcb6I4FZTu/sHPX/7aCIpXf6IHPpAtltGizKo4RcXQjaLlKTH13Oqet5Aq
	78CyP86pLEdYFFCEjsBaSml548NLdVV+WFW4AiBxp
X-Gm-Gg: AYBFou2fvJS3reNGrJCdotTYXUhTwhaeNYnNUUHxIUm43UXhF5tgCvuQHreeaZoAr6/
	LcEx8S1uBy6LbYh82HHu+mac3onVqO/fvEiM3ws3j4Sx0DK57HmiUypk8MlUyr8NDjij5cNlpJ0
	w9VSOmU8mEOAatvVpkZMpmxh4aQcTV6NVRkfJ4JtMImf9m40pW55BUDQTBrTG4TEgZZIA4Kxgjj
	/mCURbkk7db/Dkm1bAenwvgcB3rC97TFSHmPZBdNtOiV62MvyMDn2tgqMyVTrCGGRhJfRUl74mi
	JO/qQDTuzHZZ5dRf1KgIPJRxchiDcl1Ca1jh7U+WCLqAO+o5lS4O3GyT/KnIBfxyv6zY+mOOc3a
	qjPwaePuSjrtdOrUAJ48cR0LGRZ9jZZwdV+xKlBB+TYnQ8QBnchmddQ2SW6PQ62GV+qW1Hg==
X-Received: by 2002:a05:6000:400f:b0:486:f856:1975 with SMTP id
 ffacd0b85a97d-48872a7ed6emr28989136f8f.22.1790658373306; Mon, 28 Sep 2026
 22:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
In-Reply-To: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Sep 2026 22:06:01 -0700
X-Gm-Features: AclHuK-G3nC4fZFb5XTwTm_Ndg0dN9k5HC4ZdnEzBSe__7iBSOMXfWozEdeSNPY
Message-ID: <CAKwvOdnmU0qt1--_1pO=8F=D39W-EEPHojc544APimtartFo+w@mail.gmail.com>
Subject: Re: [PATCH] scripts: gen_compile_commands: accept object file paths
To: omer zalman <omerzalman42@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:46=E2=80=AFPM omer zalman <omerzalman42@gmail.com=
> wrote:
>
> The command-line help lists *.o among supported path arguments,
> but main() rejects every object path as an unknown file type. Map
> an object path to its matching .cmd file so the documented input
> produces a compile database entry.
>
> Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
>
> The exact git-format-patch file is attached because Gmail's web
> composer removes tabs from inline diffs.

Do the instructions at
https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-pat=
ch-to-the-linux-kernel-and-responding-to-feedback/
still work?

Otherwise please checkout `b4`.
https://b4.docs.kernel.org/en/latest/

--=20
Thanks,
~Nick Desaulniers
