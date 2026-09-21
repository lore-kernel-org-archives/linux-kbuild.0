Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BEE3B38A4;
	Mon, 21 Sep 2026 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021656; cv=none; b=DOXD7qrtfghajmhu4guc92oCbnIFAQ7z7RXT1aOl31L4jKuJRxGMXoLPvkPyin5fEtVBhIWTMgSSRuC1E2ydiyqFy43cJU3hNR/k5aySMiqkaOfTxaAIVK3yzgGf6heEXldcNoS/eUK3qgWek41PpXmhHdrplv9Rqb0n1RyhMog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021656; c=relaxed/simple;
	bh=i6h1EHvv6EfvOoBPtcs49iBR6xf/2RJ34J0NVultwAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSUwtFjyG4pT+++vAR7+4zSmz8ZuORzrRATA3TGKRCH49aZwtDtiXI3ezXgITTiPhapEly31jrvPX0qU6AJLDvVO6J+i3ybx0Ykg5ErL5r7anICtK7+6PTZgJbu0UdVlReWMas3ME/9LXnM1CXR1YmSo3UmEgI0mwoJdFBwy2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GBImZCvz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GBImZCvz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3xwhFfhFQtUpwSUNLzVtlECDKQeL0QbyYtauvngSzzo=; b=GBImZCvzcWuXHDOA67mEsxRaHP
	p9FmrZXkg6ts5v0uC3cPFgzlFLbYcwqLlU27BlMXTiXfXXchDXzfAw/nXNEyzFdB0iJSpQznBHe+Z
	Q2OdoPfv9WrUEq/xBJ2+X48tVeDnw2dxpNmu2PMJaKAnXGpECZr70k/gjigKPSTGZjq9CycbsHkBi
	aniK5zZ4vaLL/ChmBQ1wzMRhhXalP2lWt95GDe1YJdzDOwqQFLq9XsmQztAiU3TuytbXq6gbrGLgF
	W9+viqcsofUnnNJQgK9L8cc6G4MKoLP4i2yXK1Ceia8TrU+RPNmdRCmHaVTTO0v1cXC9jBryzCGP0
	WiOsrpog==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kOy-00000003K4J-2EFY;
	Mon, 21 Sep 2026 20:14:12 +0000
Message-ID: <4acccfc3-d934-46fd-88b5-e5660dd0ce65@infradead.org>
Date: Mon, 21 Sep 2026 13:14:11 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] README: rename to README.rst and make the doc
 references links
To: Matthew Wilcox <willy@infradead.org>
Cc: Osman Ahmadzai <osmanahmadxai@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nathan@kernel.org, nsc@kernel.org, apw@canonical.com, joe@perches.com,
 tglx@kernel.org, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org,
 linux-spdx@vger.kernel.org
References: <20260921050038.76985-1-osmanahmadxai@gmail.com>
 <20260921070556.6909-1-osmanahmadxai@gmail.com>
 <e08514b5-87f6-4a2b-8080-7d7d8e802f99@infradead.org>
 <arGHSsj96C3C3C4x@casper.infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <arGHSsj96C3C3C4x@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/21/26 12:36 PM, Matthew Wilcox wrote:
> On Mon, Sep 21, 2026 at 12:24:08PM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> On 9/21/26 12:05 AM, Osman Ahmadzai wrote:
>>> The README points at some sixty files in the tree, but it has no
>>> extension, so it shows up as plain text and none of those paths can be
>>> followed.  You have to go and find each one by hand.
>>>
>>> The content has always been reStructuredText - it uses reST section
>>> syntax for its headings - so give it the extension to match, and wrap
>>> each in-tree reference in an anonymous hyperlink whose link text is the
>>> path itself.  The rendered text is byte-for-byte what it was before; only
>>
>> What causes README.rst to be rendered? Is it named README.html?
>> I don't see it being rendered on a clean 'make htmldocs' build.
> 
> I believe this is some github thing.

Oh, that makes some sense (although they generally use markdown).

> There's something very strange about the diff being sent.  For some
> reason it shows as a delete + create rather than as a rename + changes.
> That makes it hard to review.  Please investigate and fix.
> 
> Also the commit message was not revised to match what v2 actually does.

My next comment to Osman is why do we need hyperlinks at all?
Any decent editor that has the README file open can be told to
open the file at the editor's cursor location -- no links needed. :)

-- 
~Randy

