Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842952;
	b=Gw1oCLu/m1c3ScubIUQjTmEkI2L2sr4go4hBfF2xsylrRccJPKnwsXp7nApByF5w1DoZ
	 qMCYvcr1k7MYudPfiLZa9Xkr795kA/ANSR2kwS3GTueS/OA3g4i0f/PPpkWo984Ud6I9K
	 ZOIyN/R/Vh1vQlDvKL+7SUnzMcz1OhKOkSppUgpSq51oXKgmcPuFjBBn6x9yeb7sYYm08
	 16/SpjE+GiV4C4xgdrTVck+gcgErdtUrc9NRO0Y+lfJxDFg12mnqFsklDDy8XrKt05yek
	 AXuxuXPZpjBNV5F8J9oanISjpgomLvn2TCovA4dcbzyfN0H59mCuQU1E1cCXZr2Ed0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
	b=RrmIKoIX9vPk/DGwQ1e7pLCV3h77RxpBW/MWhzDB4tGaESGkV9GYciB95yuLsgrpVULz
	 5dhpGzON4i9tZSGJ/5kIEbKbHDeDZribKkpNmhNajagcpud5W/PEKcBYBVwZoQUKDghDb
	 SP5haROHe3RhjI7a7Y2S+HXwLFwUl3mfYm0jhQvFJe5H2ud2cOi3p1NFlWktC1Ocwfct7
	 Y4wo3aZAW3ww7bDw069Ut/fDFbp2bXpe4Jropv2I2SKTaLCekSjRk7hGseJB8YobfWzgk
	 ogFUaQL9Hw5MDrYM3sYk6SVUs5viCP9OwqLsmKPKUqx6paPAicjHhCF5LBXOy1OGNEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RzVtavYk;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1B5606A33A
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 01:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1B5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RzVtavYk
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 893EC3F7D1
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 01:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793842948;
	bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=RzVtavYkE/LBMxpLKB6QGcQKcna+jHZBHZlBmThLYzqMGoIRU3ImDyxu0guCqITMo
	 1eTiTck2Q1vsq8KW7GRcZCEOtnHGWaCZi4rk4cFEoMMc69lT6Yh691ZABf7DsakKqz
	 iyIB0ekVqFgCJlXYlHWYMa2mpnlQbZpKa4e1pK76R0MtJBN0J9RFHLHX3tVGFzzOnP
	 xBANUb2YsSym8zl8ao97CXb1wvT7eNVhiBPw36eW1PvLwFTUrpxgnePVbPXbo53B8i
	 4isztSi/ujZGsKjwC7zZ9jrm8Qgs3kUcXMwAjZwUaJQ5gNUv6UaSIZ61FT/VasXGcO
	 Rs6UaqOiE9Nx+x2Lr/k5oW1f08JL1YNEjDQK+fnfkcrxXy25dGIpaYLOfw3/cLjUn0
	 6JUIYm1SSAV0lAE3yVIwdGgc9mO0QTb8jjEVR0FUjMCCZWaqP1O1euNBFq3DoNvSTd
	 vLHzbUh/SiNzgaBnTkE5fDvUd9oDV0ctvrRmK4PF6FzaSDWWULYKdcfSgi9A44mrIO
	 DU5HtQX7fJ5keKbmbq3LA6sWemlfErQwfVn1dAFMNTrOvXIcBCxI5SwUzR8GNj5OHg
	 WEV35Uyc2fPyKEWqofJC+HMYp7pwKHsI9El4JLf2lTVuGHrjkcf9RQfcUydXl6Kkbn
	 wqw9dLFexkl5BN1HI96ZQ3CE=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a0f2237afso137061eec.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 17:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842946; x=1794447746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
        b=Kj1vJIAZNzgX2jGwGlsdzNNDhGafsAE7o9cF/8HvnSdTerI/WqtdqTt3gGwEk3bFBJ
         9GRao77RB50R9G04FVV7LTSuNaOR6YyWlctBOtnJCHVqGoQIUVO61dUL4aLsd96BDKlf
         DVs5d4/cA5DU9X/rnTzLcrehqEz1BO8SJJL2i3OHNvIKvkso9MUv0OFdkeyxrRKKqpNB
         rYrE7CYyKgzww/sZbE3no72LGPXmGgQ1IFkZZCbWBfTN/AhX4/8NlGnEDROtxvB7JlRx
         0r9fBx6SpUbqfPGrIrHpKYv0glQuovunwp6loFA+RPuKihEHxSAIzO8zbEDiTMzNiDJL
         vh+w==
