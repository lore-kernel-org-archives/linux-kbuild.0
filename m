Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137713;
	b=RSY7uLGiPWiUkpST539WE9+szziLiC0hmrnFYbRy1sfXM726Tc2v1C/hQ89jr58xKGeV
	 SWDdwWP9HVFqKf1+3P3fr8SeWyifKy7/lYEk9jAf0f3F6A6R9HnrQ6BhgkYe8rvYYJWIm
	 BMRAi3qtdD3qpB5EMhzzqTXkpG4A0JDfYYR5HzHL+1D9Aya5F7V92niEgPpXHJfgYomJn
	 mXvO82+4KgAF+KJs5EH+4lVckweGPYeL3bFJOnojdQz+PiaaCZIQTKnFNucDPm+BU6OAF
	 eySkvyUbXnqvYqq4xY26h67SUZ9wB7bhGvzxhVyV4YmxbcCjbNUOrbCX+BEcTvqOsuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
	b=tGoNdonZGzGRp2WfmHkXmtO2WMoYbAwlMEn4CrBibioqtq6qmqBCEQ4dD2YMGkVi/29q
	 0pWyklMWj+vHLYIVpWY99RRaw+Kv9xjC/RXytm5QxJDzqNuhc/BcAvE4T9T+tdq4vOzN/
	 inVH07qBgRV/+0zoqYJOiO9lLe/RwNlyW/Ds/8NkPvy+x+JdGj++TAx90ePcYNQlkSwZW
	 1cI3GMNIf924Zm7zIl4k7HJRlehv/lB4I9Z7LYVpzK/wuycoavMvpjYbgJXTXTTDzoAA+
	 Uvmuv5+JLPLwL54mw4OcF6uGsgw/Gp0yGHmNcKOBXtMJ1sm4roEkuQgO4KqkOPha2rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NsnIF6s2;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD0606A31F
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2026 21:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BD0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NsnIF6s2
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2157040252
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2026 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793137710;
	bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NsnIF6s23mLz8NdigrB4LFVWsHXrAI2gv8c/0r4DaBDgi1/szzsT3mv4J1WQvsX7U
	 zdzd/DmaabVx0WgdHBRtYbsUUXQfLEmyIpuGgKO5QETxu3kW2fIUwM5U7EAKh+CzyL
	 Pp9eBfvo7+XiQGcCKx0ts23DJkfEFlO/G03UBIhkJasSzYcHH7IHNp5njCNmk+G+fX
	 8D5ybftMkhFpOTqrB031ZTfloLSY5zbGBxPF3Pi4FrN6DTWkxAj/qZzzsg59AoaEST
	 9SQcPFdyqRxu7i3MP42POw4BgRS9tkm1/JJA95eprKGqLI9+SH3EgE2aJ+83zzBQsH
	 0BK2u573yl1ivql/6a50YiauLCYuvqU9yJpCciUGP6JfULI4OnQFcAEoLF8LQkShTJ
	 C8pkCrsnxG0Ls3PJ67TagKG7PvFo6IabWsfM8+YMZ2fKbwt8i9URBHx+cOA+J+9wIB
	 wjNDKJ+hHkZKc3fQAhVSzXiNzs1EkPR6BwsF+9hJgbaT19J/EoO76NQTPsQftvBV1S
	 fue1T1CPnh3FP1giDmLPTaBIcypc/pNfudv+N/2IhOW/d7T1F9SgW+oVhU44HidGMJ
	 +gSp4ue3iAgi/OMUiyJX881ZsA2MKWyhDgMtdfG/H//GT7I9gqPXcQFi3DcV1xLLUR
	 +OW5JYCOTL41oZtLE0vGfUp4=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab08c4aca5so74248a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2026 14:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137708; x=1793742508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
        b=fyHlYt8H2GlkmbixEi0ysqVxlyd3uXq+1/gFo/NH+Qa8MGq7i44r19GRHa2EldRGHr
         Luor+ebiurIC4FuxNXkPxChAWXaaWPlig61sjfAxoLhI8WtMwgpNBSuGKQcGhx8quV2u
         RTYyxGKKLG8FNWm1gOsRJojoLfLEWQKDG094CZ3wdTcNJzJ+6sKlVWlJF3Bbz1Lml6U7
         N0hUjp5/hJOmNXqo/wygQgcO+uRno/dk9+fSUk61MRj6SCS+ga2JIeSyHIRoYv3ZZbhe
         bsU/Qgjsg8zdGQNFr01ek7LzgFG5s7IoVZ6iGqJ3dn4acOtBuISgO53aV82IpeSKJ/KW
         08aw==
