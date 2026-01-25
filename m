Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28191324712;
	Sun, 25 Jan 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355656; cv=none; b=Wk1X2lrlmNl9xLUkwfrrx6DNj68JdPhnybQXtttgcNk01Ty+QQAZv/y2TvzmtE3KYwe1FJo4A2JKDajlD9638jFpuPJyxI8Ca3sJz2sN7WMVZO5nlR/xKWz4+NXX9WYITyTheGHwd5AvBMNRlH0XDrR5aIkgFmNVQRB5/qz21XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355656; c=relaxed/simple;
	bh=0vvpRzEt5ZPkt7Rajd1dP1MpP710q5ZfPp3UMvqEMnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJczsvw5OW2TCvR7WoFBW1oWDVNEKI+3wbT9DWcwlSno2GrwMyoatpGPkH7A2PoS4TSr0TVpcouOn4gxs+QUv9pU4MWS7f83ug+77syUjq13le3eT5RQ7siRUjdPWMY1mTAEphEnKciUqjR1Zxa+Qar5/HkA+jE2b0tg4KgYkEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UHu48SR2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UHu48SR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09038C4CEF1;
	Sun, 25 Jan 2026 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769355655;
	bh=0vvpRzEt5ZPkt7Rajd1dP1MpP710q5ZfPp3UMvqEMnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHu48SR2dfhgo4a/RHVT0A9HR6qOBYHfHbfyUD8CZDH72tKtz0EerpQcXrxzqBeBO
	 jCcjQXkO3OwY+ewjJkLrDFSn0xUpMrba9Kjat0D3r8s40EiJWyP5bFAi7ggysJ/o7y
	 ij/GlWLTXWZTTIyOkvXSckAOQCIKtswQd+HR7vio=
Date: Sun, 25 Jan 2026 16:40:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Luis Augenstein <luis.augenstein@tngtech.com>, nathan@kernel.org,
	nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <2026012558-shield-backward-5bd7@gregkh>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <CANiq72my2WQm9z_iF46e3Umqt1HZ5gthneXMLP-0VCF8EMSz1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72my2WQm9z_iF46e3Umqt1HZ5gthneXMLP-0VCF8EMSz1w@mail.gmail.com>

On Sun, Jan 25, 2026 at 04:33:28PM +0100, Miguel Ojeda wrote:
> On Sun, Jan 25, 2026 at 4:20 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > After all, the kernel image should not change at all whether there is
> > an SBOM or not.
> 
> Well, I guess the SBOM could be saved into the kernel itself (and
> perhaps retrieved in different ways, e.g. at runtime), in which case,
> then an option definitely makes sense.

Ick, let's not dump the HUGE sbom json file inside the binary kernel
image itself, unless you want to do something like /proc/sbom.gz?

That would be funny, but a big waste of memory :)

greg k-h
