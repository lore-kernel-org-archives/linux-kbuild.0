Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705803FF884
	for <linux-kbuild@vger.kernel.org>; Sun, 27 Sep 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517610; cv=none; b=dQsrB9gZSaXe+b+LyeX63m9SwyARelqpRMjtSauyHXx2BdYaNJm7PefCP+t+C4x5AunbukvDPpFrt4vUXjxCa/I1m0zrKusHH47oT3pl9hhUzby6TYmQUOh1F/gRTqN3RVW1ERBJ2e83FrCU2xmVekyQVl92al2+BeOstD7U7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517610; c=relaxed/simple;
	bh=zXU+tYHOl/YHGHGbII3AHvP4lVS+bS8CAqVO6nFSJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jczJ5ep1dq7z1oTyfLS81lZejHEH8EpglXttG7Yye1jlzovwCB2uekQnlzaB+14PJj+2T+i0kXSGxVb7sZ24ctYtz/S+JGH08ffMlBLf9GMbRfCxoIhm45GnZheTtcEr9brafHUZDHz1UINZz2cQHr6OGpouPgCTT5HvQn3f0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apYkh3iN; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apYkh3iN"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81b8e8e9cb0so382926a34.3
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Sep 2026 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790517608; x=1791122408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXU+tYHOl/YHGHGbII3AHvP4lVS+bS8CAqVO6nFSJhA=;
        b=apYkh3iN+/RIGSioMpWjLsBsH+OZ5/iuJ2zz0uOGhjw/6ZYa1VExZTIkJ1WXFGTaWm
         xT8PdBQt6UuYT/XI6OUKY1fsxaX1E2RyKzCwDRCKRPuaJ4iete97p4UEbROKDjwa976X
         Pk8bagEd3Md6KYr0gDgIGHehGTzdoPL4vCpkTCup0YcZrXb/yPkz2zoJgKq9TVu53x6T
         cXdbPRRxCXDsh9F8P0NBSCmN1GtIGhp4JPOr0+Jw6TlsHT+2hgDZj7tLYwHJI88/v25x
         P2sfCR33IOiqSc5wI7o32TDyoywIqq6juM8EdgeY3jiyv3oUdV5RpinOjWquCUQgHcya
         Hdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517608; x=1791122408;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXU+tYHOl/YHGHGbII3AHvP4lVS+bS8CAqVO6nFSJhA=;
        b=exxniUugpFo0m+KclnR97joDDrQyDNfOmE7NOD+tK3Lg7MII7iylcwfUn2TE+8qtCJ
         2VpcEoDQZwcUWCXqwmquiDOS5VISuuLy+0gEj6be0IMDxjf+f8bxhKQxkZqZGDHLg8IU
         diQ30ulpsLtcWy38hPTzCc2+xe0B4sruH7K3RiuVuNQRHMcr0Lx27YPMB2f5G4U8v9iA
         jaUqpR44Jr4wyyCyybTRFA08ClwFn9lPK8rKbaDvFl5JfCLr0vgPi78gzsHV+dKteD4l
         KxFxDnz8267HYqjjAO6gboJ7QwpDl/Ul/Iu/USO/cISeYajuBrOVGwIwTRoqRnDL0Ktg
         4DCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzO/m+dSVI9nIf0yB9bW83fIv//EuF60sgonjNcEXxQ0WpNxLjrQS8M779ME4CMwHWMKGEEBUEnNIg8BU=@vger.kernel.org
X-Gm-Message-State: AFuF++kBHZDwuBCgVtypCfAjwad958Pmxytib1Yh1OEOW2WVamCp30Eg
	hiJP/mbhrKvADxYxpzY0I7P2bFbE1ihnq2jdxfCz3EVjRB7QDgq/YH80
X-Gm-Gg: AYBFou1J1K/wyLj3gWJ2NQMHdFctyFJ6+WByXi2zNUD+F3+9fXC8EdbmMT8TKtDHmIT
	FqALAZSms8W5dUuUKy8z6LWceQtXmrCEMLR42iQBJnZQ2acQKhApGO+/oJu4ZwRjJEArer1HGAU
	O1nabRFo+Ht10sbElJoeKfTxVC74+6D1UqpsL/SEYg20HoUrRTo5v5BN8Bk3t8zCjCqpeeVfftz
	IIZKzwIbzUXlSunSha6QB9LIZXh6YmvvDS2MwhESVjPo9lsCgtyPaSohwjVGoPY11DcpMTEoaFb
	4rf8rsU8uTM9YclNckrxy1Uh7YZSal8MFA2M/cqwYVRIocrU7jZA0cz3CqWe9HB9Mh10Lc1tv55
	q4ZpOcn9yb5GBGw8O3n16MgsadF1K3O4pqAGP3xkiecAyUe1HsDRqURbDcR1kk5OnaN3XTJa4nN
	KIvYVbLQlTfUF8G6rDloI4Prwsfl2ZgYK8O8jTy4kYB/qwFRUS9JAo429cOBrF54VIKIGYXDIgi
	875o5Y+T/QcKPaImhtiyC+hpw94TV3dRzbct+bC
X-Received: by 2002:a05:6820:1f05:b0:6bd:850:7634 with SMTP id 006d021491bc7-6d43f89b4e9mr11060817eaf.26.1790517608344;
        Sun, 27 Sep 2026 07:00:08 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d882dc49dbsm2210058eaf.9.2026.09.27.07.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:00:06 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: Danish Khateeb <danishkhateeb03@gmail.com>,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: Fix section mismatch with CONFIG_MODULES=n
Date: Sun, 27 Sep 2026 09:00:05 -0500
Message-ID: <20260927140005.28291-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <argClwhgQyMkeq29@monoceros>
References: <20260926163506.487201-1-danishkhateeb03@gmail.com> <argClwhgQyMkeq29@monoceros>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Uwe,

On Sat, Sep 26, 2026 at 07:40:03PM +0200, Uwe Kleine-König wrote:
> Isn't that a false positive because with CONFIG_MODULES=n .exit is
> discarded and so the section mismatch doesn't matter?

Yes, it's harmless at runtime, but modpost still warns on every
CONFIG_MODULES=n build with SERIAL_8250_PNP (e.g. kunit.py --alltests),
and the build fails with CONFIG_SECTION_MISMATCH_WARN_ONLY=n.

> I thought __init_or_module was the right annotation ...

It is, modpost just doesn't know that. Without it the two helpers stay in
memory after boot, 16 bytes each on x86_64. The alternative is teaching
modpost to skip exit -> init references in vmlinux when CONFIG_MODULES=n.

Thanks
Danish
