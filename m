Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED437E5DE;
	Mon,  7 Sep 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770063; cv=none; b=SmeJTbcPLKHrtegT8DX8FHX66cNRz3CmyuVTP0qn6WMe+tSeqK4hXOQc3X9MZMuDr7PsIdYy2i99swk/HJodZRR4qjPEA7Swy4NsZshhLwVe+zW0ASAByBZ22ABVQx5d8+LyeXBqAdN2YfRH4uq9uOB9k5rtGqatUeFL3rFsNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770063; c=relaxed/simple;
	bh=GCyhSTqi9v9WFVQqKFlgJCiVTuM/+HC8dBjnRDUasGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUvs5Kie8z16R1sg1yOYQ8smGTwkeAsJ3RY1vstkUAKhDLpbLOAJSkkYglLFQJag+nnmN0CCd/YRU5UprpZ4VXs3iwWcQjIr65pzXHgRVMXyiwbGuMItKsFnC9jWHHVta/v4SWMP35Acnkst7GosNNW5cVkdw+efmgl43Vw04EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=fQs6sFgG; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="fQs6sFgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788770049; bh=GCyhSTqi9v9WFVQqKFlgJCiVTuM/+HC8dBjnRDUasGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQs6sFgGHJ9IxbrYKYhDW0lJpONeaBkwoZgD/7DExMjJ1DjKsc2xDq+1cnBzl4Erm
	 gvFEqFzBP/E8htEgj2JDpNw7k+7/gRUiutOVZvovr5FEqM5m92g6if9wYdh9pQHmc5
	 AA4lqWP/ELo3ThVJ6ONj+srWzG9dKv4yTdX+jz/EpcWJS7O+iQUsEAsDOGTFGpuTEb
	 3YhIjXsMi4LRZrkKlfXEw2McrdPZkmbqiCoycFZOePiXGE/OwFjpOKQAv1iOK/Sdrz
	 XvDe+gb4XuUAAhslcQR3uYiTBHfT0vM/n1jQ16BMGRb927VJ8HNhN6xe2+VJhryWfr
	 m1mGAj8PDSFUQ==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9e7701-0472-7f0000032729-7f000001e6b8-1
	for <multiple-recipients>; Mon, 07 Sep 2026 10:34:09 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  7 Sep 2026 10:34:09 +0200 (CEST)
Date: Mon, 7 Sep 2026 10:34:08 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, ojeda@kernel.org,
	akpm@linux-foundation.org, jani.nikula@linux.intel.com,
	gary@garyguo.net, gregkh@linuxfoundation.org, arnd@arndb.de,
	ljs@kernel.org, andrew.jones@linux.dev, masahiroy@kernel.org,
	corbet@lwn.net, qingfang.deng@linux.dev, demiobenour@gmail.com,
	ej@inai.de, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 0/5] add kconfirm
Message-ID: <20260907-urban-seal-of-promotion-d2bc6c@l-nschier-aarch64>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
 <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
 <20260904220559.GB2787252@ax162>
 <4bdaab67-87d7-4c5c-8cb5-ac0f9add4d97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bdaab67-87d7-4c5c-8cb5-ac0f9add4d97@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788770049-765C695E-45B3F715/0/0
X-purgate-type: clean
X-purgate-size: 910
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 30CAFA038B  external: no

On Sun, Sep 06, 2026 at 04:22:21PM +0100, Julian Braha wrote:
> On 9/4/26 23:05, Nathan Chancellor wrote:
> 
> > My apologies for not getting to this sooner, I have been busy with some
> > other projects. I will try to play around with this from a usability
> > perspective (which is what I am most concerned with at this point). If a
> > v5 is mostly prepared, I would not mind seeing it even if we want to go
> > the in-tree interpreter checks. One option is to take kconfirm into the
> > tree, fix up the warnings it generates, then moving the checks into the
> > interpreter directly while dropping them from kconfirm (since the tree
> > should be clean at that point). I am open to opinions on that though.
> > 
> 
> Your strategy makes sense to me. I'll send v5 then, but I'd also like to
> make sure that Nicolas is onboard with this idea.

I am fully ok with that.  Thanks!

Nicolas
