Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869092C0F63
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447850; cv=none; b=O0MwTEvo5LfQvYT5McGtj5lHM2hQDqhTsJIVStwEtO82zlpaVh822fnJpj/oUcHkFDL7HozjgtoxWTFtKDR5+/wYRJNyvPNHs5hfqOTFUGYAVONgVh/dai6qmdJWYYDv8WdZ8rTLklX6Ocft2kJKo1Ow4SH28t/GlAltHlj5v+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447850; c=relaxed/simple;
	bh=Kk321TkWIk+v+OgukE4VCpI9sMgYWT3H86s6gYrMgKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Qa70heGRZEMKvB146ycrd26bPk/9vB4N5rnFAWF7suqd8Io2/60x2kh4Zw4vpZFMJX75hBQkcKh92AqvYKwgN18PqxJj8/J54T7RP4/7yKXwuOG1D736DlulzMHATrNPnbZpwJ44YiLzFgCmUozKHulourMCSTX1owdF1Fi3DQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo+EXw/L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo+EXw/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217CAC116C6
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769447850;
	bh=Kk321TkWIk+v+OgukE4VCpI9sMgYWT3H86s6gYrMgKE=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=Jo+EXw/LaA9CyStF8cwO+wnYtuNGyyWMfNnAA57uud1HOoqYBt686T35kbxPLt42n
	 f0x01IX07TcObpk9Y2AzLJprCzSGIf018CD8PE7XcMf0qAKiXv6pqLcyAjORELcYb2
	 daAAVol1G89hE7PTD27yYW8Sj0Jr4JNXEN/Q4qvF1vqQJ9mpltqFWG1wzE4ocvBwRS
	 R12uzwIPF1ysqmMUsFMLqrnqdKrlQQ7AFMr/SswwA2pHfG7w/iq+kb1EJDBa1O+nx2
	 sd4SiyyKLFOM6ajla2ffplsstMuUIQHQMqIkYsOgscEI1160Bbp2m551YjITO8bvQP
	 QOYHVkyJsA02g==
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8946a794e4fso58668966d6.2
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 09:17:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDmxvZazOIBuX66gsDAJn6b5at1lEEkhGTnCVDRU4yxmgkwkWYlKrgg7443qoIb68y/vOtxs8bwJjXNYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7QHXifH+uahbjyTS64Ayw8fmqWcuAlk62zjo4M67aVOfAYxuJ
	gcPMZd3KMHLUQWWhGlTmhT1hy0RkH1rbvoFm+IgGyWmjbVk2tFnWZdPBzi3WaxM8g0neG04L9dY
	dhSRBWAvJZpeu2iBQt8zjx6FA7cEJ1Lg=
X-Received: by 2002:a05:622a:1111:b0:502:a1c6:4ee with SMTP id
 d75a77b69052e-50314b79633mr61347191cf.1.1769447849272; Mon, 26 Jan 2026
 09:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162> <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
 <20260123234418.GA206716@ax162> <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
 <aXUfOK38XIapv1Ak@levanger>
In-Reply-To: <aXUfOK38XIapv1Ak@levanger>
From: Song Liu <song@kernel.org>
Date: Mon, 26 Jan 2026 09:17:18 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4xCmGu4g2N7eBzR4tt4yFffWSAjr_dQvUzkUvQAspvTA@mail.gmail.com>
X-Gm-Features: AZwV_QgwDzYihj88qNUxYMQmqO9xR1D-8wIrxNRcGSnrw7ioi-NDItR-hc-VUNs
Message-ID: <CAPhsuW4xCmGu4g2N7eBzR4tt4yFffWSAjr_dQvUzkUvQAspvTA@mail.gmail.com>
Subject: Re: make olddefconfig surprises
To: Song Liu <song@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 11:40=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wr=
ote:
[...]
> Have you tried to use something like
>
>   make KCONFIG_ALLCONFIG=3Dwhatever/minimal.config make allnoconfig

Hmm.. This doesn't seem to work (or I didn't get it right):

$ cat y.config
CONFIG_LIVEPATCH=3Dy
$ make KCONFIG_ALLCONFIG=3Dy.config allnoconfig
#
# No change to .config
#
$ grep LIVEPATCH .config || echo no LIVEPATCH
no LIVEPATCH

Thanks,
Song
