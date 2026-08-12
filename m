Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93A3B83FE
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523298; cv=pass; b=g08TdPpA1UaAYRDt19LKBvI1lV9NIqtv1PChi+DMjVKo8kmyNUPDKJztFrxflt5TMRk2wwMqoucbL7T4GfGhBE5LPyaKfPJfiWUnTWLTyLWoc7O2IEQ07Z5E2c2a/sE/NGX/kc6gxnAnIb7szXtp7jfBQD/ISPzfbaL2PyJ+njA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523298; c=relaxed/simple;
	bh=KAD9ksCybhc8clv14bTiCcv/CYLxdm47VVR2R99SEPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejhIi9j4A2BAmRaZJ1botOBr6x8+LyRad6yafYWxf8PCccdA4WiHZ3KKtkZ8iGY0noBVPl1A8XrIEAkr/+vk0nKISqoP0u+ZCk7s/47yp/bl3f4j1Pble8VofxEiqDekokR3f0MpBe7fwbWKQ7dZwNM66arxnn31aiSQxeSl6M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBnxSdrC; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBnxSdrC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1677c91969so80851566b.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 01:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786523295; cv=none;
        d=google.com; s=arc-20260327;
        b=S2x4AzKjVtzii389bgWrxktknlp9xhf0C4L9YWiS8Vs3kW80r6knbTyZc4twi4ryAs
         ZMW3LtAKHS8NMedBIzWOqUUOPnTCotZcB9tpuFuHBpfh6CAhOaKA5GyP5oXJim4tzBOT
         H9/W6xP+LLYAAeBaL89iFKjBPZHZcfPAb6vqhSUk7GB0lo8jRJxyIyqN3MfxcU5t7Glc
         kAFFI+0TBiOmr64Y6uMhA1yTFvd9a+3MSHiYzQfxp9O6/tKQllYaEH1mJPg4L/2m1auz
         5VYaNmuywXZhF21kkF8ANggMgCxVjK84UNMtnIUbqgVYLTHWF6rGdz6D+W15+GYoR0E8
         HFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        fh=gwBhclMTOXfGiIlviML0IyIXowX/CoNoQOLKCkgXx/c=;
        b=N5/4uPJWe97YVVZCnZV/q9s1TGP8Sjuo96b010f9jr7EreQ1t10T2P/35R+1OWDSri
         /u/TYwp2WpOa1JlPYOW9w5ack94C0sfjo4UcpVsekXj8JvaahUh1+7wjPiKNYBBEBgF0
         A++FU/INuMvf3eYXVWbvjUTPTBy8Y3EzhIeQN4tzd+BPg+dgoyqonx7LWz0+eg0QRZ2D
         ii/Glix6nZROvQhF5muO6DUWLUIerhoSs3hr8ihtC3zL3z1tA/wqA5gG2R8Tgmoy51SE
         iVajJ/Cv5VLH9IGRTN2L05XlZ8wc3xfd7vh3j7MUFWeoLSbGbCTPRUUIZ03R2HWtSNct
         cVSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786523295; x=1787128095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        b=GBnxSdrCTF03cZvOFp8hjvpQTlgLfM6tG8TmBZe+AqQ93/g1w/EUz6Pu7Nz+hyGK2V
         LiBmkYl5O3+SthEY1hQ3yqeIy1im2cCIQfvi3FjdukEOpaCGdCFlFlml3uRyoMU2ChGM
         fuybpe1dAu7grq6quQ+/qrx67wv9N9hCFes7aBh8JgsWSTJk3eLCpEYBInfXDmCwz7NB
         GfRTUBp2aDZW7z8DYtcxxHkWEomn9CQrG8F2rFgAX1o4PrFLndj3q/pFCUMEdAWvAER/
         WDC43LbWXBVZGF1zRCbgkeyAVZB5ptFZWnzpiyklde8tFFn699u45x+qZwhOysv8xLvY
         yaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523295; x=1787128095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        b=kbu/n4A+MbLOh5MCWrEFBPXh1TDqmbrjJ1HkGsGD6D9cuus0eFBO7zaZcTLuNQzJfB
         2mvAinPQMWquWfHE3OPwYwU04zVFUodql/IB8sGaDhV82/vgwV03u1jWST5EYB4EhkBh
         f5X+tH6Smp5D6ENs/L20CCNLF0CzjSYB8h/6ZFjoX2T16UX0B9MAUpBkXkCc8aJpTyBU
         jfzemz6PZ/GxbsEOJZoSCgGV3wWe+o5OjLcvnD9rmnGmxgef/ZJq/rQKKlpIE4KoTls4
         Y8qK/l67cTicLCdNWWJrWEt7ggvUibbj9PEOVOGi1Gsz/BMMWyLa7BdxBPMsNVR/sIRM
         LKKA==
X-Forwarded-Encrypted: i=1; AHgh+RrEBJYsGjq8IB/yQQBGHuh/MmrA64EuacNgAivwF2Lzw1K09Xl4jJfGh3h8ZCABQw3Zk7is07igNz1IX0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxB82z5fNvCFZWVCUk3gLTM0GeVnaayJX26ZEvX+Nm8fBKsR1T
	LkGAUcoGcz9MFJgHskiJfWazzVMx9SzPYzIfxivK9I5SATQh/F4ad8YgvNCamtFiibxMvK+qTAC
	mH5pkoPBMu/nXK/lMA7o14HLRId/9+RI=
X-Gm-Gg: AR+sD11uMRezvx7SalBoU7NI/Eptcvu6e5FNmGcIma/A4g+vWm5D0wcSBqUN6WS+Uw6
	X8WQ2QhVplB6GsCLg+m7GjLSUiVkfJJhLXTzrhhOj55Jyjaet4oC/pou4KVaMMqa8E0Aj91sXXB
	lcVx3wZQbc22bhP5jrlLUpPWvhFfKnNnc1MdSRvEdaTrIVWI1tU66tzmVXpTMjq9ngVTxVluMro
	8tCBigPhz6jLOXxngEBJ78YJfP6KC0R+NixvGu6A0l06yAWCXH9lthxPyvMnEe8VgptSHSiDl92
	54nUnzNfNnVTGYj4RFAlxTB18v4+OPegWB11CK+FkujLcZshTSx90ydoTpsgDFF1Wow0e8/Zkby
	cVrK+6NjJtcL+0xwLMTeYJbgELL2BfA==
X-Received: by 2002:a17:907:7251:b0:c20:eea4:267c with SMTP id
 a640c23a62f3a-c20f305ee93mr132768966b.30.1786523294569; Wed, 12 Aug 2026
 01:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk> <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
 <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 12 Aug 2026 10:28:03 +0200
X-Gm-Features: AUfX_mxFGFTXsloghSaGbl7nrZA4hTgYyp3DHtv9-CHPmf-xGOOB1T8KYXQqRBU
Message-ID: <CA+=Fv5TKNW776xCe6XJ6LsvnsYF1r+QxUrsnG2Z2o5JRJP4NsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:56=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
>  FAOD it's also the space in `"=3Dr" (gptr)'.
>
>   Maciej

Done!

Magnus
