Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592256;
	b=YBM91qUnC+fhVlq6Ta8zjuKxo3vJj9nlCH/ySP6lO853ZtffBwjm55wOVniq9BQWi9xL
	 vLhot1hT7fGgaHq+Gw6ksCn/TNT7VgSWDG01H/NO8uE4Pw+7xuBN5Pn3blltsnegXVdMX
	 eYrHVOtCchiX1wALvVTIZjH5eDJefPPNYoa1H1G0U/NQuEuyV9aq188xKqNrS+RR4JEEe
	 HZt/N/bO206HcpJMCyt68q6BKBz4Q1RO56Ub6zaXkvi8iZNT5c3XWpoKmuHvwZV33wZGr
	 AqhxRe77mzce0deq0i/vZh+1QRVvvhp9kLU1yyhiEKRvm42OzfESBfaouFzoeh4iXlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Content-Type:Mime-Version:Subject:
	 In-Reply-To:Date:Cc:Reply-To:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer;
	bh=8uM/e5bRSgkmbP1MwQqFnaKW7cMdOGe9VQb7vfvxj/s=;
	b=I5ntK8HAUKV5F0xvsoJa7c9oUohCzqINOJjDrImXgieirgGuYbWk980kiFS1F7eDFdWL
	 pom1XXLpAfIYXdxA+aq2fBo/+N1prSyjkxRnZMDTme/TH3/8Ks/EdJyStf7fozCLGmv81
	 6Jxj+5dXiqQSqFtU4wvZ3Qh64GtYrpXNuDXzPLi6ltRaQRgp2KiZg3aF84id+nRtEcetg
	 j7203kaxwbxUogaMNp70eaAmBgAnLe4N6nSnOWcEtzCvIpq5W6IBaisMxUjH1D85AWGrT
	 OZjoTeuWVo4jiT2v9K6dotFsQ6+4N0NgudqTYri5n9j94L49RSjtK2BDrMWpw9uBWfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OXaKGvJj;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3F606A319
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 14:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC3F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OXaKGvJj
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9841363b5so6368821fa.2
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592254; x=1793197054; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8uM/e5bRSgkmbP1MwQqFnaKW7cMdOGe9VQb7vfvxj/s=;
        b=OXaKGvJj/Rvfp5iQJHj3a9Pkkubnrwkzym1QjgKYJHRH6OfGe74FL6C3b5PacqARx1
         3H5jX+SNPvFECNajCLdd6x0Q5+MDv8bW4lY2cLTUlXYxKbU/h8hLsy6h8sNDq4dTr5ap
         OmjUtWYkxIYUhXgtj2C+0vNYFom+L7AnaiSMU8dSgq0dSxvutv0EndBd4/QZyIPlV/OG
         kUPsymLpGSLt9kDK9spzVfvZ6RhJv3QkOz8J6OHCdoc5/6gSLWdBpHX0GA6kR1UuAaXo
         B1T/2fPtkf16CTKiX8Zsc231yZ5yhJITArd5G/w+ACMCcjxqCAdHXD8aJCg2K37jeLx2
         DMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592254; x=1793197054;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uM/e5bRSgkmbP1MwQqFnaKW7cMdOGe9VQb7vfvxj/s=;
        b=lF6vCNt+t7BGNH4cNJpSTstoAgfykvFR7QEUGv+60E+2d9h1tb3afoPDtlRxfTW7km
         HsmVIw13r+t4pe24hECqzHVuHZTaU0g77bf7trTPIhG+6mt3seglE4xBL65BcK133X8H
         Q8sPfinKmKPm8UESMwEUcuAqQDbkDCXyJOdQ1tm+FwljMiezhUxbhQQ9+81C6U7pAPRw
         0wnXBry3XSNM8El8NlzhPwsItXkimJvereXwoAWbTG4aOoD38OhkNWOXcE46AgpNvqg+
         SZpo3+ilZomNk43JWqDMaMCffEJHp3ZP+qSYQ9xVQ8kU0nhEYZTmf2xd3w8W5GFzUYvG
         gPfg==
