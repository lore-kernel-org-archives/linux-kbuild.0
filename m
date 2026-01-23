Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05580268690
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192508; cv=none; b=OAouMB3UTLsMxC8IqrkFPi2oTglzQ8gvpfZh/AGSu9RULvpJL+MIDB3TsilE4sKhk6f0EGINeIGYJ/dstrjQSdehMLK3th2wcaRH8E8vRWGCDG8EwH/cAbq7uSt52QSktptOfg2UPb3nOiQ0J3MQi3ZA1CS/qDJ7gVVq3ulffvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192508; c=relaxed/simple;
	bh=FWqJ2VGMK2OTlL/1KpRdfPRbFbG0s1Aut1lFxLZTp6I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UOtLUCqPKlFTgcIRqdm9FlHZ+D/S7IptKbDGkSeKph4anl/xYUcVRcrykQzps5aI54K3YQG5oHlCUkIAYKI7IXYjwqlXQQHqPMwWi7Y4k5uFqbyO6Q4oXBxAAcoQqjiYAsHaI1B9to1EK/BWrwqRiIop5QTZVvIUKdgsvPCB0XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYmGZsYV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYmGZsYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C57C19423
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769192507;
	bh=FWqJ2VGMK2OTlL/1KpRdfPRbFbG0s1Aut1lFxLZTp6I=;
	h=From:Date:Subject:To:From;
	b=CYmGZsYVrQq47mddIoiWI2I9tBTwWGPYXc3SnSP4pHSwUhaqXZHXxD54SR3Z/dp2L
	 RDKxb+/lE+nzH7/4dBpIDsXyxR+6Rs320ZcjhA+MDADPOZ3h2lTcrOSwmJiFQL3qzd
	 pw7+BoxfHUq0AhQPhMItW3Dcd8maxSRKlfomqcktjA4yXbolfdDJ6Ug7pR6GUbwOF0
	 5aMp2otP6dxfgBx0v4x5mMqplrzT+HDJ2Y9jYKiTI8qWuwYGYmcC6tGs5iSwbtxorP
	 xybTm6lPs8RrGQg62pbcCo6k4ZT+RJbJok2eXyB+03DP9yPgoYGfxJMB4WcqJlniha
	 jWLc0xelCte5Q==
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5014b7de222so30658071cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 10:21:47 -0800 (PST)
X-Gm-Message-State: AOJu0YzPjqpHpd1j2CLi/0sFyvXxhO31jHXS7bG/EkmlGo5aGkIjBLOZ
	/0dAhX3YmuU3/2oX4IICpN37JovFc2BDvwo7m7436sqDj7n0K7Pzjhjc0qbwJp7bhP54+eRqGy0
	9K0A2bIH+v/rUnCla+tWIhMI/Gc2rt2E=
X-Received: by 2002:ac8:5815:0:b0:4f1:c66d:4c98 with SMTP id
 d75a77b69052e-502f7777fe4mr50162931cf.24.1769192506749; Fri, 23 Jan 2026
 10:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Song Liu <song@kernel.org>
Date: Fri, 23 Jan 2026 10:21:34 -0800
X-Gmail-Original-Message-ID: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg64RwCqB7rXoN-cXNvMdVPYycEMjnfgi1q6C2Gl6-r0wnUqEXDvTfuuoA
Message-ID: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
Subject: make olddefconfig surprises
To: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I was surprised by "make olddefconfig". Reporting here in case this is
something worth fixing/changing.

Here is what I see:

With make defconfig, CONFIG_DEVTMPFS is enabled:

$ make defconfig
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
$ grep CONFIG_DEVTMPFS .config
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set

But with make olddefconfig and an empty .config file,
CONFIG_DEVTMPFS is disabled:

$ echo > .config
$ make olddefconfig
#
# configuration written to .config
#
$ grep CONFIG_DEVTMPFS .config
# CONFIG_DEVTMPFS is not set

In the meanwhile, CONFIG_DEVTMPFS is enabled in my /proc/config.gz
and /boot/config*

I checked with a few folks. They were also surprised by this.

I think the logic of "make olddefconfig" is: With a .config, olddefconfig will
not look at other defaults (x86_64_defconfig, /proc/config.gz, /boot/config*,
etc.). Instead, olddefconfig only follows Kconfig files. If a config doesn't
have "default=y" in Kconfig files, it will be disabled.

This is confusing to users. For example, selftests users often have
a config file in "tools/testing/selftests/*/config" showing which configs are
needed for the tests to pass. The expectation is: default config with these
changes will work. However, this is actually not the case. Many of these
config files actually have "CONFIG_DEVTMPFS=y" to make it work.

So, the question is, shall we change the behavior of olddefconfig so
that it still honors defaults in x86_64_defconfig?

Thanks,
Song