X-Forwarded-Encrypted: i=1; AKwUvBy6hOrX/JSK3/T/myVkqMc2ECGs8RE5oFgpwTju3JjteaTqdTIAa0To1f0GO0eIPxgZdYQNyGZBOdsPpP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CRl4k3d0E62hovuQNEtXXEDKyvCJPl7udsFKRJYAI892qw0mj
	DWoT+t9nbGHfBBBo0ozVh4XCJWjp3cIOULSD+zWIeFwYu3PWmIfrQLOiyvCqsZCWZk5aM+C4wqO
	5d56e3sJyHrTGVV3SnR5bj0LsmVv4X3zrUz92lUx3fLwgGjBf9D4JfpbH5jCfO9RmRFNYF27m9H
	cZztblcQ==
X-Gm-Gg: AYBFou1nLXoTynDmSDQSn0mgSRgMRrLc/BSShBYW7AG1IA9TX0yqVRW3D4CzDCQzEma
	RUdV5SfmFSeLoJe3gYxq+VvmzBOoUqnYLs4fkBZgEv22gLsXm9mGwiMwbM53KeIRJtu+w21B21/
	SDOVJt+cUYeQjOfOivaWuA1rfODT0FQpkuWzQvjKzbBoC0GRkF/3ABoiF0ve4M2gPh+d+X4svMV
	VO7+DDJrz1Ke3b8/59LKqwT3o0DcTetvnJxGByznxJkQo1uikJm0AIetYtHEsvXcHEECAS6EG4a
	tpmOMo9jIlEj4MV9Q6KgTncJcp7esVcvCY/Clyk1h6urvKiF5v0F99LuBx0kqVCndrelohtoC+8
	JDc2L08P20QJVKVA0f9B1le3fF5pJCMxyVpcCkiarT9G3wIvV6cL9XQQ8U1Q6Y95lQ+zpwYC0iu
	vMvSG1/BEAigKh2rMl0U4VMh1QyqEanPyx87H/0i/i5a42vCN2aYiac5B2bYjjEohjr7OVHzJc4
	+uTguuydyZpG1decXTR1Dy6kOawI7PwMZMeEaF5+4UvjweIsqmewjyHPI+6Uu5XuYOE3PGovPM=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr43089055c88.2.1793842946364;
        Wed, 04 Nov 2026 17:42:26 -0800 (PST)
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr43088986c88.2.1793842945775;
        Wed, 04 Nov 2026 17:42:25 -0800 (PST)
Received: from localhost (2001-b011-2008-445c-f38f-16e4-9788-cb61.dynamic-ip6.hinet.net. [2001:b011:2008:445c:f38f:16e4:9788:cb61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm11629150c88.7.2026.11.04.17.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:42:25 -0800 (PST)
Date: Thu, 5 Nov 2026 09:42:23 +0800
From: ChunAn Wu <an.wu@canonical.com>
To: Markus Probst <markus.probst@posteo.de>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, cocci@inria.fr
Cc: linux-serial@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 1/3] serdev: handle devices without an ACPI or device
 tree node
Message-ID: <auve/wI4t7A+2G5W@an-XPS-15-9520>
References: <cover.1792856688.git.an.wu@canonical.com>
 <263a607c3602f31a3f6fdd245e3c2008cdf97abd.1792856688.git.an.wu@canonical.com>
 <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
 <20261027214742.3624605-1-an.wu@canonical.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027214742.3624605-1-an.wu@canonical.com>

On Wed, Oct 28, 2026 at 05:47:42AM +0800, ChunAn Wu wrote:
> On Mon, 2026-10-26 at 13:59 +0000, Markus Probst wrote:
> > Reviewed-by: Markus Probst <markus.probst@posteo.de>
> >
> > You should add the maintainers for the modpost scripts to To/Cc.
> >
> > $ ./scripts/get_maintainer.pl scripts/coccinelle/misc/of_table.cocci
> > scripts/mod/file2alias.c scripts/mod/devicetable-offsets.c
> > include/linux/mod_devicetable.h
> 
> Hi Markus,
> 
> Thank you for the reminder. Adding the Coccinelle and modpost
> maintainers to Cc now.
> 
> BR
>     An
gentle ping
