Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53F3CB577
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404620; cv=none; b=uXi+EzoX2Z83jRfWzkTiZf6BFui+FkS6ODYt17cfRsKQFOp/TN5MnIifg5zHf6PPNZSUdI0f6gmaxPMd5oP8Oa/mtAffUvfbB0fahUE2D7evMLpjuySwL/qafymUuTZ1QTzPmRNjQuML4pPv3+/QxeUkiAWm7lnnZAFJcy1e8Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404620; c=relaxed/simple;
	bh=yhREa5E7QoDb2zLXJVFqRq4DwDaXk/DbGXCUnlmD6VE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=smeoMTFYgqer5Hxav5AVZDc7ZqP6awqLDU66OskaC8kr2sYLgYvyMI8zIQJ38fiHhBE2/zUL9EWNqEz7t6Avq+1ljOZQu+wGBbOcnYfH8gTDDQVleNNRTh+ODzmciZiKr+5o7ra2pge1+FTl7x+gddwjYBo5tjhUuwoB+ezbWeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=E571459Z; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="E571459Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785404613; x=1785663813;
	bh=8X46T2qYvgBQvvU9t+RSIyEg9Zw+0CJ/5Sh0Ady8eaU=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=E571459Zzdt4yx4t/v9y503UA4PVkKzwy+hYvat0aOcM41piPZ3DpxdIgPDaY/5eO
	 LkEb0fvArTggn+YvbwwpBizBU3ZOfCQEyu3f3if3TD356tr7d7JT2v7LiUu0OVyYGL
	 Qg6UQLWKTP3Tpu5YCE/c4GHUlQFtZkrRa6dyv0Q+Actpu1kNbxV2xhCcl9qXJVw+qS
	 8+beFZX/FkXvME7TTpYRFzpEWbcUMet7N9ZY35Tv5VeNx8pr0Ci0Kwob5HIa6t8GCQ
	 eZ9J0MyGmYeo0fgjAgXfTwxXYrpdrl79p83wljcFLwXLmrKoSwz6OQjL5jxvP3Joxb
	 HasGN0sLW4mcg==
Date: Thu, 30 Jul 2026 09:43:27 +0000
To: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
From: Tj <tj.iam.tj@proton.me>
Subject: How to move usr/Makefile call to just before vmlinux_a target ?
Message-ID: <869aa706-004a-44b8-a007-8ea5d4aa60bb@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 839cb776e08eb748809207c611b692c686652a56
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Note: re-send since original accidentally only got sent to Nicholas.

I've developed a new feature for CONFIG_INITRAMFS_SOURCE implemented in usr=
/gen_initramfs.sh that extends dir_filelist(). The feature enables includin=
g a directory filter of the form:

 =C2=A0filter:/path/to/script:/path/to/dir/

where /path/to/script decides the list of files to include from /path/to/di=
r/

My current usage is=C2=A0 to take a dynamic selection of modules from the c=
urrent build and include them in the initramfs.

One of the purposes is to create a self-contained kernel image for automate=
d rapid bisect/pre-build or bisect/build/test iterations that avoid requiri=
ng building an external initrd.img or adding modules to a root file-system =
and can be passed directly to qemu -kernel.

This all works fine. The problem I have struggled with over the last day or=
 so is how to move the call to usr/Makefile to just before the vmlinux_a ta=
rget so that the CPIO, compressed, and usr/built-in.a files are built after=
 all modules are complete and just prior to all the built-in.a's being asse=
mbled together ?

-- 8-< snip original additional info that Nicholas' response renders mute -=
--

Nicholas pointed me to the November 2025 mailing-list discussions, I was no=
t aware of, on this topic that appear to have a similar aim:

*https://lore.kernel.org/linux-kbuild/28e18785-1336-4fbc-9f2b-69aa6bb06375@=
pengutronix.de/
*https://lore.kernel.org/all/20251125-cpio-modules-pkg-v2-0-aa8277d89682@pe=
ngutronix.de/

Based on Nicholas' response to me regarding the need to fully build vmlinux=
 first there is an obvious chicken-and-egg problem. However, I wonder if th=
ere's a sneaky way around it?

Whilst I was doing my (now hundreds) of test cycles I was fooled a few time=
s when the initramfs was correctly populated - making me think the changes =
I'd made were working.

After some thought I realised it was because the incremental build benefite=
d from the module builds of the previous full build and therefore although =
usr/Makefile executes early it can create a valid working initramfs that is=
 embedded in the normal flow.

Thinking on this and Nicholas' observation I wonder if the solution here is=
 to create a new top-level target something like this:

vmlinux_initramfs: initramfs_modules

initramfs_modules: vmlinux modules
     $(Q)$(MAKE) -f $(srctree)/usr/Makefile ... initramfs_add_modules
     # rebuild vmlinux to include usr/built-in.a
     $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux

Adding a new target (or modifying existing) in usr/Makefile

initramfs_add_modules: ...
     ...

There are other details to take care of for this approach such as ensuring =
modules.dep and any other prerequisites are built.

The second call to Makefile.vmlinux should only need to repeat the AR task,=
 I think.

Comments and suggestions welcome - especially if they prevent me exploring =
futile paths!