X-Forwarded-Encrypted: i=1; AKwUvBymUkg3b+TNymuAIYNLym6FRnurPvuvdZIpV639du56e5vLonnaj/L6pRXUdjtAGFIByo2L7kWm+XXbplg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh5ul67tet/W4ndAeg3l7l6UOiTsWZEH0QddUlbWbwr+qPvJt8
	r4sY/AJJeSf8wp9QOKZwBfp98QaHeLLMPCuoFT5fTcICtMS3yEgeArxUkODNvx1JN9B0oB6082v
	UUNj3ygq6t+MQ0Rg4XYHjlLkkwY8wGtGIgX0QrW4Ay52J3X4OqRc9kGpw23lpP0GDsrKDVbDoAg
	Xlwq3dig==
X-Gm-Gg: AYBFou3K4NHE4Wmepb0riWOCKdkCuSKim/bkqPvpBf0agRkQABUBxwsWjnrP7oujskJ
	UGacHAL9j/DTGzk0d7AxQzVDVCBqPH3BC8/bmLRBm+HvH/GphlSdbwln6QRWszGfw40du6rrRZt
	MYuBC92krnQiAyn+7gV9Ivy8LJcdbFk+4FHntZbzCo+5c/TOrsViud7RhBf1i4uFLD2CZVIwiNL
	w/+iYM49bK0oqKY85bbzIVnz5o/rGUQ+VsjKXyynP+2IIJEyG5rZesvAaDmzIfOp8A7bKf/de43
	K6Ei4yxJaF1HUgufc1ri4V9wj7NNBr+tASw+xZR99c1Lr2bBO2R0iJpc9VUAj1hjZaXkNrw6ddm
	I20pL9VCJsibfFfo42u8g0J4kubtPxO3YbWqj9fZ+FWn8pDv6pmxY5hhbu8+LouWUGJoC/dFcNl
	JtjANO52lD2ycLyv89LCYVeWhVTwX6JU3W7dyiviJJ54KJo5o/6xiJP+v/EZn+bui8tM+Ee9wGP
	rZvofuwMEAZcYsh+FsSTQZcIlxI5PtlohwnURH9tg==
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3ae581402edmr428974a91.4.1793137708590;
        Tue, 27 Oct 2026 14:48:28 -0700 (PDT)
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3ae581402edmr428960a91.4.1793137708192;
        Tue, 27 Oct 2026 14:48:28 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-fcc4-d427-0dad-9764.dynamic-ip6.hinet.net. [2001:b011:2008:445c:fcc4:d427:dad:9764])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm37741a91.10.2026.10.27.14.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:48:27 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	cocci@inria.fr,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 1/3] serdev: handle devices without an ACPI or device tree node
Date: Wed, 28 Oct 2026 05:47:42 +0800
Message-Id: <20261027214742.3624605-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
References: <cover.1792856688.git.an.wu@canonical.com> <263a607c3602f31a3f6fdd245e3c2008cdf97abd.1792856688.git.an.wu@canonical.com> <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2026-10-26 at 13:59 +0000, Markus Probst wrote:
> Reviewed-by: Markus Probst <markus.probst@posteo.de>
>
> You should add the maintainers for the modpost scripts to To/Cc.
>
> $ ./scripts/get_maintainer.pl scripts/coccinelle/misc/of_table.cocci
> scripts/mod/file2alias.c scripts/mod/devicetable-offsets.c
> include/linux/mod_devicetable.h

Hi Markus,

Thank you for the reminder. Adding the Coccinelle and modpost
maintainers to Cc now.

BR
    An