X-Forwarded-Encrypted: i=1; AKwUvBwX1aVLjkS26cAiutB3npr4mR+P5bRn3UilrDnLVLeyzPZp1Ro45E1pg+JETjruDN6tW8Geq8VQmG/zCBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUxS7Js3ClqCislyBYFg3HcoemqJMv8BAlr78XsSGFZOTIm5gd
	OSlKSy0hzHI8btTEgruTQZFGMBP+n6NwvYKsolwPr5A+NKP4Xh/dR1ha
X-Gm-Gg: AYBFou1Po2LgIvQth1gxmt6HVHVf9EQvhnzvh+DG+RWFCtNf3r2ptc5dJQK2jDmgiib
	X8bBTqVBSAxEeNoQyIW0uw1xQ4Z+tWN08UEuNmwDcKhtJYe8Ono8cR+0xwNSrmKAXxFzI6hyq6j
	LNhZePrjZASMjmzaAT739AGlKui2Ym+ox8J1slqCzuVJhhHAQYV66f/3Fj0lULk9hTzasBRSL6P
	LHlh7EJnRem63iNWoO1JcRXV5X2g9CDheCF9RMNRSP0gL63oilVrOql6qvKmNlACNeJCBpr9FAa
	Z97mo+WyMs1CULVjWfaU/BG1D9/C/Ro9Bt2iloqwTOY6CHVJt19CGGXUVZCFCpocHM9VRQOihqR
	7AH2/8gN64WmafKD+PQ0/5iEWbr948eipD3pzVdHoyNo/yPubM0a1OpGcDbLPdCsACX/ngl62n6
	dA1rCzNfDCFaP0IMCRW+KaopkJ/JS3Ok7FlX5r78G8kLJ5JdfQvmiMxNRoboHQhJDyeFneQUrg8
	E7Is8rvLAz9W8O1ayHlhvIKXzRhg+IOMYinrSJIDxkJNLYwtD6Ztr9Hr2Qk/sjxl6cEJS9dWe+w
	xA==
X-Received: by 2002:a05:651c:a20c:10b0:3a9:9a60:2c47 with SMTP id 38308e7fff4ca-3ac441c1e28mr5511751fa.29.1792592254112;
        Wed, 21 Oct 2026 07:17:34 -0700 (PDT)
Received: from smtpclient.apple ([176.99.99.239])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563b1asm169111fa.17.2026.10.21.07.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:17:33 -0700 (PDT)
From: "=?utf-8?B?0JTQvNC40YLRgNC40Lkg0JrQsNC90LTRi9Cx0LrQsA==?=" <d.kandybka@gmail.com>
X-Google-Original-From: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JrQsNC90LTRi9Cx0LrQsA==?= <D.Kandybka@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH v2] kbuild: Makefile.lib: fix offsets generation with
 debug info
In-Reply-To: <20261017214129.GA404142@ax162>
Date: Wed, 21 Oct 2026 17:17:16 +0300
Cc: sashiko-reviews@lists.linux.dev,
 Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org
Reply-To: 20261017214129.GA404142@ax162
Content-Transfer-Encoding: 7bit
Message-Id: <72D78195-967D-4789-92C2-2521195D9454@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com>
 <20261015210149.78470-1-d.kandybka@gmail.com>
 <sashiko-outbox-174936@kernel.org> <20261017214129.GA404142@ax162>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.3)


> On 18 Oct 2026, at 00:41, Nathan Chancellor <nathan@kernel.org> wrote:
> 
> This definitely feels a little contrived but anchoring at the beginning
> would avoid this and seems to match the rest of the macro.
> 
>  s:^->BLANK()::p;}'

Thank you for better view on this patch. I agree with your correction.

--
best regards,
Dmitry

