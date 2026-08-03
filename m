Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031A8326D55
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791759; cv=none; b=naL8NpflT8KAbECoxpl6CsIMsNrBSOErGXoVBDAHEDnjFammiCtaPitEqCcfYbLCU5E+B3JubsDqHUwbLXifiQOPzC1qDTltuNE3+6PUQQA9kuiKmZij6AlgeX8kuDLqNLm2A41sF92q8vxb+R2jY0GPfEKl/TO1NEVYDdBRsrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791759; c=relaxed/simple;
	bh=IZG8R1c/WzhTt+TQr2kUbSEHXHCtyyKZo5brjPGGl6E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pqISS5IIC0IVGyyAKW/xZAoeaA8FqOesRQCSLm5ZbOF5wZByL2l0O3b0tuwGR06XxM0y0qhGLoPYbmvrTiHXudsoPcxhLzlgz0s9AQEBsvlA56CQ7ypAScSzwBiEn0yWo1Wz3JklpzQSkwViP1qnk84irOMqnhL3zKj5E0iEFsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IJehqfuI; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IJehqfuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785791747; x=1786050947;
	bh=IZG8R1c/WzhTt+TQr2kUbSEHXHCtyyKZo5brjPGGl6E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IJehqfuIMWIIAxvfo/irsfzJdGrb1KVpv23snEkqW3TC3lOTE54TvpDH3OSzCu/3p
	 yEXNAEhreXG78DYTBqZipUkals4n/3TOBYbX2yM5Yv6hIGVSbpp3hnjvMsq3zVhjz8
	 XLMT7BryeQzuwg/ENHFMMvPAF/XMsRN2Q7nDXjz7ZpURs66FL0hF4uFtnK63C8+0ZE
	 USwS+vL/OMS/n5tCmLlx5B72OmAvaVGq7wCbbLA4l+BP1CPnrtM36QgcwdbE8Z065t
	 KuNf7/oneoLspC6EJlOPry3d80UfULL/iOtDFU7Jb3K6298wrL8zFPqzAW68XX7mY6
	 V46zuSovhiw6g==
Date: Mon, 03 Aug 2026 21:15:39 +0000
To: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
From: Tj <tj.iam.tj@proton.me>
Cc: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 0/2] Move tool for generating initramfs cpio to scripts/
Message-ID: <anEE6Zy9DmNzOqDZ@mail.iam.tj>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 639ead01465d74c74aae0401796349e7c2b71003
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I've almost finished the feature to add to usr/gen_initramfs.sh::dir_fileli=
st()
parsing of:

filter:/path/to/filter_script.sh:/path/to/directory/

A generic solution that can generate a cpio list dynamically.

My feature's current status is "working well".

I use it to include a sub-set of just-built modules in the initramfs
with some additional ./Makefile top-level magic.

I noticed this proposal to move scripts so want to provide a heads-up.

I described the technique as 'sneaky' in my email of 30th July:

"How to move usr/Makefile call to just before vmlinux_a target ?"

In it I add usr/Makefile.add_modules. It relies on being able to include,
unmodified, usr/Makefile, and use its targets.

Does moving usr/gen_initramfs.sh to scripts/ infer my 'example' script

usr/gen_initramfs_dirlist_filter.sh

should also be prepared to move to scripts/ ? It feels like that would
be moving it from its logical home.

Due to the trial-and-error process whilst developing it, and much additiona=
l debug
logging to understand call flows, it is not currently in a state to propose=
.

My aim is to clean it up by end of this week (8th August) and post an
RFC patch series.


