Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82271E98EF
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771786305; cv=none; b=X+/yV5ImaJFgJkXDqkSuYqsY+6y0o7oudShmn8TatpMrs7r0Zg2wiaZnlWCappvyKzczVnJFqZJmb94x20q2/NzDsrx4B4qKRcUI14J7zhhXCveO68EobTaQoiUvVsfjYf40HBqqFTlH319S3/yH9qS+D81zdQB8JL7tAx/jN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771786305; c=relaxed/simple;
	bh=A0bOaYc6ZATp/wgBvIr8oxyf8oltvEiXttvCnASi8Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m7OQqoZK1BJNJNYlDWzwHFdKCvsNSQgj59Nf3PUq64oqcBaGm7nrOpgZqcjQh4H6D+hHR8ZAnlsFqp5Wwmv+uSjhLlABC3aYyS9yv4JauRlZR9y11NnRnsyrkZkNIQ/X+xDIECx2/3Vb3Z2bXfVna3GknPT12G2MShj6GE+3goI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OjJJn4dk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OjJJn4dk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=wFvNDgvU/0XcBxJ4qfPpPE0QsVKGe19Jb6N/Z3o+/IY=; b=OjJJn4dkBUja9KTp7Gracl6Gxu
	CQNiuB0guj8Ee2IPCQGI+FqiiGXI1J2DK1LLOW7oyDIUxJw25kUrzMD0iHWE5QQfqOIPnLkegiWaw
	ufPDTaYB0zhCidzbblydxUV6XVaNpchZ7c0dkeoBhXaiudo40mMzAv2CzIrKQqbsKfOq31ky1C1iX
	SJEsOQzzepM1V53mi3r/Uo11HhoY5E4kc0/M5R8otGwWtLvNE7YB9Ey/9728RaF/FqTBoIvWj1wZk
	0ZawVdlBa9Q2vVb2T2BvN5J2NevxtEVpQOimfkm9tZ6Od5YHP9lDWpVFcLWv9F9wJW+G2yetXxQ9K
	vJpGwfBw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuEYN-0000000GsKf-2KsI;
	Sun, 22 Feb 2026 18:51:39 +0000
Message-ID: <fd7a58ed-e8d2-4101-b89b-297190b41813@infradead.org>
Date: Sun, 22 Feb 2026 10:51:39 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tools-support-relr.sh segfaults when NM is empty
To: Bogdan Metla <edistuo.revresbo@gmail.com>, linux-kbuild@vger.kernel.org
References: <CACT+mvZJo4ZdWbwY1=MpJqJg=Xf3y4QCiSy9APvMZaCh4GBBKw@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CACT+mvZJo4ZdWbwY1=MpJqJg=Xf3y4QCiSy9APvMZaCh4GBBKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/22/26 9:19 AM, Bogdan Metla wrote:
> Hello
> 
> Problem:
> When NM is unset or empty, tools-support-relr.sh executes a temporary
> file as a program, causing a segfault:
> 
>   test -z "$($NM $tmp_file ...)" → test -z "$($tmp_file ...)" → segfault!
> 
> Root cause:
> The script uses #!/bin/sh -eu, but -u only catches unset variables,
> not empty strings. When NM="", the command becomes `$tmp_file`, which
> tries to execute the temporary object file.
> 
> Reproduction:
>   unset NM
>   export srctree=. SRCARCH=x86 CC=gcc LD=ld
>   python3 -c "from kconfiglib import Kconfig; Kconfig('Kconfig', warn=False)"
>   dmesg | grep -i segfault  # Shows segfault in tmp.XXXXXX
> 
> Expected behavior:
> Clear error message like "NM must be set" instead of segfault.
> 
> Fix:
> Add explicit check at start of tools-support-relr.sh:
>   : "${NM:?NM must be set}"
> 

or it needs a change similar to a recent one in
check-function-names.sh:
${NM:-nm}
(see https://lore.kernel.org/linux-kbuild/20251219214252.GD1407372@ax162/)
or the top-level Makefile needs that (although several of the
scripts in scripts/ are run directly, without using Makefile),
so each script might need its own protection.

thanks.
-- 
~Randy

