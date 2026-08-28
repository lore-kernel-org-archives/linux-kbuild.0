Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101263AEF36
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787959215; cv=none; b=XVaYo121IUn9ndnfNTO/Fg48FsYg/ZkPK3p2s/zoHFVIOZ2Iocptu/TEIUWwMOTUv7xPEBw90s07oHs9Q81a/7GLek7jOVNroUGRei6GW4DEvIZ5AeLPyGcxqwP+QHrDYnqzY0hzg9O7t7Fpz88tJ2gaBJhgJ9OHOUCfRNLTyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787959215; c=relaxed/simple;
	bh=Dsr8qBZLgil/7Jhc9mZG6IoOdofcq7dtRdjka7YmlGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YBOVQ2LHCGg5iL/CNi2eoSyaQCB1lawHZqoOYiydY638M6Y+AN3QLYkpsNVCBG4zjkV/KarB0BZccig8ZCv0/m0ReGv5UHXVIryzb+Eo1nHF3u+VByQLWUznDYJPzEqpwxy0R8TikSAn4E4sWhZIuOxkaXPmnyKYlmUE3htfoZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB4+0lYf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB4+0lYf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482ea739de2so1011256f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2026 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787959196; x=1788563996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dsr8qBZLgil/7Jhc9mZG6IoOdofcq7dtRdjka7YmlGM=;
        b=SB4+0lYfaaqVlq59q+XtB+rJWmIK7SxZ90qQvWK8dyJLLpmedBdH4mym0F8cBj1OS7
         dgNY2V5oFOgm7QPkk6r7iX//mNvGtkkAcgElof0etrKPdK+1eSG0dML78a3jKVhxE0bs
         i/qwmiq+ADsph8hJ06dyZBIyQ4U5IXnMxTa0b564GbEDhpc3ADX7To4/em93IY/8HBAQ
         8mFp+7lKSjABm2MEfUDciu0USesNJlmDkoz4/W1S07pYUuf8SzCm+q1EO4qe/iczTT49
         ChkcA4MRiRNkJlNkiW2UFMlHouR2N2Vzj5Uf1a6r/lJhJbE6DED2uIs2P3eNB5E6aksC
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959196; x=1788563996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dsr8qBZLgil/7Jhc9mZG6IoOdofcq7dtRdjka7YmlGM=;
        b=iHXhL9h117KYEak5u1GACPM47z1cPVEEVRDgX9873ePJf/NFMMKVtETN8ZciCsl9SC
         hI/2ZUhri4rsn4HeHhz6f4FzJs0YiWkJ5PBzIlnnJQe+UaAk++90jKqukI9a2hZ1ksOi
         tX/P0LTAj9Ipitg7Q48LjfRBCPbTt8qcG36P/9gkxZO5t2qKTGA93gcIwMmSXci/FeLK
         QZceWzB602S3F6Si+0DcNZ8YNFiiZEqJCkGr7DmGL7SCF4+I+9JNU0jNRbmYGlVtTxTr
         372RMSrtMd2YHhd3gncXLWa2kOcPjx4Zar4ADDK+dDyCNIIGwsuK0kceNEBbQFf/dsJS
         C0yQ==
X-Forwarded-Encrypted: i=1; AHgh+RoobVLhVIuP5cDxl3c51EDHOanmraeIAlYfSRUM0YnLDyYMg9BU7TE6vy5BTL3LdHais+8mLrGpHlcJjfc=@vger.kernel.org
X-Gm-Message-State: AFuF++mWUkAcsrWoaAsW1MpDTAL2Yi3if9L4p2ZvhxxgoxtEw+nIOq/P
	1Dbwo5Yh5xBqqQRQBR/6KjsThpqiI/5WXZVG0ZlBPKzPJJD6Rjor5BwS
X-Gm-Gg: AR+sD12RdjBoRYFAzdHW2NrsBgVqsn5t7kYAi4JiAYDSCKgaJ4Wp4W3eoZnwFbmmWIc
	3neSmGm48FVivMLNMPdIBtx32wWSX+O+Y7JAKTv0bVCC5lRG0P66xMXbtcIDfsW9jz3gUHk/uHl
	pRk7twmwrXOjIMDOhj4Q1OwdJn6CfyVhuwI1h5fB5A13KZjykpcu7gjAug8OtQAFCsOPJQosbQf
	n7cCLVpu0qCotsjQHFb0VKDItTC+gCYh1ZhSeupICUoub4ObBWAryu/R7eBlpxyyRKgr3AJLSA3
	0xKYxMkI9fh6I/b0C2WlM1GtRZ73PhXahmKOBUSbJeLSO4QdtSgAUiWoTgquJLhrTlyZZpHY1ja
	paaosjGMFkTRwpptvMxXLLN/yaf+2xEQeGGPYDyKLuHMiQs2GIF4mIkzh2LHUEI+c0BbR0qjwK9
	hu65buZDVw6CgGQ1WYIm9desVnRFuREKLvYzH7UCp4spYv0aLZR1/x1hvDPm5az7+/WUi4h9x0m
	zWbO0sgqgz4mmKDBFA2UElKfgKP9jbK16ywN/3Bs/FvegroeQfptH9K
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr110929705e9.13.1787959195990;
        Fri, 28 Aug 2026 16:19:55 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca1ed292sm33018995e9.8.2026.08.28.16.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 16:19:55 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9de2f5e7-079b-472f-9d98-91d878dcefd3@gmail.com>
Date: Sat, 29 Aug 2026 00:19:54 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default
 logic
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale
 <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>,
 Chunhai Guo <guochunhai@vivo.com>,
 Michael Bommarito <michael.bommarito@gmail.com>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild <linux-kbuild@vger.kernel.org>
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
 <apGqg5a5I9g1CoF_@levanger>
 <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
 <apHfhILRL0-lFOEh@levanger>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <apHfhILRL0-lFOEh@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 20:20, Nicolas Schier wrote:
> Cc: Julian

Thanks for looping me in.

So it's not great usage of the Kconfig language to have the 'range 1 1'
and the 'default 16' here contradicting each other. But, it's currently
legal.

I would prefer to disallow this, but a proper check would actually
require SAT solving (or similar) in the general case, so it's unlikely
to become an error in the near future.

Anyway, as long as we're continuing to allow it, savedefconfig should be
considered bugged for not handling it accordingly.

Let me see if I can send something out this weekend.

- Julian Braha
