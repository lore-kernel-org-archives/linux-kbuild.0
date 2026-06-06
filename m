Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812D2E7367
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767381; cv=none; b=pcPXgKeXrYFLHrCaGaZI2OHCUkXkGmdHF7cw5ZEOao5vsr3tYQ80VCmwQRTt9s7kL1QRWimCnMlg5t4/GZjpPCIdFDtpe+r4NIg5nk8qJ2DsMz5q5ONSSA7yjx+wdUyZvEqH1hLp8gWoAPwL7X4ronb8/SKljnPT+UdBk2SPkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767381; c=relaxed/simple;
	bh=3LoRZRoSOHCgp+5a+buMDm9erlhghHI5iUQWtrzHpQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjay++fScmGy0Azx7Y6R/CW0yow//ZndgXQhypovOQfsJ6F1QhRMBu1VDH+lBNAzCKLRY5YZKao+4HH7pUBnhzrhJtzBBXNlz4q7f+83Y64NZTDQHpjSwr7oUjHUXpHYpfv6NqzJFRScJ9oTSXWb7vmKwc9720IytKdUk7idJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=cuD1ps+r; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=MEmkvMHO; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="cuD1ps+r";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="MEmkvMHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1780767375; x=1781372175;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=UwuPKkp/1Eoa4Wex/pCeqBtMKPqSjTxPON4LN+hbyUE=;
	b=cuD1ps+rPMX8D3smFmDJsBny+gqi3kJVGIjpMkxr5ozFZ4RTV/97S+OvTaZdbu252Yx3RL48jNH+Y
	 zE7+ym3sep1F6ps9qx6xYop5K1FgsOf1g9mr1gkFIkRMMS1Xuk/4jb62OagV+NcJUnm4A9BsMw2heT
	 PwDlqROt/3+86SyKjvWuFqYZk6SpjxCVeQ2Ysn0ZUCdh6X23qrXuirYTca7mO/5iFMJaMt4Xc2dyjH
	 bbB0IyS25YITpjUCFRWhU9yaMPoXwWw9FrcMNRRuhN0xK43TImkDAESh0ToIk0btWvctQD9vvsTTHo
	 Fd08iWYy3CUboexHMH6vhelgH3L30kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1780767375; x=1781372175;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=UwuPKkp/1Eoa4Wex/pCeqBtMKPqSjTxPON4LN+hbyUE=;
	b=MEmkvMHOTjSUjnX+BXGsnjAbx4mp9gvhLAtbTg1GNeaBqGMtI1bzx1sTIDZHXNBUO697T3hqhA2si
	 /UODVROBQ==
X-HalOne-ID: 35e9c283-61ce-11f1-be0d-f7376af24660
Received: from ravnborg.org (unknown [37.97.11.187])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 35e9c283-61ce-11f1-be0d-f7376af24660;
	Sat, 06 Jun 2026 17:36:15 +0000 (UTC)
Date: Sat, 6 Jun 2026 19:36:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: warn on dead default
Message-ID: <20260606173613.GA126491@ravnborg.org>
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260606142326.GA117482@ravnborg.org>
 <a5d09cc6-2878-443f-899d-dafb286322ad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d09cc6-2878-443f-899d-dafb286322ad@gmail.com>

Hi Julian.

On Sat, Jun 06, 2026 at 04:01:34PM +0100, Julian Braha wrote:
> On 6/6/26 15:23, Sam Ravnborg wrote:
> > I looks redundant with the two loops were we for the latter knows it is
> > a P_DEFAULT.
> 
> Hi Sam,
> 
> It may look redundant, but we do need to check each default we encounter
> in the
> ```
> for (prop = sym->prop; prop; prop = prop->next) {
> ```
> loop against the previous defaults to know if we've encountered a
> duplicate default condition.
> 
> I guess the other approach would be to copy each default as we encounter
> them into a hashtable and check against that, instead? Let me know if
> you have another, preferred approach.

It was just a drive-by comment, keep it as simple as possible.

	Sam
