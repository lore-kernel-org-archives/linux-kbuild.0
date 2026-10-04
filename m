Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150E2E4257
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Oct 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103685; cv=none; b=LX/cTYUjHV/AQt3mBBLHsHtmRD1bHA22nvKwXzOY6nJDu2JqK7VL6hL/N7awr4d+hfmhCIV/BGscvOLc1aayjfMUn9DPIlETwfJWGD+A9n2Sh0eYFN9BdzAyYlQt8deo/sOL6QjKZT4PzfbORMFId0/WchQ7Zirey2KigTPD2l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103685; c=relaxed/simple;
	bh=6T8DZgYYr+1+mhUdP7wNNBrVRLpWRoP/73DbbLweLc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riVvzsgOH2nEWTA/XufgsCXgOEUmMcbX+2FQsN2uXVaonofpkyX2sv0G9b3NtBWKSfXnV/HkLKtvfyEAMVpD35GTefDMenm8HzoKdJTcGDg1HDBxKKnm4k7BqCFnHNUjnV9VA2E0rCigyeq69n46gX0tmOR6fL9DoHJkS1Hvg3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl3wG+nZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl3wG+nZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e4a341d177so4930555ad.0
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Oct 2026 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791103684; x=1791708484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zELZTu5aToONR3XKy4GsDgiiiK8sRg6RuxNVymYA2Q=;
        b=nl3wG+nZqRN4em+9wX0XMPtUTl3TlqNJ3R48RordX6Kauy4+kiT8fmCODVl58UKUXu
         LquMbqeVpEDc7aQMrb7x3Oh/r1uk2wiqiWn3fqMHPEwpGticAlsWe2lLxxukH4ZJs3DK
         dYO4pIDUDhnp3cMnKaKpnA0liYOXHTP/QJP2gG1EzhY9dRwCwGdWlv4XUlwVz/82+EzE
         d21XzS/hjqJfE5ywYxuIKGooKiyDTkoxowLWzaQLEG66q5c2vDDc0tXUqinosevFniiW
         oSy7Bt5fMSFZb9aBlveDy5ierXgamJC6mWrgceWpsq3GrbHKnvCvUEeeUucAlYSYFiYe
         LUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791103684; x=1791708484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zELZTu5aToONR3XKy4GsDgiiiK8sRg6RuxNVymYA2Q=;
        b=gbqnWUzQuRBfXP8RwIFUZMIUV/FukokdT4nkEOQwm60sgmjPJFQtQL2MUubDGJpn0+
         a5/HqrynBERhjhYWH6UQY5r4GYaQeCiIF1VKZxpu6ZBELa3hNJ2lwwQ/IUYOEO5pYp8a
         m+KiCjwvlgINin4qwgDEQbRfQlXy9jhdZ0SWZagS5g/RHwsGP3SOq7ee5l1GtqWNu6dM
         FrRt/9GHNHCQlx9VzyDQK/drO5VRteWD8cGl+xY3w+Lqs3+vkcx6Dfq1PQ9oq0czid1E
         MR7art2/tvXPKXFUIroYItyOPFhRaqLjyh32rWtQ1ZETQxQ88qfAt9UX4zXPeiMnG7sq
         uywg==
X-Forwarded-Encrypted: i=1; AKwUvBwC5WjELuOf8ENTL2QlbdGSCJYzGBELRv9JIYLgpso2DJve+Ue9h/fea9PZf+h7/HE52vOlKsbVaseR8Ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5QyXNWv3GfMrhuvnYLsmCdf7tP8S0HFODuY7eUo1vRCB5cxKU
	mxrhvaqQeRX1ze1EJzaawXld1mZo/SZleB1Mt5GPLDxTpOI8PHcO7n/4IELEU00wAHg=
X-Gm-Gg: AYBFou0HvBf3EA4b0dpSRk+NUoxw1OkatWIkNgImg8S6N4K5e1j7foakyHut64Xqbeh
	8jyRx639qiEjpgSXWChTsu1iMdIaHNV2GNaWcbnqkH9zVtTPG6f74D9PGIS1+v16KSGY2tV4I28
	hJ2AwHeE1xPC1DQ1qxEJQpzRai8kWjjod8r89kg2qp54aaj80fKkR/M0OMWdK4GAbgky2ABAra1
	7yJ8VsDwQ1sgXNpWVvuaAoA/s+awoy5W14SL5kV0bDimsblCEYNMseuEJMcjA59SKMMoTXzwYsA
	LdV4/bg5dJ9E7A9Dsbuy2B4aoo4I0z65yK54d5B6LJNxGcz++86fOi1IViflJU2LkZszYn8+G/9
	jSJ+DjKSjFaflLtOq1D1YJrmwBpXuz6NKcvpl7ry9PFsNaBGk/JXr2Dkl2FCXxoMbsaZW5i8dYP
	rtrqnrcHaCfSUx9MrRCBzouHN/o9xKyUsBVAMH9AWM5zAkQtFkvJfZnwDArpi0jjT7Z6uZXE4HI
	cMe1twIFYJ/c8nXJKb1MC8L6HOPdFvusF5SFJI3KM/DjJihk/15TFIi6qHc99SpYTejDI969y6+
	5wAxhYqNABOEO90YkWCbUM1dCYMQh6DOsOStMrh++XKapy4VUGpTZ1tm1hA=
X-Received: by 2002:a17:902:d592:b0:2e2:e57f:77e0 with SMTP id d9443c01a7336-2e51057aee5mr39075065ad.24.1791103683643;
        Sun, 04 Oct 2026 01:48:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e4c2a7e76csm15786865ad.31.2026.10.04.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:48:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 5/6] kbuild: rust: warn if the out-of-tree compiler differs from the kernel one
Date: Sun,  4 Oct 2026 16:47:58 +0800
Message-ID: <20261004084758.40138-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20240902165535.1101978-6-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org> <20240902165535.1101978-6-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

When you applied the rest of this series you held this patch back "to
give people more time to look at it".  Nicolas reviewed and Alice
tested the series at the time, but nobody commented on this patch, and
it never went in.  Here is a case from the field where it would have
helped.

Arch Linux users building an out-of-tree Rust module with DKMS (the
bcachefs module, in this case) hit E0514 against the headers package:

  crate `core` compiled by rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-2): /usr/lib/modules/6.18.53-1-lts/build/rust/libcore.rmeta
  = help: please recompile that crate using this compiler (rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-1)) (consider running `cargo clean` first)

Both are 1.98.1 from the same commit, in two package releases: the
linux-lts headers were built with the second while users still had the
first.  (Arch has since rebuilt its kernels.)  The advice to recompile
`core` and run `cargo clean` does not apply to a headers package, and
the forum thread spent several posts on repository settings before the
cause was clear:

  https://bbs.archlinux.org/viewtopic.php?id=314993

The check in this patch compares `rustc --version`, which includes the
distribution's description, so it fires in exactly this case.  I
rebased it onto current mainline (the only conflict is the pahole
check added since; I put the Rust check after the C one) and tried it
the other way round, with the Arch 7.2.8.arch1-1 headers (now in the
Arch Linux Archive) and the newer rustc:

  warning: the Rust compiler differs from the one used to build the kernel
    The kernel was built by: rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-1)
    You are using:           rustc 1.98.1 (48a229cea 2026-09-01) (Arch Linux rust 1:1.98.1-2)
    RUSTC [M] rust_oot.o
  error[E0514]: found crate `core` compiled by an incompatible version of rustc

With a matching rustc it prints nothing.  If you would like to take it
now, I can send the rebased version.

Thanks,
Matthias
