Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4747DD6F
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038187; cv=pass; b=EKyPC9JhEbQTzfI1LkpaXzWUHp1RLWjRDUPAirCVHbW0QQ0Id/NKHk9Gl49I+//ppquYp6+tWD53xw+ecEibafM8i2UQn6JgfBB76QYR4xe5akN3l8PqzGAuLRScXJoMrvgMwoIANQhMNZYNBM8rl62VYVL2mifMdDkgQSxb+Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038187; c=relaxed/simple;
	bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Z+D/xGh6wi54PluUTlBh5gzVDP7ffKzybw3vlVhKbbhKFYGDecVeBkRxXA/rXakBgE3Xk/v9CnlDEk1D5gqNwjBadt2nmKJBaqWilOIsovzisWFgmS1YVtUT5ZcoeI9UAgqf6bCB4t01Zt+lAFa+4bB/9l7zvqUFq9wMtp3AZbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXeWdspq; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXeWdspq"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so650089a91.2
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 07:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038183; cv=none;
        d=google.com; s=arc-20260327;
        b=TPHfShPpCCf6BrhTVqKmr93KCfYVkHdQjnC3GgLpTyXELH7VM7UedlEVQF1t/SUs+I
         /8bDqaZnvYG6gt7W7s049AuSD1qlJjknz/ogUV5/5Ux9wYyk9yVtqjQ180WLJE3O3njw
         p60LcVTJA0uj7zi0RTTrOZ32c6VA6rBiQaD3vmXhwvuxGavmWdpQ4eLCX3wteousco0O
         ugKSqHIFyiRbx+6Gh3afHuiZhomm6Zk0CDhrBvBNE/NZPDdI8AZlDfKfrbeaZAAQo8gc
         NLljvYiUX4aN2mmdCr11hOZ+ZSOO8DrPc/slgRL+naIL08fNLuNtvbk34w5hYKfFPYc/
         Comg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
        fh=JC7FMgcllv7fS+L4qZl6GPpZ2F2l8oEG85SEigO9Y68=;
        b=UvjCsfbj+lrILzHlZtwvUSbq6AQWN1cZM/V52O1R4kW5tmsN28mlWA1iXGXpnBFt3O
         8Wr3vNCKH74WXPX3NkItukYFaO79he+0KgGMoILJPW6bPH+GCiO0JJkmvxTCqCoR0ioZ
         0v/q2MoI9PBEYtRy3mkBD+1mXDXGtijJTtS37WhbB2ELx1vAjfJNBAvWCCJOTxRXb6xy
         iAANqjHlAoIQJy+iuIG7ttqR9AaXdBDxt7wpZGCoDOKHAgUYtx3jO/BUkVb4d/jaLJEF
         tT2LUZwNzSXP8PCXh+qvJSPgf9iu+TPvkTgXwUIj51tYYImufkBgJR3uKCQEqjHMP9SN
         vOpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038183; x=1784642983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
        b=BXeWdspqbLaupeIZEjiitm9hl1+qYIcVeoIGRxKOEsZLOVLDH6mm1v3tG/sXYjGF8e
         NIE6np/yPGZvr0Cu+3Zc3rNcnv8/Xr0XzeXpBgORloYpFUu8gd350+lFMn0+970/+597
         n9SJPfghvl9yAstcVr+iOgRoX09x+gG85x4I0ghmXfTB3EuEQvc56oDZWtQnnD6Xy+PQ
         9qxyRO3GPNijtUJ9VXbekbKn3NALC71fT3w8njaxuNY6XuSh/Dq9JrH7hxGvawlrGhZa
         hNZsvZe0Dxgwe+iz1XMMEur1P3Kdfyu4Bhoq0w2J0A+Y/qoRccF1cZ6CLGfpJNsLiJJc
         p0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038183; x=1784642983;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IdzfBAuda1Ugb7dvbIa+3pE4vsLysi0rcWtfaUR3BA=;
        b=EEWf8LmdvVArhK0NZ0gRsCVmOPNX2L+au6gdd6fX41iXQWF5lTM97Q4TSZTIuiXi1L
         8A/tyfhIATT7Wk1tn87UmozviC1Iyax/sESmq58IAW9OUNKKTgsgty/5VTtJ1AXHNK+L
         6/J+BdrGUkHX+FJ6U4RD7Ct4GPyVpSZiEpLYh6qEGnz6wIT4PK6P7RzO26ygurlv42ql
         UFFmgRGoaAsVCT5MsnbADdz3O9fkabBRS71wGfhPZZ3XfOKyfDi+7mS56FXz24lQ6lKt
         Am1eMiAJHQ1dblDT/d61NiK/XidiAZ00o/5aAVJh3XrQOFVSZBQUgZd3QPV2bK+hyMrc
         h4/g==
X-Forwarded-Encrypted: i=1; AHgh+RoKsWhCR9wZLaeE1wy+HVmGKGjWalDcUu4Mw//4n0wJPDo1iahRpXP9gFtnD4Yqs7za7op2t5hpvrTClc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4FQSMs6E00cBbgjejlUwpO4bbS0v/o3G7UYDBiC7Z9kP1NVw
	pXFxkegdJ+fbnPR2G+SSBba6QjclpD95MLJY3Jb+0F7f+ZL8jEQPLWBNbcZEl92gbCobsMCm0JY
	EPMl6Bo17rh9Qn9v1xc87hN50I9wG3mA=
X-Gm-Gg: AfdE7ck3ndfa+ie288xQaqA3BwHxUSKrahBDL9rHolL35OvC+upAqW39/NkYV6Fl23q
	pfDIS5aDpM5mP5R6DsPgHkQ0sRrgawi6/PG/xKZfy1vIfMbYQWAwAkTxCb3QMZM+0ZpUzKmC3kt
	QJqI2t20rZ7bwv6ZbbKkFGKYVATYhfp7xrp9rfvo3xg0zYTI2yM8zlqqhCv/UUe1A2AY3yD9sn9
	4LRUfrDaaDlWwlCi31mG06/BvwFgKOQhcDjDspkfZDi0dnrhFssCJcDTUpZdOBPN/5yp/Cx/fZ5
	1XCEdBGrrpVrKSTQ+fKGJRpQ2WXFw9IkuCohxcOVLd49a5Hi1dMYMuABhHFN/1R2EG+3wBRc6ab
	E7QiZLI5g2qZu
X-Received: by 2002:a17:90b:564c:b0:37f:eda5:516f with SMTP id
 98e67ed59e1d1-38dc760604fmr9794243a91.0.1784038182439; Tue, 14 Jul 2026
 07:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
 <20260714083331.69482-1-litvindev@gmail.com> <alZBCoBorSGsCw-t@levanger>
In-Reply-To: <alZBCoBorSGsCw-t@levanger>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 16:09:29 +0200
X-Gm-Features: AUfX_mx--yhT3w1NL0wLQwdIGz-EJTA8oL5Ed7RG3qAqn7teI9MMql8DPSUS0vc
Message-ID: <CANiq72kCEr+576R3U-QpNkKm41HFPzrR42z7RCJNo_YAt+MR=A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: Prevent binary files appearing in cscope.files
To: Sergei Litvin <litvindev@gmail.com>, miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, 
	nathan@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:00=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> Miguel, are you with with it if I take this patch as well as the second
> one [2] via kbuild-next?

Yes, of course, thanks!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(If the `cscope` target is actually broken in some cases, then I think
it would still be fine in -fixes; but since nobody complained so far,
I guess it is not that urgent anyway...).

Cheers,
Miguel
