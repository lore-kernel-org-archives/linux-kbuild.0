Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11413D503;
	Tue, 10 Mar 2026 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773117042; cv=none; b=fNH66FBaW6u6HjjGo6NelJ1z/P87NfQtbG0Pq3rz8zZlP19elvJb5CMeYco+hkxgTSjT2SPcPPIEhdxFZkpTXka3rE+4LL4dywavvQwsCRSmkuDYAMwwff/YgW4B3fongzi8PbNBNIPWRBggxKOSpt7NyC6+8e1rahQpTRLPM0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773117042; c=relaxed/simple;
	bh=UdKMMY6l5tRhLsXLDOlXyBZfiGFBbADixixWV/vsMyI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RxDz8HkmsIF1OqQ8cwo91JxHmvXCtWW32OU55LCSqV1GxIBM9ueZQComDsqm3/8x10djSxzFFcs2+VwaUjxoKkN/kaEPiLFcf1P9wL9fhloX+FIatxCc9EchG1GF8oojDBivQBF0Ky2CR1wFsRkSztSfntlyZHw4DDpjK34/iXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GN9xIYF2; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GN9xIYF2"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62A4UYfK1107931
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 9 Mar 2026 21:30:35 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62A4UYfK1107931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1773117035;
	bh=UdKMMY6l5tRhLsXLDOlXyBZfiGFBbADixixWV/vsMyI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=GN9xIYF2nSkpDsF7cND0ENEeduy89gNxPa/Vzh8f4YaFKsRj3rM0DZ4/dYiOaQeG2
	 6OlddoPeJAPs2iKga4To61xW16zRU+/1wLBvAo+WtYAj2uzarSP/A02UiVBB2SaIAw
	 pD6TwA76LQyPwI8xwQlkqt3UHd4X69xzKpyGJT7nnJfQzIu99mnznewnJogoSu/ibG
	 vzBChekWBbuQoygFV8CVXHNd3owXMD9qe+VpZOIYcmNaqamynefKtlKvhwWcEGOW15
	 oceLAkD+35CcY3iZ4+T8EDYSE30EFimA1mVgUS+d/3F9XM02wy0tf9YhoYu6CXbpa5
	 ++Cp0ZMteegCA==
Date: Mon, 09 Mar 2026 21:30:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Askar Safin <safinaskar@gmail.com>, nsc@kernel.org
CC: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, safinaskar@gmail.com, Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/2] Move tool for generating initramfs cpio to scripts/
User-Agent: K-9 Mail for Android
In-Reply-To: <20260310015416.3034078-1-safinaskar@gmail.com>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org> <20260310015416.3034078-1-safinaskar@gmail.com>
Message-ID: <F0129D94-2B47-4F2A-AA5F-D3F7F2017C05@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 9, 2026 6:54:16 PM PDT, Askar Safin <safinaskar@gmail=2Ecom> wrote=
:
>I like this patchset=2E
>
>Rob (CC'd), does this solve your problem?
>
>Also, in [1] I said:
>> command
>> "make usr/gen_init_cpio" doesn't work in clean kernel tree even if
>> config exists (I checked this)
>
>Now I tested this again, and I see that "make usr/gen_init_cpio" indeed
>doesn't work in current mainline in that scenario, but
>"cd usr; make gen_init_cpio" works (how I supposed to know this?)=2E
>So, problems in [1] are not as big as I thought=2E You don't need to buil=
d
>whole kernel two times in that scenario=2E But still I like this your
>new patchset=2E
>
>Also, I think that top-level "usr" directory exists as a placeholder for
>klibc-init project (this is merely my hypothesis, I don't know for sure)=
=2E
>I=2E e=2E it was supposed to contain source for userspace init program, w=
hich
>was supposed to be put into default initramfs=2E
>
>But klibc-init project, unfortunately, seems to fail=2E So, I think we sh=
ould
>remove whole top level "usr" directory and move its contents to other pla=
ces=2E
>
>[1] https://lore=2Ekernel=2Eorg/all/20260220191150=2E244006-1-safinaskar@=
gmail=2Ecom
>
>
>

Well, it worked, but got vetoed=2E It is still maintained out of tree=2E
